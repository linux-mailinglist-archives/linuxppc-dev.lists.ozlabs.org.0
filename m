Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BAB1E77B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:03:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YHBt5M3szDqdl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 18:03:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.67; helo=mail-pj1-f67.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGj1364pzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:25 +1000 (AEST)
Received: by mail-pj1-f67.google.com with SMTP id t8so827091pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeMaeWf8ySHfvuEzWncwhX9a4D5s1xQoEDO3/r/aYzY=;
 b=txYYxCBwESHs0hIpJsyBG/0fPKQRpxQxLmXInu1R6lrfcr/yFySwE/ScVJN+ABQdhw
 1GsOltM68eKGCujQDFSn6T9VfJv8z0LEAY361Z/+sW8VFFJU/maTcVHmLZ2eMsO8gR5b
 J8c7a1rRk2Zaj+SFkiNy9S9QmsJHhXIaxrJ+Mw463ln4VET1QObL7vnupps003aeJY3G
 z/wCxWhnNge+4ySlTEmm3RR7s1Hfagiry2tXqaEJdy2FPAyHOENa8jpW2NfB2Jrg+LSw
 9/tUYwrpp+qo0okTjTuvqc7/QuoVZi4sKUTfNaJQPMjVU/GUpwx8OoP4yNclSw+pVq0S
 qi2Q==
X-Gm-Message-State: AOAM532+bKI3kCaYHpmsfeCKadwuDjLb2CbTBAlAgvQZza34eKwuN7DG
 bjirhKZpPWLtbbirZYrCWKY=
X-Google-Smtp-Source: ABdhPJyZTqVeXpnC780yNsYcAysPbnmEI2o7s7rzYFo+LKi1oKtcOEgW9W/Zd68h1pyiVT90AxPOjw==
X-Received: by 2002:a17:90a:2807:: with SMTP id e7mr7981405pjd.6.1590738083514; 
 Fri, 29 May 2020 00:41:23 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id jx10sm6903511pjb.46.2020.05.29.00.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id DDE9C42376; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 09/13] firmware_loader: simplify sysctl declaration with
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:04 +0000
Message-Id: <20200529074108.16928-10-mcgrof@kernel.org>
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

Move the firmware config sysctl table to fallback_table.c and use the
new register_sysctl_subdir() helper. This removes the clutter from
kernel/sysctl.c.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/base/firmware_loader/fallback.c       |  4 ++++
 drivers/base/firmware_loader/fallback.h       | 11 ++++++++++
 drivers/base/firmware_loader/fallback_table.c | 22 +++++++++++++++++--
 include/linux/sysctl.h                        |  1 -
 kernel/sysctl.c                               |  7 ------
 5 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index d9ac7296205e..8190653ae9a3 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -200,12 +200,16 @@ static struct class firmware_class = {
 
 int register_sysfs_loader(void)
 {
+	int ret = register_firmware_config_sysctl();
+	if (ret != 0)
+		return ret;
 	return class_register(&firmware_class);
 }
 
 void unregister_sysfs_loader(void)
 {
 	class_unregister(&firmware_class);
+	unregister_firmware_config_sysctl();
 }
 
 static ssize_t firmware_loading_show(struct device *dev,
diff --git a/drivers/base/firmware_loader/fallback.h b/drivers/base/firmware_loader/fallback.h
index 06f4577733a8..7d2cb5f6ceb8 100644
--- a/drivers/base/firmware_loader/fallback.h
+++ b/drivers/base/firmware_loader/fallback.h
@@ -42,6 +42,17 @@ void fw_fallback_set_default_timeout(void);
 
 int register_sysfs_loader(void);
 void unregister_sysfs_loader(void);
+#ifdef CONFIG_SYSCTL
+extern int register_firmware_config_sysctl(void);
+extern void unregister_firmware_config_sysctl(void);
+#else
+static inline int register_firmware_config_sysctl(void)
+{
+	return 0;
+}
+static inline void unregister_firmware_config_sysctl(void) { }
+#endif /* CONFIG_SYSCTL */
+
 #else /* CONFIG_FW_LOADER_USER_HELPER */
 static inline int firmware_fallback_sysfs(struct firmware *fw, const char *name,
 					  struct device *device,
diff --git a/drivers/base/firmware_loader/fallback_table.c b/drivers/base/firmware_loader/fallback_table.c
index 46a731dede6f..4234aa5ee5df 100644
--- a/drivers/base/firmware_loader/fallback_table.c
+++ b/drivers/base/firmware_loader/fallback_table.c
@@ -24,7 +24,7 @@ struct firmware_fallback_config fw_fallback_config = {
 EXPORT_SYMBOL_NS_GPL(fw_fallback_config, FIRMWARE_LOADER_PRIVATE);
 
 #ifdef CONFIG_SYSCTL
-struct ctl_table firmware_config_table[] = {
+static struct ctl_table firmware_config_table[] = {
 	{
 		.procname	= "force_sysfs_fallback",
 		.data		= &fw_fallback_config.force_sysfs_fallback,
@@ -45,4 +45,22 @@ struct ctl_table firmware_config_table[] = {
 	},
 	{ }
 };
-#endif
+
+static struct ctl_table_header *hdr;
+int register_firmware_config_sysctl(void)
+{
+	if (hdr)
+		return -EEXIST;
+	hdr = register_sysctl_subdir("kernel", "firmware_config",
+				     firmware_config_table);
+	if (!hdr)
+		return -ENOMEM;
+	return 0;
+}
+
+void unregister_firmware_config_sysctl(void)
+{
+	if (hdr)
+		unregister_sysctl_table(hdr);
+}
+#endif /* CONFIG_SYSCTL */
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 58bc978d4f03..aa01f54d0442 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -217,7 +217,6 @@ extern int no_unaligned_warning;
 
 extern struct ctl_table sysctl_mount_point[];
 extern struct ctl_table random_table[];
-extern struct ctl_table firmware_config_table[];
 extern struct ctl_table epoll_table[];
 
 #else /* CONFIG_SYSCTL */
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 30c2d521502a..e007375c8a11 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2088,13 +2088,6 @@ static struct ctl_table kern_table[] = {
 		.mode		= 0555,
 		.child		= usermodehelper_table,
 	},
-#ifdef CONFIG_FW_LOADER_USER_HELPER
-	{
-		.procname	= "firmware_config",
-		.mode		= 0555,
-		.child		= firmware_config_table,
-	},
-#endif
 	{
 		.procname	= "overflowuid",
 		.data		= &overflowuid,
-- 
2.26.2

