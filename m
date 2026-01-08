Return-Path: <linuxppc-dev+bounces-15424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62353D05E16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 20:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnFk04FcFz2yFk;
	Fri, 09 Jan 2026 06:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767901512;
	cv=none; b=VuN2zVwykF/OfiIIm6V2nSve/iR+NpliN4V99qN6RrXfiN4/riTrvJ5lT8Lkk9DA/w8fM3NBMKJONprolG/cUxc8zKxVRMiLMeKcp6HUukSsNgBRhhn1RiLzdgtU1NlHs4Ltgi32T1H5KwaKeU+e610966CEN3AZ1rnLMg0/SJJoBGPsJBq/CF7ZJEMg5vg6D+7VdY2YOtykysTXu8cknrI8CESgX7Tfy2I4xSwEq2MitiN2RFWKV8XBm4MLLLQV9VTWQxf7IaLZElNrsYM+orHeHUeSff7WSQWOxcdOAMtgHUqDq5vsHmonIZXgFBDj1ktI4yqCMu6Gkg5dQcymYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767901512; c=relaxed/relaxed;
	bh=QMAIfByDrljUcTHtSb0mvVkbtrVaLMiwYuVN4a+LvD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsUGnkrXGPFIZ1YWX01L7YqKZQKQMCQpTjRZMr5lgT7BskOygVXgoJcdMsvyXP2idxKjBNj1bsdarJMj97ER7VnQWjANGFL47X3wqP/h2qobyTfYGCn9XZwGMNOBas4xHxTsExotvys21cLL6aDSYmyDwL9QsNdNgX6mkLBSOtmLyumi2g6mk13w4Mf0dgps3j0RdMrFpscXTXJGEFRGONub/I72J6C1b9a/qAInYac18dSovVMLhARiyNmOWeyU+xX4Bdgi9EmA7URGVXpp/5izCLmNY+AVedHz8If6pV1KuYzcXlxtm71iXXwSjXl7tKmMrPnR6jw6lcDIzFW0ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mM1BLJpo; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mM1BLJpo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnFjz3MWVz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 06:45:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 939A443821;
	Thu,  8 Jan 2026 19:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC89C116C6;
	Thu,  8 Jan 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767901479;
	bh=8RfRMlVDFkZfgKpt/lJTExflB5KKf8XGW+QQIfsHwe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mM1BLJpogphrrcqUpZj74hD9Ac7HxV5e9VZs/CrMHciucDJVodVi25SN3HBOXmKKn
	 VYAI1lJd5qRf5TioPPfl8e/bL1kK/IDbBWE1utghMWT48dN4dwF7c9eieKkxBVxWfr
	 jIahpi5kVAcJJ6gfHgB5sXVXXvqHyNr89SBigaPx0x54WWTZSgdgQwidbT1EHR5zym
	 dA9fVqO2W0fRgetwgPJnVRlpU/vtsbynDhzfSyfOCnSsSrbyrDO1zr186rNc2VDuWv
	 imguLkVpMDIUhyT0Kr67Q+SIuH47rsmfEUC+eog35yBG6TJESR+j/qZrbdre6XS9hG
	 P+pVPxyG+DJRg==
Message-ID: <8a8c8a31-ebe8-48cb-9836-c69c6d65a545@kernel.org>
Date: Thu, 8 Jan 2026 20:44:35 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
 <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
 <20260108190203.GA780464-robh@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260108190203.GA780464-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 08/01/2026 à 20:02, Rob Herring a écrit :
> On Wed, Jan 07, 2026 at 05:59:10PM +0100, Christophe Leroy (CS GROUP) wrote:
>> The QUICC Engine provides interrupts for a few I/O ports. This is
>> handled via a separate interrupt ID and managed via a triplet of
>> dedicated registers hosted by the SoC.
>>
>> Implement an interrupt driver for it so that those IRQs can then
>> be linked to the related GPIOs.
>>
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Already? On a v1?

This is extracted from a previous series, here: 
https://lore.kernel.org/all/67987bbf42344398709949cb53e3e8415260ec09.1758212309.git.christophe.leroy@csgroup.eu/

Should I have called it v7 even if it is only a small part of the 
initial series ?

Ack is here: 
https://lore.kernel.org/all/20250818-babbling-studio-81a974afc169@spud/

> 
>> ---
>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> new file mode 100644
>> index 0000000000000..1f3c652b1569d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fsoc%2Ffsl%2Fcpm_qe%2Ffsl%2Cqe-ports-ic.yaml%23&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de4ee86aff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639034957294961534%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mH5SPbAw48C6BGcazDPJMtoiM71TXswUGBvSZf15dUQ%3D&reserved=0
>> +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de4ee86aff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639034957294990994%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=RhD807Jcx3MerOAXGWuwgwHkATpTzTkDIQC7lO3t1AA%3D&reserved=0
>> +
>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>> +
>> +maintainers:
>> +  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - fsl,mpc8323-qe-ports-ic
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#address-cells':
>> +    const: 0
>> +
>> +  '#interrupt-cells':
>> +    const: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - '#address-cells'
>> +  - '#interrupt-cells'
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    interrupt-controller@c00 {
>> +      compatible = "fsl,mpc8323-qe-ports-ic";
>> +      reg = <0xc00 0x18>;
>> +      interrupt-controller;
>> +      #address-cells = <0>;
>> +      #interrupt-cells = <1>;
>> +      interrupts = <74 0x8>;
>> +      interrupt-parent = <&ipic>;
> 
> This doesn't look like a separate block, but just part of its parent. So
> just add interrupt-controller/#interrupt-cells to the parent.

I don't understand what you mean, can you explain with the extract below ?

Extract from device tree including the parent:

	soc8321@b0000000 {
		#address-cells = <1>;
		#size-cells = <1>;
		device_type = "soc";
		compatible = "simple-bus";
		ranges = <0x0 0xb0000000 0x00100000>;
		reg = <0xb0000000 0x00000200>;
		bus-frequency = <0>;

		ipic:pic@700 {
			interrupt-controller;
			#address-cells = <0>;
			#interrupt-cells = <2>;
			reg = <0x700 0x100>;
			device_type = "ipic";
		};

		qepic:interrupt-controller@c00 {
			compatible = "fsl,mpc8323-qe-ports-ic";
			reg = <0xc00 0x18>;
			interrupt-controller;
			#address-cells = <0>;
			#interrupt-cells = <1>;
			interrupts = <74 0x8>;
			interrupt-parent = <&ipic>;
		};
	};


Thanks
Christophe

