Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA47457FF57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 14:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls0Mz4fw4z3cd9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:53:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mGeVBIlw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mGeVBIlw;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls0MP16Ggz30QW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 22:53:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 25244CE127A;
	Mon, 25 Jul 2022 12:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F43BC341C6;
	Mon, 25 Jul 2022 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658753580;
	bh=ROkD0ewTSUbH5Y4MAS09LLcGBMU0zKBF8A8Cpc0zxY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGeVBIlwPwUuiYIKxmetHBzzuORpyQ+/K/nyNq4h4UfKwwKj7hMqOb1NUh5oaluGu
	 86G61mxrV/YqLhdeRjk7VPAvsstG8Ek/Cf6dj3FYts1IhxNF5UyKr7jRgMbU/qTyhQ
	 xMWzcS+PpkZKLsmgZDKdAsETrB2z19uTMU9A395cu7XCfrN8XpIO50A+RVAbixrBqH
	 C/eHd+ycnJwgBhy+0lotqrq61oD82iMPOZ3FZevEhEkgWjcbrHtvE+x8PXTTdLilJT
	 jxXB4dZwXhFsyqc98gwi1qsef+xP5l1ZXggWoHV5u+wFsKf2tXmpkm7TodQKOZrvD/
	 GEGaHffQBdZ2Q==
Received: by pali.im (Postfix)
	id 00CDF793; Mon, 25 Jul 2022 14:52:56 +0200 (CEST)
Date: Mon, 25 Jul 2022 14:52:56 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Message-ID: <20220725125256.cg6su4d2ageylvp6@pali>
References: <20220722090929.mwhmxxdd7yioxqpz@pali>
 <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
 <20220723150702.jecerkhxhy65dgww@pali>
 <875yjld2oe.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yjld2oe.fsf@mpe.ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 25 July 2022 18:20:01 Michael Ellerman wrote:
> Pali Rohár <pali@kernel.org> writes:
> > On Saturday 23 July 2022 14:42:22 Christophe Leroy wrote:
> >> Le 22/07/2022 à 11:09, Pali Rohár a écrit :
> >> > Trying to boot mainline Linux kernel v5.15+, including current version
> >> > from master branch, on Freescale P2020 does not work. Kernel does not
> >> > print anything to serial console, seems that it does not work and after
> >> > timeout watchdog reset the board.
> >> 
> >> Can you provide more information ? Which defconfig or .config, which 
> >> version of gcc, etc ... ?
> >
> > I used default defconfig for mpc85xx with gcc 8, compilation for e500
> > cores.
> >
> > If you need exact .config content I can send it during week.
> >
> >> > I run git bisect and it found following commit:
> >> > 
> >> > 9401f4e46cf6965e23738f70e149172344a01eef is the first bad commit
> >> > commit 9401f4e46cf6965e23738f70e149172344a01eef
> >> > Author: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> > Date:   Tue Mar 2 08:48:11 2021 +0000
> >> > 
> >> >      powerpc: Use lwarx/ldarx directly instead of PPC_LWARX/LDARX macros
> >> > 
> >> >      Force the eh flag at 0 on PPC32.
> >> > 
> >> >      Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> >      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >> >      Link: https://lore.kernel.org/r/1fc81f07cabebb875b963e295408cc3dd38c8d85.1614674882.git.christophe.leroy@csgroup.eu
> >> > 
> >> > :040000 040000 fe6747e45736dfcba74914a9445e5f70f5120600 96358d08b65d3200928a973efb5b969b3d45f2b0 M      arch
> >> > 
> >> > 
> >> > If I revert this commit then kernel boots correctly. It also boots fine
> >> > if I revert this commit on top of master branch.
> >> > 
> >> > Freescale P2020 has two 32-bit e500 powerpc cores.
> >> > 
> >> > Any idea why above commit is causing crash of the kernel? And why it is
> >> > needed? Could eh flag set to 0 cause deadlock?
> >> 
> >> Setting the eh flag to 0 is not supposed to be a change introduced by 
> >> that commit. Indeed that commit is not supposed to change anything at 
> >> all in the generated code.
> >
> > My understanding of that commit is that it changed eh flag parameter
> > from 1 to 0 for 32-bit powerpc, including also p2020.
> 
> Can you compare the disassembly before and after and find a place where
> an instruction has changed?
> 
> cheers

Yes, of course. Here is diff between output from objdump -d vmlinux.
original version --- is from git master branch and modified version +++
is the original version with reverted above problematic commit.
So the +++ version is the one which is working.

--- vmlinux.master.dump	2022-07-25 14:43:45.922239496 +0200
+++ vmlinux.revert.dump	2022-07-25 14:43:49.238259296 +0200
@@ -1,5 +1,5 @@
 
