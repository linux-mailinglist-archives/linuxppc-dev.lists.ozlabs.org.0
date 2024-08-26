Return-Path: <linuxppc-dev+bounces-550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A295FBE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:43:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt41J2Vtyz2yNs;
	Tue, 27 Aug 2024 07:43:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724687800;
	cv=none; b=mfsbONA3F57x+bIP3JpH6b3+QgYei2qUoa3jzCOZ3aOeaHkxysoiPD1lsujIGpc0RBvsihf8og8iMVRmC+l4cu8uDzzyoyxZcv1T+YCgHlu3zrflXiTXPfxBYwow9TGDyMGj6KEJf5bYtBNjZymqimLZB2oEq3uxQj00g8Mbyx2jwYGOzFKMig/RHuES5x9NROr7QjkVHslAN1SSTasf1Vn42gL7tFUNDnY4fGNTxGoigsErNX4vaA8hqtV/Om4pILSkgo3GIiGz8dQUxGg04sfNfv7+lelTylVz5Kyytjw3+N6N4CK5TOKTrYBNoT/uVklaqCjt98FVA+PybuaMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724687800; c=relaxed/relaxed;
	bh=eRydv55gNXaJ5A8ZeAWT2zJk1Y3fP0tRUqT2W8LViaQ=;
	h=X-Greylist:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QmHhf/LECZII82sJ7E0acg1s5fi3Tc+qbNrQriZsdErkmAD1IpkxewR7aZ7Hu83vZ4FUtheJRiSDnFWhLmkAdhz64wHt4rIWOPdSzTsUjsztFr01PBIv4bTeRLiDTJ5Q/DgafDOfn4xYcp4ZybPbECQZAU2qyiKsCYcswHFEeUzePNBaoyXTULaGoXSIKMCMI+AJKS7+W50jb0zfHJN8TUwt/VE/vuKJ+ok8Zwu+KIewK5iJNfrBeFq3xVG0ss6ROcpy+ViRz/Sj7ihlfYE/SDZnyG3YlaNZ7R9p46ERfg0fZGdwVbW0aQtCM73v47tOxLI7+zr6mqzv2JgifADDBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; dkim=pass (2048-bit key; unprotected) header.d=pankajraghav.com header.i=@pankajraghav.com header.a=rsa-sha256 header.s=MBO0001 header.b=rgBQImOf; dkim-atps=neutral; spf=pass (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=kernel@pankajraghav.com; receiver=lists.ozlabs.org) smtp.mailfrom=pankajraghav.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pankajraghav.com header.i=@pankajraghav.com header.a=rsa-sha256 header.s=MBO0001 header.b=rgBQImOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pankajraghav.com (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=kernel@pankajraghav.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 488 seconds by postgrey-1.37 at boromir; Tue, 27 Aug 2024 01:56:40 AEST
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WswK40m1Jz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:56:39 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Wsw7T529Sz9sGf;
	Mon, 26 Aug 2024 17:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1724687301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eRydv55gNXaJ5A8ZeAWT2zJk1Y3fP0tRUqT2W8LViaQ=;
	b=rgBQImOf5dPh+IqVFwGUy/Fy+wyfsnvuDcxC2DsTW9GyK4gN24SVBdHRVFxPL/jGLJfqUU
	tcwEtQ0oHfegOUFWzbGhtarvaE2iAjcnExlQIo9xMCwM0yZYk1VAi/j2bDGoBT5qA6uxQB
	t3FxMM+Yd+g8ztHqidEBk1O3Xh2w21fAYi1r6Mk6Rt++euWDs0q+mT8mmkiYtoB7qDFCaG
	gyHVUub6eB2MIvbCflrOpmeDeTC923hg//FDmAIvoqLbxn4Phdzlyon9YEv2diTpLYGk60
	JutJBd+r02CK7OlgeCgo1FHk0Lo3p3Iei5lwdSpqo7bkp/ZHV2WPk2juA2ZcNA==
Date: Mon, 26 Aug 2024 15:48:18 +0000
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	djwong@kernel.org, ritesh.list@gmail.com,
	linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
Message-ID: <20240826154818.hzqnvofdmaxvuwrh@quentin>
References: <20240826175931.1989f99e@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826175931.1989f99e@canb.auug.org.au>

On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next boot test (powerpc
> pseries_le_defconfig) produced this warning:

iomap dio calls set_memory_ro() on the page that is used for sub block
zeroing.

But looking at powerpc code, they don't support set_memory_ro() for
memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).

