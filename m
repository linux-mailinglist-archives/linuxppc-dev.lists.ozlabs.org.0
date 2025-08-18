Return-Path: <linuxppc-dev+bounces-11105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB8B2B247
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 22:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PGr6l4Cz3chF;
	Tue, 19 Aug 2025 06:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755548436;
	cv=none; b=cVlhY1jWc+oa/xQ67DEPousviccJ4uFuUaMGSZ7f41kzcv5PGTGsjWUPY4fpaGzOlG0OiT8RHiJJTuvWiK5Kkx5R7aGwm6ZoGSFioJlLjUVTTe0nfoMfcdcWJQXWxm55dpIb6vzvIUuxQEYyp125YN3ZQxpBfo2h405hApZSBQMjulFDTSFRMWuifQBja+/pOLfKznEYYmv+0BdxpEwUwfTrYVg02UXstV/DbfZsJpZocuQvPVnS8ctXzXE771aBYElJ0PWA/NyA/5hGYY60aYIqbZt9FN3x0/YfMOQSXKU2LdLiMD+AbOVqUkTlwzEItRxtROpxlAwlVNv0LEVD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755548436; c=relaxed/relaxed;
	bh=AwYuYWkD6HG/WmASteon2R3SgEbV3PMKCgt21o3VGAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSh/isnXzv2rjUt2HJG8cJviXwygxWfdzCOCt/1WUIuqQhgN4H+z/f+JPCUBaGTmSJ4UQOhEYVGLhDkYdj9GJ/vGF2Uke++J8C44pguCcHDHq6ooSnj6GNjxmvyqgjsJoVVnijfo6H/eSBtUHSqUQuujcL/ZG6vZ7RmLddkiVw+rrVg/EdQw5fpVqJflSbtPNCiYV7dDObyroqBH+8MxITsIf9NhYiE1z3fItXjiBVu9vXQPY9U2MEFqNjcTo13hhAV9lU5dJyWFYXqAhDp+xYkJaNC/pVFEVE8cYB0VT75bFtsJxz0l71w7LibHsYqiSLiQPq/DQ0vxcLRTdHRjzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PGr26Ydz3cfx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 06:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55g45CxBz9sWv;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkJOApxeOfnh; Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55g43xC4z9sWt;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6ECF68B764;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id U_Z-I48WiQ0s; Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D1758B763;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Message-ID: <a14e4ec5-74ff-4f0b-bc26-76c59ecb2357@csgroup.eu>
Date: Mon, 18 Aug 2025 10:37:04 +0200
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
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Krzysztof Kozlowski <krzk@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 12/08/2025 à 17:23, Krzysztof Kozlowski a écrit :
> On 12/08/2025 13:02, Christophe Leroy wrote:
>> The QUICC Engine provides interrupts for a few I/O ports. This is
>> handled via a separate interrupt ID and managed via a triplet of
>> dedicated registers hosted by the SoC.
>>
>> Implement an interrupt driver for it for that those IRQs can then
>> be linked to the related GPIOs.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> new file mode 100644
>> index 0000000000000..7c98706d03dd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +
>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>> +
>> +maintainers:
>> +  - name: Christophe Leroy
>> +    email: christophe.leroy@csgroup.eu
> 
> Oh no...
> 
>> +
>> +description: |
>> +  Interrupt controller for the QUICC Engine I/O ports found on some
>> +  Freescale/NXP PowerQUICC and QorIQ SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - fsl,mpc8323-qe-ports-ic
>> +      - fsl,mpc8360-qe-ports-ic
>> +      - fsl,mpc8568-qe-ports-ic
>> +
>> +  reg:
>> +    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
>> +    minItems: 1
>> +    maxItems: 1
> 
> This was never tested but more important this and everything further
> looks like generated by AI. Please don't do that or at least mark it
> clearly, so I will prioritize accordingly (hint: AI generates poor code
> and burden to decipher AI slop should not be on open source reviewers
> but on users of AI, but as one of maintainers probably you already know
> that, so sorry for lecturing).

Yes sorry, overconfidence into AI. Until now I knew almost nothing about 
YAML and the generated file had a good look. I didn't know there was a 
special procedure to test bindings, I thought checkpatch was doing all 
necessary checks.

Fixed in v2.

