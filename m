Return-Path: <linuxppc-dev+bounces-3852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2C9E8963
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 03:59:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y665z5HKSz2xbN;
	Mon,  9 Dec 2024 13:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733713175;
	cv=none; b=ZEaXlFqqAXrSR11EP6RNywHU6Q2+IKGDFDgIvB9ROtU1b9HSg1Vw3TdCHdLTA2aaaJcgAAPJ7twojnYwDGoh/OeBnBNjg7lWLUKPj/U959kBWMhLu1lwFvwqssLr+Ma/smP1b1+ycX6fMDKSRTg7lF/wC2pZshObtTuUSqqwZHw+tt5G9xh5vDD0iK0WsleEJqPz8CgjYwlAFwlPqOZ7QZ2N5yvTpsB48cmHJcuahmTgrEUXIvCkER+tvAe+MG/k6whjNgeYWPqAnGbcrkdmRMqSqPcUEv7tBJ/lG+bMfxUEYuQrDydYNghmttOZ+FjKcMm2zFEvkNvLuS1RN+CJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733713175; c=relaxed/relaxed;
	bh=20OY5Wca9v29+l5BtvCY5fuiV4sFMquFAGouScos9WA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=op1kCdum90cEu+Kgn/Ha8ioDtIqCym+slRWW+KxatbmUG+lYTptxIk/PsPFdRbR2ZofLiWZVXdTCHCMzltcXwQZJJhNqjXQYmHIi6B/03salSWfQ4HdOIah+1p+WgPNJT8KwurXPd9V9TWBVR0NFcE8efYndRH71LdcH+ThmiGovYLK4iWKV2JxjrIFw40ukVjnlvq1T9b5zd9DX2bNDOAWFCojeyurUngqueQ2+FGlKHoke19SuO9s9m6uJ3SH+8wF7eOooZ9nPceVkAKJb+kQSFIGpatzwdxuQ6wWv6OSEgIB1SccCPJ8T2ADTZfmNAxxvZ4UnNNUkAn+byOlW5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 965 seconds by postgrey-1.37 at boromir; Mon, 09 Dec 2024 13:59:33 AEDT
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y665x5FMYz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 13:59:30 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y65hS4kNBz2DhQD;
	Mon,  9 Dec 2024 10:40:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 732081A016C;
	Mon,  9 Dec 2024 10:43:19 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Dec 2024 10:43:17 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, James
 Morse <james.morse@arm.com>, Robin Murphy <robin.murphy@arm.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan
	<maddy@linux.ibm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, Tong Tiangen <tongtiangen@huawei.com>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
Subject: [PATCH v13 0/5]arm64: add ARCH_HAS_COPY_MC support
Date: Mon, 9 Dec 2024 10:42:52 +0800
Message-ID: <20241209024257.3618492-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Problem
=========
With the increase of memory capacity and density, the probability of memory
error also increases. The increasing size and density of server RAM in data
centers and clouds have shown increased uncorrectable memory errors.

Currently, more and more scenarios that can tolerate memory errors，such as
COW[1,2], KSM copy[3], coredump copy[4], khugepaged[5,6], uaccess copy[7],
etc.

Solution
=========

This patchset introduces a new processing framework on ARM64, which enables
ARM64 to support error recovery in the above scenarios, and more scenarios
can be expanded based on this in the future.

In arm64, memory error handling in do_sea(), which is divided into two cases:
 1. If the user state consumed the memory errors, the solution is to kill
    the user process and isolate the error page.
 2. If the kernel state consumed the memory errors, the solution is to
    panic.

For case 2, Undifferentiated panic may not be the optimal choice, as it can
be handled better. In some scenarios, we can avoid panic, such as uaccess,
if the uaccess fails due to memory error, only the user process will be
affected, killing the user process and isolating the user page with
hardware memory errors is a better choice.

[1] commit d302c2398ba2 ("mm, hwpoison: when copy-on-write hits poison, take page offline")
[2] commit 1cb9dc4b475c ("mm: hwpoison: support recovery from HugePage copy-on-write faults")
[3] commit 6b970599e807 ("mm: hwpoison: support recovery from ksm_might_need_to_copy()")
[4] commit 245f09226893 ("mm: hwpoison: coredump: support recovery from dump_user_range()")
[5] commit 98c76c9f1ef7 ("mm/khugepaged: recover from poisoned anonymous memory")
[6] commit 12904d953364 ("mm/khugepaged: recover from poisoned file-backed memory")
[7] commit 278b917f8cb9 ("x86/mce: Add _ASM_EXTABLE_CPY for copy user access")

