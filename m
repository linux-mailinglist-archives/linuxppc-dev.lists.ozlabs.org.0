Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1842A1E7750
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 09:45:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YGnl2WFJzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 17:45:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.66; helo=mail-pj1-f66.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGht5grczDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:18 +1000 (AEST)
Received: by mail-pj1-f66.google.com with SMTP id n15so826544pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2jHA8VIMvKgrxc1AW+DPbkuZZuKskUQcNv9lMPkimBs=;
 b=aG96GcT+VUiri8TIypfXyPOwZnynbGA8fAQCnrQkMPDtjr+8VP/vcBcm/1uUrig8hr
 oM+4T0lgE7Y6vVPbMCBLFERtcJUeeZQL0GO67SoHcwr5MmfYs9ckOpZHPmQfKCb94f0O
 R5JB1bcjP3iZey+5+R5I/vxEsuJJLbqej28rEQRC4HsinfYtSGAvQQ/Aq6iDAdHT4Agl
 3mOFMKybHqjCh19M3hxLokEhAxjIHZ+KK0vaYb3sOkMvzTNCB5NHk3jAMWAugdsUcnXj
 LjudufW5XMEfJNnEsKoliVm1HHgRe4EjO06tUoIgvH+pJuAYqCHbSuEON6AN37XuFCNR
 yfCQ==
X-Gm-Message-State: AOAM532psRmQKIv5T4MlkaRhdJNc9rHkUUkYcM3wPGqKKJxHHev/WBZD
 K3wzJndpDvm3oV+sgfwnZeg=
X-Google-Smtp-Source: ABdhPJwLKp4Ek16GIR6wfTGzoNi9sGCN2B5VA54FGeDyqorTPtnWjcRjvN0kcQMGbXM4anhxYRPvyw==
X-Received: by 2002:a17:90a:b011:: with SMTP id
 x17mr8088274pjq.175.1590738075444; 
 Fri, 29 May 2020 00:41:15 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id a7sm6765760pfa.187.2020.05.29.00.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 67FA942309; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 03/13] hpet: use new sysctl subdir helper
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:40:58 +0000
Message-Id: <20200529074108.16928-4-mcgrof@kernel.org>
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

This simplifies the code considerably. The following coccinelle
SmPL grammar rule was used to transform this code.

// pycocci sysctl-subdir.cocci drivers/char/hpet.c

@c1@
expression E1;
identifier subdir, sysctls;
@@

static struct ctl_table subdir[] = {
	{
		.procname = E1,
		.maxlen = 0,
		.mode = 0555,
		.child = sysctls,
	},
	{ }
};

@c2@
identifier c1.subdir;

expression E2;
identifier base;
@@

static struct ctl_table base[] = {
	{
		.procname = E2,
		.maxlen = 0,
		.mode = 0555,
		.child = subdir,
	},
	{ }
};

@c3@
identifier c2.base;
identifier header;
@@

header = register_sysctl_table(base);

@r1 depends on c1 && c2 && c3@
expression c1.E1;
identifier c1.subdir, c1.sysctls;
@@

-static struct ctl_table subdir[] = {
-	{
-		.procname = E1,
-		.maxlen = 0,
-		.mode = 0555,
-		.child = sysctls,
-	},
-	{ }
-};

@r2 depends on c1 && c2 && c3@
identifier c1.subdir;

expression c2.E2;
identifier c2.base;
@@
-static struct ctl_table base[] = {
-	{
-		.procname = E2,
-		.maxlen = 0,
-		.mode = 0555,
-		.child = subdir,
-	},
-	{ }
-};

@r3 depends on c1 && c2 && c3@
expression c1.E1;
identifier c1.sysctls;
expression c2.E2;
identifier c2.base;
identifier c3.header;
@@

header =
-register_sysctl_table(base);
+register_sysctl_subdir(E2, E1, sysctls);

Generated-by: Coccinelle SmPL

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/char/hpet.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index ed3b7dab678d..169c970d5ff8 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -746,26 +746,6 @@ static struct ctl_table hpet_table[] = {
 	{}
 };
 
-static struct ctl_table hpet_root[] = {
-	{
-	 .procname = "hpet",
-	 .maxlen = 0,
-	 .mode = 0555,
-	 .child = hpet_table,
-	 },
-	{}
-};
-
-static struct ctl_table dev_root[] = {
-	{
-	 .procname = "dev",
-	 .maxlen = 0,
-	 .mode = 0555,
-	 .child = hpet_root,
-	 },
-	{}
-};
-
 static struct ctl_table_header *sysctl_header;
 
 /*
@@ -1059,7 +1039,7 @@ static int __init hpet_init(void)
 	if (result < 0)
 		return -ENODEV;
 
-	sysctl_header = register_sysctl_table(dev_root);
+	sysctl_header = register_sysctl_subdir("dev", "hpet", hpet_table);
 
 	result = acpi_bus_register_driver(&hpet_acpi_driver);
 	if (result < 0) {
-- 
2.26.2