-vmlinux.master:     file format elf32-powerpc
+vmlinux.revert:     file format elf32-powerpc
 
 
 Disassembly of section .head.text:
@@ -11213,7 +11213,7 @@ c000b850:	3f a0 c1 0f 	lis     r29,-1611
 c000b854:	81 02 00 04 	lwz     r8,4(r2)
 c000b858:	3b fd 10 68 	addi    r31,r29,4200
 c000b85c:	39 40 00 01 	li      r10,1
-c000b860:	7d 20 f8 29 	lwarx   r9,0,r31,1
+c000b860:	7d 20 f8 28 	lwarx   r9,0,r31
 c000b864:	2c 09 00 00 	cmpwi   r9,0
 c000b868:	40 82 00 10 	bne     c000b878 <die+0x68>
 c000b86c:	7d 40 f9 2d 	stwcx.  r10,0,r31
@@ -11227,7 +11227,7 @@ c000b888:	81 3e 00 1c 	lwz     r9,28(r30
 c000b88c:	7f 88 48 00 	cmpw    cr7,r8,r9
 c000b890:	41 9e 00 38 	beq     cr7,c000b8c8 <die+0xb8>
 c000b894:	39 40 00 01 	li      r10,1
-c000b898:	7d 20 f8 29 	lwarx   r9,0,r31,1
+c000b898:	7d 20 f8 28 	lwarx   r9,0,r31
 c000b89c:	2c 09 00 00 	cmpwi   r9,0
 c000b8a0:	40 82 00 10 	bne     c000b8b0 <die+0xa0>
 c000b8a4:	7d 40 f9 2d 	stwcx.  r10,0,r31
@@ -186495,7 +186495,7 @@ c00b173c:	3b 40 00 00 	li      r26,0
 c00b1740:	3a e0 00 00 	li      r23,0
 c00b1744:	7e c0 00 a6 	mfmsr   r22
 c00b1748:	7c 00 01 46 	wrteei  0
-c00b174c:	7f a0 c0 29 	lwarx   r29,0,r24,1
+c00b174c:	7f a0 c0 28 	lwarx   r29,0,r24
 c00b1750:	2c 1d 00 00 	cmpwi   r29,0
 c00b1754:	40 82 00 10 	bne     c00b1764 <rcu_gp_init+0x15c>
 c00b1758:	7f 20 c1 2d 	stwcx.  r25,0,r24
@@ -187821,7 +187821,7 @@ c00b2b7c:	3f e0 c1 0b 	lis     r31,-1611
 c00b2b80:	38 c0 00 01 	li      r6,1
 c00b2b84:	3b ff c5 20 	addi    r31,r31,-15072
 c00b2b88:	38 ff 02 20 	addi    r7,r31,544
-c00b2b8c:	7d 00 38 29 	lwarx   r8,0,r7,1
+c00b2b8c:	7d 00 38 28 	lwarx   r8,0,r7
 c00b2b90:	2c 08 00 00 	cmpwi   r8,0
 c00b2b94:	40 82 00 10 	bne     c00b2ba4 <rcu_cpu_starting+0xc0>
 c00b2b98:	7c c0 39 2d 	stwcx.  r6,0,r7
@@ -187947,7 +187947,7 @@ c00b2d6c:	3f a0 c1 0b 	lis     r29,-1611
 c00b2d70:	39 00 00 01 	li      r8,1
 c00b2d74:	3b bd c5 20 	addi    r29,r29,-15072
 c00b2d78:	39 3d 02 20 	addi    r9,r29,544
-c00b2d7c:	7d 40 48 29 	lwarx   r10,0,r9,1
+c00b2d7c:	7d 40 48 28 	lwarx   r10,0,r9
 c00b2d80:	2c 0a 00 00 	cmpwi   r10,0
 c00b2d84:	40 82 00 10 	bne     c00b2d94 <rcu_report_dead+0x90>
 c00b2d88:	7d 00 49 2d 	stwcx.  r8,0,r9
@@ -2527838,7 +2527838,7 @@ c096b0e4:	4e 80 00 20 	blr
 c096b0e8 <_raw_spin_trylock>:
 c096b0e8:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b0ec:	39 40 00 01 	li      r10,1
-c096b0f0:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b0f0:	7d 20 18 28 	lwarx   r9,0,r3
 c096b0f4:	2c 09 00 00 	cmpwi   r9,0
 c096b0f8:	40 82 00 10 	bne     c096b108 <_raw_spin_trylock+0x20>
 c096b0fc:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2527853,7 +2527853,7 @@ c096b11c:	4e 80 00 20 	blr
 
 c096b120 <_raw_read_trylock>:
 c096b120:	94 21 ff f0 	stwu    r1,-16(r1)
-c096b124:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b124:	7d 20 18 28 	lwarx   r9,0,r3
 c096b128:	35 29 00 01 	addic.  r9,r9,1
 c096b12c:	40 81 00 10 	ble     c096b13c <_raw_read_trylock+0x1c>
 c096b130:	7d 20 19 2d 	stwcx.  r9,0,r3
@@ -2527869,7 +2527869,7 @@ c096b150:	4e 80 00 20 	blr
 c096b154 <_raw_write_trylock>:
 c096b154:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b158:	39 40 ff ff 	li      r10,-1
-c096b15c:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b15c:	7d 20 18 28 	lwarx   r9,0,r3
 c096b160:	2c 09 00 00 	cmpwi   r9,0
 c096b164:	40 82 00 10 	bne     c096b174 <_raw_write_trylock+0x20>
 c096b168:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2527888,7 +2527888,7 @@ c096b190:	81 22 00 00 	lwz     r9,0(r2)
 c096b194:	39 29 02 00 	addi    r9,r9,512
 c096b198:	91 22 00 00 	stw     r9,0(r2)
 c096b19c:	39 40 00 01 	li      r10,1
-c096b1a0:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b1a0:	7d 20 18 28 	lwarx   r9,0,r3
 c096b1a4:	2c 09 00 00 	cmpwi   r9,0
 c096b1a8:	40 82 00 10 	bne     c096b1b8 <_raw_spin_lock_bh+0x2c>
 c096b1ac:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2527940,7 +2527940,7 @@ c096b240:	81 22 00 00 	lwz     r9,0(r2)
 c096b244:	39 29 02 00 	addi    r9,r9,512
 c096b248:	91 22 00 00 	stw     r9,0(r2)
 c096b24c:	39 40 00 01 	li      r10,1
-c096b250:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b250:	7d 20 18 28 	lwarx   r9,0,r3
 c096b254:	2c 09 00 00 	cmpwi   r9,0
 c096b258:	40 82 00 10 	bne     c096b268 <_raw_spin_trylock_bh+0x34>
 c096b25c:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2527997,7 +2527997,7 @@ c096b304:	94 21 ff f0 	stwu    r1,-16(r1
 c096b308:	81 22 00 00 	lwz     r9,0(r2)
 c096b30c:	39 29 02 00 	addi    r9,r9,512
 c096b310:	91 22 00 00 	stw     r9,0(r2)
-c096b314:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b314:	7d 20 18 28 	lwarx   r9,0,r3
 c096b318:	35 29 00 01 	addic.  r9,r9,1
 c096b31c:	40 81 00 10 	ble     c096b32c <_raw_read_lock_bh+0x28>
 c096b320:	7d 20 19 2d 	stwcx.  r9,0,r3
@@ -2528018,7 +2528018,7 @@ c096b350:	81 22 00 00 	lwz     r9,0(r2)
 c096b354:	39 29 02 00 	addi    r9,r9,512
 c096b358:	91 22 00 00 	stw     r9,0(r2)
 c096b35c:	39 40 ff ff 	li      r10,-1
-c096b360:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b360:	7d 20 18 28 	lwarx   r9,0,r3
 c096b364:	2c 09 00 00 	cmpwi   r9,0
 c096b368:	40 82 00 10 	bne     c096b378 <_raw_write_lock_bh+0x2c>
 c096b36c:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2528035,7 +2528035,7 @@ c096b394:	4b ff ff f4 	b       c096b388
 
 c096b398 <_raw_read_lock>:
 c096b398:	94 21 ff f0 	stwu    r1,-16(r1)
-c096b39c:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b39c:	7d 20 18 28 	lwarx   r9,0,r3
 c096b3a0:	35 29 00 01 	addic.  r9,r9,1
 c096b3a4:	40 81 00 10 	ble     c096b3b4 <_raw_read_lock+0x1c>
 c096b3a8:	7d 20 19 2d 	stwcx.  r9,0,r3
@@ -2528053,7 +2528053,7 @@ c096b3d0:	4b ff ff f4 	b       c096b3c4
 c096b3d4 <_raw_read_lock_irq>:
 c096b3d4:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b3d8:	7c 00 01 46 	wrteei  0
-c096b3dc:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b3dc:	7d 20 18 28 	lwarx   r9,0,r3
 c096b3e0:	35 29 00 01 	addic.  r9,r9,1
 c096b3e4:	40 81 00 10 	ble     c096b3f4 <_raw_read_lock_irq+0x20>
 c096b3e8:	7d 20 19 2d 	stwcx.  r9,0,r3
@@ -2528073,7 +2528073,7 @@ c096b414:	94 21 ff f0 	stwu    r1,-16(r1
 c096b418:	7c 6a 1b 78 	mr      r10,r3
 c096b41c:	7c 60 00 a6 	mfmsr   r3
 c096b420:	7c 00 01 46 	wrteei  0
-c096b424:	7d 20 50 29 	lwarx   r9,0,r10,1
+c096b424:	7d 20 50 28 	lwarx   r9,0,r10
 c096b428:	35 29 00 01 	addic.  r9,r9,1
 c096b42c:	40 81 00 10 	ble     c096b43c <_raw_read_lock_irqsave+0x28>
 c096b430:	7d 20 51 2d 	stwcx.  r9,0,r10
@@ -2528091,7 +2528091,7 @@ c096b458:	4b ff ff f4 	b       c096b44c
 c096b45c <_raw_spin_lock>:
 c096b45c:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b460:	39 40 00 01 	li      r10,1
-c096b464:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b464:	7d 20 18 28 	lwarx   r9,0,r3
 c096b468:	2c 09 00 00 	cmpwi   r9,0
 c096b46c:	40 82 00 10 	bne     c096b47c <_raw_spin_lock+0x20>
 c096b470:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2528110,7 +2528110,7 @@ c096b49c <_raw_spin_lock_irq>:
 c096b49c:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b4a0:	7c 00 01 46 	wrteei  0
 c096b4a4:	39 40 00 01 	li      r10,1
-c096b4a8:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b4a8:	7d 20 18 28 	lwarx   r9,0,r3
 c096b4ac:	2c 09 00 00 	cmpwi   r9,0
 c096b4b0:	40 82 00 10 	bne     c096b4c0 <_raw_spin_lock_irq+0x24>
 c096b4b4:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2528131,7 +2528131,7 @@ c096b4e4:	7c 6a 1b 78 	mr      r10,r3
 c096b4e8:	7c 60 00 a6 	mfmsr   r3
 c096b4ec:	7c 00 01 46 	wrteei  0
 c096b4f0:	39 00 00 01 	li      r8,1
-c096b4f4:	7d 20 50 29 	lwarx   r9,0,r10,1
+c096b4f4:	7d 20 50 28 	lwarx   r9,0,r10
 c096b4f8:	2c 09 00 00 	cmpwi   r9,0
 c096b4fc:	40 82 00 10 	bne     c096b50c <_raw_spin_lock_irqsave+0x2c>
 c096b500:	7d 00 51 2d 	stwcx.  r8,0,r10
@@ -2528149,7 +2528149,7 @@ c096b528:	4b ff ff f4 	b       c096b51c
 c096b52c <_raw_write_lock_nested>:
 c096b52c:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b530:	39 40 ff ff 	li      r10,-1
-c096b534:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b534:	7d 20 18 28 	lwarx   r9,0,r3
 c096b538:	2c 09 00 00 	cmpwi   r9,0
 c096b53c:	40 82 00 10 	bne     c096b54c <_raw_write_lock_nested+0x20>
 c096b540:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2528167,7 +2528167,7 @@ c096b568:	4b ff ff f4 	b       c096b55c
 c096b56c <_raw_write_lock>:
 c096b56c:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b570:	39 40 ff ff 	li      r10,-1
-c096b574:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b574:	7d 20 18 28 	lwarx   r9,0,r3
 c096b578:	2c 09 00 00 	cmpwi   r9,0
 c096b57c:	40 82 00 10 	bne     c096b58c <_raw_write_lock+0x20>
 c096b580:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2528186,7 +2528186,7 @@ c096b5ac <_raw_write_lock_irq>:
 c096b5ac:	94 21 ff f0 	stwu    r1,-16(r1)
 c096b5b0:	7c 00 01 46 	wrteei  0
 c096b5b4:	39 40 ff ff 	li      r10,-1
-c096b5b8:	7d 20 18 29 	lwarx   r9,0,r3,1
+c096b5b8:	7d 20 18 28 	lwarx   r9,0,r3
 c096b5bc:	2c 09 00 00 	cmpwi   r9,0
 c096b5c0:	40 82 00 10 	bne     c096b5d0 <_raw_write_lock_irq+0x24>
 c096b5c4:	7d 40 19 2d 	stwcx.  r10,0,r3
@@ -2528207,7 +2528207,7 @@ c096b5f4:	7c 6a 1b 78 	mr      r10,r3
 c096b5f8:	7c 60 00 a6 	mfmsr   r3
 c096b5fc:	7c 00 01 46 	wrteei  0
 c096b600:	39 00 ff ff 	li      r8,-1
-c096b604:	7d 20 50 29 	lwarx   r9,0,r10,1
+c096b604:	7d 20 50 28 	lwarx   r9,0,r10
 c096b608:	2c 09 00 00 	cmpwi   r9,0
 c096b60c:	40 82 00 10 	bne     c096b61c <_raw_write_lock_irqsave+0x2c>
 c096b610:	7d 00 51 2d 	stwcx.  r8,0,r10
