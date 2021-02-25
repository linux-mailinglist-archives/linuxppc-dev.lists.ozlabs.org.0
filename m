Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ACB324C89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 10:13:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmRt20QqZz3cHx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 20:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.88.44.36;
 helo=out4436.biz.mail.alibaba.com; envelope-from=yang.lee@linux.alibaba.com;
 receiver=<UNKNOWN>)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmRsk2K8Zz30Ql
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 20:13:29 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0UPXPpzL_1614244379; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UPXPpzL_1614244379) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 25 Feb 2021 17:13:00 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Thu, 25 Feb 2021 17:12:58 +0800
Message-Id: <1614244378-63152-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following coccicheck warning:
./arch/powerpc/kernel/setup_64.c:1143:0-23: WARNING: fops_rfi_flush
should be defined with DEFINE_DEBUGFS_ATTRIBUTE
./arch/powerpc/kernel/setup_64.c:1169:0-23: WARNING: fops_entry_flush
should be defined with DEFINE_DEBUGFS_ATTRIBUTE
./arch/powerpc/kernel/setup_64.c:1195:0-23: WARNING: fops_uaccess_flush
should be defined with DEFINE_DEBUGFS_ATTRIBUTE
./arch/powerpc/platforms/powernv/memtrace.c:311:0-23: WARNING:
memtrace_init_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
./arch/powerpc/xmon/xmon.c:3997:0-23: WARNING: xmon_dbgfs_ops should be
defined with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/kernel/setup_64.c            | 6 +++---
 arch/powerpc/platforms/powernv/memtrace.c | 4 ++--
 arch/powerpc/xmon/xmon.c                  | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 560ed8b..6a030b0 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -1140,7 +1140,7 @@ static int rfi_flush_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
 
 static int entry_flush_set(void *data, u64 val)
 {
@@ -1166,7 +1166,7 @@ static int entry_flush_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_entry_flush, entry_flush_get, entry_flush_set, "%llu\n");
 
 static int uaccess_flush_set(void *data, u64 val)
 {
@@ -1192,7 +1192,7 @@ static int uaccess_flush_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_uaccess_flush, uaccess_flush_get, uaccess_flush_set, "%llu\n");
 
 static __init int rfi_flush_debugfs_init(void)
 {
diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 019669e..731be02 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -308,8 +308,8 @@ static int memtrace_enable_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(memtrace_init_fops, memtrace_enable_get,
-					memtrace_enable_set, "0x%016llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(memtrace_init_fops, memtrace_enable_get,
+			 memtrace_enable_set, "0x%016llx\n");
 
 static int memtrace_init(void)
 {
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3fe3749..6d54767 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3994,7 +3994,7 @@ static int xmon_dbgfs_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(xmon_dbgfs_ops, xmon_dbgfs_get,
+DEFINE_DEBUGFS_ATTRIBUTE(xmon_dbgfs_ops, xmon_dbgfs_get,
 			xmon_dbgfs_set, "%llu\n");
 
 static int __init setup_xmon_dbgfs(void)
-- 
1.8.3.1

