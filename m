Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9A38DA31
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 10:20:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FntZx40jwz3btR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 18:20:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b+KRmroR;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5gJEAWYW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=hare@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=b+KRmroR; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5gJEAWYW; 
 dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FntZS1LJ0z2xgL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 18:20:31 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621758028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkWgVmeV1aDIbqHf2NWEl/RY0pR5gonwUowiZNNAcjQ=;
 b=b+KRmroRC/XnrIoT11eR1Zk2Jd7yfgwHdeYGc5z7w8i6TcEXXIvJ+uAJltYU677ItQKbcP
 lTfr+wvAFKJAAA6huplmsb7+l7hNTLV7yag5ZnXHWJBdfxMJJWQT/9Tyv1KcRDcaRBTR4d
 gH8UlaT3HpMdJlK6xi7bJ6DG0Dwlpuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621758028;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkWgVmeV1aDIbqHf2NWEl/RY0pR5gonwUowiZNNAcjQ=;
 b=5gJEAWYW4NtLrHn8NUGKKYttWxGml91Pn705UCTO6YjfUC4LqVOYzM2Ns7am/CTWT5WxK7
 TNrsYHd51WvUdFAA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B335CAB7C;
 Sun, 23 May 2021 08:20:28 +0000 (UTC)
Subject: Re: [PATCH 18/26] nvme-multipath: convert to
 blk_alloc_disk/blk_cleanup_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
 Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210521055116.1053587-1-hch@lst.de>
 <20210521055116.1053587-19-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1a771bf9-5083-c440-f0e1-5f6920b5b017@suse.de>
Date: Sun, 23 May 2021 10:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-19-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-raid@vger.kernel.org, nvdimm@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/21 7:51 AM, Christoph Hellwig wrote:
> Convert the nvme-multipath driver to use the blk_alloc_disk and
> blk_cleanup_disk helpers to simplify gendisk and request_queue
> allocation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvdimm/pmem.c         |  1 -
>   drivers/nvme/host/multipath.c | 45 ++++++++++-------------------------
>   2 files changed, 13 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 9fcd05084564..31f3c4bd6f72 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -472,7 +472,6 @@ static int pmem_attach_disk(struct device *dev,
>   		blk_queue_flag_set(QUEUE_FLAG_DAX, q);
>   
>   	disk->fops		= &pmem_fops;
> -	disk->queue		= q;
>   	disk->private_data	= pmem;
>   	nvdimm_namespace_disk_name(ndns, disk->disk_name);
>   	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index a5d02f236cca..b5fbdb416022 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -427,7 +427,6 @@ static void nvme_requeue_work(struct work_struct *work)
>   
>   int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
>   {
> -	struct request_queue *q;
>   	bool vwc = false;
>   
>   	mutex_init(&head->lock);
> @@ -443,33 +442,24 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
>   	if (!(ctrl->subsys->cmic & NVME_CTRL_CMIC_MULTI_CTRL) || !multipath)
>   		return 0;
>   
> -	q = blk_alloc_queue(ctrl->numa_node);
> -	if (!q)
> -		goto out;
> -	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
> -	/* set to a default value for 512 until disk is validated */
> -	blk_queue_logical_block_size(q, 512);
> -	blk_set_stacking_limits(&q->limits);
> -
> -	/* we need to propagate up the VMC settings */
> -	if (ctrl->vwc & NVME_CTRL_VWC_PRESENT)
> -		vwc = true;
> -	blk_queue_write_cache(q, vwc, vwc);
> -
> -	head->disk = alloc_disk(0);
> +	head->disk = blk_alloc_disk(ctrl->numa_node);
>   	if (!head->disk)
> -		goto out_cleanup_queue;
> +		return -ENOMEM;
>   	head->disk->fops = &nvme_ns_head_ops;
>   	head->disk->private_data = head;
> -	head->disk->queue = q;
>   	sprintf(head->disk->disk_name, "nvme%dn%d",
>   			ctrl->subsys->instance, head->instance);
> -	return 0;
>   
> -out_cleanup_queue:
> -	blk_cleanup_queue(q);
> -out:
> -	return -ENOMEM;
> +	blk_queue_flag_set(QUEUE_FLAG_NONROT, head->disk->queue);
> +	/* set to a default value of 512 until the disk is validated */
> +	blk_queue_logical_block_size(head->disk->queue, 512);
> +	blk_set_stacking_limits(&head->disk->queue->limits);
> +
> +	/* we need to propagate up the VMC settings */
> +	if (ctrl->vwc & NVME_CTRL_VWC_PRESENT)
> +		vwc = true;
> +	blk_queue_write_cache(head->disk->queue, vwc, vwc);
> +	return 0;
>   }
>   
>   static void nvme_mpath_set_live(struct nvme_ns *ns)
> @@ -768,16 +758,7 @@ void nvme_mpath_remove_disk(struct nvme_ns_head *head)
>   	/* make sure all pending bios are cleaned up */
>   	kblockd_schedule_work(&head->requeue_work);
>   	flush_work(&head->requeue_work);
> -	blk_cleanup_queue(head->disk->queue);
> -	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
> -		/*
> -		 * if device_add_disk wasn't called, prevent
> -		 * disk release to put a bogus reference on the
> -		 * request queue
> -		 */
> -		head->disk->queue = NULL;
> -	}
> -	put_disk(head->disk);
> +	blk_cleanup_disk(head->disk);
>   }
>   
>   void nvme_mpath_init_ctrl(struct nvme_ctrl *ctrl)
> 
What about the check for GENHD_FL_UP a bit further up in line 766?
Can this still happen with the new allocation scheme, ie is there still 
a difference in lifetime between ->disk and ->disk->queue?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
