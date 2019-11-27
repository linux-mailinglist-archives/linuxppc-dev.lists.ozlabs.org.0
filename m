Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C110C009
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 23:12:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NZlN478ZzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 09:12:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NZhJ6bqkzDqx1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 09:10:07 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 395CFB3DC;
 Wed, 27 Nov 2019 22:10:03 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: add link stack flush mitigation status in debugfs.
Date: Wed, 27 Nov 2019 23:09:59 +0100
Message-Id: <20191127220959.6208-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Anthony Steinhauser <asteinhauser@google.com>,
 "Gustavo L. F. Walbon" <gwalbon@linux.ibm.com>,
 "Christopher M. Riedl" <cmr@informatik.wtf>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Diana Craciun <diana.craciun@nxp.com>, Paul Mackerras <paulus@samba.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The link stack flush status is not visible in debugfs. It can be enabled
even when count cache flush is disabled. Add separate file for its
status.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/kernel/security.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 7d4b2080a658..56dce4798a4d 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -446,14 +446,26 @@ static int count_cache_flush_get(void *data, u64 *val)
 	return 0;
 }
 
+static int link_stack_flush_get(void *data, u64 *val)
+{
+	*val = link_stack_flush_enabled;
+
+	return 0;
+}
+
 DEFINE_DEBUGFS_ATTRIBUTE(fops_count_cache_flush, count_cache_flush_get,
 			 count_cache_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_link_stack_flush, link_stack_flush_get,
+			 count_cache_flush_set, "%llu\n");
 
 static __init int count_cache_flush_debugfs_init(void)
 {
 	debugfs_create_file_unsafe("count_cache_flush", 0600,
 				   powerpc_debugfs_root, NULL,
 				   &fops_count_cache_flush);
+	debugfs_create_file_unsafe("link_stack_flush", 0600,
+				   powerpc_debugfs_root, NULL,
+				   &fops_link_stack_flush);
 	return 0;
 }
 device_initcall(count_cache_flush_debugfs_init);
-- 
2.23.0

