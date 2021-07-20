Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65593D05E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 01:53:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTwXh3wLJz3bgN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 09:53:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e0EE40nq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e0EE40nq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTwXB6fLXz2yPB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 09:53:30 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 76FEE60E08
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 23:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626825208;
 bh=J0Il9UY/skweKYdo2syntQFL7OMmMC9NyOb3Jbf0+e0=;
 h=From:To:Subject:Date:From;
 b=e0EE40nqod9DtlV465ceMsWfnZFd/ppQhzVd/UlDknsuG+M4ENHUU9RcDymeqtzqV
 kj1qADTE8ksJlKAOM4QipISosXwuVn8vzsoHtBl9aBjnF5WINEkAsKftjaugosVsom
 fNYuNbKSM3PABeHVjD6Ailn4lHRdv7gKs8pAPjiJtdf6x8mOSmEuo+pN/kiCOJsMBk
 lwQ+OHn/WVsKMEDjri7b+kL6SHYiKky1NtXewxQl5No6SjaVmCF6ONhBrR2CedT+wy
 vdD+bOD62Rg2LXsG0gBnRGJDoPH7Pt0nd8dcBWaMwpyYkkbqPND2wGVzsDmyVp86QJ
 YcEBNmntqecTQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 60D9C611F0; Tue, 20 Jul 2021 23:53:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: =?UTF-8?B?W0J1ZyAyMTM4MDNdIE5ldzogRzUga2VybmVsIGJ1aWxkICh2NS4x?=
 =?UTF-8?B?NC1yYzIpIGZhaWxzIGF0IGxpbmtpbmcgc3RhZ2UgLSBsZDogYXJjaC9wb3dl?=
 =?UTF-8?B?cnBjL21tL3BndGFibGUubzogaW4gZnVuY3Rpb24gYC5fX3B0ZXBfc2V0X2Fj?=
 =?UTF-8?B?Y2Vzc19mbGFncyc6IC91c3Ivc3JjL2xpbnV4LXN0YWJsZS8uL2FyY2gvcG93?=
 =?UTF-8?B?ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oOjgyNDogdW5k?=
 =?UTF-8?B?ZWZpbmVkIHJlZmVyZW5jZSB0byBgLnJhZGl4X19wdGVwX3NldF9hY2Nlc3Nf?=
 =?UTF-8?B?ZmxhZ3Mn?=
Date: Tue, 20 Jul 2021 23:53:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213803-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213803

            Bug ID: 213803
           Summary: G5 kernel build (v5.14-rc2) fails at linking stage -
                    ld: arch/powerpc/mm/pgtable.o: in function
                    `.__ptep_set_access_flags':
                    /usr/src/linux-stable/./arch/powerpc/include/asm/book3
                    s/64/pgtable.h:824: undefined reference to
                    `.radix__ptep_set_access_flags'
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.14-rc2
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 297967
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297967&action=3Dedit
kernel .config (5.14-rc2, PowerMac G5 11,2)

