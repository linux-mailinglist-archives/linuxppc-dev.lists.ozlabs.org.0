Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 255DB810966
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 06:17:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K8Oanw6y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqkJZ6FFzz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 16:17:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K8Oanw6y;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqkHm4yZ7z3bcH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 16:17:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702444628;
	bh=ZQ8SYLdtEMIrsG32K/Wj2sQioIE+71rOBA3hWDAqiyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K8Oanw6y0Sf9n+ksquTN8Fj+X4+0x6dQKAtsnWZxxKlV7HNZuWzTpVYfFFZdAyGiw
	 iGzt3N33J4Q3EbmOFUGTQDoAPpE1ZYyaQoWzjGWoVdg9Iz+LXuiVFz1l5cK0QJSKGe
	 YNwgm4e2/tKdcMEFAgwsJlVGY+sbtfzMQLCcBeZr+3QZA9rLHyGtKjg19mM2x5IUn0
	 fK76cJE1SOLRzAfVwBHIWg4IPUTE4shgvUZCFldWgRKzJhbfB2srx7bmBu5WaC2nsy
	 Bbm46zgqt2SdMpS/x4mim3GDeCaqgk2PIOPMbhTDxAeiDnY5fjY/la623KyIeFI7bE
	 8H44LnyB/7Vig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqkHl74qGz4wcj;
	Wed, 13 Dec 2023 16:17:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Heidelberg <david@ixit.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, David Heidelberg <david@ixit.cz>,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean
 <vladimir.oltean@nxp.com>
Subject: Re: [RESEND PATCH] powerpc/fsl: fix the schema check errors for
 fsl,tmu-calibration
In-Reply-To: <20231212184515.82886-2-david@ixit.cz>
References: <20231212184515.82886-2-david@ixit.cz>
Date: Wed, 13 Dec 2023 16:17:04 +1100
Message-ID: <87ttomy94f.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Heidelberg <david@ixit.cz> writes:
> fsl,tmu-calibration is in u32-matrix. Use matching property syntax.
> No functional changes. Fixes warnings as:
> $ make dtbs_check
> ...
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dt.yaml: tmu@30260000: fsl,tmu-calibration:0: Additional items are not allowed (1, 41, 2, 47, 3, 53, 4, 61, 5, 67, 6, 75, 7, 81, 8, 87, 9, 95, 10, 103, 11, 111

This file name doesn't match the one you're modifying?

> , 65536, 27, 65537, 35, 65538, 43, 65539, 51, 65540, 59, 65541, 67, 65542, 75, 65543, 85, 65544, 93, 65545, 103, 65546, 112, 131072, 23, 131073, 35, 131074, 45, 131075, 55, 131076, 65, 131077, 75, 131078, 87, 13
> 1079, 99, 131080, 111, 196608, 21, 196609, 33, 196610, 45, 196611, 57, 196612, 69, 196613, 83, 196614, 95, 196615, 113 were unexpected)
>         From schema: Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
> ...

I don't see any errors like this. I guess I'm running the tests wrong?

I'm using:

$ make CHECK_DTBS=1 fsl/t1023rdb.dtb 

I do get errors (see below), but not the one you mention in the change
log. Maybe it's being hidden by some other error?

cheers


  CHKDT   Documentation/devicetree/bindings/processed-schema.json
