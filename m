Return-Path: <linuxppc-dev+bounces-11079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DEEB29D7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 11:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c56dR6wzsz3cBW;
	Mon, 18 Aug 2025 19:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755508843;
	cv=none; b=GrnKPKaRNpbxE7G/Vbe0+FNU26m3yA+NmYqqHmM6DTZYUmZfd+ou5f9g9NU5LGPzGbwFrkbgPQmaP+AQHaqpmYy390TJ8QbOa8O6Cz8N501qzuYIopz8JZ6N8NBnhPypsMm/xjmqtJ6grQR34IkkLt0rJtJaMBGThIHkj6zpDbllPTmbgIq5kppDL45AvwyM3MD7FxytBpY+VFULs5Ihjz0RLg/M6pZVA+Cj8XJFAHt0FG3/8ywo9KQbzR2n1BKXCig+4oP8dh8gakIIRU4ssOSUclOa3c7+WpSUiq8Tu9g8OA8cH2nnKXkYJd8brAyIzEZNTpOP6NU531vhz4ftfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755508843; c=relaxed/relaxed;
	bh=cmbMvHYcAKL1oYjNvx32A9vsyDt9UugS1sYtvrJfCXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dztOOiP+JM8sUbP0cFUPVX+jb5bIlq2pEEnS8+zlv3/XSIjEOXzsMMZa3zHmODNLvucUas2WwNw/1tzG0+E4t48F7Ox/7fKl06t7S82SyVQS2nZmkQKl1ZHjaH90qceV/BYWy3Bs77867z7g633KUCTJkkJovA8C8AWvjjUIdd3YY3kHVc/QSc7MiFG4ZDerqJfZ8YaWiBqmBDO09xulmFl9199PWtqeOnUuLQW65ttzEZ9BIGXXN/iGe97Z0XAGBfX6XORER6/vLltp023HDgteLNlQZqMLAMixtPjtcwkAFXeysQUUdHx3nDpcn/6zMijxf4Uvm8VW+/UKjTCPkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c56dR3DLJz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 19:20:43 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55kL3mnlz9sWd;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0_Y38SyLNAT; Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55kL2Zsnz9sWc;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AE7D8B764;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0VXbaU8cA_eG; Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E12538B763;
	Mon, 18 Aug 2025 10:39:53 +0200 (CEST)
Message-ID: <88b259e8-433f-49f1-a25b-f65a40c8da65@csgroup.eu>
Date: Mon, 18 Aug 2025 10:39:53 +0200
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
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
 <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 12/08/2025 à 19:16, Rob Herring a écrit :
> On Tue, Aug 12, 2025 at 10:23 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/08/2025 13:02, Christophe Leroy wrote:
>>> The QUICC Engine provides interrupts for a few I/O ports. This is
>>> handled via a separate interrupt ID and managed via a triplet of
>>> dedicated registers hosted by the SoC.
>>>
>>> Implement an interrupt driver for it for that those IRQs can then
>>> be linked to the related GPIOs.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>>>   1 file changed, 63 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>> new file mode 100644
>>> index 0000000000000..7c98706d03dd1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>> @@ -0,0 +1,63 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +
>>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>>> +
>>> +maintainers:
>>> +  - name: Christophe Leroy
>>> +    email: christophe.leroy@csgroup.eu
>>
>> Oh no...
>>
>>> +
>>> +description: |
>>> +  Interrupt controller for the QUICC Engine I/O ports found on some
>>> +  Freescale/NXP PowerQUICC and QorIQ SoCs.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,mpc8323-qe-ports-ic
>>> +      - fsl,mpc8360-qe-ports-ic
>>> +      - fsl,mpc8568-qe-ports-ic
>>> +
>>> +  reg:
>>> +    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
>>> +    minItems: 1
>>> +    maxItems: 1
>>
>> This was never tested but more important this and everything further
>> looks like generated by AI. Please don't do that or at least mark it
>> clearly, so I will prioritize accordingly (hint: AI generates poor code
>> and burden to decipher AI slop should not be on open source reviewers
>> but on users of AI, but as one of maintainers probably you already know
>> that, so sorry for lecturing).
> 
> If anyone needs some AI (chatgpt) converted bindings, my "dt-convert"
> branch has ~800 of them. Feeding the warnings back to AI to fix was
> somewhat effective. The result is not the worst I've seen submitted.
> It saves some of the boilerplate, but can't fix things that are just
> wrong or unclear in .txt bindings. Despite my 'prompt engineering'
> attempts, it still tends to get the same things wrong over and over.

By the way, the new binding was not generated from text binding. I fed 
the AI with the driver C source file.

Christophe

