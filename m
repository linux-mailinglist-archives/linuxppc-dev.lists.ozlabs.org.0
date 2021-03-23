Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5937345F9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 14:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4XHf4yPSz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 00:28:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4XHH65LZz2ywx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 00:27:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F4XH70jjqz9v1GL;
 Tue, 23 Mar 2021 14:27:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RzqWHqF5nznC; Tue, 23 Mar 2021 14:27:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F4XH66lWHz9v1GJ;
 Tue, 23 Mar 2021 14:27:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4CFA18B7F7;
 Tue, 23 Mar 2021 14:27:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TWHHaF8PUfFg; Tue, 23 Mar 2021 14:27:48 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4B0A8B7F4;
 Tue, 23 Mar 2021 14:27:47 +0100 (CET)
Subject: Re: [PATCH v11 0/6] KASAN for powerpc64 radix
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20210319144058.772525-1-dja@axtens.net>
 <5a3b5952-b31f-42bf-eaf4-ea24444f8df6@csgroup.eu>
 <87ft0mbr6r.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a5e1d7c5-3ebc-283c-2c9d-55d36d03cf48@csgroup.eu>
Date: Tue, 23 Mar 2021 14:27:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87ft0mbr6r.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/03/2021 à 02:21, Daniel Axtens a écrit :
> Hi Christophe,
> 
>> In the discussion we had long time ago,
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20190806233827.16454-5-dja@axtens.net/#2321067
>> , I challenged you on why it was not possible to implement things the same way as other
>> architectures, in extenso with an early mapping.
>>
>> Your first answer was that too many things were done in real mode at startup. After some discussion
>> you said that finally there was not that much things at startup but the issue was KVM.
>>
>> Now you say that instrumentation on KVM is fully disabled.
>>
>> So my question is, if KVM is not a problem anymore, why not go the standard way with an early shadow
>> ? Then you could also support inline instrumentation.
> 
> Fair enough, I've had some trouble both understanding the problem myself
> and clearly articulating it. Let me try again.
> 
> We need translations on to access the shadow area.
> 
> We reach setup_64.c::early_setup() with translations off. At this point
> we don't know what MMU we're running under, or our CPU features.

What do you need to know ? Whether it is Hash or Radix, or more/different details ?

IIUC, today we only support KASAN on Radix. Would it make sense to say that a kernel built with 
KASAN can only run on processors having Radix capacility ? Then select CONFIG_PPC_RADIX_MMU_DEFAULT 
when KASAN is set, and accept that the kernel crashes if Radix is not available ?

> 
> To determine our MMU and CPU features, early_setup() calls functions
> (dt_cpu_ftrs_init, early_init_devtree) that call out to generic code
> like of_scan_flat_dt. We need to do this before we turn on translations
> because we can't set up the MMU until we know what MMU we have.
> 
> So this puts us in a bind:
> 
>   - We can't set up an early shadow until we have translations on, which
>     requires that the MMU is set up.
> 
>   - We can't set up an MMU until we call out to generic code for FDT
>     parsing.
> 
> So there will be calls to generic FDT parsing code that happen before the
> early shadow is set up.

I see some logic in kernel/prom_init.c for detecting MMU. Can we get the information from there in 
order to setup the MMU ?

> 
> The setup code also prints a bunch of information about the platform
> with printk() while translations are off, so it wouldn't even be enough
> to disable instrumentation for bits of the generic DT code on ppc64.

I'm sure the printk() stuff can be avoided or delayed without much problems, I guess the main 
problem is the DT code, isn't it ?

As far as I can see the code only use udbg_printf() before MMU is on, and this could be simply 
skipped when KASAN is selected, I see no situation where you need early printk together with KASAN.

> 
> Does that make sense? If you can figure out how to 'square the circle'
> here I'm all ears.

Yes it is a lot more clear now, thanks you. Gave a few ideas above, does it help ?

> 
> Other notes:
> 
>   - There's a comment about printk() being 'safe' in early_setup(), that
>     refers to having a valid PACA, it doesn't mean that it's safe in any
>     other sense.
> 
>   - KVM does indeed also run stuff with translations off but we can catch
>     all of that by disabling instrumentation on the real-mode handlers:
>     it doesn't seem to leak out to generic code. So you are right that
>     KVM is no longer an issue.
> 

Christophe