[...]
  CHK     include/generated/autoksyms.h
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
ld: arch/powerpc/mm/pgtable.o: in function `.__ptep_set_access_flags':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:824:
undefined reference to `.radix__ptep_set_access_flags'
ld: arch/powerpc/mm/pageattr.o: in function `.change_page_attr':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:80:
undefined reference to `.radix__flush_tlb_kernel_range'
ld: arch/powerpc/mm/pageattr.o: in function `.set_page_attr':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:80:
undefined reference to `.radix__flush_tlb_kernel_range'
ld: arch/powerpc/mm/book3s64/mmu_context.o:(.toc+0x0): undefined reference =
to
`mmu_pid_bits'
ld: arch/powerpc/mm/book3s64/mmu_context.o:(.toc+0x8): undefined reference =
to
`mmu_base_pid'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.pmd_hugepage_update':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1197:
undefined reference to `.radix__pmd_hugepage_update'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.do_serialize':
/usr/src/linux-stable/arch/powerpc/mm/book3s64/pgtable.c:89: undefined
reference to `.exit_lazy_flush_tlb'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.pmdp_set_access_flags=
':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:824:
undefined reference to `.radix__ptep_set_access_flags'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.pmdp_invalidate':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:54:
undefined reference to `.radix__flush_pmd_tlb_range'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function
`.pmdp_huge_get_and_clear_full':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1300:
undefined reference to `.radix__pmdp_huge_get_and_clear'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function
`.pmdp_huge_get_and_clear_full':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:54:
undefined reference to `.radix__flush_pmd_tlb_range'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.mmu_cleanup_all':
/usr/src/linux-stable/arch/powerpc/mm/book3s64/pgtable.c:179: undefined
reference to `.radix__mmu_cleanup_all'
ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.ptep_modify_prot_comm=
it':
/usr/src/linux-stable/arch/powerpc/mm/book3s64/pgtable.c:457: undefined
reference to `.radix__ptep_modify_prot_commit'
ld: arch/powerpc/lib/code-patching.o: in function `.patch_instruction':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1080:
undefined reference to `.radix__map_kernel_page'
ld: arch/powerpc/lib/code-patching.o: in function `.patch_instruction':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:80:
undefined reference to `.radix__flush_tlb_kernel_range'
ld: kernel/fork.o: in function `.dup_mm':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:117:
undefined reference to `.radix__flush_tlb_mm'
ld: mm/memory.o: in function `.unmap_page_range':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:109:
undefined reference to `.radix__tlb_flush'
ld: mm/memory.o: in function `.do_wp_page':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:125:
undefined reference to `.radix__flush_tlb_page'
ld: mm/memory.o: in function `.do_set_pmd':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1323:
undefined reference to `.radix__pgtable_trans_huge_deposit'
ld: mm/memory.o: in function `.__handle_mm_fault':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:125:
undefined reference to `.radix__flush_tlb_page'
ld: mm/mprotect.o: in function `.change_protection':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:72:
undefined reference to `.radix__flush_tlb_range'
ld: mm/mremap.o: in function `.flush_tlb_range':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:72:
undefined reference to `.radix__flush_tlb_range'
ld: mm/pgtable-generic.o: in function `.ptep_clear_flush':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:125:
undefined reference to `.radix__flush_tlb_page'
ld: mm/pgtable-generic.o: in function `.pmdp_huge_clear_flush':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1300:
undefined reference to `.radix__pmdp_huge_get_and_clear'
ld: mm/pgtable-generic.o: in function `.pmdp_huge_clear_flush':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:54:
undefined reference to `.radix__flush_pmd_tlb_range'
ld: mm/rmap.o: in function `.try_to_unmap_one':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:72:
undefined reference to `.radix__flush_tlb_range'
ld: mm/rmap.o: in function `.try_to_migrate_one':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:72:
undefined reference to `.radix__flush_tlb_range'
ld: mm/vmalloc.o: in function `.flush_tlb_kernel_range':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:80:
undefined reference to `.radix__flush_tlb_kernel_range'
ld: mm/hugetlb.o: in function `.hugetlb_cow':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/hugetlb.h:91:
undefined reference to `.radix__flush_hugetlb_page'
ld: mm/hugetlb.o: in function `.hugetlb_change_protection':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:64:
undefined reference to `.radix__flush_hugetlb_tlb_range'
ld: mm/hugetlb.o: in function `.hugetlb_unshare_all_pmds':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:64:
undefined reference to `.radix__flush_hugetlb_tlb_range'
ld: mm/huge_memory.o: in function `.pgtable_trans_huge_deposit':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1323:
undefined reference to `.radix__pgtable_trans_huge_deposit'
ld: mm/huge_memory.o: in function `.pgtable_trans_huge_withdraw':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1332:
undefined reference to `.radix__pgtable_trans_huge_withdraw'
ld: mm/huge_memory.o: in function `.pmd_hugepage_update.isra.0':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1197:
undefined reference to `.radix__pmd_hugepage_update'
ld: mm/huge_memory.o: in function `.do_huge_pmd_numa_page':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:72:
undefined reference to `.radix__flush_tlb_range'
ld: mm/huge_memory.o: in function `.move_huge_pmd':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1300:
undefined reference to `.radix__pmdp_huge_get_and_clear'
ld: mm/huge_memory.o: in function `.move_huge_pmd':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:72:
undefined reference to `.radix__flush_tlb_range'
ld: mm/khugepaged.o: in function `.pmdp_collapse_flush':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1308:
undefined reference to `.radix__pmdp_collapse_flush'
ld: mm/khugepaged.o: in function `.khugepaged':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/pgtable.h:1323:
undefined reference to `.radix__pgtable_trans_huge_deposit'
ld: fs/proc/task_mmu.o: in function `.clear_refs_write':
/usr/src/linux-stable/./arch/powerpc/include/asm/book3s/64/tlbflush.h:117:
undefined reference to `.radix__flush_tlb_mm'
ld: warning: creating DT_TEXTREL in a PIE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
