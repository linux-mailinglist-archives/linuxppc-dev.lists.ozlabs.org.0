Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F511E7793
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 09:59:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YH5l5kGNzDqcD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 17:59:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.193;
 helo=mail-pl1-f193.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGhz5cJmzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:23 +1000 (AEST)
Received: by mail-pl1-f193.google.com with SMTP id d3so773356pln.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EMTldmiu4HpdS3+bhynB06GHRs/PyLwICOClb2SLlV8=;
 b=gjS/j4Dardo0/UhHHdngBZiwbcQzg5DYxyALZYI0lkKOvV6g9cok3XZyzbqtwGBHPH
 shA3oV92kskOTx0g5hKGv2LWjOqKkkvuAn9ls2RwbUDzgPY1f9RuadeQRStLel502GKX
 7ruvR18RHn2stu4Yqd3ZleDCw7VrYp9yhNeaAKQJPkdMusZB2Iem9W6RrWkZsm6PG1hL
 A2jjvyOUA7qeVUabvpCIuxWaRTtgeEJaZoQwvkRpiTgWnGNlVQXCu1i3caKxIMcgvTqL
 kTx3a0PcSWe5lnKBHmeoAHz+wlkK1IR41+swFzK8aPOW6zxCojlwxIOjHabhNEMCz/2Q
 lntw==
X-Gm-Message-State: AOAM532lW31kS2uvWBHNeCL6BG3b0jMdd001z4Pe0wLABopThYCPJka0
 f313gdypXgY5lGEkfIDHfyo=
X-Google-Smtp-Source: ABdhPJw+tLCz0Ai55w1J/TSc/SJ1hmAb/QR0nXrNQObS7m5mw2Mpybr+mAQiJMcxaaq1sxYWrYa58A==
X-Received: by 2002:a17:902:7281:: with SMTP id
 d1mr7887571pll.78.1590738081442; 
 Fri, 29 May 2020 00:41:21 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id gd8sm101244pjb.28.2020.05.29.00.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id E7F0642380; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 10/13] eventpoll: simplify sysctl declaration with
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:05 +0000
Message-Id: <20200529074108.16928-11-mcgrof@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200529074108.16928-1-mcgrof@kernel.org>
References: <20200529074108.16928-1-mcgrof@kernel.org>
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
 dri-devel@lists.freedesktop.org, julia.lawall@lip6.fr,
 Luis Chamberlain <mcgrof@kernel.org>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiaoming Ni <nixiaoming@huawei.com>

Move epoll_table sysctl to fs/eventpoll.c and remove the
clutter out of kernel/sysctl.c by using register_sysctl_subdir()..

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/eventpoll.c         | 10 +++++++++-
 include/linux/poll.h   |  2 --
 include/linux/sysctl.h |  1 -
 kernel/sysctl.c        |  7 -------
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 12eebcdea9c8..957ebc9700e3 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -299,7 +299,7 @@ static LIST_HEAD(tfile_check_list);
 static long long_zero;
 static long long_max = LONG_MAX;
 
-struct ctl_table epoll_table[] = {
+static struct ctl_table epoll_table[] = {
 	{
 		.procname	= "max_user_watches",
 		.data		= &max_user_watches,
@@ -311,6 +311,13 @@ struct ctl_table epoll_table[] = {
 	},
 	{ }
 };
+
+static void __init epoll_sysctls_init(void)
+{
+	register_sysctl_subdir("fs", "epoll", epoll_table);
+}
+#else
+#define epoll_sysctls_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
 static const struct file_operations eventpoll_fops;
@@ -2422,6 +2429,7 @@ static int __init eventpoll_init(void)
 	/* Allocates slab cache used to allocate "struct eppoll_entry" */
 	pwq_cache = kmem_cache_create("eventpoll_pwq",
 		sizeof(struct eppoll_entry), 0, SLAB_PANIC|SLAB_ACCOUNT, NULL);
+	epoll_sysctls_init();
 
 	return 0;
 }
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
index aa01f54d0442..e5364b69dd95 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -217,7 +217,6 @@ extern int no_unaligned_warning;
 
 extern struct ctl_table sysctl_mount_point[];
 extern struct ctl_table random_table[];
-extern struct ctl_table epoll_table[];
 
 #else /* CONFIG_SYSCTL */
 static inline struct ctl_table_header *register_sysctl_table(struct ctl_table * table)
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index e007375c8a11..5c116904feb7 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3001,13 +3001,6 @@ static struct ctl_table fs_table[] = {
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
2.26.2

