Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F014E879
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 06:35:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4885XP3MPgzDqkk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 16:35:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=BDqsewvd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=rTtUs3Ob; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4885T30QjFzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 16:32:16 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 201BC21B84;
 Fri, 31 Jan 2020 00:32:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 31 Jan 2020 00:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=FNsMuvFx+h50FnF2XeP6GajNtS
 bj8MaRYeBlypo3DRc=; b=BDqsewvdGEQjWuHV8mzH5TLYSNwBsU5wQZNIF55t20
 eizgVcWCfS6ZREdmZvL5OzlXlRU6DhQ+PS4wuHnD7HOEG1kke4/yXrhPHCGbo2Wi
 bgSyC7v9wt3ngUhIrdy5r7GO4NJhDY8zpR+KuPfGVwV3rwyFpKEJHcbXmBgAb13H
 DSvTxGRMZM4A6GTB3hzpMqCdXZdyxWMJBAIUDEQgUWeL+rbjjV4Sa0DGGWVkzNns
 ApLJ3nivgbQi1UfQYXbfwycw0s43h3ZLXr/8nQK1T/NnXksxBneP1GAZM+P8N6T0
 TSVyfvId7seYVlNvpHZ/yCnhwcnucQHwlfhyk/J7PITg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FNsMuvFx+h50FnF2X
 eP6GajNtSbj8MaRYeBlypo3DRc=; b=rTtUs3ObF0+87lIGId0MO4IRwfADjf3I3
 UOCQscH3/QbElEk9xfGM63M+KzsbPufhddxlmc4LiVv/mEvhpnkaE+7pFo94bVV5
 shsC9zWci4CPGa9onBPb/6hH0Cfgjngr6R7qR+qwvefv7aFIH76/z+/1AKDRGDK2
 hhqcqn6xuAGFsEZo3tuBBDy05OXKQGrVwQB+rstYagFTPf07+Ls81FEJxb6VP/fG
 K+BL4WHuTs7NqeZ2h9Z+ISOMh40C7FTrZcoPewGHQfpz+BYQQkM+5SoaPTn0qTtR
 90+7s/lCmjwVZYujLPtBepUpesUHwXEr4J62LiBCAFsv/3Ivonq5Q==
X-ME-Sender: <xms:27szXpsXtzx3YE7atDRuw5dA6yIHbbjeDf_74YenHZ3EPs8Mj7orWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeelgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvddrud
 dtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhu
 shgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:27szXvKauJN9NXVyPI9V0P6Ouzjt4wfN1ncDWZVm0R9rqffFq8R-tQ>
 <xmx:27szXgpI1e2YzyiyKCIupHVAsFN2s1LLwBunZj0m_bBXB3odv7lbKQ>
 <xmx:27szXqWbhpUC5fgMiI8xftmAbSYpF44FsYnaTvmFDcrKrfMGwS7HqQ>
 <xmx:3bszXn9V55gm-ya5jnLZ8lEQG9ThZWMUBSk-sscociwfQ5W9OPTtuQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id B2DA0328005A;
 Fri, 31 Jan 2020 00:32:08 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: keescook@chromium.org
Subject: [PATCH] lkdtm: Test KUAP directional user access unlocks on powerpc
Date: Fri, 31 Jan 2020 16:31:57 +1100
Message-Id: <20200131053157.22463-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel Userspace Access Prevention (KUAP) on powerpc supports
allowing only one access direction (Read or Write) when allowing access
to or from user memory.

A bug was recently found that showed that these one-way unlocks never
worked, and allowing Read *or* Write would actually unlock Read *and*
Write.  We should have a test case for this so we can make sure this
doesn't happen again.

Like ACCESS_USERSPACE, the correct result is for the test to fault.

At the time of writing this, the upstream kernel still has this bug
present, so the test will allow both accesses whereas ACCESS_USERSPACE
will correctly fault.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 drivers/misc/lkdtm/core.c  |  3 +++
 drivers/misc/lkdtm/lkdtm.h |  3 +++
 drivers/misc/lkdtm/perms.c | 43 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index ee0d6e721441..baef3c6f48d6 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -137,6 +137,9 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(EXEC_USERSPACE),
 	CRASHTYPE(EXEC_NULL),
 	CRASHTYPE(ACCESS_USERSPACE),
+#ifdef CONFIG_PPC_KUAP
+	CRASHTYPE(ACCESS_USERSPACE_KUAP),
+#endif
 	CRASHTYPE(ACCESS_NULL),
 	CRASHTYPE(WRITE_RO),
 	CRASHTYPE(WRITE_RO_AFTER_INIT),
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index c56d23e37643..406a3fb32e6f 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -57,6 +57,9 @@ void lkdtm_EXEC_RODATA(void);
 void lkdtm_EXEC_USERSPACE(void);
 void lkdtm_EXEC_NULL(void);
 void lkdtm_ACCESS_USERSPACE(void);
+#ifdef CONFIG_PPC_KUAP
+void lkdtm_ACCESS_USERSPACE_KUAP(void);
+#endif
 void lkdtm_ACCESS_NULL(void);
 
 /* lkdtm_refcount.c */
diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index 62f76d506f04..2c9aa0114333 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -10,6 +10,9 @@
 #include <linux/mman.h>
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
+#ifdef CONFIG_PPC_KUAP
+#include <asm/uaccess.h>
+#endif
 
 /* Whether or not to fill the target memory area with do_nothing(). */
 #define CODE_WRITE	true
@@ -200,6 +203,46 @@ void lkdtm_ACCESS_USERSPACE(void)
 	vm_munmap(user_addr, PAGE_SIZE);
 }
 
+/* Test that KUAP's directional user access unlocks work as intended */
+#ifdef CONFIG_PPC_KUAP
+void lkdtm_ACCESS_USERSPACE_KUAP(void)
+{
+	unsigned long user_addr, tmp = 0;
+	unsigned long *ptr;
+
+	user_addr = vm_mmap(NULL, 0, PAGE_SIZE,
+			    PROT_READ | PROT_WRITE | PROT_EXEC,
+			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
+	if (user_addr >= TASK_SIZE) {
+		pr_warn("Failed to allocate user memory\n");
+		return;
+	}
+
+	if (copy_to_user((void __user *)user_addr, &tmp, sizeof(tmp))) {
+		pr_warn("copy_to_user failed\n");
+		vm_munmap(user_addr, PAGE_SIZE);
+		return;
+	}
+
+	ptr = (unsigned long *)user_addr;
+
+	/* Allowing "write to" should not allow "read from" */
+	allow_write_to_user(ptr, sizeof(unsigned long));
+	pr_info("attempting bad read at %px with write allowed\n", ptr);
+	tmp = *ptr;
+	tmp += 0xc0dec0de;
+	prevent_write_to_user(ptr, sizeof(unsigned long));
+
+	/* Allowing "read from" should not allow "write to" */
+	allow_read_from_user(ptr, sizeof(unsigned long));
+	pr_info("attempting bad write at %px with read allowed\n", ptr);
+	*ptr = tmp;
+	prevent_read_from_user(ptr, sizeof(unsigned long));
+
+	vm_munmap(user_addr, PAGE_SIZE);
+}
+#endif
+
 void lkdtm_ACCESS_NULL(void)
 {
 	unsigned long tmp;
-- 
2.25.0

