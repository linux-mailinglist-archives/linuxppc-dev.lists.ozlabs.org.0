Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A41E7777
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 09:52:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YGy50YsczDqcF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 17:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.68; helo=mail-pj1-f68.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGhw1Cr5zDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:16 +1000 (AEST)
Received: by mail-pj1-f68.google.com with SMTP id z15so2903021pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztkbZyMAj8QAP+BJLtRR/lmTCR2M8J8E3LJknwjviqU=;
 b=sPIfjg4i6A+5Hz8tOb/6TxyLFY3vQwH6VR6K2yPKBpAvVwUty/2RHkdErtrz/RvuTy
 T3K0kSCLAS27etIlOEP29/bvCxM/G5UXEP1Xr0O4JrEK9KoLi92mRD7pkOiRtJ8itCB+
 VoeAzzHkFMjL8E9gu2h3HqkDLAkslI+8eJYIKIddWcQdbDi8BKCKRDYaviOLaQ2yRiso
 awUKHLcF9/Mpc9PUL20CQnaoPiQ0i61V20r78zdytBD3QYumpBUkodBcWOA8IrRRIPQC
 LIF9oxfi+bBCMbp2ELIeTD0MaQEnSJopE1FZU6bEfEbg5euDLiXBl2ybT9HUsjSPw7RD
 fgXg==
X-Gm-Message-State: AOAM532ChG6CVUbggDU5fFGrqTpPXCXk/KQnGus78Wkm2uhJcLMnaEwA
 ZK394s0FezouzuwzSbgRHBk=
X-Google-Smtp-Source: ABdhPJwef9VnxevTutof/OWjXxMen8nqP316VSHb8lndoYqWe0y1ALBADBIyXeEXdBPr/HgBfKduig==
X-Received: by 2002:a17:902:bd95:: with SMTP id
 q21mr7959305pls.238.1590738074446; 
 Fri, 29 May 2020 00:41:14 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id e26sm6189878pgl.27.2020.05.29.00.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 10D65418C0; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 01/13] sysctl: add new register_sysctl_subdir() helper
Date: Fri, 29 May 2020 07:40:56 +0000
Message-Id: <20200529074108.16928-2-mcgrof@kernel.org>
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

Often enough all we need to do is create a subdirectory so that
we can stuff sysctls underneath it. However, *if* that directory
was already created early on the boot sequence we really have no
need to use the full boiler plate code for it, we can just use
local variables to help us guide sysctl to place the new leaf files.

So use a helper to do precisely this.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 include/linux/sysctl.h | 11 +++++++++++
 kernel/sysctl.c        | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index ddaa06ddd852..58bc978d4f03 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -205,6 +205,9 @@ void unregister_sysctl_table(struct ctl_table_header * table);
 extern int sysctl_init(void);
 extern void register_sysctl_init(const char *path, struct ctl_table *table,
 				 const char *table_name);
+extern struct ctl_table_header *register_sysctl_subdir(const char *base,
+						       const char *subdir,
+						       struct ctl_table *table);
 void do_sysctl_args(void);
 
 extern int pwrsw_enabled;
@@ -223,6 +226,14 @@ static inline struct ctl_table_header *register_sysctl_table(struct ctl_table *
 	return NULL;
 }
 
+static
+inline struct ctl_table_header *register_sysctl_subdir(const char *base,
+						       const char *subdir,
+						       struct ctl_table *table)
+{
+	return NULL;
+}
+
 static inline struct ctl_table_header *register_sysctl_paths(
 			const struct ctl_path *path, struct ctl_table *table)
 {
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 008ac0576ae5..04ff032f2863 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3195,6 +3195,43 @@ void __init register_sysctl_init(const char *path, struct ctl_table *table,
 	}
 	kmemleak_not_leak(hdr);
 }
+
+struct ctl_table_header *register_sysctl_subdir(const char *base,
+						const char *subdir,
+						struct ctl_table *table)
+{
+	struct ctl_table_header *hdr = NULL;
+	struct ctl_table subdir_table[] = {
+		{
+			.procname	= subdir,
+			.mode		= 0555,
+			.child		= table,
+		},
+		{ }
+	};
+	struct ctl_table base_table[] = {
+		{
+			.procname	= base,
+			.mode		= 0555,
+			.child		= subdir_table,
+		},
+		{ }
+	};
+
+	if (!table->procname)
+		goto out;
+
+	hdr = register_sysctl_table(base_table);
+	if (unlikely(!hdr)) {
+		pr_err("failed when creating subdirectory sysctl %s/%s/%s\n",
+		       base, subdir, table->procname);
+		goto out;
+	}
+	kmemleak_not_leak(hdr);
+out:
+	return hdr;
+}
+EXPORT_SYMBOL_GPL(register_sysctl_subdir);
 #endif /* CONFIG_SYSCTL */
 /*
  * No sense putting this after each symbol definition, twice,
-- 
2.26.2

