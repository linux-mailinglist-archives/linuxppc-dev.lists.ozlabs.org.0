Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76281302B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 13:31:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=Li+jgPTr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrWt95g1Kz3dFH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 23:31:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=Li+jgPTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ixit.cz (client-ip=89.177.23.149; helo=ixit.cz; envelope-from=david@ixit.cz; receiver=lists.ozlabs.org)
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrWsF2lJXz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 23:30:23 +1100 (AEDT)
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id CCBEC161F1E;
	Thu, 14 Dec 2023 13:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1702557016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z9+j3RuAFmVdTivpBrevf7GvHqi09Hed+JCxMMuEXlg=;
	b=Li+jgPTrBU6ZP+lfh3MSWuFXGvPhsUE4zrRjkMB7ISsrt6j54g00kM/SGEhBfYzTB5UoAD
	cyizlXzcShrc2D0mEwu3glOvo7/zSAJcdyqvZ0v1aWuqrYEzGGd0iL9VSM7mADW7jRAlSx
	nFn4ahnErS3UvTnEDuKDaiHgkLEVq2o=
Message-ID: <7259e7fe-157e-4cc7-9e82-98cb8e32bfed@ixit.cz>
Date: Thu, 14 Dec 2023 13:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RESEND PATCH] powerpc/fsl: fix the schema check errors for
 fsl,tmu-calibration
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20231212184515.82886-2-david@ixit.cz>
 <87ttomy94f.fsf@mail.lhotse>
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <87ttomy94f.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 13/12/2023 06:17, Michael Ellerman wrote:
> David Heidelberg <david@ixit.cz> writes:
>> fsl,tmu-calibration is in u32-matrix. Use matching property syntax.
>> No functional changes. Fixes warnings as:
>> $ make dtbs_check
>> ...
>> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dt.yaml: tmu@30260000: fsl,tmu-calibration:0: Additional items are not allowed (1, 41, 2, 47, 3, 53, 4, 61, 5, 67, 6, 75, 7, 81, 8, 87, 9, 95, 10, 103, 11, 111
> This file name doesn't match the one you're modifying?
Hello Michael. I mentioned this as a example of same problem (I 
originally sent more patches to fix it across DTS files)
>
>> , 65536, 27, 65537, 35, 65538, 43, 65539, 51, 65540, 59, 65541, 67, 65542, 75, 65543, 85, 65544, 93, 65545, 103, 65546, 112, 131072, 23, 131073, 35, 131074, 45, 131075, 55, 131076, 65, 131077, 75, 131078, 87, 13
>> 1079, 99, 131080, 111, 196608, 21, 196609, 33, 196610, 45, 196611, 57, 196612, 69, 196613, 83, 196614, 95, 196615, 113 were unexpected)
>>          From schema: Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
>> ...
> I don't see any errors like this. I guess I'm running the tests wrong?

