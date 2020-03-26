Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19721193F47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:53:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4fj21r2zDqDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:53:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cr2PtdzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cr0GVrz9sT1; Thu, 26 Mar 2020 23:06:51 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 36b78402d97a3b9aeab136feb9b00d8647ec2c20
In-Reply-To: <20200313094842.351830-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/book3s/hash64/devmap: Use H_PAGE_THP_HUGE when
 setting up huge devmap pte entries
Message-Id: <48p3cr0GVrz9sT1@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:51 +1100 (AEDT)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-13 at 09:48:42 UTC, "Aneesh Kumar K.V" wrote:
> H_PAGE_THP_HUGE is used to differentiate between a THP hugepage and hugetlb
> hugepage entries. The difference is w.r.t how we handle hash fault on these
> address. THP address enables MPSS in segments. We want to manage devmap hugepage
> entries similar to THP pt entries. Hence use H_PAGE_THP_HUGE for devmap huge pte
> entries.
> 
> With current code while handling hash pte fault, we do set is_thp = true when
> finding devmap pte huge pte entries.
> 
> Current code also does the below sequence we setting up huge devmap entries.
> 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> 	if (pfn_t_devmap(pfn))
> 		entry = pmd_mkdevmap(entry);
> 
> In that case we would find both H_PAGE_THP_HUGE and PAGE_DEVMAP set for huge
> devmap pte entries. This results in false positive error like below.
> 
>  kernel BUG at /home/kvaneesh/src/linux/mm/memory.c:4321!
>  Oops: Exception in kernel mode, sig: 5 [#1]
>  LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>  Modules linked in:
>  CPU: 56 PID: 67996 Comm: t_mmap_dio Not tainted 5.6.0-rc4-59640-g371c804dedbc #128
>  ....
>  NIP [c00000000044c9e4] __follow_pte_pmd+0x264/0x900
>  LR [c0000000005d45f8] dax_writeback_one+0x1a8/0x740
>  Call Trace:
>  [c000000c6e9f38c0] [c0000000013f4130] str_spec.74809+0x22ffb4/0x2d116c (unreliable)
>  [c000000c6e9f3960] [c0000000005d45f8] dax_writeback_one+0x1a8/0x740
>  [c000000c6e9f3a40] [c0000000005d4dfc] dax_writeback_mapping_range+0x26c/0x700
>  [c000000c6e9f3b30] [c000000000666580] ext4_dax_writepages+0x150/0x5a0
>  [c000000c6e9f3ba0] [c0000000003fe278] do_writepages+0x68/0x180
>  [c000000c6e9f3c10] [c0000000003ecc58] __filemap_fdatawrite_range+0x138/0x180
>  [c000000c6e9f3cc0] [c0000000003ede74] file_write_and_wait_range+0xa4/0x110
>  [c000000c6e9f3d10] [c0000000006552d0] ext4_sync_file+0x370/0x6e0
>  [c000000c6e9f3d70] [c00000000057d330] vfs_fsync_range+0x70/0xf0
>  [c000000c6e9f3db0] [c00000000046a000] sys_msync+0x220/0x2e0
>  [c000000c6e9f3e20] [c00000000000b478] system_call+0x5c/0x68
>  Instruction dump:
>  7a941564 392affff 7fbffc36 7a94f082 7d2907b4 78f4f00e 7fff4838 7bff1f24
>  7e54f82a 7e74fa14 724900a0 40820410 <0b080000> 72490040 418201c8 2fb7000
> 
> This is because our pmd_trans_huge check doesn't exclude _PAGE_DEVMAP.
> 
> To make this all consistent, update pmd_mkdevmap to set H_PAGE_THP_HUGE and
> pmd_trans_huge check now excludes _PAGE_DEVMAP correctly.
> 
> Fixes: ebd31197931d ("powerpc/mm: Add devmap support for ppc64")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/36b78402d97a3b9aeab136feb9b00d8647ec2c20

cheers
