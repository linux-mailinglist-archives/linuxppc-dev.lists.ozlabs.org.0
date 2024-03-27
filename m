Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B0F88D39B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 02:09:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V47qP41Ymz3vc7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 12:09:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1173 seconds by postgrey-1.37 at boromir; Wed, 27 Mar 2024 12:08:57 AEDT
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V47px2Kdwz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 12:08:53 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4V47KC2BFCz1R7Kc;
	Wed, 27 Mar 2024 08:46:39 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id C7ADC140412;
	Wed, 27 Mar 2024 08:49:18 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 08:49:16 +0800
Message-ID: <54007f91-3614-37c2-49f6-fc30429ec67d@huawei.com>
Date: Wed, 27 Mar 2024 08:49:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v11 0/5]arm64: add ARCH_HAS_COPY_MC support
To: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
References: <20240207132204.1720444-1-tongtiangen@huawei.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20240207132204.1720444-1-tongtiangen@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark:

	Kindly ping...

Thanks,
Tong.

在 2024/2/7 21:21, Tong Tiangen 写道:
> With the increase of memory capacity and density, the probability of memory
> error also increases. The increasing size and density of server RAM in data
> centers and clouds have shown increased uncorrectable memory errors.
> 
> Currently, more and more scenarios that can tolerate memory errors，such as
> CoW[1,2], KSM copy[3], coredump copy[4], khugepaged[5,6], uaccess copy[7],
> etc.
> 
> This patchset introduces a new processing framework on ARM64, which enables
> ARM64 to support error recovery in the above scenarios, and more scenarios
> can be expanded based on this in the future.
> 
> In arm64, memory error handling in do_sea(), which is divided into two cases:
>   1. If the user state consumed the memory errors, the solution is to kill
>      the user process and isolate the error page.
>   2. If the kernel state consumed the memory errors, the solution is to
>      panic.
> 
> For case 2, Undifferentiated panic may not be the optimal choice, as it can
> be handled better. In some scenarios, we can avoid panic, such as uaccess,
> if the uaccess fails due to memory error, only the user process will be
> affected, killing the user process and isolating the user page with
> hardware memory errors is a better choice.
> 
> [1] commit d302c2398ba2 ("mm, hwpoison: when copy-on-write hits poison, take page offline")
> [2] commit 1cb9dc4b475c ("mm: hwpoison: support recovery from HugePage copy-on-write faults")
> [3] commit 6b970599e807 ("mm: hwpoison: support recovery from ksm_might_need_to_copy()")
> [4] commit 245f09226893 ("mm: hwpoison: coredump: support recovery from dump_user_range()")
> [5] commit 98c76c9f1ef7 ("mm/khugepaged: recover from poisoned anonymous memory")
> [6] commit 12904d953364 ("mm/khugepaged: recover from poisoned file-backed memory")
> [7] commit 278b917f8cb9 ("x86/mce: Add _ASM_EXTABLE_CPY for copy user access")
> 
> ------------------
> Test result:
> 
> 1. copy_page(), copy_mc_page() basic function test pass, and the disassembly
>     contents remains the same before and after refactor.
> 
> 2. copy_to/from_user() access kernel NULL pointer raise translation fault
>     and dump error message then die(), test pass.
> 
> 3. Test following scenarios: copy_from_user(), get_user(), COW.
> 
>     Before patched: trigger a hardware memory error then panic.
>     After  patched: trigger a hardware memory error without panic.
> 
>     Testing step:
>     step1. start an user-process.
>     step2. poison(einj) the user-process's page.
>     step3: user-process access the poison page in kernel mode, then trigger SEA.
>     step4: the kernel will not panic, only the user process is killed, the poison
>            page is isolated. (before patched, the kernel will panic in do_sea())
> 
> ------------------
> 
> Since V10:
>   Accroding Mark's suggestion:
>   1. Merge V10's patch2 and patch3 to V11's patch2.
>   2. Patch2(V11): use new fixup_type for ld* in copy_to_user(), fix fatal
>      issues (NULL kernel pointeraccess) been fixup incorrectly.
>   3. Patch2(V11): refactoring the logic of do_sea().
>   4. Patch4(V11): Remove duplicate assembly logic and remove do_mte().
> 
>   Besides:
>   1. Patch2(V11): remove st* insn's fixup, st* generally not trigger memory error.
>   2. Split a part of the logic of patch2(V11) to patch5(V11), for detail,
>      see patch5(V11)'s commit msg.
>   3. Remove patch6(v10) “arm64: introduce copy_mc_to_kernel() implementation”.
>      During modification, some problems that cannot be solved in a short
>      period are found. The patch will be released after the problems are
>      solved.
>   4. Add test result in this patch.
>   5. Modify patchset title, do not use machine check and remove "-next".
> 
> Since V9:
>   1. Rebase to latest kernel version 6.8-rc2.
>   2. Add patch 6/6 to support copy_mc_to_kernel().
> 
> Since V8:
>   1. Rebase to latest kernel version and fix topo in some of the patches.
>   2. According to the suggestion of Catalin, I attempted to modify the
>      return value of function copy_mc_[user]_highpage() to bytes not copied.
>      During the modification process, I found that it would be more
>      reasonable to return -EFAULT when copy error occurs (referring to the
>      newly added patch 4).
> 
>      For ARM64, the implementation of copy_mc_[user]_highpage() needs to
>      consider MTE. Considering the scenario where data copying is successful
>      but the MTE tag copying fails, it is also not reasonable to return
>      bytes not copied.
>   3. Considering the recent addition of machine check safe support for
>      multiple scenarios, modify commit message for patch 5 (patch 4 for V8).
> 
> Since V7:
>   Currently, there are patches supporting recover from poison
>   consumption for the cow scenario[1]. Therefore, Supporting cow
>   scenario under the arm64 architecture only needs to modify the relevant
>   code under the arch/.
>   [1]https://lore.kernel.org/lkml/20221031201029.102123-1-tony.luck@intel.com/
> 
> Since V6:
>   Resend patches that are not merged into the mainline in V6.
> 
> Since V5:
>   1. Add patch2/3 to add uaccess assembly helpers.
>   2. Optimize the implementation logic of arm64_do_kernel_sea() in patch8.
>   3. Remove kernel access fixup in patch9.
>   All suggestion are from Mark.
> 
> Since V4:
>   1. According Michael's suggestion, add patch5.
>   2. According Mark's suggestiog, do some restructuring to arm64
>   extable, then a new adaptation of machine check safe support is made based
>   on this.
>   3. According Mark's suggestion, support machine check safe in do_mte() in
>   cow scene.
>   4. In V4, two patches have been merged into -next, so V5 not send these
>   two patches.
> 
> Since V3:
>   1. According to Robin's suggestion, direct modify user_ldst and
>   user_ldp in asm-uaccess.h and modify mte.S.
>   2. Add new macro USER_MC in asm-uaccess.h, used in copy_from_user.S
>   and copy_to_user.S.
>   3. According to Robin's suggestion, using micro in copy_page_mc.S to
>   simplify code.
>   4. According to KeFeng's suggestion, modify powerpc code in patch1.
>   5. According to KeFeng's suggestion, modify mm/extable.c and some code
>   optimization.
> 
> Since V2:
>   1. According to Mark's suggestion, all uaccess can be recovered due to
>      memory error.
>   2. Scenario pagecache reading is also supported as part of uaccess
>      (copy_to_user()) and duplication code problem is also solved.
>      Thanks for Robin's suggestion.
>   3. According Mark's suggestion, update commit message of patch 2/5.
>   4. According Borisllav's suggestion, update commit message of patch 1/5.
> 
> Since V1:
>   1.Consistent with PPC/x86, Using CONFIG_ARCH_HAS_COPY_MC instead of
>     ARM64_UCE_KERNEL_RECOVERY.
>   2.Add two new scenes, cow and pagecache reading.
>   3.Fix two small bug(the first two patch).
> 
> V1 in here:
> https://lore.kernel.org/lkml/20220323033705.3966643-1-tongtiangen@huawei.com/
> 
> Tong Tiangen (5):
>    uaccess: add generic fallback version of copy_mc_to_user()
>    arm64: add support for ARCH_HAS_COPY_MC
>    mm/hwpoison: return -EFAULT when copy fail in
>      copy_mc_[user]_highpage()
>    arm64: support copy_mc_[user]_highpage()
>    arm64: send SIGBUS to user process for SEA exception
> 
>   arch/arm64/Kconfig                   |  1 +
>   arch/arm64/include/asm/asm-extable.h | 31 ++++++++++++---
>   arch/arm64/include/asm/asm-uaccess.h |  4 ++
>   arch/arm64/include/asm/extable.h     |  1 +
>   arch/arm64/include/asm/mte.h         |  9 +++++
>   arch/arm64/include/asm/page.h        | 10 +++++
>   arch/arm64/lib/Makefile              |  2 +
>   arch/arm64/lib/copy_mc_page.S        | 37 ++++++++++++++++++
>   arch/arm64/lib/copy_page.S           | 50 +++----------------------
>   arch/arm64/lib/copy_page_template.S  | 56 ++++++++++++++++++++++++++++
>   arch/arm64/lib/copy_to_user.S        | 10 ++---
>   arch/arm64/lib/mte.S                 | 29 ++++++++++++++
>   arch/arm64/mm/copypage.c             | 45 ++++++++++++++++++++++
>   arch/arm64/mm/extable.c              | 19 ++++++++++
>   arch/arm64/mm/fault.c                | 39 ++++++++++++++-----
>   arch/powerpc/include/asm/uaccess.h   |  1 +
>   arch/x86/include/asm/uaccess.h       |  1 +
>   include/linux/highmem.h              | 16 ++++++--
>   include/linux/uaccess.h              |  9 +++++
>   mm/khugepaged.c                      |  4 +-
>   20 files changed, 304 insertions(+), 70 deletions(-)
>   create mode 100644 arch/arm64/lib/copy_mc_page.S
>   create mode 100644 arch/arm64/lib/copy_page_template.S
> 
