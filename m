Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C086285B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:13:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458yLD0JYqzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 04:13:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ODTH0Hcv"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458yJq3HdczDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 04:12:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458yJg4QJqz9v6W2;
 Thu, 23 May 2019 20:12:19 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ODTH0Hcv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MK8yZGatrBCh; Thu, 23 May 2019 20:12:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458yJg3NSXz9v6W1;
 Thu, 23 May 2019 20:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558635139; bh=BrS00nqs+EfozkyQk4VFem0LkSQsETrP9vUIIyEd7ms=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ODTH0HcvMGkXaivF+uJ30VywGVK9IJnmeniWmUBA+7yS71ZWwVQi5urgXGpxtgCRv
 +OQc5hGJSNmhQtMK4DIv0NF8NQlE6PS6EhEyFB4TNyBTw+G6rQv4RXTCiveLemHg7s
 DiwgVKTHrpnWzxq66VRFEDuhCV1Xr7XaLo8P05dM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C5C38B875;
 Thu, 23 May 2019 20:12:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ogkcH_hF6zzM; Thu, 23 May 2019 20:12:19 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D9B38B869;
 Thu, 23 May 2019 20:12:19 +0200 (CEST)
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
To: Mathieu Malaterre <malat@debian.org>
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
 <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
 <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
 <CA+7wUsxoCrqw5MH+8QrT4kVVC0AcwdgUu3Zuy+-GGU=bU1_ezg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <225acfb1-2eed-ed7b-fd82-732a3f8b746a@c-s.fr>
Date: Thu, 23 May 2019 18:08:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CA+7wUsxoCrqw5MH+8QrT4kVVC0AcwdgUu3Zuy+-GGU=bU1_ezg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/23/2019 10:16 AM, Mathieu Malaterre wrote:
> On Thu, May 23, 2019 at 11:45 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>>
>>
>> Le 23/05/2019 à 10:53, Mathieu Malaterre a écrit :
>>>
>>> I confirm powerpc/merge does not boot for me (same config). Commit id:
>>>
>>> a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
>>> 'next' and 'fixes' into merge
>>
>> I see in the config you sent me that you have selected CONFIG_KASAN,
>> which is a big new stuff.
>>
>> Can you try without it ?
> 
> With same config but CONFIG_KASAN=n (on top of a27eaa62326d), I can
> reproduce the boot failure (no change).
> 
> Time for bisect ?
> 

I found the issue. In order to be able to support KASAN, the setup of 
segments have moved earlier in the boot. Your problem is a side effect 
of this change.
Function setup_disp_bat() is supposed to setup BAT3 for btext data.
But setup_disp_bat() rely on someone setting in disp_BAT the values to 
be loaded into BATs. This is done by btext_prepare_BAT() which is called 
by bootx_init().
The problem is that bootx_init() is never called, so setup_disp_bat() 
does nothing and the access to btext data is possible because the 
bootloader has set an entry for it in the hash table.

But by setting up the segment earlier, we break the bootloader hash 
table, which shouldn't be an issue if the BATs had been set properly as 
expected.

The problematic commit is 215b823707ce ("powerpc/32s: set up an early 
static hash table for KASAN)"

Here is a dirty fix that works for me when CONFIG_KASAN is NOT set.
Of course, the real fix has to be to setup the BATs properly, but I 
won't have time to look at that before June. Maybe you can ?

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 755fab9641d6..fba16970c028 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -162,7 +162,6 @@ __after_mmu_off:
  	bl	flush_tlbs

  	bl	initial_bats
-	bl	load_segment_registers
  #ifdef CONFIG_KASAN
  	bl	early_hash_table
  #endif
@@ -920,6 +919,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
  	RFI
  /* Load up the kernel context */
  2:	bl	load_up_mmu
+	bl	load_segment_registers

  #ifdef CONFIG_BDI_SWITCH
  	/* Add helper information for the Abatron bdiGDB debugger.

Christophe