Currently I see also no error :(

If you look into 
Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml you can see 
that

`fsl,tmu-calibration` matches the change I'm introducing here, most 
likely there is a bug in validator or syntax is not 100% correct.

David

>
> I'm using:
>
> $ make CHECK_DTBS=1 fsl/t1023rdb.dtb
>
> I do get errors (see below), but not the one you mention in the change
> log. Maybe it's being hidden by some other error?
>
> cheers
>
>
>    CHKDT   Documentation/devicetree/bindings/processed-schema.json
> /home/michael/linux/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /home/michael/linux/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTC_CHK arch/powerpc/boot/dts/fsl/t1023rdb.dtb
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /: memory: 'reg' is a required property
> 	from schema $id: http://devicetree.org/schemas/memory.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
> 	from schema $id: http://devicetree.org/schemas/root-node.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /: failed to match any schema with compatible: ['fsl,T1023RDB']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
> 	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: compatible: ['fsl,ifc', 'simple-bus'] is too long
> 	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: 'nand@1,0', 'nor@0,0' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
> 	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /localbus@ffe124000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: dcsr-npc: {'compatible': ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc'], 'reg': [[4096, 4096], [16785408, 65536]]} should not be valid under {'type': 'object'}
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: dcsr-corenet: {'compatible': ['fsl,dcsr-corenet'], 'reg': [[32768, 4096], [106496, 4096]]} should not be valid under {'type': 'object'}
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-nal@18000: failed to match any schema with compatible: ['fsl,t1023-dcsr-nal', 'fsl,dcsr-nal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-nal@18000: failed to match any schema with compatible: ['fsl,t1023-dcsr-nal', 'fsl,dcsr-nal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-rcpm@22000: failed to match any schema with compatible: ['fsl,t1023-dcsr-rcpm', 'fsl,dcsr-rcpm']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-rcpm@22000: failed to match any schema with compatible: ['fsl,t1023-dcsr-rcpm', 'fsl,dcsr-rcpm']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@30000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@30000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@31000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-snpc@31000: failed to match any schema with compatible: ['fsl,t1023-dcsr-snpc', 'fsl,dcsr-snpc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: bman-portals@ff4000000: $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-portals@ff6000000: $nodename:0: 'qman-portals@ff6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /qman-portals@ff6000000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: soc@ffe000000: soc-sram-error: {'compatible': ['fsl,soc-sram-error'], 'interrupts': [[16, 2, 1, 29]]} should not be valid under {'type': 'object'}
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: soc@ffe000000: thermal-zones: {'cpu-thermal': {'polling-delay-passive': [[1000]], 'polling-delay': [[5000]], 'thermal-sensors': [[29, 0]], 'trips': {'cpu-alert': {'temperature': [[85000]], 'hysteresis': [[2000]], 'type': ['passive'], 'phandle': [[30]]}, 'cpu-crit': {'temperature': [[95000]], 'hysteresis': [[2000]], 'type': ['critical']}}, 'cooling-maps': {'map0': {'trip': [[30]], 'cooling-device': [[7, 4294967295, 4294967295]]}, 'map1': {'trip': [[30]], 'cooling-device': [[8, 4294967295, 4294967295]]}}}} should not be valid under {'type': 'object'}
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl-i2c'] is too short
> 	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
> 	'fsl,mpc5200b-i2c' was expected
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/i2c@118000/eeprom@50: failed to match any schema with compatible: ['st,m24256']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118100: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl-i2c'] is too short
> 	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
> 	'fsl,mpc5200b-i2c' was expected
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'sleep' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: Unevaluated properties are not allowed ('sleep' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'sleep' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'sleep' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
> 	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e1000: failed to match any schema with compatible: ['fsl,t1023-clockgen', 'fsl,qoriq-clockgen-2.0']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e1000: failed to match any schema with compatible: ['fsl,t1023-clockgen', 'fsl,qoriq-clockgen-2.0']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,elo3-dma']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@300: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@380: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@400: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@480: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,elo3-dma']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@300: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@380: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@400: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/dma@101300/dma-channel@480: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t1023-esdhc', 'fsl,esdhc']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t1023-esdhc', 'fsl,esdhc']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl-i2c'] is too short
> 	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
> 	'fsl,mpc5200b-i2c' was expected
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119100: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl-i2c'] is too short
> 	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
> 	'fsl,mpc5200b-i2c' was expected
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@119100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c500: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,ns16550', 'ns16550'] is too long
> 	['fsl,ns16550', 'ns16550'] is too short
> 	'ns8250' was expected
> 	'ns16450' was expected
> 	'ns16550' was expected
> 	'ns16550a' was expected
> 	'ns16850' was expected
> 	'aspeed,ast2400-vuart' was expected
> 	'aspeed,ast2500-vuart' was expected
> 	'intel,xscale-uart' was expected
> 	'mrvl,pxa-uart' was expected
> 	'nuvoton,wpcm450-uart' was expected
> 	'nuvoton,npcm750-uart' was expected
> 	'nvidia,tegra20-uart' was expected
> 	'nxp,lpc3220-uart' was expected
> 	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
> 	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
> 	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
> 	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
> 	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
> 	'mrvl,mmp-uart' was expected
> 	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
> 	'ralink,rt2880-uart' was expected
> 	'mediatek,mtk-btif' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c500: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c600: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,ns16550', 'ns16550'] is too long
> 	['fsl,ns16550', 'ns16550'] is too short
> 	'ns8250' was expected
> 	'ns16450' was expected
> 	'ns16550' was expected
> 	'ns16550a' was expected
> 	'ns16850' was expected
> 	'aspeed,ast2400-vuart' was expected
> 	'aspeed,ast2500-vuart' was expected
> 	'intel,xscale-uart' was expected
> 	'mrvl,pxa-uart' was expected
> 	'nuvoton,wpcm450-uart' was expected
> 	'nuvoton,npcm750-uart' was expected
> 	'nvidia,tegra20-uart' was expected
> 	'nxp,lpc3220-uart' was expected
> 	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
> 	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
> 	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
> 	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
> 	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
> 	'mrvl,mmp-uart' was expected
> 	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
> 	'ralink,rt2880-uart' was expected
> 	'mediatek,mtk-btif' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11c600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d500: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,ns16550', 'ns16550'] is too long
> 	['fsl,ns16550', 'ns16550'] is too short
> 	'ns8250' was expected
> 	'ns16450' was expected
> 	'ns16550' was expected
> 	'ns16550a' was expected
> 	'ns16850' was expected
> 	'aspeed,ast2400-vuart' was expected
> 	'aspeed,ast2500-vuart' was expected
> 	'intel,xscale-uart' was expected
> 	'mrvl,pxa-uart' was expected
> 	'nuvoton,wpcm450-uart' was expected
> 	'nuvoton,npcm750-uart' was expected
> 	'nvidia,tegra20-uart' was expected
> 	'nxp,lpc3220-uart' was expected
> 	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
> 	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
> 	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
> 	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
> 	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
> 	'mrvl,mmp-uart' was expected
> 	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
> 	'ralink,rt2880-uart' was expected
> 	'mediatek,mtk-btif' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d500: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d600: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,ns16550', 'ns16550'] is too long
> 	['fsl,ns16550', 'ns16550'] is too short
> 	'ns8250' was expected
> 	'ns16450' was expected
> 	'ns16550' was expected
> 	'ns16550a' was expected
> 	'ns16850' was expected
> 	'aspeed,ast2400-vuart' was expected
> 	'aspeed,ast2500-vuart' was expected
> 	'intel,xscale-uart' was expected
> 	'mrvl,pxa-uart' was expected
> 	'nuvoton,wpcm450-uart' was expected
> 	'nuvoton,npcm750-uart' was expected
> 	'nvidia,tegra20-uart' was expected
> 	'nxp,lpc3220-uart' was expected
> 	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
> 	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
> 	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
> 	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
> 	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
> 	'mrvl,mmp-uart' was expected
> 	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
> 	'ralink,rt2880-uart' was expected
> 	'mediatek,mtk-btif' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
> 	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
> 	'fsl,sec-v5.4-rtic' was expected
> 	'fsl,sec-v4.0-rtic' was expected
> 	'fsl,sec-v5.0-rtic' was expected
> 	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
> 	'fsl,sec-v5.4-rtic-memory' was expected
> 	'fsl,sec-v4.0-rtic-memory' was expected
> 	'fsl,sec-v5.0-rtic-memory' was expected
> 	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-b@20:compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
> 	'fsl,sec-v5.4-rtic-memory' was expected
> 	'fsl,sec-v4.0-rtic-memory' was expected
> 	'fsl,sec-v5.0-rtic-memory' was expected
> 	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-c@40:compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
> 	'fsl,sec-v5.4-rtic-memory' was expected
> 	'fsl,sec-v4.0-rtic-memory' was expected
> 	'fsl,sec-v5.0-rtic-memory' was expected
> 	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-d@60:compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
> 	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
> 	'fsl,sec-v5.4-rtic-memory' was expected
> 	'fsl,sec-v4.0-rtic-memory' was expected
> 	'fsl,sec-v5.0-rtic-memory' was expected
> 	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
> /home/michael/linux/.build/arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sec_mon@314000: interrupts: [[93, 2, 0, 0]] is too short
> 	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
> make[1]: Leaving directory '/home/michael/linux/.build'

-- 
David Heidelberg