------------------
Test result:

1. copy_page(), copy_mc_page() basic function test pass, and the disassembly
   contents remains the same before and after refactor.

2. copy_to/from_user() access kernel NULL pointer raise translation fault
   and dump error message then die(), test pass.

3. Test following scenarios: copy_from_user(), get_user(), COW.

   Before patched: trigger a hardware memory error then panic.
   After  patched: trigger a hardware memory error without panic.

   Testing step:
   step1. start an user-process.
   step2. poison(einj) the user-process's page.
   step3: user-process access the poison page in kernel mode, then trigger SEA.
   step4: the kernel will not panic, only the user process is killed, the poison
          page is isolated. (before patched, the kernel will panic in do_sea())

------------------

Benefits
=========
According to the statistics of our storage product, the memory errors triggered
in kernel-mode by COW and page cache read (uaccess) scenarios account for more
than 50%, with this patchset deployed, all the kernel panic caused by COW and
page cache memory errors are eliminated, in addition, other scenarios that
account for a small proportion will also benefit.

Since v12:
Thanks to the suggestions of Jonathan, Mark, and Mauro, the following modifications
are made:
1. Rebase to latest kernel version.
2. Patch1, add Jonathan's and Mauro's review-by.
3. Patch2, modified do_apei_claim_sea() according to Mark's and Jonathan's suggestions,
   and optimized the commit message according to Mark's suggestions(Added description of
   the impact on regular copy_to_user()).
4. Patch3, optimized the commit message according to Mauro's suggestions and add Jonathan's
   review-by.
5. Patch4, modified copy_mc_user_highpage() and Optimized the commit message according to
   Jonathan's suggestions(no functional changes).
6. Patch5, optimized the commit message according to Mauro's suggestions.
7. Patch4/5, FEAT_MOPS is added to the code logic. Currently, the fixup is not performed
   on the MOPS instruction. 
8. Remove patch6 in v12 according to Jonathan's suggestions.

Since v11:
1. Rebase to latest kernel version 6.9-rc1.
2. Add patch 5, Since the problem described in "Since V10 Besides 3" has
   been solved in a50026bdb867 ('iov_iter: get rid of 'copy_mc' flag').
3. Add the benefit of applying the patch set to our company to the description of patch0.

Since V10:
 Accroding Mark's suggestion:
 1. Merge V10's patch2 and patch3 to V11's patch2.
 2. Patch2(V11): use new fixup_type for ld* in copy_to_user(), fix fatal
    issues (NULL kernel pointeraccess) been fixup incorrectly.
 3. Patch2(V11): refactoring the logic of do_sea().
 4. Patch4(V11): Remove duplicate assembly logic and remove do_mte().

 Besides:
 1. Patch2(V11): remove st* insn's fixup, st* generally not trigger memory error.
 2. Split a part of the logic of patch2(V11) to patch5(V11), for detail,
    see patch5(V11)'s commit msg.
 3. Remove patch6(v10) “arm64: introduce copy_mc_to_kernel() implementation”.
    During modification, some problems that cannot be solved in a short
    period are found. The patch will be released after the problems are
    solved.
 4. Add test result in this patch.
 5. Modify patchset title, do not use machine check and remove "-next".

Since V9:
 1. Rebase to latest kernel version 6.8-rc2.
 2. Add patch 6/6 to support copy_mc_to_kernel().

Since V8:
 1. Rebase to latest kernel version and fix topo in some of the patches.
 2. According to the suggestion of Catalin, I attempted to modify the
    return value of function copy_mc_[user]_highpage() to bytes not copied.
    During the modification process, I found that it would be more
    reasonable to return -EFAULT when copy error occurs (referring to the
    newly added patch 4). 

    For ARM64, the implementation of copy_mc_[user]_highpage() needs to
    consider MTE. Considering the scenario where data copying is successful
    but the MTE tag copying fails, it is also not reasonable to return
    bytes not copied.
 3. Considering the recent addition of machine check safe support for
    multiple scenarios, modify commit message for patch 5 (patch 4 for V8).

