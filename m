Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B781E77C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:05:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YHFF0nLvzDqYd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 18:05:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.65; helo=mail-pj1-f65.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGj351hfzDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:27 +1000 (AEST)
Received: by mail-pj1-f65.google.com with SMTP id ci21so847509pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDbHuQyYpIA+NrKXcOMmKPCGJcWzsoGwYaKrbY/Qlik=;
 b=VWqA0uVxhc/ZjupIIY3itLe8lIfh+T3po8W67FM7WRURtU9sIkA8PK2UgU2EjdgFg8
 iCF3HXqjfh5ncunfke2JWgu4gz3kGD3lq8iAHQA9Sqcj55UDqfLbG2esA5JXCVtol8E6
 D0Av0V3lR/ONVttrfrmvhxxt71w/2XoQruKPfIBhmFLVssV435HbbZyqUnIV57ULes52
 zFHCIKpVbDygayc9F9Vwv1dgvgE5sduUcfUElOmpJ2m7sA+IBU6yjhupeg3HlLtCFwhv
 3qYKCGLjaVSNrklkxu3UATmjlvZHuv5mffrO4LQCUKIq5DnrVJryuFrSKeF9UwwPidw6
 k3pA==
X-Gm-Message-State: AOAM531BsGhYEonIXhtQCh2pj+6tmhWdmOCosEeTF9zzZIEHsrq6imd2
 VpvqxKEc3Qi4NZs9e2AfXrw=
X-Google-Smtp-Source: ABdhPJwGzuqDcH6Vkxqbl1C5ZMUAQstwFZ+JipZBre8wnuBfBUsU2v0rs/LBQURtmvm2RkRrx2hGlQ==
X-Received: by 2002:a17:90a:fe0c:: with SMTP id
 ck12mr973724pjb.209.1590738085315; 
 Fri, 29 May 2020 00:41:25 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id t201sm3703652pfc.104.2020.05.29.00.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 08CEC42394; Fri, 29 May 2020 07:41:11 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 12/13] sysctl: add helper to register empty subdir
Date: Fri, 29 May 2020 07:41:07 +0000
Message-Id: <20200529074108.16928-13-mcgrof@kernel.org>
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

The way to create a subdirectory from the base set of directories
is a bit obscure, so provide a helper which makes this clear, and
also helps remove boiler plate code required to do this work.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 include/linux/sysctl.h |  7 +++++++
 kernel/sysctl.c        | 16 +++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 33a471b56345..89c92390e6de 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -208,6 +208,8 @@ extern void register_sysctl_init(const char *path, struct ctl_table *table,
 extern struct ctl_table_header *register_sysctl_subdir(const char *base,
 						       const char *subdir,
 						       struct ctl_table *table);
+extern void register_sysctl_empty_subdir(const char *base, const char *subdir);
+
 void do_sysctl_args(void);
 
 extern int pwrsw_enabled;
@@ -231,6 +233,11 @@ inline struct ctl_table_header *register_sysctl_subdir(const char *base,
 	return NULL;
 }
 
+static inline void register_sysctl_empty_subdir(const char *base,
+						const char *subdir)
+{
+}
+
 static inline struct ctl_table_header *register_sysctl_paths(
 			const struct ctl_path *path, struct ctl_table *table)
 {
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index f9a35325d5d5..460532cd5ac8 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3188,13 +3188,17 @@ struct ctl_table_header *register_sysctl_subdir(const char *base,
 		{ }
 	};
 
-	if (!table->procname)
+	if (table != sysctl_mount_point && !table->procname)
 		goto out;
 
 	hdr = register_sysctl_table(base_table);
 	if (unlikely(!hdr)) {
-		pr_err("failed when creating subdirectory sysctl %s/%s/%s\n",
-		       base, subdir, table->procname);
+		if (table != sysctl_mount_point)
+			pr_err("failed when creating subdirectory sysctl %s/%s/%s\n",
+			       base, subdir, table->procname);
+		else
+			pr_err("failed when creating empty subddirectory %s/%s\n",
+			       base, subdir);
 		goto out;
 	}
 	kmemleak_not_leak(hdr);
@@ -3202,6 +3206,12 @@ struct ctl_table_header *register_sysctl_subdir(const char *base,
 	return hdr;
 }
 EXPORT_SYMBOL_GPL(register_sysctl_subdir);
+
+void register_sysctl_empty_subdir(const char *base,
+				  const char *subdir)
+{
+	register_sysctl_subdir(base, subdir, sysctl_mount_point);
+}
 #endif /* CONFIG_SYSCTL */
 /*
  * No sense putting this after each symbol definition, twice,
-- 
2.26.2

