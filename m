Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB91C4FFE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 10:14:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXYv3VBnzDqsb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:14:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWN65Ws4zDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:20:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZPE2rD0Z; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GWN42Jrwz9sSs;
 Tue,  5 May 2020 17:20:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588663236;
 bh=te726N1vGj3CXBfa1S0vTCMmjEH0Yi8yV1wywI+qKNA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZPE2rD0ZfDdGON9KNEClKjX+ckJCxqN3NhiMa0Cvhsg8iLCH0LTqjlbILMc8mnnHH
 ssn22vhFEr5jh/ANKO5yGbNup+3zb17wHwqB1+k4San8u0Eb0vQvk8pUg+dxJc083S
 4tSOkrjBnx/8Kn4aMCXl4DeifGd2RGsibWSbGatE0h139Nhi1gaSXiL5W2J8QI7Gu2
 YAB7WTVfvZgvr9Ik+YSxSD9x4oEEcpxJ48HUCXTZUfAzLRojzjT/SwekH+W9ZnVHiu
 +3vjCutvFsqFPGNgO/QkUwOled7AZoJd4RjzJn2a6f6PzH9IL614B62wefXHmJ3gcT
 6d+p74CpqByKw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/spufs: fix copy_to_user while atomic
In-Reply-To: <20200504130443.GA18125@lst.de>
References: <20200429070303.17599-1-jk@ozlabs.org>
 <20200504130443.GA18125@lst.de>
Date: Tue, 05 May 2020 17:20:54 +1000
Message-ID: <87y2q6dezt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Christoph Hellwig <hch@lst.de> writes:
> powerpc mantainers,

There's only one of me.

> are you going to pick this up for the next -rc1?  I'm waiting for it to
> hit upstream before resending the coredump series.

I thought you were going to take it in your series. 

Otherwise you'll be waiting 4 or more weeks before this hits rc1.

I can put it in a topic branch if you're worried about merge conflicts.

There's also the fcheck() RCU fix I need to repost as a proper patch, it
seems to work.

cheers

