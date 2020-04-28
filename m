Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2771BBD0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 14:06:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BL3f1sMSzDqsv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 22:06:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BL1N5h6yzDqlV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 22:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=OXiAX4v3; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 49BL1M6wGwz9sSX; Tue, 28 Apr 2020 22:04:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1588075495; bh=mQaL0dNlw7pvZD2irMmg/vOkZrvHKgvORLsAa9jZbwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXiAX4v3r2OpdzAIA7yqGju8GgordMTliwZOsaVy1nYlxsLovY8BF8soLE2xtEQmo
 ixPXs14E9V7/bf+dQgUOviu/YR5M0zSvZiDvj2upRTsmS/mNLk8SGfWql+mzK2YoVv
 W59U/nxFeKHoXidJsYTbNv17pkjU1qM0Du1TibEtyj359VpHFqoh/eF1ZtyuRhwvhX
 gDOwH7VYh2WrEtT5vKHPNdbb8UhrsptCSjXNOb3qUxecO4Orzchqdlw58z09vl8CQC
 oh0feGG52IB6RSAs5uW8vy0ICvSOK19DyGc4WJLcBKf2h/JEAC/dQeiXfdojWH6oGX
 Qq6bOiifFbCkA==
From: Jeremy Kerr <jk@ozlabs.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH] powerpc/spufs: fix copy_to_user while atomic
Date: Tue, 28 Apr 2020 20:02:07 +0800
Message-Id: <20200428120207.15728-1-jk@ozlabs.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427200626.1622060-2-hch@lst.de>
References: <20200427200626.1622060-2-hch@lst.de>
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
Cc: linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, we may perform a copy_to_user (through
simple_read_from_buffer()) while holding a context's register_lock,
while accessing the context save area.

This change uses a temporary buffers for the context save area data,
which we then pass to simple_read_from_buffer.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---

Christoph - this fixes the copy_to_user while atomic, hopefully with
only minimal distruption to your series.

---
 arch/powerpc/platforms/cell/spufs/file.c | 110 +++++++++++++++--------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
index c0f950a3f4e1..c62d77ddaf7d 100644
--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
@@ -1978,8 +1978,9 @@ static ssize_t __spufs_mbox_info_read(struct spu_context *ctx,
 static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
 				   size_t len, loff_t *pos)
 {
-	int ret;
 	struct spu_context *ctx = file->private_data;
+	u32 stat, data;
+	int ret;
 
 	if (!access_ok(buf, len))
 		return -EFAULT;
@@ -1988,11 +1989,16 @@ static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
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
@@ -2019,6 +2025,7 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
 				   size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
+	u32 stat, data;
 	int ret;
 
 	if (!access_ok(buf, len))
@@ -2028,11 +2035,16 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
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
@@ -2041,6 +2053,11 @@ static const struct file_operations spufs_ibox_info_fops = {
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
@@ -2049,7 +2066,7 @@ static ssize_t __spufs_wbox_info_read(struct spu_context *ctx,
 	u32 wbox_stat;
 
 	wbox_stat = ctx->csa.prob.mb_stat_R;
-	cnt = 4 - ((wbox_stat & 0x00ff00) >> 8);
+	cnt = spufs_wbox_info_cnt(ctx);
 	for (i = 0; i < cnt; i++) {
 		data[i] = ctx->csa.spu_mailbox_data[i];
 	}
@@ -2062,7 +2079,8 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
 				   size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
-	int ret;
+	u32 data[ARRAY_SIZE(ctx->csa.spu_mailbox_data)];
+	int ret, count;
 
 	if (!access_ok(buf, len))
 		return -EFAULT;
@@ -2071,11 +2089,13 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
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
@@ -2084,20 +2104,19 @@ static const struct file_operations spufs_wbox_info_fops = {
 	.llseek  = generic_file_llseek,
 };
 
-static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
-			char __user *buf, size_t len, loff_t *pos)
+static void ___spufs_dma_info_read(struct spu_context *ctx,
+		struct spu_dma_info *info)
 {
-	struct spu_dma_info info;
 	struct mfc_cq_sr *qp, *spuqp;
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
+		qp = &info->dma_info_command_data[i];
 		spuqp = &ctx->csa.priv2.spuq[i];
 
 		qp->mfc_cq_data0_RW = spuqp->mfc_cq_data0_RW;
@@ -2105,6 +2124,14 @@ static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
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
+	___spufs_dma_info_read(ctx, &info);
 
 	return simple_read_from_buffer(buf, len, pos, &info,
 				sizeof info);
@@ -2114,6 +2141,7 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
 			      size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
+	struct spu_dma_info info;
 	int ret;
 
 	if (!access_ok(buf, len))
@@ -2123,11 +2151,12 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
 	if (ret)
 		return ret;
 	spin_lock(&ctx->csa.register_lock);
-	ret = __spufs_dma_info_read(ctx, buf, len, pos);
+	___spufs_dma_info_read(ctx, &info);
 	spin_unlock(&ctx->csa.register_lock);
 	spu_release_saved(ctx);
 
-	return ret;
+	return simple_read_from_buffer(buf, len, pos, &info,
+				sizeof(info));
 }
 
 static const struct file_operations spufs_dma_info_fops = {
@@ -2136,13 +2165,31 @@ static const struct file_operations spufs_dma_info_fops = {
 	.llseek = no_llseek,
 };
 
+static void ___spufs_proxydma_info_read(struct spu_context *ctx,
+	struct spu_proxydma_info *info)
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
@@ -2150,18 +2197,7 @@ static ssize_t __spufs_proxydma_info_read(struct spu_context *ctx,
 	if (!access_ok(buf, len))
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
+	___spufs_proxydma_info_read(ctx, &info);
 
 	return simple_read_from_buffer(buf, len, pos, &info,
 				sizeof info);
@@ -2171,17 +2207,19 @@ static ssize_t spufs_proxydma_info_read(struct file *file, char __user *buf,
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
+	___spufs_proxydma_info_read(ctx, &info);
 	spin_unlock(&ctx->csa.register_lock);
 	spu_release_saved(ctx);
 
-	return ret;
+	return simple_read_from_buffer(buf, len, pos, &info,
+				sizeof(info));
 }
 
 static const struct file_operations spufs_proxydma_info_fops = {
-- 
2.17.1

