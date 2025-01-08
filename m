Return-Path: <linuxppc-dev+bounces-4802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B29A05368
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 07:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSdp80gjBz2yLJ;
	Wed,  8 Jan 2025 17:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319008;
	cv=none; b=he5qSG2PcI/7x9f6zMM1r+NuvkNkFdwmr7rOtOn2XTfXlh8qPAvpv5oPMe8ceMUEWbUb0bP6J7bE5RdkqA+qo62tWDbZ2k2TeEw/sUhH/fOXjJdF3lBxg19IxJ7T+9nzupS9OlrxMy5J/L7ACarTpOTKbd6kSScNTBEoQVdNge/t6gP7yxVlHX7Xy/AIP/2r+hGi2KnLCTsQXein9NAi5rVkHSiDvTZNT/jrRC4uhsfoywGRELmorpCQtBGCUGGNj+iSXhadojd5NDdAvQhICOV8D5og5C8NtFg2ds206znJHQ0G5SWWu2UR4TxenyuNl6g+3Fa87kN4MIeccEuTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319008; c=relaxed/relaxed;
	bh=Bi11j5NNITm00rjYYBPxJZCc+v6rmWpBCHeEBaJCMqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8fePJBX4Y3AZuU8ZFeFKKEkVhYn661xQIepYovouquSdMb8o0e00kQVYq12IyftyH5JRL2tgfc+8/7brdUyfa4lk9VpeiZtu9r/yH3p5Ar6KnvZY1tGlbyY5Nw1P8aGRXbtFAWUemsoH+cehYsB/ha2jT4BKnQGZVKKN3DwwKosLpyBImjiqVF97G6ZwOIv4ZnLLvDMFUmkjSEkAlzAIZQSB+uy5dmGlFPfeTZwBw+IMhH6Q3r74ljJqSb7yRPN9s5P+7hn5N2B7a01H2vwe2Vszpye3gYWaRMPvdkyJWp50MvdGQMOWJDLjC+3Ij75arLZ0f3VnYrhYtqINdXcRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSdp70DkPz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 17:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSdXw6RjBz9sPd;
	Wed,  8 Jan 2025 07:38:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U78Fjo-CcYje; Wed,  8 Jan 2025 07:38:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSdXw59tPz9rvV;
	Wed,  8 Jan 2025 07:38:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 955858B768;
	Wed,  8 Jan 2025 07:38:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id IuATmTbrlDCX; Wed,  8 Jan 2025 07:38:40 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CF7368B767;
	Wed,  8 Jan 2025 07:38:39 +0100 (CET)
Message-ID: <2311c126-804a-4aee-bddb-abf4929b1073@csgroup.eu>
Date: Wed, 8 Jan 2025 07:38:38 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] powerpc: Generalize MPC831x platform support
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-1-86f78ba2a7af@posteo.net>
 <0b66e94d-7116-4916-b897-06b1199752b4@csgroup.eu> <Z32uk8VJqhlogY50@probook>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Z32uk8VJqhlogY50@probook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 07/01/2025 à 23:45, J. Neuschäfer a écrit :
> [Vous ne recevez pas souvent de courriers de j.ne@posteo.net. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Mon, Jan 06, 2025 at 02:50:31PM +0100, Christophe Leroy wrote:
>>
>>
>> Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
>>> [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: "J. Neuschäfer" <j.ne@posteo.net>
>>>
>>> The Reference Design Boards (RDB) don't have the same relevance they had
>>> then the MPC831x platform was new; if any work is done today, then
>>> likely based on used production boards, which are more readily available
>>> than NXP's discontinued devboards.
>>>
>>> To further reduce the focus on RDBs, add DT compatible strings for all
>>> four MPC8314/5 variants.
>>
>> Seems like this patch does more than adding DT compatible strings.
> 
> I'll move the addition of DT compatibles to a new patch.
> 
>>
>>>
>>> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
>>> ---
> [...]
>>> diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
>>> index d355ad40995fdc0fc3b4355126c65c761c21c296..944ec44a1fa6044b03ac71c295e891cd411ce444 100644
>>> --- a/arch/powerpc/platforms/83xx/Kconfig
>>> +++ b/arch/powerpc/platforms/83xx/Kconfig
>>> @@ -18,12 +18,12 @@ config MPC830x_RDB
>>>           help
>>>             This option enables support for the MPC8308 RDB and MPC8308 P1M boards.
>>>
>>> -config MPC831x_RDB
>>> -       bool "Freescale MPC831x RDB"
>>> +config MPC831x
>>
>> That looks confusing. We already have CONFIG_PPC_MPC831x
> 
> Fair enough. How about CONFIG_MPC831x_BOARDS?

Yes that would be more explicit.

> 
>>
>>> +       bool "Freescale MPC831x boards"
>>>           select DEFAULT_UIMAGE
>>>           select PPC_MPC831x
>>>           help
>>> -         This option enables support for the MPC8313 RDB and MPC8315 RDB boards.
>>> +         This option enables support for all MPC831x-based boards.
>>>
>>>    config MPC832x_RDB
>>>           bool "Freescale MPC832x RDB"
>>> diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
>>> index 6fc3dba943dade4f63da090b520b0c35bb46a091..92fb0b34913e1113d3e6eac49acbb1c32fb06ab7 100644
>>> --- a/arch/powerpc/platforms/83xx/Makefile
>>> +++ b/arch/powerpc/platforms/83xx/Makefile
>>> @@ -6,7 +6,7 @@ obj-y                           := misc.o
>>>    obj-$(CONFIG_SUSPEND)          += suspend.o suspend-asm.o
>>>    obj-$(CONFIG_MCU_MPC8349EMITX) += mcu_mpc8349emitx.o
>>>    obj-$(CONFIG_MPC830x_RDB)      += mpc830x_rdb.o
>>> -obj-$(CONFIG_MPC831x_RDB)      += mpc831x_rdb.o
>>> +obj-$(CONFIG_MPC831x)          += mpc831x.o
>>>    obj-$(CONFIG_MPC832x_RDB)      += mpc832x_rdb.o
>>>    obj-$(CONFIG_MPC834x_ITX)      += mpc834x_itx.o
>>>    obj-$(CONFIG_MPC836x_RDK)      += mpc836x_rdk.o
>>> diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x.c
>>> similarity index 65%
>>> rename from arch/powerpc/platforms/83xx/mpc831x_rdb.c
>>> rename to arch/powerpc/platforms/83xx/mpc831x.c
>>> index 5c39966762e4264d2ef91b2c4ef75fdf2c2c5d65..7250fc11c7ee80b266f39d0b3aebb0deb777c129 100644
>>> --- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
>>> +++ b/arch/powerpc/platforms/83xx/mpc831x.c
>>> @@ -1,8 +1,8 @@
>>>    // SPDX-License-Identifier: GPL-2.0-or-later
>>>    /*
>>> - * arch/powerpc/platforms/83xx/mpc831x_rdb.c
>>> + * arch/powerpc/platforms/83xx/mpc831x.c
>>
>> Please remove the file name from the file.
> 
> Will do.
> 
>>>     *
>>> - * Description: MPC831x RDB board specific routines.
>>> + * Description: MPC831x board specific routines.
>>
>> s/board/boards ?
> 
> No, the "board" in "board specific" doesn't get pluralized when there
> are multiple boards. How about the following?
> 
>        * Description: MPC831x specific routines.

Ok

Christophe

