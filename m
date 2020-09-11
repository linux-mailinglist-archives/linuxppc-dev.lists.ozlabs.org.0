Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F07792656E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 04:15:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnfVp2fhYzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 12:15:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HSLAHaSF; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnfSr592qzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 12:14:03 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id w16so8427897qkj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 19:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kTjTaXAUIVG8guSvTTK04JJOQ81rc1LCw3u4xDMGxj0=;
 b=HSLAHaSF6WD0O2qzm1kcGX8wYB6EpDFGZYZyE+uIoIGMjEaOm+AfqPntVhu1Yp7MKw
 bDAidoRuytdteg3WzBoq+i9bMEefdqkbX1S1CAjHYo992tYg1Fi0+s5mKG4SjEybfOOg
 L4agXR7HBlXbpAmcoD8huNC8XihE+6Px1mWw/UZvIAek1HBNZGu8CNX9T3Wqk0i1Nere
 FLh0Tva566RAwkKf+VK8B7wKLdiePZQstH+HlfrgjXmFeZ9EBUorU/g3U32g5ABoN0Jg
 bNvA3aAuvy4rxNkKXmErdDvZVTodMmh92BOc8jUWu0YXg0jowpPhyIjH131sPUEZWNn3
 FMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kTjTaXAUIVG8guSvTTK04JJOQ81rc1LCw3u4xDMGxj0=;
 b=DwajJUmTZaVQC015a1Zptt9XH3XMhkVQF+3ymGi5QYMRafX7dyU1e3cDEq1rwA1Ezq
 HK4axMK8Ty8j+r4Ln+VSEnlarm4titt4v9pcLWAOUSY4dx+5upbFQlH/pJzTUZNUz4NF
 QtLVksBIMlTd46WN0nnPivdYnEOX5KPiciw9ItXPkXf1mf6DglyCZ4nO0JHxNPY9D9qY
 moLYcCn5eOZwZ3FmIvPI0gUSq46njsaibeVZ5icpbKRwy5hzPHVp7oIq9aNSvd9Gy2IQ
 DWLDwHr7SWuKgQU88r7oIQxnLfFRZCYHQ43jbIxC//ZVmhOL6bfqfZbvGGWTuXAFabbq
 yr0A==
X-Gm-Message-State: AOAM5317szDdukmS2h56sRFoc99+ld3Vq2tpRYV7Kl2Wi3SJhX3C9c4+
 bfoQoBnVmbkW+BNug24cPlc=
X-Google-Smtp-Source: ABdhPJzFf31qSZEB+rz+YEP3aKkRbpO/EEZTy9LJtkbAfWnFusqjfiDRkoyYFpW0BVjvl2s7awSbUA==
X-Received: by 2002:a37:543:: with SMTP id 64mr10718958qkf.170.1599790440118; 
 Thu, 10 Sep 2020 19:14:00 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id q68sm1111689qkd.45.2020.09.10.19.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 19:13:59 -0700 (PDT)
Date: Thu, 10 Sep 2020 19:13:58 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 13/13] mm/debug_vm_pgtable: Avoid none pte in
 pte_clear_test
