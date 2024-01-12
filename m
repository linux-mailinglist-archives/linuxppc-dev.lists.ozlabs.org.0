Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712F82BB0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 06:50:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB9c76GCsz3vcf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 16:50:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB9bg3fwfz2xWR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 16:49:49 +1100 (AEDT)
X-UUID: 42fd11a048c0454598ed9c6f7886c2d0-20240112
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:f4e44b7c-1c19-4d19-85ee-fa66e4fada47,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:20
X-CID-INFO: VERSION:1.1.35,REQID:f4e44b7c-1c19-4d19-85ee-fa66e4fada47,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:5d391d7,CLOUDID:9838162f-1ab8-4133-9780-81938111c800,B
	ulkID:240112134931J0V78QH9,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|66|1
	02,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 42fd11a048c0454598ed9c6f7886c2d0-20240112
X-User: chentao@kylinos.cn
Received: from kernel.. [(116.128.244.171)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1899038784; Fri, 12 Jan 2024 13:49:30 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	mpe@ellerman.id.au,
	mrochs@linux.vnet.ibm.com
Subject: [PATCH v2] cxl: Fix null pointer dereference in cxl_get_fd
Date: Fri, 12 Jan 2024 13:49:03 +0800
Message-Id: <20240112054903.133145-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>, Kunwu Chan <kunwu.chan@hotmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure.

Uniformly handle resource release in error paths. And when an
error occurs, an error pointer should be returned.

Fixes: bdecf76e319a ("cxl: Fix coredump generation when cxl_get_fd() is used")
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
Cc: Kunwu Chan <kunwu.chan@hotmail.com>
Suggested-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
v2: Deal with error path
---
 drivers/misc/cxl/api.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index d85c56530863..b49bc3d29fc0 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -389,19 +389,22 @@ struct file *cxl_get_fd(struct cxl_context *ctx, struct file_operations *fops,
 			int *fd)
 {
 	struct file *file;
-	int rc, flags, fdtmp;
+	int rc = 0, flags, fdtmp;
 	char *name = NULL;
 
 	/* only allow one per context */
-	if (ctx->mapping)
-		return ERR_PTR(-EEXIST);
+	if (ctx->mapping) {
+		rc = -EEXIST;
+		goto err;
+	}
 
 	flags = O_RDWR | O_CLOEXEC;
 
 	/* This code is similar to anon_inode_getfd() */
 	rc = get_unused_fd_flags(flags);
 	if (rc < 0)
-		return ERR_PTR(rc);
+		goto err;
+
 	fdtmp = rc;
 
 	/*
@@ -419,6 +422,10 @@ struct file *cxl_get_fd(struct cxl_context *ctx, struct file_operations *fops,
 		fops = (struct file_operations *)&afu_fops;
 
 	name = kasprintf(GFP_KERNEL, "cxl:%d", ctx->pe);
+	if (!name) {
+		rc = -ENOMEM;
+		goto err_fd;
+	}
 	file = cxl_getfile(name, fops, ctx, flags);
 	kfree(name);
 	if (IS_ERR(file))
@@ -430,6 +437,9 @@ struct file *cxl_get_fd(struct cxl_context *ctx, struct file_operations *fops,
 
 err_fd:
 	put_unused_fd(fdtmp);
+err:
+	if (rc < 0)
+		return ERR_PTR(rc);
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(cxl_get_fd);
-- 
2.39.2

