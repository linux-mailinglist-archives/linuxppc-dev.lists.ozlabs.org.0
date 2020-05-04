Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD071C3AE5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 15:07:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G36k39WYzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 23:07:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G33l1RtkzDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 23:04:49 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3162268BFE; Mon,  4 May 2020 15:04:44 +0200 (CEST)
Date: Mon, 4 May 2020 15:04:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/spufs: fix copy_to_user while atomic
Message-ID: <20200504130443.GA18125@lst.de>
References: <20200429070303.17599-1-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429070303.17599-1-jk@ozlabs.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc mantainers,

are you going to pick this up for the next -rc1?  I'm waiting for it to
hit upstream before resending the coredump series.

On Wed, Apr 29, 2020 at 03:03:02PM +0800, Jeremy Kerr wrote:
> Currently, we may perform a copy_to_user (through
> simple_read_from_buffer()) while holding a context's register_lock,
> while accessing the context save area.
> 
> This change uses a temporary buffer for the context save area data,
> which we then pass to simple_read_from_buffer.
> 
> Includes changes from Christoph Hellwig <hch@lst.de>.
> 
> Fixes: bf1ab978be23 ("[POWERPC] coredump: Add SPU elf notes to coredump.")
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/platforms/cell/spufs/file.c | 113 +++++++++++++++--------
>  1 file changed, 75 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
> index c0f950a3f4e1..b4e1ef650b40 100644
> --- a/arch/powerpc/platforms/cell/spufs/file.c
> +++ b/arch/powerpc/platforms/cell/spufs/file.c
> @@ -1978,8 +1978,9 @@ static ssize_t __spufs_mbox_info_read(struct spu_context *ctx,
>  static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
>  				   size_t len, loff_t *pos)
>  {
> -	int ret;
>  	struct spu_context *ctx = file->private_data;
> +	u32 stat, data;
> +	int ret;
>  
>  	if (!access_ok(buf, len))
>  		return -EFAULT;
> @@ -1988,11 +1989,16 @@ static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
>  	if (ret)
>  		return ret;
>  	spin_lock(&ctx->csa.register_lock);
> -	ret = __spufs_mbox_info_read(ctx, buf, len, pos);
> +	stat = ctx->csa.prob.mb_stat_R;
> +	data = ctx->csa.prob.pu_mb_R;
>  	spin_unlock(&ctx->csa.register_lock);
>  	spu_release_saved(ctx);
>  
> -	return ret;
> +	/* EOF if there's no entry in the mbox */
> +	if (!(stat & 0x0000ff))
> +		return 0;
> +
> +	return simple_read_from_buffer(buf, len, pos, &data, sizeof(data));
>  }
>  
>  static const struct file_operations spufs_mbox_info_fops = {
> @@ -2019,6 +2025,7 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
>  				   size_t len, loff_t *pos)
>  {
>  	struct spu_context *ctx = file->private_data;
> +	u32 stat, data;
>  	int ret;
>  
>  	if (!access_ok(buf, len))
> @@ -2028,11 +2035,16 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
>  	if (ret)
>  		return ret;
>  	spin_lock(&ctx->csa.register_lock);
> -	ret = __spufs_ibox_info_read(ctx, buf, len, pos);
> +	stat = ctx->csa.prob.mb_stat_R;
> +	data = ctx->csa.priv2.puint_mb_R;
>  	spin_unlock(&ctx->csa.register_lock);
>  	spu_release_saved(ctx);
>  
> -	return ret;
> +	/* EOF if there's no entry in the ibox */
> +	if (!(stat & 0xff0000))
> +		return 0;
> +
> +	return simple_read_from_buffer(buf, len, pos, &data, sizeof(data));
>  }
>  
>  static const struct file_operations spufs_ibox_info_fops = {
> @@ -2041,6 +2053,11 @@ static const struct file_operations spufs_ibox_info_fops = {
>  	.llseek  = generic_file_llseek,
>  };
>  
> +static size_t spufs_wbox_info_cnt(struct spu_context *ctx)
> +{
> +	return (4 - ((ctx->csa.prob.mb_stat_R & 0x00ff00) >> 8)) * sizeof(u32);
> +}
> +
>  static ssize_t __spufs_wbox_info_read(struct spu_context *ctx,
>  			char __user *buf, size_t len, loff_t *pos)
>  {
> @@ -2049,7 +2066,7 @@ static ssize_t __spufs_wbox_info_read(struct spu_context *ctx,
>  	u32 wbox_stat;
>  
>  	wbox_stat = ctx->csa.prob.mb_stat_R;
> -	cnt = 4 - ((wbox_stat & 0x00ff00) >> 8);
> +	cnt = spufs_wbox_info_cnt(ctx);
>  	for (i = 0; i < cnt; i++) {
>  		data[i] = ctx->csa.spu_mailbox_data[i];
>  	}
> @@ -2062,7 +2079,8 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
>  				   size_t len, loff_t *pos)
>  {
>  	struct spu_context *ctx = file->private_data;
> -	int ret;
> +	u32 data[ARRAY_SIZE(ctx->csa.spu_mailbox_data)];
> +	int ret, count;
>  
>  	if (!access_ok(buf, len))
>  		return -EFAULT;
> @@ -2071,11 +2089,13 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
>  	if (ret)
>  		return ret;
>  	spin_lock(&ctx->csa.register_lock);
> -	ret = __spufs_wbox_info_read(ctx, buf, len, pos);
> +	count = spufs_wbox_info_cnt(ctx);
> +	memcpy(&data, &ctx->csa.spu_mailbox_data, sizeof(data));
>  	spin_unlock(&ctx->csa.register_lock);
>  	spu_release_saved(ctx);
>  
> -	return ret;
> +	return simple_read_from_buffer(buf, len, pos, &data,
> +				count * sizeof(u32));
>  }
>  
>  static const struct file_operations spufs_wbox_info_fops = {
> @@ -2084,27 +2104,33 @@ static const struct file_operations spufs_wbox_info_fops = {
>  	.llseek  = generic_file_llseek,
>  };
>  
> -static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
> -			char __user *buf, size_t len, loff_t *pos)
> +static void ___spufs_dma_info_read(struct spu_context *ctx,
> +		struct spu_dma_info *info)
>  {
> -	struct spu_dma_info info;
> -	struct mfc_cq_sr *qp, *spuqp;
>  	int i;
>  
> -	info.dma_info_type = ctx->csa.priv2.spu_tag_status_query_RW;
> -	info.dma_info_mask = ctx->csa.lscsa->tag_mask.slot[0];
> -	info.dma_info_status = ctx->csa.spu_chnldata_RW[24];
> -	info.dma_info_stall_and_notify = ctx->csa.spu_chnldata_RW[25];
> -	info.dma_info_atomic_command_status = ctx->csa.spu_chnldata_RW[27];
> +	info->dma_info_type = ctx->csa.priv2.spu_tag_status_query_RW;
> +	info->dma_info_mask = ctx->csa.lscsa->tag_mask.slot[0];
> +	info->dma_info_status = ctx->csa.spu_chnldata_RW[24];
> +	info->dma_info_stall_and_notify = ctx->csa.spu_chnldata_RW[25];
> +	info->dma_info_atomic_command_status = ctx->csa.spu_chnldata_RW[27];
>  	for (i = 0; i < 16; i++) {
> -		qp = &info.dma_info_command_data[i];
> -		spuqp = &ctx->csa.priv2.spuq[i];
> +		struct mfc_cq_sr *qp = &info->dma_info_command_data[i];
> +		struct mfc_cq_sr *spuqp = &ctx->csa.priv2.spuq[i];
>  
>  		qp->mfc_cq_data0_RW = spuqp->mfc_cq_data0_RW;
>  		qp->mfc_cq_data1_RW = spuqp->mfc_cq_data1_RW;
>  		qp->mfc_cq_data2_RW = spuqp->mfc_cq_data2_RW;
>  		qp->mfc_cq_data3_RW = spuqp->mfc_cq_data3_RW;
>  	}
> +}
> +
> +static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
> +			char __user *buf, size_t len, loff_t *pos)
> +{
> +	struct spu_dma_info info;
> +
> +	___spufs_dma_info_read(ctx, &info);
>  
>  	return simple_read_from_buffer(buf, len, pos, &info,
>  				sizeof info);
> @@ -2114,6 +2140,7 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
>  			      size_t len, loff_t *pos)
>  {
>  	struct spu_context *ctx = file->private_data;
> +	struct spu_dma_info info;
>  	int ret;
>  
>  	if (!access_ok(buf, len))
> @@ -2123,11 +2150,12 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
>  	if (ret)
>  		return ret;
>  	spin_lock(&ctx->csa.register_lock);
> -	ret = __spufs_dma_info_read(ctx, buf, len, pos);
> +	___spufs_dma_info_read(ctx, &info);
>  	spin_unlock(&ctx->csa.register_lock);
>  	spu_release_saved(ctx);
>  
> -	return ret;
> +	return simple_read_from_buffer(buf, len, pos, &info,
> +				sizeof(info));
>  }
>  
>  static const struct file_operations spufs_dma_info_fops = {
> @@ -2136,13 +2164,31 @@ static const struct file_operations spufs_dma_info_fops = {
>  	.llseek = no_llseek,
>  };
>  
> +static void ___spufs_proxydma_info_read(struct spu_context *ctx,
> +		struct spu_proxydma_info *info)
> +{
> +	int i;
> +
> +	info->proxydma_info_type = ctx->csa.prob.dma_querytype_RW;
> +	info->proxydma_info_mask = ctx->csa.prob.dma_querymask_RW;
> +	info->proxydma_info_status = ctx->csa.prob.dma_tagstatus_R;
> +
> +	for (i = 0; i < 8; i++) {
> +		struct mfc_cq_sr *qp = &info->proxydma_info_command_data[i];
> +		struct mfc_cq_sr *puqp = &ctx->csa.priv2.puq[i];
> +
> +		qp->mfc_cq_data0_RW = puqp->mfc_cq_data0_RW;
> +		qp->mfc_cq_data1_RW = puqp->mfc_cq_data1_RW;
> +		qp->mfc_cq_data2_RW = puqp->mfc_cq_data2_RW;
> +		qp->mfc_cq_data3_RW = puqp->mfc_cq_data3_RW;
> +	}
> +}
> +
>  static ssize_t __spufs_proxydma_info_read(struct spu_context *ctx,
>  			char __user *buf, size_t len, loff_t *pos)
>  {
>  	struct spu_proxydma_info info;
> -	struct mfc_cq_sr *qp, *puqp;
>  	int ret = sizeof info;
> -	int i;
>  
>  	if (len < ret)
>  		return -EINVAL;
> @@ -2150,18 +2196,7 @@ static ssize_t __spufs_proxydma_info_read(struct spu_context *ctx,
>  	if (!access_ok(buf, len))
>  		return -EFAULT;
>  
> -	info.proxydma_info_type = ctx->csa.prob.dma_querytype_RW;
> -	info.proxydma_info_mask = ctx->csa.prob.dma_querymask_RW;
> -	info.proxydma_info_status = ctx->csa.prob.dma_tagstatus_R;
> -	for (i = 0; i < 8; i++) {
> -		qp = &info.proxydma_info_command_data[i];
> -		puqp = &ctx->csa.priv2.puq[i];
> -
> -		qp->mfc_cq_data0_RW = puqp->mfc_cq_data0_RW;
> -		qp->mfc_cq_data1_RW = puqp->mfc_cq_data1_RW;
> -		qp->mfc_cq_data2_RW = puqp->mfc_cq_data2_RW;
> -		qp->mfc_cq_data3_RW = puqp->mfc_cq_data3_RW;
> -	}
> +	___spufs_proxydma_info_read(ctx, &info);
>  
>  	return simple_read_from_buffer(buf, len, pos, &info,
>  				sizeof info);
> @@ -2171,17 +2206,19 @@ static ssize_t spufs_proxydma_info_read(struct file *file, char __user *buf,
>  				   size_t len, loff_t *pos)
>  {
>  	struct spu_context *ctx = file->private_data;
> +	struct spu_proxydma_info info;
>  	int ret;
>  
>  	ret = spu_acquire_saved(ctx);
>  	if (ret)
>  		return ret;
>  	spin_lock(&ctx->csa.register_lock);
> -	ret = __spufs_proxydma_info_read(ctx, buf, len, pos);
> +	___spufs_proxydma_info_read(ctx, &info);
>  	spin_unlock(&ctx->csa.register_lock);
>  	spu_release_saved(ctx);
>  
> -	return ret;
> +	return simple_read_from_buffer(buf, len, pos, &info,
> +				sizeof(info));
>  }
>  
>  static const struct file_operations spufs_proxydma_info_fops = {
> -- 
> 2.17.1
---end quoted text---