/home/michael/linux/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/home/michael/linux/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC_CHK arch/powerpc/boot/dts/fsl/t1023rdb.dtb
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /: memory: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/memory.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /: failed to match any schema with compatible: ['fsl,T1023RDB']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: compatible: ['fsl,ifc', 'simple-bus'] is too long
	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: 'nand@1,0', 'nor@0,0' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /localbus@ffe124000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: dcsr-npc: {'compatible': ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc'], 'reg': [[4096, 4096], [16785408, 65536]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: dcsr-corenet: {'compatible': ['fsl,dcsr-corenet'], 'reg': [[32768, 4096], [106496, 4096]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-nal@18000: failed to match any schema with compatible: ['fsl,t1023-dcsr-nal', 'fsl,dcsr-nal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-nal@18000: failed to match any schema with compatible: ['fsl,t1023-dcsr-nal', 'fsl,dcsr-nal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-rcpm@22000: failed to match any schema with compatible: ['fsl,t1023-dcsr-rcpm', 'fsl,dcsr-rcpm']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-rcpm@22000: failed to match any schema with compatible: ['fsl,t1023-dcsr-rcpm', 'fsl,dcsr-rcpm']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@30000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@30000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@31000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@31000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: bman-portals@ff4000000: $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-portals@ff6000000: $nodename:0: 'qman-portals@ff6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: soc@ffe000000: soc-sram-error: {'compatible': ['fsl,soc-sram-error'], 'interrupts': [[16, 2, 1, 29]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: soc@ffe000000: thermal-zones: {'cpu-thermal': {'polling-delay-passive': [[1000]], 'polling-delay': [[5000]], 'thermal-sensors': [[29, 0]], 'trips': {'cpu-alert': {'temperature': [[85000]], 'hysteresis': [[2000]], 'type': ['passive'], 'phandle': [[30]]}, 'cpu-crit': {'temperature': [[95000]], 'hysteresis': [[2000]], 'type': ['critical']}}, 'cooling-maps': {'map0': {'trip': [[30]], 'cooling-device': [[7, 4294967295, 4294967295]]}, 'map1': {'trip': [[30]], 'cooling-device': [[8, 4294967295, 4294967295]]}}}} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl-i2c'] is too short
	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
	'fsl,mpc5200b-i2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/i2c@118000/eeprom@50: failed to match any schema with compatible: ['st,m24256']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118100: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl-i2c'] is too short
	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
	'fsl,mpc5200b-i2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'sleep' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: Unevaluated properties are not allowed ('sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'sleep' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'sleep' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e1000: failed to match any schema with compatible: ['fsl,t1023-clockgen', 'fsl,qoriq-clockgen-2.0']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e1000: failed to match any schema with compatible: ['fsl,t1023-clockgen', 'fsl,qoriq-clockgen-2.0']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,elo3-dma']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@300: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@380: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@400: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@480: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,elo3-dma']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@300: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@380: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@400: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@480: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t1023-esdhc', 'fsl,esdhc']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t1023-esdhc', 'fsl,esdhc']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl-i2c'] is too short
	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
	'fsl,mpc5200b-i2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119100: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl-i2c'] is too short
	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
	'fsl,mpc5200b-i2c' was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c500: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,ns16550', 'ns16550'] is too long
	['fsl,ns16550', 'ns16550'] is too short
	'ns8250' was expected
	'ns16450' was expected
	'ns16550' was expected
	'ns16550a' was expected
	'ns16850' was expected
	'aspeed,ast2400-vuart' was expected
	'aspeed,ast2500-vuart' was expected
	'intel,xscale-uart' was expected
	'mrvl,pxa-uart' was expected
	'nuvoton,wpcm450-uart' was expected
	'nuvoton,npcm750-uart' was expected
	'nvidia,tegra20-uart' was expected
	'nxp,lpc3220-uart' was expected
	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
	'mrvl,mmp-uart' was expected
	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
	'ralink,rt2880-uart' was expected
	'mediatek,mtk-btif' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c500: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c600: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,ns16550', 'ns16550'] is too long
	['fsl,ns16550', 'ns16550'] is too short
	'ns8250' was expected
	'ns16450' was expected
	'ns16550' was expected
	'ns16550a' was expected
	'ns16850' was expected
	'aspeed,ast2400-vuart' was expected
	'aspeed,ast2500-vuart' was expected
	'intel,xscale-uart' was expected
	'mrvl,pxa-uart' was expected
	'nuvoton,wpcm450-uart' was expected
	'nuvoton,npcm750-uart' was expected
	'nvidia,tegra20-uart' was expected
	'nxp,lpc3220-uart' was expected
	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
	'mrvl,mmp-uart' was expected
	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
	'ralink,rt2880-uart' was expected
	'mediatek,mtk-btif' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d500: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,ns16550', 'ns16550'] is too long
	['fsl,ns16550', 'ns16550'] is too short
	'ns8250' was expected
	'ns16450' was expected
	'ns16550' was expected
	'ns16550a' was expected
	'ns16850' was expected
	'aspeed,ast2400-vuart' was expected
	'aspeed,ast2500-vuart' was expected
	'intel,xscale-uart' was expected
	'mrvl,pxa-uart' was expected
	'nuvoton,wpcm450-uart' was expected
	'nuvoton,npcm750-uart' was expected
	'nvidia,tegra20-uart' was expected
	'nxp,lpc3220-uart' was expected
	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
	'mrvl,mmp-uart' was expected
	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
	'ralink,rt2880-uart' was expected
	'mediatek,mtk-btif' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d500: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d600: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,ns16550', 'ns16550'] is too long
	['fsl,ns16550', 'ns16550'] is too short
	'ns8250' was expected
	'ns16450' was expected
	'ns16550' was expected
	'ns16550a' was expected
	'ns16850' was expected
	'aspeed,ast2400-vuart' was expected
	'aspeed,ast2500-vuart' was expected
	'intel,xscale-uart' was expected
	'mrvl,pxa-uart' was expected
	'nuvoton,wpcm450-uart' was expected
	'nuvoton,npcm750-uart' was expected
	'nvidia,tegra20-uart' was expected
	'nxp,lpc3220-uart' was expected
	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
	'mrvl,mmp-uart' was expected
	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
	'ralink,rt2880-uart' was expected
	'mediatek,mtk-btif' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
	'fsl,sec-v5.4-rtic' was expected
	'fsl,sec-v4.0-rtic' was expected
	'fsl,sec-v5.0-rtic' was expected
	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
	'fsl,sec-v5.4-rtic-memory' was expected
	'fsl,sec-v4.0-rtic-memory' was expected
	'fsl,sec-v5.0-rtic-memory' was expected
	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-b@20:compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
	'fsl,sec-v5.4-rtic-memory' was expected
	'fsl,sec-v4.0-rtic-memory' was expected
	'fsl,sec-v5.0-rtic-memory' was expected
	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-c@40:compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
	'fsl,sec-v5.4-rtic-memory' was expected
	'fsl,sec-v4.0-rtic-memory' was expected
	'fsl,sec-v5.0-rtic-memory' was expected
	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-d@60:compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
	'fsl,sec-v5.4-rtic-memory' was expected
	'fsl,sec-v4.0-rtic-memory' was expected
	'fsl,sec-v5.0-rtic-memory' was expected
	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
/home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sec_mon@314000: interrupts: [[93, 2, 0, 0]] is too short
	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
make[1]: Leaving directory '/home/michael/linux/.build'
