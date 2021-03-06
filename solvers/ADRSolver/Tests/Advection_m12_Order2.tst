<?xml version="1.0" encoding="utf-8"?>
<test>
    <description>2D unsteady advection, order 2, P=12</description>
    <executable>ADRSolver</executable>
    <parameters>Advection_m12_Order2.xml</parameters>
    <files>
        <file description="Session File">Advection_m12_Order2.xml</file>
    </files>
    <metrics>
        <metric type="L2" id="1">
            <value variable="u" tolerance="1e-12">9.55749e-05</value>
        </metric>
        <metric type="Linf" id="2">
            <value variable="u" tolerance="1e-12">9.27095e-05</value>
        </metric>
    </metrics>
</test>


