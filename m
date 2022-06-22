Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFB5555085
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 17:58:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSp350KFQz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 01:58:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnw41xdnz3bqd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:52:49 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LSnvG4wZ9zDsJJ;
	Wed, 22 Jun 2022 23:52:10 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:44 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:43 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v5 12/33] objtool: arm64: Enable stack validation for arm64
Date: Wed, 22 Jun 2022 23:48:59 +0800
Message-ID: <20220622154920.95075-13-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622154920.95075-1-chenzhongjin@huawei.com>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add build option to run stack validation at compile time.

When requiring stack validation, jump tables are disabled as it
simplifies objtool analysis (without having to introduce unreliable
artifacs). In local testing, this does not appear to significaly
affect final binary size nor system performance.

Signed-off-by: Raphael Gault <raphael.gault@arm.com>
Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/arm64/Kconfig       |  2 ++
 arch/arm64/Kconfig.debug | 21 +++++++++++++++++++++
 arch/arm64/Makefile      |  4 ++++
 3 files changed, 27 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 57c4c995965f..30d3d549160f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -201,6 +201,8 @@ config ARM64
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
+	select HAVE_OBJTOOL
+	select HAVE_STACK_VALIDATION
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
index 265c4461031f..c2c68c6f7557 100644
--- a/arch/arm64/Kconfig.debug
+++ b/arch/arm64/Kconfig.debug
@@ -20,4 +20,25 @@ config ARM64_RELOC_TEST
 	depends on m
 	tristate "Relocation testing module"
 
+choice
+    prompt "Choose kernel unwinder"
+    default UNWINDER_FRAME_POINTER
+    help
+      This determines which method will be used for unwinding kernel stack
+      traces for panics, oopses, bugs, warnings, perf, /proc/<pid>/stack,
+      livepatch, lockdep, and more.
+
+config UNWINDER_FRAME_POINTER
+    bool "Frame pointer unwinder"
+    select FRAME_POINTER
+    help
+      This option enables the frame pointer unwinder for unwinding kernel
+      stack traces.
+
+      The unwinder itself is fast and it uses less RAM than the ORC
+      unwinder, but the kernel text size will grow by ~3% and the kernel's
+      overall performance will degrade by roughly 5-10%.
+
+endchoice
+
 source "drivers/hwtracing/coresight/Kconfig"
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2f1de88651e6..ad2f4a5e8f6c 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -133,6 +133,10 @@ ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_REGS),y)
   CC_FLAGS_FTRACE := -fpatchable-function-entry=2
 endif
 
+ifeq ($(CONFIG_STACK_VALIDATION),y)
+KBUILD_CFLAGS	+= -fno-jump-tables
+endif
+
 # Default value
 head-y		:= arch/arm64/kernel/head.o
 
-- 
2.17.1

