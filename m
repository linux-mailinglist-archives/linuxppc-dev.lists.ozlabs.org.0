Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199247FDE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 15:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JN0vz1K7Tz3cTV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 01:50:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JN0v55Qqwz2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 01:49:52 +1100 (AEDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JN0sq5Vv9z91vr;
 Mon, 27 Dec 2021 22:48:47 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 22:49:42 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 22:49:41 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/3] mm: vmalloc: Let user to control huge vmalloc default
 behavior
Date: Mon, 27 Dec 2021 22:59:01 +0800
Message-ID: <20211227145903.187152-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
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

Introduce HUGE_VMALLOC_DEFAULT_ENABLED and make it default y, this
let user to choose whether or not enable huge vmalloc mappings by
default.

Meanwhile, add new hugevmalloc=on/off parameter to enable or disable
this feature at boot time, nohugevmalloc is still supported and
equivalent to hugevmalloc=off.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 .../admin-guide/kernel-parameters.txt          | 12 ++++++++++++
 mm/Kconfig                                     |  8 ++++++++
 mm/vmalloc.c                                   | 18 +++++++++++++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a069d8fe2fee..7b2f900fd243 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1638,6 +1638,18 @@
 			If both parameters are enabled, hugetlb_free_vmemmap takes
 			precedence over memory_hotplug.memmap_on_memory.
 
+
+	hugevmalloc=	[PPC] Reguires CONFIG_HAVE_ARCH_HUGE_VMALLOC
+			Format: { on | off }
+			Default set by CONFIG_HUGE_VMALLOC_DEFAULT_ENABLED.
+
+			This parameter enables/disables kernel huge vmalloc
+			mappings at boot time.
+
+			on:  Enable the feature
+			off: Disable the feature
+			     Equivalent to: nohugevmalloc
+
 	hung_task_panic=
 			[KNL] Should the hung task detector generate panics.
 			Format: 0 | 1
diff --git a/mm/Kconfig b/mm/Kconfig
index a99bd499ef51..8d8a92f22905 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -262,6 +262,14 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 	  HUGETLB_PAGE_ORDER when there are multiple HugeTLB page sizes available
 	  on a platform.
 
+config HUGE_VMALLOC_DEFAULT_ENABLED
+	bool "Enable huge vmalloc mappings by default"
+	default y
+	depends on HAVE_ARCH_HUGE_VMALLOC
+	help
+	  Enable huge vmalloc mappings by default, this value could be overridden
+	  by hugevmalloc=off|on.
+
 config CONTIG_ALLOC
 	def_bool (MEMORY_ISOLATION && COMPACTION) || CMA
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 9bf838817a47..0d0f8deb5639 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -60,7 +60,7 @@ static const unsigned int ioremap_max_page_shift = PAGE_SHIFT;
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMALLOC
-static bool __ro_after_init vmap_allow_huge = true;
+static bool __ro_after_init vmap_allow_huge = IS_ENABLED(CONFIG_HUGE_VMALLOC_DEFAULT_ENABLED);
 
 static int __init set_nohugevmalloc(char *str)
 {
@@ -68,6 +68,22 @@ static int __init set_nohugevmalloc(char *str)
 	return 0;
 }
 early_param("nohugevmalloc", set_nohugevmalloc);
+
+static int __init set_hugevmalloc(char *str)
+{
+	if (!str)
+		return -EINVAL;
+
+	if (!strcmp(str, "on"))
+		vmap_allow_huge = true;
+	else if (!strcmp(str, "off"))
+		vmap_allow_huge = false;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("hugevmalloc", set_hugevmalloc);
 #else /* CONFIG_HAVE_ARCH_HUGE_VMALLOC */
 static const bool vmap_allow_huge = false;
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMALLOC */
-- 
2.26.2

