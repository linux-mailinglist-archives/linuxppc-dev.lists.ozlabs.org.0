Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D984F3EF022
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 18:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpxGL53frz30J5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 02:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GpxFw0js1z2yWr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 02:25:07 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17HGMea1021252;
 Tue, 17 Aug 2021 11:22:40 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17HGMdsF021251;
 Tue, 17 Aug 2021 11:22:39 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 17 Aug 2021 11:22:39 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix random crashes by adding isync() after
 locking/unlocking KUEP
Message-ID: <20210817162239.GF1583@gate.crashing.org>
References: <1d28441dd80845e6428d693c0724cb6457247466.1629211378.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d28441dd80845e6428d693c0724cb6457247466.1629211378.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.4.2.3i
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
Cc: userm57@yahoo.com, fthain@linux-m68k.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 17, 2021 at 02:43:15PM +0000, Christophe Leroy wrote:
> Commit b5efec00b671 ("powerpc/32s: Move KUEP locking/unlocking in C")
> removed the 'isync' instruction after adding/removing NX bit in user
> segments. The reasoning behind this change was that when setting the
> NX bit we don't mind it taking effect with delay as the kernel never
> executes text from userspace, and when clearing the NX bit this is
> to return to userspace and then the 'rfi' should synchronise the
> context.
> 
> However, it looks like on book3s/32 having a hash page table, at least
> on the G3 processor, we get an unexpected fault from userspace, then
> this is followed by something wrong in the verification of MSR_PR
> at end of another interrupt.
> 
> This is fixed by adding back the removed isync() following update
> of NX bit in user segment registers. Only do it for cores with an
> hash table, as 603 cores don't exhibit that problem and the two isync
> increase ./null_syscall selftest by 6 cycles on an MPC 832x.
> 
> First problem: unexpected PROTFAULT
> 
> 	[   62.896426] WARNING: CPU: 0 PID: 1660 at arch/powerpc/mm/fault.c:354 do_page_fault+0x6c/0x5b0
> 	[   62.918111] Modules linked in:
> 	[   62.923350] CPU: 0 PID: 1660 Comm: Xorg Not tainted 5.13.0-pmac-00028-gb3c15b60339a #40
> 	[   62.943476] NIP:  c001b5c8 LR: c001b6f8 CTR: 00000000
> 	[   62.954714] REGS: e2d09e40 TRAP: 0700   Not tainted  (5.13.0-pmac-00028-gb3c15b60339a)

That is not a protection fault.  What causes this?

A CSI (like isync) is required both before and after mtsr.  It may work
on some cores without -- what part of that is luck, if there is anything
that guarantees it, is anyone's guess :-/

> @@ -28,6 +30,8 @@ static inline void kuep_lock(void)
>  		return;
>  
>  	update_user_segments(mfsr(0) | SR_NX);
> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
> +		isync();	/* Context sync required after mtsr() */
>  }

This needs a comment why you are not doing this for systems without
hardware page table walk, at the least?


Segher
