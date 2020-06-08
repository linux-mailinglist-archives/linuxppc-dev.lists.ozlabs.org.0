Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113A1F28E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 01:57:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gqts168mzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:57:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JwD3Vluw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gqCs6m71zDqSN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 09:27:21 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 062972078D;
 Mon,  8 Jun 2020 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658839;
 bh=p64kvqwdHjvutBUyLKF79Z35nfL8WtrSF/yQ7hkXSUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JwD3Vluw56S2UsLNgbawsF4NalKa+IfKTS5QIPLfzLgPHJT8E8/4fgMhrII14DDPm
 3zzlk5Hy71TPlxDhmgL62JkfQMw9gldBiNGR+NzcgZhfsUsdUQtZ/D/qlaN8UhreO5
 onLRjmLV1LZlJSkRlt4g0v2zgZZbaFsd8E/+cs3U=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 29/50] powerpc/spufs: fix copy_to_user while atomic
Date: Mon,  8 Jun 2020 19:26:19 -0400
Message-Id: <20200608232640.3370262-29-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608232640.3370262-1-sashal@kernel.org>
References: <20200608232640.3370262-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Al Viro <viro@zeniv.linux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jeremy Kerr <jk@ozlabs.org>

[ Upstream commit 88413a6bfbbe2f648df399b62f85c934460b7a4d ]

Currently, we may perform a copy_to_user (through
simple_read_from_buffer()) while holding a context's register_lock,
while accessing the context save area.

This change uses a temporary buffer for the context save area data,
which we then pass to simple_read_from_buffer.

Includes changes from Christoph Hellwig <hch@lst.de>.

Fixes: bf1ab978be23 ("[POWERPC] coredump: Add SPU elf notes to coredump.")
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
[hch: renamed to function to avoid ___-prefixes]
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/cell/spufs/file.c | 113 +++++++++++++++--------
 1 file changed, 75 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
