Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABAA3F7DB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 23:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvzYN4nTFz2yfg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 07:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JFqjPb4Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JFqjPb4Y; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvzXg0cGRz2xrk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 07:25:22 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FA79610A1;
 Wed, 25 Aug 2021 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629926719;
 bh=CeaJGcL5TPB/VT6KtN5ovF2oKKTE6SyCZvsi7/rIFac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFqjPb4YCOxJ3F/skQ4AkEBps8jk75StB3LkrUJR8feAcsRe5Me1TUncHxQsy1gRd
 Flmf5hWWVMn3MBcinFB0+0tZkp6AnwnslcOEdckuU6qrpsDp1vZ5mBP3dDEuCJMJpj
 dcgb2RI2Fv0Ixi8aC8YjVEyrz77AgfnMBBuBhG0F1DHBCGrQ2BgTzCXUigTcARAE2b
 W6VHz+TPKL6iW17twl/nHji5rRLuwL/P6XekIWjeRpMQHHVpdX3bVOY/nLuNa+sl6V
 uyrMitUvlt6dCeC9QidrWNJ51xqGJciS9zlamUD4L2HKiStAJAwzLNz6XYqW/4vw+n
 IZso0669nQ2TA==
Date: Wed, 25 Aug 2021 14:25:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 2/2] powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto
Message-ID: <YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, llvm@list.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Tue, Apr 13, 2021 at 04:38:10PM +0000, Christophe Leroy wrote:
> Using asm goto in __WARN_FLAGS() and WARN_ON() allows more
> flexibility to GCC.
> 
> For that add an entry to the exception table so that
> program_check_exception() knowns where to resume execution
> after a WARNING.
> 
> Here are two exemples. The first one is done on PPC32 (which
> benefits from the previous patch), the second is on PPC64.
> 
> 	unsigned long test(struct pt_regs *regs)
> 	{
> 		int ret;
> 
> 		WARN_ON(regs->msr & MSR_PR);
> 
> 		return regs->gpr[3];
> 	}
> 
> 	unsigned long test9w(unsigned long a, unsigned long b)
> 	{
> 		if (WARN_ON(!b))
> 			return 0;
> 		return a / b;
> 	}
> 
> Before the patch:
> 
> 	000003a8 <test>:
> 	 3a8:	81 23 00 84 	lwz     r9,132(r3)
> 	 3ac:	71 29 40 00 	andi.   r9,r9,16384
> 	 3b0:	40 82 00 0c 	bne     3bc <test+0x14>
> 	 3b4:	80 63 00 0c 	lwz     r3,12(r3)
> 	 3b8:	4e 80 00 20 	blr
> 
> 	 3bc:	0f e0 00 00 	twui    r0,0
> 	 3c0:	80 63 00 0c 	lwz     r3,12(r3)
> 	 3c4:	4e 80 00 20 	blr
> 
> 	0000000000000bf0 <.test9w>:
> 	 bf0:	7c 89 00 74 	cntlzd  r9,r4
> 	 bf4:	79 29 d1 82 	rldicl  r9,r9,58,6
> 	 bf8:	0b 09 00 00 	tdnei   r9,0
> 	 bfc:	2c 24 00 00 	cmpdi   r4,0
> 	 c00:	41 82 00 0c 	beq     c0c <.test9w+0x1c>
> 	 c04:	7c 63 23 92 	divdu   r3,r3,r4
> 	 c08:	4e 80 00 20 	blr
> 
> 	 c0c:	38 60 00 00 	li      r3,0
> 	 c10:	4e 80 00 20 	blr
> 
> After the patch:
> 
> 	000003a8 <test>:
> 	 3a8:	81 23 00 84 	lwz     r9,132(r3)
> 	 3ac:	71 29 40 00 	andi.   r9,r9,16384
> 	 3b0:	40 82 00 0c 	bne     3bc <test+0x14>
> 	 3b4:	80 63 00 0c 	lwz     r3,12(r3)
> 	 3b8:	4e 80 00 20 	blr
> 
> 	 3bc:	0f e0 00 00 	twui    r0,0
> 
> 	0000000000000c50 <.test9w>:
> 	 c50:	7c 89 00 74 	cntlzd  r9,r4
> 	 c54:	79 29 d1 82 	rldicl  r9,r9,58,6
> 	 c58:	0b 09 00 00 	tdnei   r9,0
> 	 c5c:	7c 63 23 92 	divdu   r3,r3,r4
> 	 c60:	4e 80 00 20 	blr
> 
> 	 c70:	38 60 00 00 	li      r3,0
> 	 c74:	4e 80 00 20 	blr
> 
> In the first exemple, we see GCC doesn't need to duplicate what
> happens after the trap.
> 
> In the second exemple, we see that GCC doesn't need to emit a test
> and a branch in the likely path in addition to the trap.
> 
> We've got some WARN_ON() in .softirqentry.text section so it needs
> to be added in the OTHER_TEXT_SECTIONS in modpost.c
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