> On Wed, Apr 29, 2020 at 03:03:02PM +0800, Jeremy Kerr wrote:
>> Currently, we may perform a copy_to_user (through
>> simple_read_from_buffer()) while holding a context's register_lock,
>> while accessing the context save area.
>> 
>> This change uses a temporary buffer for the context save area data,
>> which we then pass to simple_read_from_buffer.
>> 
>> Includes changes from Christoph Hellwig <hch@lst.de>.
>> 
>> Fixes: bf1ab978be23 ("[POWERPC] coredump: Add SPU elf notes to coredump.")
>> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  arch/powerpc/platforms/cell/spufs/file.c | 113 +++++++++++++++--------
>>  1 file changed, 75 insertions(+), 38 deletions(-)
>> 
>> diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
>> index c0f950a3f4e1..b4e1ef650b40 100644
>> --- a/arch/powerpc/platforms/cell/spufs/file.c
>> +++ b/arch/powerpc/platforms/cell/spufs/file.c
>> @@ -1978,8 +1978,9 @@ static ssize_t __spufs_mbox_info_read(struct spu_context *ctx,
>>  static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
>>  				   size_t len, loff_t *pos)
>>  {
>> -	int ret;
>>  	struct spu_context *ctx = file->private_data;
>> +	u32 stat, data;
>> +	int ret;
>>  
>>  	if (!access_ok(buf, len))
>>  		return -EFAULT;
>> @@ -1988,11 +1989,16 @@ static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
>>  	if (ret)
>>  		return ret;
>>  	spin_lock(&ctx->csa.register_lock);
>> -	ret = __spufs_mbox_info_read(ctx, buf, len, pos);
>> +	stat = ctx->csa.prob.mb_stat_R;
>> +	data = ctx->csa.prob.pu_mb_R;
>>  	spin_unlock(&ctx->csa.register_lock);
>>  	spu_release_saved(ctx);
>>  
>> -	return ret;
>> +	/* EOF if there's no entry in the mbox */
>> +	if (!(stat & 0x0000ff))
>> +		return 0;
>> +
>> +	return simple_read_from_buffer(buf, len, pos, &data, sizeof(data));
>>  }
>>  
>>  static const struct file_operations spufs_mbox_info_fops = {
>> @@ -2019,6 +2025,7 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
>>  				   size_t len, loff_t *pos)
>>  {
>>  	struct spu_context *ctx = file->private_data;
>> +	u32 stat, data;
>>  	int ret;
>>  
>>  	if (!access_ok(buf, len))
>> @@ -2028,11 +2035,16 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
>>  	if (ret)
>>  		return ret;
>>  	spin_lock(&ctx->csa.register_lock);
>> -	ret = __spufs_ibox_info_read(ctx, buf, len, pos);
>> +	stat = ctx->csa.prob.mb_stat_R;
>> +	data = ctx->csa.priv2.puint_mb_R;
>>  	spin_unlock(&ctx->csa.register_lock);
>>  	spu_release_saved(ctx);
>>  
>> -	return ret;
>> +	/* EOF if there's no entry in the ibox */
>> +	if (!(stat & 0xff0000))
>> +		return 0;
>> +
>> +	return simple_read_from_buffer(buf, len, pos, &data, sizeof(data));
>>  }
>>  
>>  static const struct file_operations spufs_ibox_info_fops = {
>> @@ -2041,6 +2053,11 @@ static const struct file_operations spufs_ibox_info_fops = {
>>  	.llseek  = generic_file_llseek,
>>  };
>>  
>> +static size_t spufs_wbox_info_cnt(struct spu_context *ctx)
>> +{
>> +	return (4 - ((ctx->csa.prob.mb_stat_R & 0x00ff00) >> 8)) * sizeof(u32);
>> +}
>> +
>>  static ssize_t __spufs_wbox_info_read(struct spu_context *ctx,
>>  			char __user *buf, size_t len, loff_t *pos)
>>  {
>> @@ -2049,7 +2066,7 @@ static ssize_t __spufs_wbox_info_read(struct spu_context *ctx,
>>  	u32 wbox_stat;
>>  
>>  	wbox_stat = ctx->csa.prob.mb_stat_R;
>> -	cnt = 4 - ((wbox_stat & 0x00ff00) >> 8);
>> +	cnt = spufs_wbox_info_cnt(ctx);
>>  	for (i = 0; i < cnt; i++) {
>>  		data[i] = ctx->csa.spu_mailbox_data[i];
>>  	}
>> @@ -2062,7 +2079,8 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
>>  				   size_t len, loff_t *pos)
>>  {
>>  	struct spu_context *ctx = file->private_data;
>> -	int ret;
>> +	u32 data[ARRAY_SIZE(ctx->csa.spu_mailbox_data)];
>> +	int ret, count;
>>  
>>  	if (!access_ok(buf, len))
>>  		return -EFAULT;
>> @@ -2071,11 +2089,13 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
>>  	if (ret)
>>  		return ret;
>>  	spin_lock(&ctx->csa.register_lock);
>> -	ret = __spufs_wbox_info_read(ctx, buf, len, pos);
>> +	count = spufs_wbox_info_cnt(ctx);
>> +	memcpy(&data, &ctx->csa.spu_mailbox_data, sizeof(data));
>>  	spin_unlock(&ctx->csa.register_lock);
>>  	spu_release_saved(ctx);
>>  
>> -	return ret;
>> +	return simple_read_from_buffer(buf, len, pos, &data,
>> +				count * sizeof(u32));
>>  }
>>  
>>  static const struct file_operations spufs_wbox_info_fops = {
>> @@ -2084,27 +2104,33 @@ static const struct file_operations spufs_wbox_info_fops = {
>>  	.llseek  = generic_file_llseek,
>>  };
>>  
>> -static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
>> -			char __user *buf, size_t len, loff_t *pos)
>> +static void ___spufs_dma_info_read(struct spu_context *ctx,
>> +		struct spu_dma_info *info)
>>  {
>> -	struct spu_dma_info info;
>> -	struct mfc_cq_sr *qp, *spuqp;
>>  	int i;
>>  
>> -	info.dma_info_type = ctx->csa.priv2.spu_tag_status_query_RW;
>> -	info.dma_info_mask = ctx->csa.lscsa->tag_mask.slot[0];
>> -	info.dma_info_status = ctx->csa.spu_chnldata_RW[24];
>> -	info.dma_info_stall_and_notify = ctx->csa.spu_chnldata_RW[25];
>> -	info.dma_info_atomic_command_status = ctx->csa.spu_chnldata_RW[27];
>> +	info->dma_info_type = ctx->csa.priv2.spu_tag_status_query_RW;
>> +	info->dma_info_mask = ctx->csa.lscsa->tag_mask.slot[0];
>> +	info->dma_info_status = ctx->csa.spu_chnldata_RW[24];
>> +	info->dma_info_stall_and_notify = ctx->csa.spu_chnldata_RW[25];
>> +	info->dma_info_atomic_command_status = ctx->csa.spu_chnldata_RW[27];
>>  	for (i = 0; i < 16; i++) {
>> -		qp = &info.dma_info_command_data[i];
>> -		spuqp = &ctx->csa.priv2.spuq[i];
>> +		struct mfc_cq_sr *qp = &info->dma_info_command_data[i];
>> +		struct mfc_cq_sr *spuqp = &ctx->csa.priv2.spuq[i];
>>  
>>  		qp->mfc_cq_data0_RW = spuqp->mfc_cq_data0_RW;
>>  		qp->mfc_cq_data1_RW = spuqp->mfc_cq_data1_RW;
>>  		qp->mfc_cq_data2_RW = spuqp->mfc_cq_data2_RW;
>>  		qp->mfc_cq_data3_RW = spuqp->mfc_cq_data3_RW;
>>  	}
>> +}
>> +
>> +static ssize_t __spufs_dma_info_read(struct spu_context *ctx,
>> +			char __user *buf, size_t len, loff_t *pos)
>> +{
>> +	struct spu_dma_info info;
>> +
>> +	___spufs_dma_info_read(ctx, &info);
>>  
>>  	return simple_read_from_buffer(buf, len, pos, &info,
>>  				sizeof info);
>> @@ -2114,6 +2140,7 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
>>  			      size_t len, loff_t *pos)
>>  {
>>  	struct spu_context *ctx = file->private_data;
>> +	struct spu_dma_info info;
>>  	int ret;
>>  
>>  	if (!access_ok(buf, len))
>> @@ -2123,11 +2150,12 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
>>  	if (ret)
>>  		return ret;
>>  	spin_lock(&ctx->csa.register_lock);
>> -	ret = __spufs_dma_info_read(ctx, buf, len, pos);
>> +	___spufs_dma_info_read(ctx, &info);
>>  	spin_unlock(&ctx->csa.register_lock);
>>  	spu_release_saved(ctx);
>>  
>> -	return ret;
>> +	return simple_read_from_buffer(buf, len, pos, &info,
>> +				sizeof(info));
>>  }
>>  
>>  static const struct file_operations spufs_dma_info_fops = {
>> @@ -2136,13 +2164,31 @@ static const struct file_operations spufs_dma_info_fops = {
>>  	.llseek = no_llseek,
>>  };
>>  
>> +static void ___spufs_proxydma_info_read(struct spu_context *ctx,
>> +		struct spu_proxydma_info *info)
>> +{
>> +	int i;
>> +
>> +	info->proxydma_info_type = ctx->csa.prob.dma_querytype_RW;
>> +	info->proxydma_info_mask = ctx->csa.prob.dma_querymask_RW;
>> +	info->proxydma_info_status = ctx->csa.prob.dma_tagstatus_R;
>> +
>> +	for (i = 0; i < 8; i++) {
>> +		struct mfc_cq_sr *qp = &info->proxydma_info_command_data[i];
>> +		struct mfc_cq_sr *puqp = &ctx->csa.priv2.puq[i];
>> +
>> +		qp->mfc_cq_data0_RW = puqp->mfc_cq_data0_RW;
>> +		qp->mfc_cq_data1_RW = puqp->mfc_cq_data1_RW;
>> +		qp->mfc_cq_data2_RW = puqp->mfc_cq_data2_RW;
>> +		qp->mfc_cq_data3_RW = puqp->mfc_cq_data3_RW;
>> +	}
>> +}
>> +
>>  static ssize_t __spufs_proxydma_info_read(struct spu_context *ctx,
>>  			char __user *buf, size_t len, loff_t *pos)
>>  {
>>  	struct spu_proxydma_info info;
>> -	struct mfc_cq_sr *qp, *puqp;
>>  	int ret = sizeof info;
>> -	int i;
>>  
>>  	if (len < ret)
>>  		return -EINVAL;
>> @@ -2150,18 +2196,7 @@ static ssize_t __spufs_proxydma_info_read(struct spu_context *ctx,
>>  	if (!access_ok(buf, len))
>>  		return -EFAULT;
>>  
>> -	info.proxydma_info_type = ctx->csa.prob.dma_querytype_RW;
>> -	info.proxydma_info_mask = ctx->csa.prob.dma_querymask_RW;
>> -	info.proxydma_info_status = ctx->csa.prob.dma_tagstatus_R;
>> -	for (i = 0; i < 8; i++) {
>> -		qp = &info.proxydma_info_command_data[i];
>> -		puqp = &ctx->csa.priv2.puq[i];
>> -
>> -		qp->mfc_cq_data0_RW = puqp->mfc_cq_data0_RW;
>> -		qp->mfc_cq_data1_RW = puqp->mfc_cq_data1_RW;
>> -		qp->mfc_cq_data2_RW = puqp->mfc_cq_data2_RW;
>> -		qp->mfc_cq_data3_RW = puqp->mfc_cq_data3_RW;
>> -	}
>> +	___spufs_proxydma_info_read(ctx, &info);
>>  
>>  	return simple_read_from_buffer(buf, len, pos, &info,
>>  				sizeof info);
>> @@ -2171,17 +2206,19 @@ static ssize_t spufs_proxydma_info_read(struct file *file, char __user *buf,
>>  				   size_t len, loff_t *pos)
>>  {
>>  	struct spu_context *ctx = file->private_data;
>> +	struct spu_proxydma_info info;
>>  	int ret;
>>  
>>  	ret = spu_acquire_saved(ctx);
>>  	if (ret)
>>  		return ret;
>>  	spin_lock(&ctx->csa.register_lock);
>> -	ret = __spufs_proxydma_info_read(ctx, buf, len, pos);
>> +	___spufs_proxydma_info_read(ctx, &info);
>>  	spin_unlock(&ctx->csa.register_lock);
>>  	spu_release_saved(ctx);
>>  
>> -	return ret;
>> +	return simple_read_from_buffer(buf, len, pos, &info,
>> +				sizeof(info));
>>  }
>>  
>>  static const struct file_operations spufs_proxydma_info_fops = {
>> -- 
>> 2.17.1
> ---end quoted text---
