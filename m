Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 621DE1884B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 12:27:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4508fN08jtzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 20:27:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="RYvFD+U4"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4508d35sTYzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 20:25:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4508cw4MQ8z9v0w0;
 Thu,  9 May 2019 12:25:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RYvFD+U4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OQ1XD7IYUQTy; Thu,  9 May 2019 12:25:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4508cw2WNzz9v0vy;
 Thu,  9 May 2019 12:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557397552; bh=oM9IN291q28btKotl5Li3AUbMIgpJSnY/pmdUpLnu44=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=RYvFD+U4qKtzxXRaRu3IQJO/HOIybJuw4mJ5M6hyGWftQPNewAt6NLoOyFXYpBU9c
 au/GamquRRnVmMg4JXOWHHGyAvcrgBFnqqfM76yNkzTlBUnU9YGrd2Q9ByNF7qJ2FO
 AKk/UoBSmA/J/XdGqax+8MpoMSpYv4FG4os4DkwY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F2148B913;
 Thu,  9 May 2019 12:25:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Lw_908122swu; Thu,  9 May 2019 12:25:53 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 50FAB8B90D;
 Thu,  9 May 2019 12:25:53 +0200 (CEST)
Subject: Re: [Bug 203125] Kernel 5.1-rc1 fails to boot on a PowerMac G4 3,6:
 Caused by (from SRR1=141020): Transfer error ack signal
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <bug-203125-206035@https.bugzilla.kernel.org/>
 <bug-203125-206035-A0uW2ahLrr@https.bugzilla.kernel.org/>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <61f41a0d-ebb4-5237-91df-bebfafb3b5ca@c-s.fr>
Date: Thu, 9 May 2019 10:22:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <bug-203125-206035-A0uW2ahLrr@https.bugzilla.kernel.org/>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/09/2019 10:05 AM, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=203125
> 
> Christophe Leroy (christophe.leroy@c-s.fr) changed:
> 
>             What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                   CC|                            |christophe.leroy@c-s.fr
> 
> --- Comment #5 from Christophe Leroy (christophe.leroy@c-s.fr) ---
> Apparently, MSR DR is not sent and DAR has value 0xc0090654, meaning that a
> virt address tries to get accessed while in real mode.
> 

Could you try the patch below:

diff --git a/arch/powerpc/mm/book3s32/hash_low.S 
b/arch/powerpc/mm/book3s32/hash_low.S
index e27792d0b744..8366c2abeafc 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -539,7 +539,8 @@ _GLOBAL(flush_hash_pages)
  #ifdef CONFIG_SMP
  	lis	r9, (mmu_hash_lock - PAGE_OFFSET)@ha
  	addi	r9, r9, (mmu_hash_lock - PAGE_OFFSET)@l
-	lwz	r8,TASK_CPU(r2)
+	tophys	(r8, r2)
+	lwz	r8, TASK_CPU(r8)
  	oris	r8,r8,9
  10:	lwarx	r0,0,r9
  	cmpi	0,r0,0


Christophe