Since V7:
 Currently, there are patches supporting recover from poison
 consumption for the cow scenario[1]. Therefore, Supporting cow
 scenario under the arm64 architecture only needs to modify the relevant
 code under the arch/.
 [1]https://lore.kernel.org/lkml/20221031201029.102123-1-tony.luck@intel.com/

Since V6:
 Resend patches that are not merged into the mainline in V6.

Since V5:
 1. Add patch2/3 to add uaccess assembly helpers.
 2. Optimize the implementation logic of arm64_do_kernel_sea() in patch8.
 3. Remove kernel access fixup in patch9.
 All suggestion are from Mark. 

Since V4:
 1. According Michael's suggestion, add patch5.
 2. According Mark's suggestiog, do some restructuring to arm64
 extable, then a new adaptation of machine check safe support is made based
 on this.
 3. According Mark's suggestion, support machine check safe in do_mte() in
 cow scene.
 4. In V4, two patches have been merged into -next, so V5 not send these
 two patches.

Since V3:
 1. According to Robin's suggestion, direct modify user_ldst and
 user_ldp in asm-uaccess.h and modify mte.S.
 2. Add new macro USER_MC in asm-uaccess.h, used in copy_from_user.S
 and copy_to_user.S.
 3. According to Robin's suggestion, using micro in copy_page_mc.S to
 simplify code.
 4. According to KeFeng's suggestion, modify powerpc code in patch1.
 5. According to KeFeng's suggestion, modify mm/extable.c and some code
 optimization.

Since V2:
 1. According to Mark's suggestion, all uaccess can be recovered due to
    memory error.
 2. Scenario pagecache reading is also supported as part of uaccess
    (copy_to_user()) and duplication code problem is also solved. 
    Thanks for Robin's suggestion.
 3. According Mark's suggestion, update commit message of patch 2/5.
 4. According Borisllav's suggestion, update commit message of patch 1/5.

Since V1:
 1.Consistent with PPC/x86, Using CONFIG_ARCH_HAS_COPY_MC instead of
   ARM64_UCE_KERNEL_RECOVERY.
 2.Add two new scenes, cow and pagecache reading.
 3.Fix two small bug(the first two patch).

V1 in here:
https://lore.kernel.org/lkml/20220323033705.3966643-1-tongtiangen@huawei.com/

Tong Tiangen (5):
  uaccess: add generic fallback version of copy_mc_to_user()
  arm64: add support for ARCH_HAS_COPY_MC
  mm/hwpoison: return -EFAULT when copy fail in
    copy_mc_[user]_highpage()
  arm64: support copy_mc_[user]_highpage()
  arm64: introduce copy_mc_to_kernel() implementation

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/asm-extable.h | 31 +++++++--
 arch/arm64/include/asm/asm-uaccess.h |  4 ++
 arch/arm64/include/asm/extable.h     |  1 +
 arch/arm64/include/asm/mte.h         |  9 +++
 arch/arm64/include/asm/page.h        | 10 +++
 arch/arm64/include/asm/string.h      |  5 ++
 arch/arm64/include/asm/uaccess.h     | 18 +++++
 arch/arm64/lib/Makefile              |  2 +
 arch/arm64/lib/copy_mc_page.S        | 37 +++++++++++
 arch/arm64/lib/copy_page.S           | 62 ++----------------
 arch/arm64/lib/copy_page_template.S  | 70 ++++++++++++++++++++
 arch/arm64/lib/copy_to_user.S        | 10 +--
 arch/arm64/lib/memcpy_mc.S           | 98 ++++++++++++++++++++++++++++
 arch/arm64/lib/mte.S                 | 29 ++++++++
 arch/arm64/mm/copypage.c             | 75 +++++++++++++++++++++
 arch/arm64/mm/extable.c              | 19 ++++++
 arch/arm64/mm/fault.c                | 30 ++++++---
 arch/powerpc/include/asm/uaccess.h   |  1 +
 arch/x86/include/asm/uaccess.h       |  1 +
 include/linux/highmem.h              | 16 +++--
 include/linux/uaccess.h              |  8 +++
 mm/kasan/shadow.c                    | 12 ++++
 mm/khugepaged.c                      |  4 +-
 24 files changed, 472 insertions(+), 81 deletions(-)
 create mode 100644 arch/arm64/lib/copy_mc_page.S
 create mode 100644 arch/arm64/lib/copy_page_template.S
 create mode 100644 arch/arm64/lib/memcpy_mc.S

-- 
2.25.1