This patch as commit 1e688dd2a3d6 ("powerpc/bug: Provide better
flexibility to WARN_ON/__WARN_FLAGS() with asm goto") cause a WARN_ON in
klist_add_tail to trigger over and over on boot when compiling with
clang:

[    2.177416][    T1] WARNING: CPU: 0 PID: 1 at lib/klist.c:62 .klist_add_tail+0x3c/0x110
[    2.177456][    T1] Modules linked in:
[    2.177481][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.14.0-rc7-next-20210825 #1
[    2.177520][    T1] NIP:  c0000000007ff81c LR: c00000000090a038 CTR: 0000000000000000
[    2.177557][    T1] REGS: c0000000073c32a0 TRAP: 0700   Tainted: G        W          (5.14.0-rc7-next-20210825)
[    2.177593][    T1] MSR:  8000000002029032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 22000a40  XER: 00000000
[    2.177667][    T1] CFAR: c00000000090a034 IRQMASK: 0
[    2.177667][    T1] GPR00: c00000000090a038 c0000000073c3540 c000000001be3200 0000000000000001
[    2.177667][    T1] GPR04: c0000000072d65c0 0000000000000000 c0000000091ba798 c0000000091bb0a0
[    2.177667][    T1] GPR08: 0000000000000001 0000000000000000 c000000008581918 fffffffffffffc00
[    2.177667][    T1] GPR12: 0000000044000240 c000000001dd0000 c000000000012300 0000000000000000
[    2.177667][    T1] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    2.177667][    T1] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    2.177667][    T1] GPR24: 0000000000000000 c0000000017e3200 0000000000000000 c000000001a0e778
[    2.177667][    T1] GPR28: c0000000072d65b0 c0000000072d65a8 c000000007de72c8 c0000000073c35d0
[    2.178019][    T1] NIP [c0000000007ff81c] .klist_add_tail+0x3c/0x110
[    2.178058][    T1] LR [c00000000090a038] .bus_add_driver+0x148/0x290
[    2.178088][    T1] Call Trace:
[    2.178105][    T1] [c0000000073c3540] [c0000000073c35d0] 0xc0000000073c35d0 (unreliable)
[    2.178150][    T1] [c0000000073c35d0] [c00000000090a038] .bus_add_driver+0x148/0x290
[    2.178190][    T1] [c0000000073c3670] [c00000000090fae8] .driver_register+0xb8/0x190
[    2.178234][    T1] [c0000000073c3700] [c000000000be55c0] .__hid_register_driver+0x70/0xd0
[    2.178275][    T1] [c0000000073c37a0] [c00000000116955c] .redragon_driver_init+0x34/0x58
[    2.178314][    T1] [c0000000073c3820] [c000000000011ae0] .do_one_initcall+0x130/0x3b0
[    2.178357][    T1] [c0000000073c3bb0] [c0000000011065e0] .do_initcall_level+0xd8/0x188
[    2.178403][    T1] [c0000000073c3c50] [c0000000011064a8] .do_initcalls+0x7c/0xdc
[    2.178445][    T1] [c0000000073c3ce0] [c000000001106238] .kernel_init_freeable+0x178/0x21c
[    2.178491][    T1] [c0000000073c3d90] [c000000000012334] .kernel_init+0x34/0x220
[    2.178530][    T1] [c0000000073c3e10] [c00000000000cf50] .ret_from_kernel_thread+0x58/0x60
[    2.178569][    T1] Instruction dump:
[    2.178592][    T1] fba10078 7c7d1b78 38600001 fb810070 3b9d0008 fbc10080 7c9e2378 389d0018
[    2.178662][    T1] fb9d0008 fb9d0010 90640000 fbdd0000 <0b1e0000> e87e0018 28230000 41820024
[    2.178728][    T1] ---[ end trace 52ed3431f58f1847 ]---

Is this a bug with clang or is there something wrong with the patch? The
vmlinux image is available at [1] if you want to inspect it and our QEMU
command and the warning at boot can be viewed at [2]. If there is any
other information I can provide, please let me know.

[1] https://builds.tuxbuild.com/1xDcmp3Tvno0TTGxDVPedRKIKM2/
[2] https://github.com/ClangBuiltLinux/continuous-integration2/commit/cee159b66a58eb57fa2359e7888074b9da24126c/checks/3422232736/logs

Cheers,
Nathan