index 06254467e4dd..f12b00a056cb 100644
--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
@@ -2044,8 +2044,9 @@ static ssize_t __spufs_mbox_info_read(struct spu_context *ctx,
 static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
 				   size_t len, loff_t *pos)
 {
-	int ret;
 	struct spu_context *ctx = file->private_data;
+	u32 stat, data;
+	int ret;
 
 	if (!access_ok(VERIFY_WRITE, buf, len))
 		return -EFAULT;
@@ -2054,11 +2055,16 @@ static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
 	if (ret)
 		return ret;
 	spin_lock(&ctx->csa.register_lock);
-	ret = __spufs_mbox_info_read(ctx, buf, len, pos);
+	stat = ctx->csa.prob.mb_stat_R;
+	data = ctx->csa.prob.pu_mb_R;
 	spin_unlock(&ctx->csa.register_lock);
 	spu_release_saved(ctx);
 
-	return ret;
+	/* EOF if there's no entry in the mbox */
+	if (!(stat & 0x0000ff))
+		return 0;
+
+	return simple_read_from_buffer(buf, len, pos, &data, sizeof(data));
 }
 
 static const struct file_operations spufs_mbox_info_fops = {
@@ -2085,6 +2091,7 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
 				   size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
+	u32 stat, data;
 	int ret;
 
 	if (!access_ok(VERIFY_WRITE, buf, len))
@@ -2094,11 +2101,16 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
 	if (ret)
 		return ret;
 	spin_lock(&ctx->csa.register_lock);
-	ret = __spufs_ibox_info_read(ctx, buf, len, pos);
+	stat = ctx->csa.prob.mb_stat_R;
+	data = ctx->csa.priv2.puint_mb_R;
 	spin_unlock(&ctx->csa.register_lock);
 	spu_release_saved(ctx);
 
-	return ret;
+	/* EOF if there's no entry in the ibox */
+	if (!(stat & 0xff0000))
+		return 0;
+
+	return simple_read_from_buffer(buf, len, pos, &data, sizeof(data));
 }
 
 static const struct file_operations spufs_ibox_info_fops = {
@@ -2107,6 +2119,11 @@ static const struct file_operations spufs_ibox_info_fops = {
 	.llseek  = generic_file_llseek,
 };
 
+static size_t spufs_wbox_info_cnt(struct spu_context *ctx)
+{
+	return (4 - ((ctx->csa.prob.mb_stat_R & 0x00ff00) >> 8)) * sizeof(u32);
+}
+
 static ssize_t __spufs_wbox_info_read(struct spu_context *ctx,
 			char __user *buf, size_t len, loff_t *pos)
 {
@@ -2115,7 +2132,7 @@ static ssize_t __spufs_wbox_info_read(struct spu_context *ctx,
 	u32 wbox_stat;
 
 	wbox_stat = ctx->csa.prob.mb_stat_R;
-	cnt = 4 - ((wbox_stat & 0x00ff00) >> 8);
+	cnt = spufs_wbox_info_cnt(ctx);
 	for (i = 0; i < cnt; i++) {
 		data[i] = ctx->csa.spu_mailbox_data[i];
 	}
@@ -2128,7 +2145,8 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
 				   size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
-	int ret;
+	u32 data[ARRAY_SIZE(ctx->csa.spu_mailbox_data)];
+	int ret, count;
 
 	if (!access_ok(VERIFY_WRITE, buf, len))
 		return -EFAULT;
@@ -2137,11 +2155,13 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
 	if (ret)
 		return ret;
 	spin_lock(&ctx->csa.register_lock);
-	ret = __spufs_wbox_info_read(ctx, buf, len, pos);
+	count = spufs_wbox_info_cnt(ctx);
+	memcpy(&data, &ctx->csa.spu_mailbox_data, sizeof(data));
 	spin_unlock(&ctx->csa.register_lock);
 	spu_release_saved(ctx);
 
-	return ret;
+	return simple_read_from_buffer(buf, len, pos, &data,
+				count * sizeof(u32));
 }
 
 static const struct file_operations spufs_wbox_info_fops = {
@@ -2150,27 +2170,33 @@ static const struct file_operations spufs_wbox_info_fops = {
 	.llseek  = generic_file_llseek,
 };
 
-static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
-			char __user *buf, size_t len, loff_t *pos)
+static void spufs_get_dma_info(struct spu_context *ctx,
+		struct spu_dma_info *info)
 {
-	struct spu_dma_info info;
-	struct mfc_cq_sr *qp, *spuqp;
 	int i;
 
-	info.dma_info_type = ctx->csa.priv2.spu_tag_status_query_RW;
-	info.dma_info_mask = ctx->csa.lscsa->tag_mask.slot[0];
-	info.dma_info_status = ctx->csa.spu_chnldata_RW[24];
-	info.dma_info_stall_and_notify = ctx->csa.spu_chnldata_RW[25];
-	info.dma_info_atomic_command_status = ctx->csa.spu_chnldata_RW[27];
+	info->dma_info_type = ctx->csa.priv2.spu_tag_status_query_RW;
+	info->dma_info_mask = ctx->csa.lscsa->tag_mask.slot[0];
+	info->dma_info_status = ctx->csa.spu_chnldata_RW[24];
+	info->dma_info_stall_and_notify = ctx->csa.spu_chnldata_RW[25];
+	info->dma_info_atomic_command_status = ctx->csa.spu_chnldata_RW[27];
 	for (i = 0; i < 16; i++) {
-		qp = &info.dma_info_command_data[i];
-		spuqp = &ctx->csa.priv2.spuq[i];
+		struct mfc_cq_sr *qp = &info->dma_info_command_data[i];
+		struct mfc_cq_sr *spuqp = &ctx->csa.priv2.spuq[i];
 
 		qp->mfc_cq_data0_RW = spuqp->mfc_cq_data0_RW;
 		qp->mfc_cq_data1_RW = spuqp->mfc_cq_data1_RW;
 		qp->mfc_cq_data2_RW = spuqp->mfc_cq_data2_RW;
 		qp->mfc_cq_data3_RW = spuqp->mfc_cq_data3_RW;
 	}
+}
+
+static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
+			char __user *buf, size_t len, loff_t *pos)
+{
+	struct spu_dma_info info;
+
+	spufs_get_dma_info(ctx, &info);
 
 	return simple_read_from_buffer(buf, len, pos, &info,
 				sizeof info);
@@ -2180,6 +2206,7 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
 			      size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
+	struct spu_dma_info info;
 	int ret;
 
 	if (!access_ok(VERIFY_WRITE, buf, len))
@@ -2189,11 +2216,12 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
 	if (ret)
 		return ret;
 	spin_lock(&ctx->csa.register_lock);
-	ret = __spufs_dma_info_read(ctx, buf, len, pos);
+	spufs_get_dma_info(ctx, &info);
 	spin_unlock(&ctx->csa.register_lock);
 	spu_release_saved(ctx);
 
-	return ret;
+	return simple_read_from_buffer(buf, len, pos, &info,
+				sizeof(info));
 }
 
 static const struct file_operations spufs_dma_info_fops = {
@@ -2202,13 +2230,31 @@ static const struct file_operations spufs_dma_info_fops = {
 	.llseek = no_llseek,
 };
 
+static void spufs_get_proxydma_info(struct spu_context *ctx,
+		struct spu_proxydma_info *info)
+{
+	int i;
+
+	info->proxydma_info_type = ctx->csa.prob.dma_querytype_RW;
+	info->proxydma_info_mask = ctx->csa.prob.dma_querymask_RW;
+	info->proxydma_info_status = ctx->csa.prob.dma_tagstatus_R;
+
+	for (i = 0; i < 8; i++) {
+		struct mfc_cq_sr *qp = &info->proxydma_info_command_data[i];
+		struct mfc_cq_sr *puqp = &ctx->csa.priv2.puq[i];
+
+		qp->mfc_cq_data0_RW = puqp->mfc_cq_data0_RW;
+		qp->mfc_cq_data1_RW = puqp->mfc_cq_data1_RW;
+		qp->mfc_cq_data2_RW = puqp->mfc_cq_data2_RW;
+		qp->mfc_cq_data3_RW = puqp->mfc_cq_data3_RW;
+	}
+}
+
 static ssize_t __spufs_proxydma_info_read(struct spu_context *ctx,
 			char __user *buf, size_t len, loff_t *pos)
 {
 	struct spu_proxydma_info info;
-	struct mfc_cq_sr *qp, *puqp;
 	int ret = sizeof info;
-	int i;
 
 	if (len < ret)
 		return -EINVAL;
@@ -2216,18 +2262,7 @@ static ssize_t __spufs_proxydma_info_read(struct spu_context *ctx,
 	if (!access_ok(VERIFY_WRITE, buf, len))
 		return -EFAULT;
 
-	info.proxydma_info_type = ctx->csa.prob.dma_querytype_RW;
-	info.proxydma_info_mask = ctx->csa.prob.dma_querymask_RW;
-	info.proxydma_info_status = ctx->csa.prob.dma_tagstatus_R;
-	for (i = 0; i < 8; i++) {
-		qp = &info.proxydma_info_command_data[i];
-		puqp = &ctx->csa.priv2.puq[i];
-
-		qp->mfc_cq_data0_RW = puqp->mfc_cq_data0_RW;
-		qp->mfc_cq_data1_RW = puqp->mfc_cq_data1_RW;
-		qp->mfc_cq_data2_RW = puqp->mfc_cq_data2_RW;
-		qp->mfc_cq_data3_RW = puqp->mfc_cq_data3_RW;
-	}
+	spufs_get_proxydma_info(ctx, &info);
 
 	return simple_read_from_buffer(buf, len, pos, &info,
 				sizeof info);
@@ -2237,17 +2272,19 @@ static ssize_t spufs_proxydma_info_read(struct file *file, char __user *buf,
 				   size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
+	struct spu_proxydma_info info;
 	int ret;
 
 	ret = spu_acquire_saved(ctx);
 	if (ret)
 		return ret;
 	spin_lock(&ctx->csa.register_lock);
-	ret = __spufs_proxydma_info_read(ctx, buf, len, pos);
+	spufs_get_proxydma_info(ctx, &info);
 	spin_unlock(&ctx->csa.register_lock);
 	spu_release_saved(ctx);
 
-	return ret;
+	return simple_read_from_buffer(buf, len, pos, &info,
+				sizeof(info));
 }
 
 static const struct file_operations spufs_proxydma_info_fops = {
-- 
2.25.1

