Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E67222068
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 12:17:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6qtw6b9SzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 20:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=miaoqinglang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 970 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Jul 2020 19:19:41 AEST
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6pcF251RzDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 19:19:37 +1000 (AEST)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C89E76DB5867427788A6;
 Thu, 16 Jul 2020 17:03:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Jul 2020 17:03:17 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Mackerras
 <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH -next] powerpc: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 16 Jul 2020 17:07:12 +0800
Message-ID: <20200716090712.14375-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 16 Jul 2020 20:14:51 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chen Huang <chenhuang5@huawei.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 arch/powerpc/kvm/book3s_xive_native.c  | 12 +-----------
 arch/powerpc/mm/ptdump/bats.c          | 24 +++++++-----------------
 arch/powerpc/mm/ptdump/hashpagetable.c | 12 +-----------
 arch/powerpc/mm/ptdump/ptdump.c        | 13 +------------
 arch/powerpc/mm/ptdump/segment_regs.c  | 12 +-----------
 5 files changed, 11 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 02e3cbbea..d0c2db0e0 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1227,17 +1227,7 @@ static int xive_native_debug_show(struct seq_file *m, void *private)
 	return 0;
 }
 
-static int xive_native_debug_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, xive_native_debug_show, inode->i_private);
-}
-
-static const struct file_operations xive_native_debug_fops = {
-	.open = xive_native_debug_open,
-	.read_iter = seq_read_iter,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(xive_native_debug);
 
 static void xive_native_debugfs_init(struct kvmppc_xive *xive)
 {
diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index 7afcdac48..93771af72 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -56,7 +56,7 @@ static void bat_show_601(struct seq_file *m, int idx, u32 lower, u32 upper)
 
 #define BAT_SHOW_601(_m, _n, _l, _u) bat_show_601(_m, _n, mfspr(_l), mfspr(_u))
 
-static int bats_show_601(struct seq_file *m, void *v)
+static int bats_601_show(struct seq_file *m, void *v)
 {
 	seq_puts(m, "---[ Block Address Translation ]---\n");
 
@@ -113,7 +113,7 @@ static void bat_show_603(struct seq_file *m, int idx, u32 lower, u32 upper, bool
 
 #define BAT_SHOW_603(_m, _n, _l, _u, _d) bat_show_603(_m, _n, mfspr(_l), mfspr(_u), _d)
 
-static int bats_show_603(struct seq_file *m, void *v)
+static int bats_603_show(struct seq_file *m, void *v)
 {
 	seq_puts(m, "---[ Instruction Block Address Translation ]---\n");
 
@@ -144,25 +144,15 @@ static int bats_show_603(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int bats_open(struct inode *inode, struct file *file)
-{
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
-		return single_open(file, bats_show_601, NULL);
-
-	return single_open(file, bats_show_603, NULL);
-}
-
-static const struct file_operations bats_fops = {
-	.open		= bats_open,
-	.read_iter		= seq_read_iter,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(bats_601);
+DEFINE_SHOW_ATTRIBUTE(bats_603);
 
 static int __init bats_init(void)
 {
 	debugfs_create_file("block_address_translation", 0400,
-			    powerpc_debugfs_root, NULL, &bats_fops);
+			    powerpc_debugfs_root, NULL,
+			    IS_ENABLED(CONFIG_PPC_BOOK3S_601) ?
+			    &bats_601_fops : &bats_603_fops);
 	return 0;
 }
 device_initcall(bats_init);
diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index 457fcee7e..c7f824d29 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -526,17 +526,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int ptdump_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, ptdump_show, NULL);
-}
-
-static const struct file_operations ptdump_fops = {
-	.open		= ptdump_open,
-	.read_iter		= seq_read_iter,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(ptdump);
 
 static int ptdump_init(void)
 {
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index db17e84b5..58b062f1b 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -398,18 +398,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-
-static int ptdump_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, ptdump_show, NULL);
-}
-
-static const struct file_operations ptdump_fops = {
-	.open		= ptdump_open,
-	.read_iter		= seq_read_iter,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(ptdump);
 
 static void build_pgtable_complete_mask(void)
 {
diff --git a/arch/powerpc/mm/ptdump/segment_regs.c b/arch/powerpc/mm/ptdump/segment_regs.c
index 8b15bad5a..9e870d44c 100644
--- a/arch/powerpc/mm/ptdump/segment_regs.c
+++ b/arch/powerpc/mm/ptdump/segment_regs.c
@@ -41,17 +41,7 @@ static int sr_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int sr_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, sr_show, NULL);
-}
-
-static const struct file_operations sr_fops = {
-	.open		= sr_open,
-	.read_iter		= seq_read_iter,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(sr);
 
 static int __init sr_init(void)
 {
-- 
2.17.1