Message-ID: <20200911021358.GA3656343@ubuntu-n2-xlarge-x86>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-14-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902114222.181353-14-aneesh.kumar@linux.ibm.com>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 02, 2020 at 05:12:22PM +0530, Aneesh Kumar K.V wrote:
> pte_clear_tests operate on an existing pte entry. Make sure that
> is not a none pte entry.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/debug_vm_pgtable.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 9afa1354326b..c36530c69e33 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -542,9 +542,10 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
>  #endif /* PAGETABLE_P4D_FOLDED */
>  
>  static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
> -				   unsigned long vaddr)
> +				   unsigned long pfn, unsigned long vaddr,
> +				   pgprot_t prot)
>  {
> -	pte_t pte = ptep_get(ptep);
> +	pte_t pte = pfn_pte(pfn, prot);
>  
>  	pr_debug("Validating PTE clear\n");
>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> @@ -1049,7 +1050,7 @@ static int __init debug_vm_pgtable(void)
>  
>  	ptl = pte_lockptr(mm, pmdp);
>  	spin_lock(ptl);
> -	pte_clear_tests(mm, ptep, vaddr);
> +	pte_clear_tests(mm, ptep, pte_aligned, vaddr, prot);
>  	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>  	pte_unmap_unlock(ptep, ptl);
>  
> -- 
> 2.26.2
> 
> 

This patch causes a panic at boot for RISC-V defconfig. The rootfs is here if it is needed:
https://github.com/ClangBuiltLinux/boot-utils/blob/3b21a5b71451742866349ba4f18638c5a754e660/images/riscv/rootfs.cpio.zst

$ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- O=out/riscv distclean defconfig Image

$ qemu-system-riscv64 -bios default -M virt -display none -initrd rootfs.cpio -kernel Image -m 512m -nodefaults -serial mon:stdio
...

OpenSBI v0.6
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : QEMU Virt Machine
Platform HART Features : RV64ACDFIMSU
Platform Max HARTs     : 8
Current Hart           : 0
Firmware Base          : 0x80000000
Firmware Size          : 120 KB
Runtime SBI Version    : 0.2

MIDELEG : 0x0000000000000222
MEDELEG : 0x000000000000b109
PMP0    : 0x0000000080000000-0x000000008001ffff (A)
PMP1    : 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
[    0.000000] Linux version 5.9.0-rc4-next-20200910 (nathan@ubuntu-n2-xlarge-x86) (riscv64-linux-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #1 SMP Thu Sep 10 19:10:43 MST 2020
...
[    0.294593] NET: Registered protocol family 17
[    0.295781] 9pnet: Installing 9P2000 support
[    0.296153] Key type dns_resolver registered
[    0.296694] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    0.297635] Unable to handle kernel paging request at virtual address 0a7fffe01dafefc8
[    0.298029] Oops [#1]
[    0.298153] Modules linked in:
[    0.298433] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc4-next-20200910 #1
[    0.298792] epc: ffffffe000205afc ra : ffffffe0008be0aa sp : ffffffe01ae73d40
[    0.299078]  gp : ffffffe0010b9b48 tp : ffffffe01ae68000 t0 : ffffffe008152000
[    0.299362]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : ffffffe01ae73d60
[    0.299648]  s1 : bffffffffffffffb a0 : 0a7fffe01dafefc8 a1 : bffffffffffffffb
[    0.299948]  a2 : ffffffe0010a2698 a3 : 0000000000000001 a4 : 0000000000000003
[    0.300231]  a5 : 0000000000000800 a6 : fffffffff0000080 a7 : 000000001b642000
[    0.300521]  s2 : ffffffe0081517b8 s3 : ffffffe008150a80 s4 : ffffffe01af30000
[    0.300806]  s5 : ffffffe01f8ca9b8 s6 : ffffffe008150000 s7 : ffffffe0010bb100
[    0.301161]  s8 : ffffffe0010bb108 s9 : 0000000000080202 s10: ffffffe0010bb928
[    0.301481]  s11: 000000002008085b t3 : 0000000000000000 t4 : 0000000000000000
[    0.301722]  t5 : 0000000000000000 t6 : ffffffe008150000
[    0.301947] status: 0000000000000120 badaddr: 0a7fffe01dafefc8 cause: 000000000000000f
[    0.302569] ---[ end trace 7ffb153d816164cf ]---
[    0.302797] note: swapper/0[1] exited with preempt_count 1
[    0.303101] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.303614] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

$ git bisect log
# bad: [7ce53e3a447bced7b85ed181c4d027e93c062e07] Add linux-next specific files for 20200910
# good: [34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8] Merge tag 'linux-kselftest-5.9-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
git bisect start '7ce53e3a447bced7b85ed181c4d027e93c062e07' '34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8'
# good: [bb1f09d126618aa1ec776d87d7f85136edbed485] Merge remote-tracking branch 'crypto/master' into master
git bisect good bb1f09d126618aa1ec776d87d7f85136edbed485
# good: [1fb7e980a0f9a0aa4c7daba1a7e35d12c97820ea] Merge remote-tracking branch 'audit/next' into master
git bisect good 1fb7e980a0f9a0aa4c7daba1a7e35d12c97820ea
# good: [afdf05baff78a658843c1013855985e7a6871406] Merge remote-tracking branch 'thunderbolt/next' into master
git bisect good afdf05baff78a658843c1013855985e7a6871406
# good: [c5f3c031bd4b8ef5fb6b07352abc284603c3edee] Merge remote-tracking branch 'kselftest/next' into master
git bisect good c5f3c031bd4b8ef5fb6b07352abc284603c3edee
# bad: [671aca25e253f2773850aefb0837a225c691e336] lib: bitmap: delete duplicated words
git bisect bad 671aca25e253f2773850aefb0837a225c691e336
# bad: [e42ac710a849403b7fe582cc555dc3b7bf5b6fa9] tools/testing/selftests/vm/hmm-tests.c: use the new SKIP() macro
git bisect bad e42ac710a849403b7fe582cc555dc3b7bf5b6fa9
# good: [1443e3384317a9dfaf1381e8134a69c1e3fc7130] device-dax: kill dax_kmem_res
git bisect good 1443e3384317a9dfaf1381e8134a69c1e3fc7130
# good: [e2aad6f1d232b457ea6a3194992dd4c0a83534a5] mm/debug_vm_pgtable/locks: take correct page table lock
git bisect good e2aad6f1d232b457ea6a3194992dd4c0a83534a5
# bad: [08075d21b791241ba9f1366f814afa4a77372250] mm: workingset: ignore slab memory size when calculating shadows pressure
git bisect bad 08075d21b791241ba9f1366f814afa4a77372250
# bad: [42e9e63856020953cc3645a2032a70179364a1d8] mm-gup-dont-permit-users-to-call-get_user_pages-with-foll_longterm-fix
git bisect bad 42e9e63856020953cc3645a2032a70179364a1d8
# good: [b77bfa2ce4c2e30c1b1d1b3eb18c5b57397277f9] mm/debug_vm_pgtable/hugetlb: disable hugetlb test on ppc64
git bisect good b77bfa2ce4c2e30c1b1d1b3eb18c5b57397277f9
# bad: [90b612d56df39666f0f6fa6a033b4a7ec2e0a16c] mm/gup_benchmark: use pin_user_pages for FOLL_LONGTERM flag
git bisect bad 90b612d56df39666f0f6fa6a033b4a7ec2e0a16c
# bad: [060e70ecf865e55d82282995b4cb478126a1163c] mm/debug_vm_pgtable: avoid none pte in pte_clear_test
git bisect bad 060e70ecf865e55d82282995b4cb478126a1163c
# first bad commit: [060e70ecf865e55d82282995b4cb478126a1163c] mm/debug_vm_pgtable: avoid none pte in pte_clear_test

Cheers,
Nathan
