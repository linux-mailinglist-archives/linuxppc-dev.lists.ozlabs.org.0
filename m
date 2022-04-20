Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBAC50802F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 06:37:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kjnvq3qjbz3dR5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 14:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kjlt74ddVz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 13:05:51 +1000 (AEST)
Received: from kwepemi100015.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KjlPr2R1vz1J9nr;
 Wed, 20 Apr 2022 10:44:48 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100015.china.huawei.com (7.221.188.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:32 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 10:45:31 +0800
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
Subject: [PATCH -next v4 0/7]arm64: add machine check safe support
Date: Wed, 20 Apr 2022 03:04:11 +0000
Message-ID: <20220420030418.3189040-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 20 Apr 2022 14:34:53 +1000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
handled better, in some scenes, we can avoid panic, such as uaccess, if the
uaccess fails due to memory error, only the user process will be affected,
kill the user process and isolate the user page with hardware memory errors
is a better choice.

This patchset can be divided into three parts:
 1. Patch 0/1/4    - make some minor fixes to the associated code.
 2. Patch 3      - arm64 add support for machine check safe framework.
 3. Pathc 5/6/7  - arm64 add uaccess and cow to machine check safe.

Since V4:
 1. According to Robin's suggestion, direct modify user_ldst and
 user_ldp in asm-uaccess.h and modify mte.S.
 2. Add new macro USER_MC in asm-uaccess.h, used in copy_from_user.S
 and copy_to_user.S.
 3. According to Robin's suggestion, using micro in copy_page_mc.S to
 simplify code.
 4. According to KeFeng's suggestion, modify powerpc code in patch1.
 5. According to KeFeng's suggestion, modify mm/extable.c and some code
 optimization.

Since V3:
 1. According to Mark's suggestion, all uaccess can be recovered due to
    memory error.
 2. Scenario pagecache reading is also supported as part of uaccess
    (copy_to_user()) and duplication code problem is also solved. 
    Thanks for Robin's suggestion.
 3. According Mark's suggestion, update commit message of patch 2/5.
 4. According Borisllav's suggestion, update commit message of patch 1/5.

Since V2:
 1.Consistent with PPC/x86, Using CONFIG_ARCH_HAS_COPY_MC instead of
   ARM64_UCE_KERNEL_RECOVERY.
 2.Add two new scenes, cow and pagecache reading.
 3.Fix two small bug(the first two patch).

V1 in here:
https://lore.kernel.org/lkml/20220323033705.3966643-1-tongtiangen@huawei.com/

Robin Murphy (1):
  arm64: mte: Clean up user tag accessors

Tong Tiangen (6):
  x86, powerpc: fix function define in copy_mc_to_user
  arm64: fix types in copy_highpage()
  arm64: add support for machine check error safe
  arm64: add copy_{to, from}_user to machine check safe
  arm64: add {get, put}_user to machine check safe
  arm64: add cow to machine check safe

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/asm-extable.h | 33 +++++++++++
 arch/arm64/include/asm/asm-uaccess.h | 15 +++--
 arch/arm64/include/asm/extable.h     |  1 +
 arch/arm64/include/asm/page.h        | 10 ++++
 arch/arm64/include/asm/uaccess.h     |  4 +-
 arch/arm64/lib/Makefile              |  2 +
 arch/arm64/lib/copy_from_user.S      | 18 +++---
 arch/arm64/lib/copy_page_mc.S        | 86 ++++++++++++++++++++++++++++
 arch/arm64/lib/copy_to_user.S        | 18 +++---
 arch/arm64/lib/mte.S                 |  4 +-
 arch/arm64/mm/copypage.c             | 36 ++++++++++--
 arch/arm64/mm/extable.c              | 33 +++++++++++
 arch/arm64/mm/fault.c                | 27 ++++++++-
 arch/powerpc/include/asm/uaccess.h   |  1 +
 arch/x86/include/asm/uaccess.h       |  1 +
 include/linux/highmem.h              |  8 +++
 include/linux/uaccess.h              |  9 +++
 mm/memory.c                          |  2 +-
 19 files changed, 278 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/lib/copy_page_mc.S

-- 
2.25.1

