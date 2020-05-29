Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B41E7787
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 09:55:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YH1f0g3SzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 17:55:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.196;
 helo=mail-pg1-f196.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGhy2JH4zDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:22 +1000 (AEST)
Received: by mail-pg1-f196.google.com with SMTP id o6so191112pgh.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gyi+SSBMYaz8TR5pIeizC0x+opRDWqonQ2PbJtJFBcU=;
 b=hF9Zqoy/iTgVF6pOAoEQC+aC0craTW/GvM8V1DWHXK+SHfIlEc0Od/id/k2dYww4Ls
 sCPQ8AuFgxxu9+Xq9pdCRRrIkm3d7tA2Q3pyaJzTstwHBJP/LU1NJwkA7ijm+pVfSlF3
 wrnZmkXHhgVsqlhEIJKZJxUIc2cP2HfQbT5hH438gsvPuL99J/GvZrqSloXMWqkEblxW
 zgDZkAmbluwdwSqFYBgsuArssp6yIezzYSz2vsfhBEYIED7d26DKqFwuCeDhMhTg8RQ0
 sfWZFMRzsvClTZNl5fSV29HvpNoPxShS3Z6c0e0K5jdU0SklqMAuSH193wTLOf/X9DJJ
 1rNA==
X-Gm-Message-State: AOAM531WFM2GmJ9QYZ6t+R4fIcIJmezyOLbmrnPPpzzv9bjR8U86PBYE
 A1muxcM+R7b6Z+Ur552T2do=
X-Google-Smtp-Source: ABdhPJx56643L02wDwth5rceoeGJdrDM09GlBME9Pg+5yDtZkMeY7H83kJ7EluZRQYSUUOaPNTyILA==
X-Received: by 2002:aa7:9510:: with SMTP id b16mr7400994pfp.265.1590738079523; 
 Fri, 29 May 2020 00:41:19 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id s63sm7735409pjj.16.2020.05.29.00.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id D3A3042349; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 08/13] inotify: simplify sysctl declaration with
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:03 +0000
Message-Id: <20200529074108.16928-9-mcgrof@kernel.org>
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

move inotify_user sysctl to inotify_user.c and use the new
register_sysctl_subdir() helper.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/notify/inotify/inotify_user.c | 11 ++++++++++-
 include/linux/inotify.h          |  3 ---
 kernel/sysctl.c                  | 11 -----------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
index f88bbcc9efeb..64859fbf8463 100644
--- a/fs/notify/inotify/inotify_user.c
+++ b/fs/notify/inotify/inotify_user.c
@@ -46,7 +46,7 @@ struct kmem_cache *inotify_inode_mark_cachep __read_mostly;
 
 #include <linux/sysctl.h>
 
-struct ctl_table inotify_table[] = {
+static struct ctl_table inotify_table[] = {
 	{
 		.procname	= "max_user_instances",
 		.data		= &init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES],
@@ -73,6 +73,14 @@ struct ctl_table inotify_table[] = {
 	},
 	{ }
 };
+
+static void __init inotify_sysctls_init(void)
+{
+	register_sysctl_subdir("fs", "inotify", inotify_table);
+}
+
+#else
+#define inotify_sysctls_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
 static inline __u32 inotify_arg_to_mask(u32 arg)
@@ -826,6 +834,7 @@ static int __init inotify_user_setup(void)
 	inotify_max_queued_events = 16384;
 	init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES] = 128;
 	init_user_ns.ucount_max[UCOUNT_INOTIFY_WATCHES] = 8192;
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
index 04ff032f2863..30c2d521502a 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -123,10 +123,6 @@ static const int maxolduid = 65535;
 static int ngroups_max = NGROUPS_MAX;
 static const int cap_last_cap = CAP_LAST_CAP;
 
-#ifdef CONFIG_INOTIFY_USER
-#include <linux/inotify.h>
-#endif
-
 #ifdef CONFIG_PROC_SYSCTL
 
 /**
@@ -3012,13 +3008,6 @@ static struct ctl_table fs_table[] = {
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
 #ifdef CONFIG_EPOLL
 	{
 		.procname	= "epoll",
-- 
2.26.2

