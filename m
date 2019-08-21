Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1CB98599
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:28:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DK4d5hTMzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 06:28:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="UEGX7GLD"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DK2h5vnmzDq67
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 06:27:08 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DK2d1nKsz9txLD;
 Wed, 21 Aug 2019 22:27:05 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UEGX7GLD; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id omHAs3bIZtOR; Wed, 21 Aug 2019 22:27:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DK2d0ct3z9txLC;
 Wed, 21 Aug 2019 22:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566419225; bh=enIzX4gTmPO57E1bMI8/3i3N4dyfDt6FfgzQCgdsq8c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UEGX7GLD3G7m5UQVeRbUtXvlSn3u2/0mfAA/bWVbpbl0amwzLCj/Bvno6MzlW48Ht
 fvD6s2zS7bjFRsNBLRNLJ/wy5O1Rw3WjXClo/3zfsZTXDjbGtB7n+jUN2kqpO1McrW
 biIyhp/gI7U8HwthutgxFHrgzMNbYHdvaeSySXp4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D27A8B7FA;
 Wed, 21 Aug 2019 22:27:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eD9Vv9KqC7Og; Wed, 21 Aug 2019 22:27:05 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C6A958B7F9;
 Wed, 21 Aug 2019 22:27:04 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
To: Alastair D'Silva <alastair@au1.ibm.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
 <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a0ad8dd8-2f5d-256d-9e88-e9c236335bb8@c-s.fr>
Date: Wed, 21 Aug 2019 22:27:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/08/2019 à 06:36, Alastair D'Silva a écrit :
> On Fri, 2019-08-16 at 15:52 +0000, Christophe Leroy wrote:

[...]

> 
> 
> Thanks Christophe,
> 
> I'm trying a somewhat different approach that requires less knowledge
> of assembler. Handling of CPU_FTR_COHERENT_ICACHE is outside this
> function. The code below is not a patch as my tree is a bit messy,
> sorry:

Can we be 100% sure that GCC won't add any code accessing some global 
data or stack while the Data MMU is OFF ?

Christophe


> 
> /**
>   * flush_dcache_icache_phys() - Flush a page by it's physical address
>   * @addr: the physical address of the page
>   */
> static void flush_dcache_icache_phys(unsigned long addr)
> {
> 	register unsigned long msr;
> 	register unsigned long dlines = PAGE_SIZE >> l1_dcache_shift();
> 	register unsigned long dbytes = l1_dcache_bytes();
> 	register unsigned long ilines = PAGE_SIZE >> l1_icache_shift();
> 	register unsigned long ibytes = l1_icache_bytes();
> 	register unsigned long i;
> 	register unsigned long address = addr;
> 
> 	/*
> 	 * Clear the DR bit so that we operate on physical
> 	 * rather than virtual addresses
> 	 */
> 	msr = mfmsr();
> 	mtmsr(msr & ~(MSR_DR));
> 
> 	/* Write out the data cache */
> 	for (i = 0; i < dlines; i++, address += dbytes)
> 		dcbst((void *)address);
> 
> 	/* Invalidate the instruction cache */
> 	address = addr;
> 	for (i = 0; i < ilines; i++, address += ibytes)
> 		icbi((void *)address);
> 
> 	mtmsr(msr);
> }
> 
> void test_flush_phys(unsigned long addr)
> {
> 	flush_dcache_icache_phys(addr);
> }
> 
> 
> This gives the following assembler (using pmac32_defconfig):
> 000003cc <test_flush_phys>:
>   3cc:   94 21 ff f0     stwu    r1,-16(r1)
>   3d0:   7d 00 00 a6     mfmsr   r8
>   3d4:   55 09 07 34     rlwinm  r9,r8,0,28,26
>   3d8:   7d 20 01 24     mtmsr   r9
>   3dc:   39 20 00 80     li      r9,128
>   3e0:   7d 29 03 a6     mtctr   r9
>   3e4:   39 43 10 00     addi    r10,r3,4096
>   3e8:   7c 69 1b 78     mr      r9,r3
>   3ec:   7c 00 48 6c     dcbst   0,r9
>   3f0:   39 29 00 20     addi    r9,r9,32
>   3f4:   42 00 ff f8     bdnz    3ec <test_flush_phys+0x20>
>   3f8:   7c 00 1f ac     icbi    0,r3
>   3fc:   38 63 00 20     addi    r3,r3,32
>   400:   7f 8a 18 40     cmplw   cr7,r10,r3
>   404:   40 9e ff f4     bne     cr7,3f8 <test_flush_phys+0x2c>
>   408:   7d 00 01 24     mtmsr   r8
>   40c:   38 21 00 10     addi    r1,r1,16
>   410:   4e 80 00 20     blr
> 
> 
