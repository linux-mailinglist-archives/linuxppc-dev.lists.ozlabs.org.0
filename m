Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5425115C090
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 15:45:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JK6d42kYzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 01:44:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JK4c0J0gzDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 01:43:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=o5tWhaFh; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48JK4b6tHNz8syf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 01:43:11 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48JK4b6R3Zz9sP7; Fri, 14 Feb 2020 01:43:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=o5tWhaFh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48JK4Z3sRSz9sNg
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Feb 2020 01:43:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48JK4P32LSz9vC10;
 Thu, 13 Feb 2020 15:43:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=o5tWhaFh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bMmmaulTlfWu; Thu, 13 Feb 2020 15:43:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48JK4P1w84z9vC0x;
 Thu, 13 Feb 2020 15:43:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581604981; bh=cRzS0pPJBZpBB4/uIjfoX2ym2rutpALADsYG1Hvzv5k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=o5tWhaFhlDAyu+oUsaUDT/hr88iv6HI9IMFcFJR9vsitKHvtAxwUYN+clTqZE7le+
 rRrjf8gcw79WXwoPteIqvsODtNZ/0GHl+fJnKwroEi4X9YE07SjvNbP3SCqxFA13ez
 uN5lTs+JOSJOF48o2AGurlABDlKQIAUfAssdJvYk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A68478B855;
 Thu, 13 Feb 2020 15:43:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oazMXWC7ZEpE; Thu, 13 Feb 2020 15:43:02 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FA558B84D;
 Thu, 13 Feb 2020 15:43:02 +0100 (CET)
Subject: Re: RESEND: Re: Problem booting a PowerBook G4 Aluminum after commit
 cd08f109 with CONFIG_VMAP_STACK=y
To: Larry Finger <Larry.Finger@lwfinger.net>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
 <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
 <7f63e8a8-95c5-eeca-dc79-3c13f4d98d39@lwfinger.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9429f86e-8c7d-b2e6-6dc1-8f58c44baadc@c-s.fr>
Date: Thu, 13 Feb 2020 14:43:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <7f63e8a8-95c5-eeca-dc79-3c13f4d98d39@lwfinger.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 02/13/2020 02:28 PM, Larry Finger wrote:
> On 2/11/20 1:23 PM, Christophe Leroy wrote:
>> Can you send me a picture of that BUG Unable to handle kernel data 
>> access with all the registers values etc..., together with the 
>> matching vmlinux ?
>>
>> First thing is to identify where we are when that happens. That mean 
>> see what is at 0xc0013674. Can be done with 'ppc-linux-objdump -d 
>> vmlinux' (Or whatever your PPC objdump is named) and get the function 
>> code.
>>
>> Then we need to understand how we reach that function and why it tries 
>> to access a physical address.
>>
>>
>> Another thing I'm thinking about, not necessarily related to that 
>> problem: Some buggy drivers do DMA from stack. This doesn't work 
>> anymore with CONFIG_VMAP_STACK. Most of them can be detected with 
>> CONFIG_DEBUG_VIRTUAL so you should activate it.
> 
> Christophe,
> 
> The previous send of this message failed because the attached vmlinux 
> was too large.
> 
> I have gone about as far as I can in debugging the problem. Setting 
> CONFIG_DEBUG_VIRTUAL made no difference.
> 
> Attached are the final screenshot, and the patches that I have applied. 
> You already have the gzipped vmlinux.
> 

This screenshot makes more sense with the vmlinux you provided, problem 
at 0xc00136dc.

That's in function power_save_ppc32_restore() in 
arch/powerpc/kernel/idle_6xx.S.

c00136c0 <power_save_ppc32_restore>:
c00136c0:	81 2b 00 a0 	lwz     r9,160(r11)
c00136c4:	91 2b 00 90 	stw     r9,144(r11)
c00136c8:	39 60 00 00 	li      r11,0
c00136cc:	7d 30 fa a6 	mfspr   r9,1008
c00136d0:	75 29 00 40 	andis.  r9,r9,64
c00136d4:	41 82 00 18 	beq     c00136ec <power_save_ppc32_restore+0x2c>
c00136d8:	3d 2b 00 7c 	addis   r9,r11,124
 >> c00136dc:	81 29 92 5c 	lwz     r9,-28068(r9)
c00136e0:	7d 36 fb a6 	mtspr   1014,r9
c00136e4:	7c 00 04 ac 	hwsync
c00136e8:	4c 00 01 2c 	isync
c00136ec:	3d 2b 00 7c 	addis   r9,r11,124
c00136f0:	81 29 92 60 	lwz     r9,-28064(r9)
c00136f4:	7d 31 fb a6 	mtspr   1009,r9
c00136f8:	48 00 19 c4 	b       c00150bc <transfer_to_handler_cont>
c00136fc:	00 00 00 00 	.long 0x0

Can you try the change below (won't work anymore without 
CONFIG_VMAP_STACK, will fix it properly later when you confirm it is OK).

diff --git a/arch/powerpc/kernel/idle_6xx.S b/arch/powerpc/kernel/idle_6xx.S
index 0ffdd18b9f26..7be8a0f3fac8 100644
--- a/arch/powerpc/kernel/idle_6xx.S
+++ b/arch/powerpc/kernel/idle_6xx.S
@@ -166,7 +166,7 @@ BEGIN_FTR_SECTION
  	mfspr	r9,SPRN_HID0
  	andis.	r9,r9,HID0_NAP@h
  	beq	1f
-	addis	r9,r11,(nap_save_msscr0-KERNELBASE)@ha
+	addis	r9,r11,nap_save_msscr0@ha
  	lwz	r9,nap_save_msscr0@l(r9)
  	mtspr	SPRN_MSSCR0, r9
  	sync
@@ -174,7 +174,7 @@ BEGIN_FTR_SECTION
  1:
  END_FTR_SECTION_IFSET(CPU_FTR_NAP_DISABLE_L2_PR)
  BEGIN_FTR_SECTION
-	addis	r9,r11,(nap_save_hid1-KERNELBASE)@ha
+	addis	r9,r11,nap_save_hid1@ha
  	lwz	r9,nap_save_hid1@l(r9)
  	mtspr	SPRN_HID1, r9
  END_FTR_SECTION_IFSET(CPU_FTR_DUAL_PLL_750FX)


Thanks
Christophe
