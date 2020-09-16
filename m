Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5226BA30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 04:30:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrkbG5xrHzDqLx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 12:30:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=liushixin2@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrkXr1C3yzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 12:28:08 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9B40F1EE6CC59AE4601;
 Wed, 16 Sep 2020 10:28:00 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 10:27:51 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH -next] powerpc/pseries: convert to use DEFINE_SEQ_ATTRIBUTE
 macro
Date: Wed, 16 Sep 2020 10:50:26 +0800
Message-ID: <20200916025026.3992835-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
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
Cc: Liu Shixin <liushixin2@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use DEFINE_SEQ_ATTRIBUTE macro to simplify the code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 arch/powerpc/platforms/pseries/hvCall_inst.c | 23 +++-----------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall_inst.c b/arch/powerpc/platforms/pseries/hvCall_inst.c
index c40c62ec432e..2c59b4986ea5 100644
--- a/arch/powerpc/platforms/pseries/hvCall_inst.c
+++ b/arch/powerpc/platforms/pseries/hvCall_inst.c
@@ -70,31 +70,14 @@ static int hc_show(struct seq_file *m, void *p)
 	return 0;
 }
 
-static const struct seq_operations hcall_inst_seq_ops = {
+static const struct seq_operations hcall_inst_sops = {
         .start = hc_start,
         .next  = hc_next,
         .stop  = hc_stop,
         .show  = hc_show
 };
 
-static int hcall_inst_seq_open(struct inode *inode, struct file *file)
-{
-	int rc;
-	struct seq_file *seq;
-
-	rc = seq_open(file, &hcall_inst_seq_ops);
-	seq = file->private_data;
-	seq->private = file_inode(file)->i_private;
-
-	return rc;
-}
-
-static const struct file_operations hcall_inst_seq_fops = {
-	.open = hcall_inst_seq_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = seq_release,
-};
+DEFINE_SEQ_ATTRIBUTE(hcall_inst);
 
 #define	HCALL_ROOT_DIR		"hcall_inst"
 #define CPU_NAME_BUF_SIZE	32
@@ -149,7 +132,7 @@ static int __init hcall_inst_init(void)
 		snprintf(cpu_name_buf, CPU_NAME_BUF_SIZE, "cpu%d", cpu);
 		debugfs_create_file(cpu_name_buf, 0444, hcall_root,
 				    per_cpu(hcall_stats, cpu),
-				    &hcall_inst_seq_fops);
+				    &hcall_inst_fops);
 	}
 
 	return 0;
-- 
2.25.1

