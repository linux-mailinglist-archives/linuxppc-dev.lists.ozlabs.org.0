Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 952E2D5FE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 12:18:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sDzZ5fgzzDqlF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 21:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NvF+Mthu"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sDxY04ZRzDqhN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 21:16:47 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEDF6206A3;
 Mon, 14 Oct 2019 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571048205;
 bh=HvxC/CtHDl0P6TKWd5+t40HL3OMhJyXpqKMzr7RI3qM=;
 h=Date:From:To:Cc:Subject:From;
 b=NvF+Mthu1tt9Fp9xaXLNy+BBv8lyWroNWIPGfy1sA/zKIk2+PfeB5pAbgLVbwQPED
 rRDlxw9T8xtpNJfKsn1I898F/6Diu+MnhrfZp0LiiWHZrqo8Lm9N+3G3YjKX10u/W9
 ZS4Bx5puyAKi4Wz5fnNoWtf1WOrI9Oa7QzeVmATg=
Date: Mon, 14 Oct 2019 12:16:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH] powerpc: pseries: no need to check return value of
 debugfs_create functions
Message-ID: <20191014101642.GA30179@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Note, I can take this in my driver-core tree as I have some later
debugfs core cleanups that depend on this, if no one objects.

thanks,

greg k-h

 arch/powerpc/platforms/pseries/dtl.c         | 38 ++++----------------
 arch/powerpc/platforms/pseries/hvCall_inst.c | 12 ++-----
 arch/powerpc/platforms/pseries/lpar.c        | 15 +-------
 3 files changed, 10 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 2b87480f2837..eab8aa293743 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -19,7 +19,6 @@
 
 struct dtl {
 	struct dtl_entry	*buf;
-	struct dentry		*file;
 	int			cpu;
 	int			buf_entries;
 	u64			last_idx;
@@ -320,46 +319,28 @@ static const struct file_operations dtl_fops = {
 
 static struct dentry *dtl_dir;
 
-static int dtl_setup_file(struct dtl *dtl)
+static void dtl_setup_file(struct dtl *dtl)
 {
 	char name[10];
 
 	sprintf(name, "cpu-%d", dtl->cpu);
 
-	dtl->file = debugfs_create_file(name, 0400, dtl_dir, dtl, &dtl_fops);
-	if (!dtl->file)
-		return -ENOMEM;
-
-	return 0;
+	debugfs_create_file(name, 0400, dtl_dir, dtl, &dtl_fops);
 }
 
 static int dtl_init(void)
 {
-	struct dentry *event_mask_file, *buf_entries_file;
-	int rc, i;
+	int i;
 
 	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
 		return -ENODEV;
 
 	/* set up common debugfs structure */
 
-	rc = -ENOMEM;
 	dtl_dir = debugfs_create_dir("dtl", powerpc_debugfs_root);
-	if (!dtl_dir) {
-		printk(KERN_WARNING "%s: can't create dtl root dir\n",
-				__func__);
-		goto err;
-	}
 
-	event_mask_file = debugfs_create_x8("dtl_event_mask", 0600,
-				dtl_dir, &dtl_event_mask);
-	buf_entries_file = debugfs_create_u32("dtl_buf_entries", 0400,
-				dtl_dir, &dtl_buf_entries);
-
-	if (!event_mask_file || !buf_entries_file) {
-		printk(KERN_WARNING "%s: can't create dtl files\n", __func__);
-		goto err_remove_dir;
-	}
+	debugfs_create_x8("dtl_event_mask", 0600, dtl_dir, &dtl_event_mask);
+	debugfs_create_u32("dtl_buf_entries", 0400, dtl_dir, &dtl_buf_entries);
 
 	/* set up the per-cpu log structures */
 	for_each_possible_cpu(i) {
@@ -367,16 +348,9 @@ static int dtl_init(void)
 		spin_lock_init(&dtl->lock);
 		dtl->cpu = i;
 
-		rc = dtl_setup_file(dtl);
-		if (rc)
-			goto err_remove_dir;
+		dtl_setup_file(dtl);
 	}
 
 	return 0;
-
-err_remove_dir:
-	debugfs_remove_recursive(dtl_dir);
-err:
-	return rc;
 }
 machine_arch_initcall(pseries, dtl_init);
diff --git a/arch/powerpc/platforms/pseries/hvCall_inst.c b/arch/powerpc/platforms/pseries/hvCall_inst.c
index bcc1b67417a8..c40c62ec432e 100644
--- a/arch/powerpc/platforms/pseries/hvCall_inst.c
+++ b/arch/powerpc/platforms/pseries/hvCall_inst.c
@@ -129,7 +129,6 @@ static void probe_hcall_exit(void *ignored, unsigned long opcode, long retval,
 static int __init hcall_inst_init(void)
 {
 	struct dentry *hcall_root;
-	struct dentry *hcall_file;
 	char cpu_name_buf[CPU_NAME_BUF_SIZE];
 	int cpu;
 
@@ -145,17 +144,12 @@ static int __init hcall_inst_init(void)
 	}
 
 	hcall_root = debugfs_create_dir(HCALL_ROOT_DIR, NULL);
-	if (!hcall_root)
-		return -ENOMEM;
 
 	for_each_possible_cpu(cpu) {
 		snprintf(cpu_name_buf, CPU_NAME_BUF_SIZE, "cpu%d", cpu);
-		hcall_file = debugfs_create_file(cpu_name_buf, 0444,
-						 hcall_root,
-						 per_cpu(hcall_stats, cpu),
-						 &hcall_inst_seq_fops);
-		if (!hcall_file)
-			return -ENOMEM;
+		debugfs_create_file(cpu_name_buf, 0444, hcall_root,
+				    per_cpu(hcall_stats, cpu),
+				    &hcall_inst_seq_fops);
 	}
 
 	return 0;
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index b53359258d99..284b2eb4a669 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1995,24 +1995,11 @@ static int __init vpa_debugfs_init(void)
 		return 0;
 
 	vpa_dir = debugfs_create_dir("vpa", powerpc_debugfs_root);
-	if (!vpa_dir) {
-		pr_warn("%s: can't create vpa root dir\n", __func__);
-		return -ENOMEM;
-	}
 
 	/* set up the per-cpu vpa file*/
 	for_each_possible_cpu(i) {
-		struct dentry *d;
-
 		sprintf(name, "cpu-%ld", i);
-
-		d = debugfs_create_file(name, 0400, vpa_dir, (void *)i,
-					&vpa_fops);
-		if (!d) {
-			pr_warn("%s: can't create per-cpu vpa file\n",
-					__func__);
-			return -ENOMEM;
-		}
+		debugfs_create_file(name, 0400, vpa_dir, (void *)i, &vpa_fops);
 	}
 
 	return 0;
-- 
2.23.0

