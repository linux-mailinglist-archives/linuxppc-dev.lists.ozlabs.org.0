Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA61E77E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:08:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YHHk05h2zDqQK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 18:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.194;
 helo=mail-pl1-f194.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YGj53gPnzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 17:41:29 +1000 (AEST)
Received: by mail-pl1-f194.google.com with SMTP id bg4so769496plb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PG5LVb0n4wOO6VZREoyBILeBAzco+IYNIeDXsX/FzY=;
 b=muphc/mQGInyCUs2b6poZSsAjniKhRWteZLUvdNzAmuAh26XoYcqQdt/RVjpzLtxmq
 B73QwJM8zYeEcq9KZwyq23aluvFVKdvSlSbnlAVg9zHB0S1HOn4djVQjsAXtAgxn7qx7
 7nPzUUUAv4X++Qf+4NQx0a32b/vvdWmpfDnjqXtt9ifV/H03WFq0cramrF221+blhacq
 O4kTQtxwAh0qRnVVeiAHzdh/+teGpz/IAbVZVdp18g/FNpv45cbYYicUI/BdxAiraEm6
 SCQiIoowLBC3RBqaYx6QZME6NZC675BDhaK3625lDCTlPbcmpESBhNBvYaBe2Ccx5AEE
 ZPcw==
X-Gm-Message-State: AOAM531PXInEGp9FuSNEzvmH7uGeaazylpDwFTzsp1CT47tFgAneGRW4
 AeV22t4UjBbk1WEZNTFrvUA=
X-Google-Smtp-Source: ABdhPJxM98lxrupu0HzIVHkaILQ2GJoC5HA3ATmBk5nOeI56XgjTlxA112dIBe6io3Hl67zR6z+BjQ==
X-Received: by 2002:a17:90a:db0c:: with SMTP id
 g12mr7872171pjv.5.1590738086768; 
 Fri, 29 May 2020 00:41:26 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id q21sm919935pfn.209.2020.05.29.00.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:25 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 13BC8423BF; Fri, 29 May 2020 07:41:11 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 13/13] fs: move binfmt_misc sysctl to its own file
Date: Fri, 29 May 2020 07:41:08 +0000
Message-Id: <20200529074108.16928-14-mcgrof@kernel.org>
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

This moves the binfmt_misc sysctl to its own file to help remove
clutter from kernel/sysctl.c.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/binfmt_misc.c | 1 +
 kernel/sysctl.c  | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index f69a043f562b..656b3f5f3bbf 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -821,6 +821,7 @@ static int __init init_misc_binfmt(void)
 	int err = register_filesystem(&bm_fs_type);
 	if (!err)
 		insert_binfmt(&misc_format);
+	register_sysctl_empty_subdir("fs", "binfmt_misc");
 	return err;
 }
 
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 460532cd5ac8..7714e7b476c2 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3042,13 +3042,6 @@ static struct ctl_table fs_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_TWO,
 	},
-#if defined(CONFIG_BINFMT_MISC) || defined(CONFIG_BINFMT_MISC_MODULE)
-	{
-		.procname	= "binfmt_misc",
-		.mode		= 0555,
-		.child		= sysctl_mount_point,
-	},
-#endif
 	{
 		.procname	= "pipe-max-size",
 		.data		= &pipe_max_size,
-- 
2.26.2

