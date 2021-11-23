Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42645AD66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzG1Y2FsTz3c5S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 07:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nocp3Jp2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzFxP1b61z2ymk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 07:24:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=i3WHWSa1hg80WuIQn/7+NJcaE8WHBrxPKwjxmfyhwfU=; b=nocp3Jp2iQzzp2V48CnvRYnwNt
 D9rzo0FJu9qmBS1ZFSUBNSY4m0LOHhDkQtQBnIKT5T01wZ6gAlkOvwyNcDZvKWl602RqAKccgxLdZ
 MlY51PlrNFan1uSSF5JVT3cj9dk8NX8eLaEZ8fkUCqa5z+4M68qAzJSIupnuBc8U7ErJubOwB2/yW
 YrumtHgbZxP96fP6GbKrcrKZUf4NCFIPX9snD3Kr326+QOc+fEzODy3C6GbGO4/vjEIDN4RHUkai2
 FBx8UCKVTYaLIMWKrhjeUJJo8feC8D4zNmW+Gpc54CLC7LV01u6c/K03nRMF1sqj2J2l81j2J4Lnc
 yRnENabA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mpcL1-003R5R-F5; Tue, 23 Nov 2021 20:24:23 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: akpm@linux-foundation.org, keescook@chromium.org,
	yzaikin@google.com, nixiaoming@huawei.com, ebiederm@xmission.com,
	clemens@ladisch.de, arnd@arndb.de, gregkh@linuxfoundation.org,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
	airlied@linux.ie, "daniel@ffwll.chairlied"@linux.ie,
	benh@kernel.crashing.org, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, jack@suse.cz, amir73il@gmail.com,
	phil@philpotter.co.uk, viro@zeniv.linux.org.uk, julia.lawall@inria.fr
Subject: [PATCH v2 8/8] eventpoll: simplify sysctl declaration with
 register_sysctl()
Date: Tue, 23 Nov 2021 12:24:22 -0800
Message-Id: <20211123202422.819032-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123202422.819032-1-mcgrof@kernel.org>
References: <20211123202422.819032-1-mcgrof@kernel.org>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiaoming Ni <nixiaoming@huawei.com>

The kernel/sysctl.c is a kitchen sink where everyone leaves
their dirty dishes, this makes it very difficult to maintain.

To help with this maintenance let's start by moving sysctls to
places where they actually belong. The proc sysctl maintainers
do not want to know what sysctl knobs you wish to add for your own
piece of code, we just care about the core logic.

So move the epoll_table sysctl to fs/eventpoll.c and use
use register_sysctl().

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/eventpoll.c         | 10 +++++++++-
 include/linux/poll.h   |  2 --
 include/linux/sysctl.h |  1 -
 kernel/sysctl.c        |  7 -------
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 06f4c5ae1451..e2daa940ebce 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -307,7 +307,7 @@ static void unlist_file(struct epitems_head *head)
 static long long_zero;
 static long long_max = LONG_MAX;
 
-struct ctl_table epoll_table[] = {
+static struct ctl_table epoll_table[] = {
 	{
 		.procname	= "max_user_watches",
 		.data		= &max_user_watches,
@@ -319,6 +319,13 @@ struct ctl_table epoll_table[] = {
 	},
 	{ }
 };
+
+static void __init epoll_sysctls_init(void)
+{
+	register_sysctl("fs/epoll", epoll_table);
+}
+#else
+#define epoll_sysctls_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
 static const struct file_operations eventpoll_fops;
@@ -2378,6 +2385,7 @@ static int __init eventpoll_init(void)
 	/* Allocates slab cache used to allocate "struct eppoll_entry" */
 	pwq_cache = kmem_cache_create("eventpoll_pwq",
 		sizeof(struct eppoll_entry), 0, SLAB_PANIC|SLAB_ACCOUNT, NULL);
+	epoll_sysctls_init();
 
 	ephead_cache = kmem_cache_create("ep_head",
 		sizeof(struct epitems_head), 0, SLAB_PANIC|SLAB_ACCOUNT, NULL);
diff --git a/include/linux/poll.h b/include/linux/poll.h
index 1cdc32b1f1b0..a9e0e1c2d1f2 100644
--- a/include/linux/poll.h
+++ b/include/linux/poll.h
@@ -8,12 +8,10 @@
 #include <linux/wait.h>
 #include <linux/string.h>
 #include <linux/fs.h>
-#include <linux/sysctl.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/poll.h>
 #include <uapi/linux/eventpoll.h>
 
-extern struct ctl_table epoll_table[]; /* for sysctl */
 /* ~832 bytes of stack space used max in sys_select/sys_poll before allocating
    additional memory. */
 #ifdef __clang__
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 718492057c70..5e0428a71899 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -218,7 +218,6 @@ extern int no_unaligned_warning;
 extern struct ctl_table sysctl_mount_point[];
 extern struct ctl_table random_table[];
 extern struct ctl_table firmware_config_table[];
-extern struct ctl_table epoll_table[];
 
 #else /* CONFIG_SYSCTL */
 static inline struct ctl_table_header *register_sysctl_table(struct ctl_table * table)
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 6aa67c737e4e..b09ff41720e3 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3092,13 +3092,6 @@ static struct ctl_table fs_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 #endif
-#ifdef CONFIG_EPOLL
-	{
-		.procname	= "epoll",
-		.mode		= 0555,
-		.child		= epoll_table,
-	},
-#endif
 #endif
 	{
 		.procname	= "protected_symlinks",
-- 
2.33.0

