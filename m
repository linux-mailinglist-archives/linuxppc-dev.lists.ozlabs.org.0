Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB38B05D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 11:16:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZN5S1jlO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPYJv1FrJz3cWR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 19:16:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZN5S1jlO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPYJ90GtMz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 19:16:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 75565CE13C6;
	Wed, 24 Apr 2024 09:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F646C113CE;
	Wed, 24 Apr 2024 09:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713950166;
	bh=IrR6AXdLOvki8vwe1yOiucSte8ILSh4EklzoMTtkN+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZN5S1jlOj4vMMvYMtWX55yDS3aKRbL0Aqsujba+w0kEr3yXZJwtbgf7P47oddxeNi
	 ykVcjkGpA7WvRCVc/lz1B88UGIaq6MTyFsm+ymYx9a3eREV6CDyxX5xtcCVajZ5RM+
	 phNptJDQjxdm0qmaDt80Z2WJVjBmDd7kiFKAa0aCi5SrIngYd4ULJLPhHuNPaaiRet
	 vlPl0C48wtvMbGNtK9H4QeZFZFB9FQtekm8kNZVHX2RoQhFH/F6OWpAW4loRsQNUEO
	 edt7f3Eaxjx3RxVmC1H91V8bX1zzy523SF0Q8q7ivA/9t7HV0xt8OBRJE+NWiHdr3B
	 EwtGbHYLKgKMQ==
Date: Wed, 24 Apr 2024 12:14:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: boot failure after merge of the modules tree
Message-ID: <ZijNiXzNpfoyokrh@kernel.org>
References: <20240424183503.2a6ce847@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424183503.2a6ce847@canb.auug.org.au>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 24, 2024 at 06:35:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the modules tree, today's linux-next boot (powerpc
> pseries_le_defconfig) failed like this:
> 
> BUG: Kernel NULL pointer dereference at 0x00000030
> Faulting instruction address: 0xc00000000057a4ec
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc5-08179-ga5ea707d10dc #1
> Hardware name: IBM pSeries (emulated by qemu) POWER8 (raw) 0x4d0200 0xf000004 of:SLOF,HEAD pSeries
> NIP:  c00000000057a4ec LR: c0000000002cd32c CTR: c0000000002cd304
> REGS: c000000004997700 TRAP: 0380   Not tainted  (6.9.0-rc5-08179-ga5ea707d10dc)
> MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84002484  XER: 20000000
> CFAR: c0000000002cd328 IRQMASK: 0 
> GPR00: c0000000002cd32c c0000000049979a0 c00000000163a500 0000000000010000 
> GPR04: 0000000000010000 0000000000004000 0000000000000000 0000000000002cc0 
> GPR08: 0000000000000030 0000000000000100 ffffffffffffffff 0000000000002000 
> GPR12: c0000000002cd304 c000000002b70000 c00000000001111c 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR24: 0000000000000000 0000000000000000 c000000002aa0940 c0000000026c0a40 
> GPR28: 0000000000010000 c0000000002cd32c 0000000000000030 c0000000027d0f78 
> NIP [c00000000057a4ec] execmem_alloc+0x5c/0x12c
> LR [c0000000002cd32c] alloc_insn_page+0x28/0x70
> Call Trace:
> [c000000004997a40] [c0000000002cd32c] alloc_insn_page+0x28/0x70
> [c000000004997a60] [c0000000002d07a4] __get_insn_slot+0x1cc/0x29c
> [c000000004997aa0] [c00000000005c434] arch_prepare_kprobe+0xbc/0x31c
> [c000000004997b20] [c0000000002d1b40] register_kprobe+0x54c/0x878
> [c000000004997b90] [c000000002018828] arch_init_kprobes+0x28/0x40
> [c000000004997bb0] [c00000000204b33c] init_kprobes+0x138/0x218
> [c000000004997c30] [c000000000010da8] do_one_initcall+0x80/0x2f8
> [c000000004997d00] [c000000002005aa8] kernel_init_freeable+0x1f8/0x520
> [c000000004997de0] [c000000000011148] kernel_init+0x34/0x26c
> [c000000004997e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
> --- interrupt: 0 at 0x0
> Code: fbe1fff8 3940ffff 38e02cc0 7c9c2378 7fa802a6 e8c91e48 f8010010 fb41ffd0 39200100 fb61ffd8 f821ff61 7fc64214 <7ca6402a> eb5e0020 837e0028 e8de0008 
> ---[ end trace 0000000000000000 ]---
> 
> note: swapper/0[1] exited with irqs disabled
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> Bisected to commit
> 
>   18da532eefc8 ("mm/execmem, arch: convert remaining overrides of module_alloc to execmem")
> 
> I have used the modules tree from next-20240423 for today.
> 
> This is a qemu boot test using:
> 
> qemu-system-ppc64 -M pseries -cpu POWER8 -m 2G -vga none -nographic -kernel ~/next/powerpc_pseries_le_defconfig/vmlinux -initrd ./ppc64le-rootfs.cpio.gz

This should fix it for now, I'll rework initialization a bit in v6
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..bea33bf538e9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -176,6 +176,7 @@ config PPC
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if PPC_RADIX_MMU
+	select ARCH_WANTS_EXECMEM_EARLY         if EXECMEM
 	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF


> -- 
> Cheers,
> Stephen Rothwell

-- 
Sincerely yours,
Mike.
