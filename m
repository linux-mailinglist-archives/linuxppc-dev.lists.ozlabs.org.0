Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E70247FDE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 15:50:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JN0vW2PHTz3bXc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 01:50:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JN0v54vJXz2xDT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 01:49:50 +1100 (AEDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JN0q60Bskz1DK7x;
 Mon, 27 Dec 2021 22:46:26 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 22:49:41 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 22:49:40 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] mm: support huge vmalloc mapping on arm64/x86
Date: Mon, 27 Dec 2021 22:59:00 +0800
Message-ID: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Huge vmalloc mappings is supported on PPC[1], but this feature should
be not only used on PPC, it could be used on arch support HAVE_ARCH_HUGE_VMAP
and PMD sized vmap mappings. this patchset is to enable this feature
on arm64/x86.

There are some disadvantages about this feature[2], one of the main
concerns is the possible memory fragmentation/waste in some scenarios,
also archs must ensure that any arch specific vmalloc allocations that
require PAGE_SIZE mappings(eg, module alloc with STRICT_MODULE_RWX)
use the VM_NO_HUGE_VMAP flag to inhibit larger mappings.

Based on the above considerations, we add the first patch is to let
user to control huge vmalloc mapping default behavior.  Meanwhile,
add new kernel parameter hugevmalloc=on/off to enable/disable this
feature at boot time, nohugevmalloc parameter is still supported.

The later two patches to enable this feature on arm64/x86, select
HAVE_ARCH_HUGE_VMALLOC and mark VM_NO_HUGE_VMAP in arch's module_alloc().

This patchset based on next-20211224.

v2:
- Default y for HUGE_VMALLOC_DEFAULT_ENABLED, not only select it on PPC
- Fix copy/type error
- Mark VM_NO_HUGE_VMAP in module_alloc() on arm64/x86

[1] https://lore.kernel.org/linux-mm/20210317062402.533919-1-npiggin@gmail.com/
[2] https://lore.kernel.org/linux-mm/1616036421.amjz2efujj.astroid@bobo.none/

Kefeng Wang (3):
  mm: vmalloc: Let user to control huge vmalloc default behavior
  arm64: Support huge vmalloc mappings
  x86: Support huge vmalloc mappings

 .../admin-guide/kernel-parameters.txt          | 14 +++++++++++++-
 arch/arm64/Kconfig                             |  1 +
 arch/arm64/kernel/module.c                     |  5 +++--
 arch/x86/Kconfig                               |  1 +
 arch/x86/kernel/module.c                       |  4 ++--
 mm/Kconfig                                     |  8 ++++++++
 mm/vmalloc.c                                   | 18 +++++++++++++++++-
 7 files changed, 45 insertions(+), 6 deletions(-)

-- 
2.26.2

