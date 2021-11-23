Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8745AD69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:29:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzG2y4mDjz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 07:29:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZWGMqUJp;
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzFxQ0R6Cz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 07:24:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=98K78mt4doENfVFa8jk6SLvGB6ZcKxW39Bfjzxnd8Es=; b=ZWGMqUJpXOQI3VJBbWwkF5dkkm
 XuZBquuv28iODfbHzo7SWPv24PHTuhXjgWDcUFNe/h7zyH7S9XP727frDacpnOEVojWeDNN1WmZ7c
 JvLWHx5EvnyZnP3SGmAmMSXcbgOcbZQlMWA1vJXmojmLuwEQFzFUo+YxgsMohzvmdxasSE17Ic+iU
 pjSFBRxi7+xCaqy4nOBq1vViyaLZD8YLYwQz2X/FSkEdkIQYKj/XS6+Ijt+7Yl706JgOTvYkabwGw
 SQA8mf4bsdIsDAoQcGvSBHoCgveFuIcxcqynlp589RtL2MjQBWPHHWwXydpdVuWzfTjedzXJkQLrP
 gOwiAFdA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mpcL1-003R5N-Cp; Tue, 23 Nov 2021 20:24:23 +0000
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
Subject: [PATCH v2 6/8] inotify: simplify subdirectory registration with
 register_sysctl()
Date: Tue, 23 Nov 2021 12:24:20 -0800
Message-Id: <20211123202422.819032-7-mcgrof@kernel.org>
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

There is no need to user boiler plate code to specify a set of base
directories we're going to stuff sysctls under. Simplify this by using
register_sysctl() and specifying the directory path directly.

Move inotify_user sysctl to inotify_user.c while at it to remove clutter
from kernel/sysctl.c.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
[mcgrof: update commit log to reflect new path we decided to take]
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/notify/inotify/inotify_user.c | 11 ++++++++++-
 include/linux/inotify.h          |  3 ---
 kernel/sysctl.c                  | 21 ---------------------
 3 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
index 29fca3284bb5..54583f62dc44 100644
--- a/fs/notify/inotify/inotify_user.c
+++ b/fs/notify/inotify/inotify_user.c
@@ -58,7 +58,7 @@ struct kmem_cache *inotify_inode_mark_cachep __read_mostly;
 static long it_zero = 0;
 static long it_int_max = INT_MAX;
 
-struct ctl_table inotify_table[] = {
+static struct ctl_table inotify_table[] = {
 	{
 		.procname	= "max_user_instances",
 		.data		= &init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES],
@@ -87,6 +87,14 @@ struct ctl_table inotify_table[] = {
 	},
 	{ }
 };
+
+static void __init inotify_sysctls_init(void)
+{
+	register_sysctl("fs/inotify", inotify_table);
+}
+
+#else
+#define inotify_sysctls_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
 static inline __u32 inotify_arg_to_mask(struct inode *inode, u32 arg)
@@ -849,6 +857,7 @@ static int __init inotify_user_setup(void)
 	inotify_max_queued_events = 16384;
 	init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES] = 128;
 	init_user_ns.ucount_max[UCOUNT_INOTIFY_WATCHES] = watches_max;
+	inotify_sysctls_init();
 
 	return 0;
 }
diff --git a/include/linux/inotify.h b/include/linux/inotify.h
index 6a24905f6e1e..8d20caa1b268 100644
--- a/include/linux/inotify.h
+++ b/include/linux/inotify.h
@@ -7,11 +7,8 @@
 #ifndef _LINUX_INOTIFY_H
 #define _LINUX_INOTIFY_H
 
-#include <linux/sysctl.h>
 #include <uapi/linux/inotify.h>
 
-extern struct ctl_table inotify_table[]; /* for sysctl */
-
 #define ALL_INOTIFY_BITS (IN_ACCESS | IN_MODIFY | IN_ATTRIB | IN_CLOSE_WRITE | \
 			  IN_CLOSE_NOWRITE | IN_OPEN | IN_MOVED_FROM | \
 			  IN_MOVED_TO | IN_CREATE | IN_DELETE | \
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 7a90a12b9ea4..6aa67c737e4e 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -125,13 +125,6 @@ static const int maxolduid = 65535;
 static const int ngroups_max = NGROUPS_MAX;
 static const int cap_last_cap = CAP_LAST_CAP;
 
-#ifdef CONFIG_INOTIFY_USER
-#include <linux/inotify.h>
-#endif
-#ifdef CONFIG_FANOTIFY
-#include <linux/fanotify.h>
-#endif
-
 #ifdef CONFIG_PROC_SYSCTL
 
 /**
@@ -3099,20 +3092,6 @@ static struct ctl_table fs_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 #endif
-#ifdef CONFIG_INOTIFY_USER
-	{
-		.procname	= "inotify",
-		.mode		= 0555,
-		.child		= inotify_table,
-	},
-#endif
-#ifdef CONFIG_FANOTIFY
-	{
-		.procname	= "fanotify",
-		.mode		= 0555,
-		.child		= fanotify_table,
-	},
-#endif
 #ifdef CONFIG_EPOLL
 	{
 		.procname	= "epoll",
-- 
2.33.0