/*
 * On hash, the linear mapping is not in the Linux page table so
 * apply_to_existing_page_range() will have no effect. If in the future
 * the set_memory_* functions are used on the linear map this will need
 * to be updated.
 */
if (!radix_enabled()) {
        int region = get_region_id(addr);

        if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
                return -EINVAL;
}

We call set_memory_ro() on the zero page as a extra security measure.
I don't know much about powerpc, but looking at the comment, is it just
adding the following to support it in powerpc:

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index ac22bf28086fa..e6e0b40ba6db4 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
        if (!radix_enabled()) {
                int region = get_region_id(addr);
 
-               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
+               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
+                                region != IO_REGION_ID &&
+                                region != LINEAR_MAP_REGION_ID))
                        return -EINVAL;
        }
 #endif

 If it involves changing more things and this feature will be added to
 powerpc in the future, we could drop the set_memory_ro() call from
 iomap.

 CC: Darrick(as he suggested set_memory_ro() on zero page), Leroy,
 Ritesh, ppc list

> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pageattr.c:97 change_memory_attr+0xbc/0x150
> Modules linked in:
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc5-06731-g66e0882fba22 #1
> Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected) 0x4d0200 0xf000004 of:SLOF,HEAD pSeries
> NIP:  c00000000008a1ac LR: c00000000008a14c CTR: 0000000000000000
> REGS: c0000000049b7930 TRAP: 0700   Not tainted  (6.11.0-rc5-06731-g66e0882fba22)
> MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84000482  XER: 00000000
> CFAR: c00000000008a218 IRQMASK: 0 
> GPR00: c00000000008a14c c0000000049b7bd0 c00000000167b100 0000000000000000 
> GPR04: 0000000000000001 0000000000000000 0000000000000200 c000000002b10878 
> GPR08: 000000007da60000 c007ffffffffffff ffffffffffffffff 0000000084000482 
> GPR12: 0000000000000180 c000000002b90000 c00000000001110c 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000000 0000000000000000 0000000000000000 c000000001562288 
> GPR24: c000000002003e6c c000000001632418 000000000000018c c0000000020c1058 
> GPR28: 0000000000000000 0000000000000000 c000000006330000 0000000000000001 
> NIP [c00000000008a1ac] change_memory_attr+0xbc/0x150
> LR [c00000000008a14c] change_memory_attr+0x5c/0x150
> Call Trace:
> [c0000000049b7bd0] [000000000000018c] 0x18c (unreliable)
> [c0000000049b7c10] [c00000000206bf70] iomap_dio_init+0x64/0x88
> [c0000000049b7c30] [c000000000010d98] do_one_initcall+0x80/0x2f8
> [c0000000049b7d00] [c000000002005c9c] kernel_init_freeable+0x32c/0x520
> [c0000000049b7de0] [c000000000011138] kernel_init+0x34/0x26c
> [c0000000049b7e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
> --- interrupt: 0 at 0x0
> Code: 60000000 e8010050 eba10028 7c6307b4 ebc10030 38210040 ebe1fff8 7c0803a6 4e800020 7bc92720 2c29000c 41820058 <0fe00000> 4800002c 60000000 60000000 
> ---[ end trace 0000000000000000 ]---
> 
> Bisected to commit
> 
>   d940b3b7b76b ("iomap: fix iomap_dio_zero() for fs bs > system page size")
> 
> I have reverted commit
> 
>   9b0ebbc72358 ("Merge patch series "enable bs > ps in XFS"")
> 
> for today.
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Pankaj Raghav

