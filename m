Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6B9590C7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 09:24:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3wCg2VPpz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 17:24:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1038 seconds by postgrey-1.36 at boromir; Fri, 12 Aug 2022 17:23:53 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3wCF1NtKz2yjC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 17:23:52 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M3vmc2HHlzmV7n;
	Fri, 12 Aug 2022 15:04:16 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 15:06:22 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 15:06:20 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -next v7 0/4]arm64: add machine check safe support
Date: Fri, 12 Aug 2022 07:05:53 +0000
Message-ID: <20220812070557.1028499-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the increase of memory capacity and density, the probability of
memory error increases. The increasing size and density of server RAM
in the data center and cloud have shown increased uncorrectable memory
errors.

Currently, the kernel has a mechanism to recover from hardware memory
errors. This patchset provides an new recovery mechanism.

For arm64, the hardware memory error handling is do_sea() which divided
into two cases:
 1. The user state consumed the memory errors, the solution is kill the
    user process and isolate the error page.
 2. The kernel state consumed the memory errors, the solution is panic.

For case 2, Undifferentiated panic maybe not the optimal choice, it can be
handled better, in some scenarios, we can avoid panic, such as uaccess, if the
uaccess fails due to memory error, only the user process will be affected,
kill the user process and isolate the user page with hardware memory errors
is a better choice.

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

Tong Tiangen (4):
  uaccess: add generic fallback version of copy_mc_to_user()
  arm64: add support for machine check error safe
  arm64: add uaccess to machine check safe
  arm64: add cow to machine check safe

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/asm-extable.h |  5 ++
 arch/arm64/include/asm/assembler.h   |  4 ++
 arch/arm64/include/asm/extable.h     |  1 +
 arch/arm64/include/asm/mte.h         |  4 ++
 arch/arm64/include/asm/page.h        | 10 ++++
 arch/arm64/lib/Makefile              |  2 +
 arch/arm64/lib/copy_page_mc.S        | 82 ++++++++++++++++++++++++++++
 arch/arm64/lib/mte.S                 | 19 +++++++
 arch/arm64/mm/copypage.c             | 37 +++++++++++--
 arch/arm64/mm/extable.c              | 25 +++++++++
 arch/arm64/mm/fault.c                | 29 +++++++++-
 arch/powerpc/include/asm/uaccess.h   |  1 +
 arch/x86/include/asm/uaccess.h       |  1 +
 include/linux/highmem.h              |  8 +++
 include/linux/uaccess.h              |  9 +++
 mm/memory.c                          |  2 +-
 17 files changed, 233 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/lib/copy_page_mc.S

-- 
2.25.1

