Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94938D9B3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 09:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fnt5x5tq4z3bs5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 17:59:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qnPLP3bD;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QUNsVeYK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=hare@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qnPLP3bD; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QUNsVeYK; 
 dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fnt5S46pkz2xYZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 17:58:52 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621756730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9q10j6pxqYkic7UkxlBRvW8G0CcNR1ybReXpt+Eyutc=;
 b=qnPLP3bDDyKEU+PsCx8mJFdQOt2c6N6KfR04BaZvOBN2hIgT+44QgHQPq6amTymZHv9wcT
 uQVXSSk1rH3OUOoEsLwbb6c2410es/n0Jb1WbtRq1aNjKmhgiBJGvGDkce3mLJhbLBmP8f
 60+5EL1xbSXqQ3Qs+WErJPexJ6ccsMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621756730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9q10j6pxqYkic7UkxlBRvW8G0CcNR1ybReXpt+Eyutc=;
 b=QUNsVeYK1qK3iqbouwKdbXcYR8JyMP3yHs0sImd7PFWvdFc0BIppcYnYdXcifwFqde0z8E
 p++NXvhUiV1DEoDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6046AB6D;
 Sun, 23 May 2021 07:58:49 +0000 (UTC)
Subject: Re: [PATCH 06/26] brd: convert to blk_alloc_disk/blk_cleanup_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
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
 <20210521055116.1053587-7-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <83fc5cdc-53ed-0bd3-fbe8-93d0afd20771@suse.de>
Date: Sun, 23 May 2021 09:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-7-hch@lst.de>
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

On 5/21/21 7:50 AM, Christoph Hellwig wrote:
> Convert the brd driver to use the blk_alloc_disk and blk_cleanup_disk
> helpers to simplify gendisk and request_queue allocation.  This also
> allows to remove the request_queue pointer in struct request_queue,
> and to simplify the initialization as blk_cleanup_disk can be called
> on any disk returned from blk_alloc_disk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/block/brd.c | 94 ++++++++++++++++-----------------------------
>   1 file changed, 33 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/block/brd.c b/drivers/block/brd.c
> index 7562cf30b14e..95694113e38e 100644
> --- a/drivers/block/brd.c
> +++ b/drivers/block/brd.c
> @@ -38,9 +38,7 @@
>    * device).
>    */
>   struct brd_device {
> -	int		brd_number;
> -
> -	struct request_queue	*brd_queue;
> +	int			brd_number;
>   	struct gendisk		*brd_disk;
>   	struct list_head	brd_list;
>   
> @@ -372,7 +370,7 @@ static LIST_HEAD(brd_devices);
>   static DEFINE_MUTEX(brd_devices_mutex);
>   static struct dentry *brd_debugfs_dir;
>   
> -static struct brd_device *brd_alloc(int i)
> +static int brd_alloc(int i)
>   {
>   	struct brd_device *brd;
>   	struct gendisk *disk;
> @@ -380,64 +378,55 @@ static struct brd_device *brd_alloc(int i)
>   
>   	brd = kzalloc(sizeof(*brd), GFP_KERNEL);
>   	if (!brd)
> -		goto out;
> +		return -ENOMEM;
>   	brd->brd_number		= i;
>   	spin_lock_init(&brd->brd_lock);
>   	INIT_RADIX_TREE(&brd->brd_pages, GFP_ATOMIC);
>   
> -	brd->brd_queue = blk_alloc_queue(NUMA_NO_NODE);
> -	if (!brd->brd_queue)
> -		goto out_free_dev;
> -
>   	snprintf(buf, DISK_NAME_LEN, "ram%d", i);
>   	if (!IS_ERR_OR_NULL(brd_debugfs_dir))
>   		debugfs_create_u64(buf, 0444, brd_debugfs_dir,
>   				&brd->brd_nr_pages);
>   
> -	/* This is so fdisk will align partitions on 4k, because of
> -	 * direct_access API needing 4k alignment, returning a PFN
> -	 * (This is only a problem on very small devices <= 4M,
> -	 *  otherwise fdisk will align on 1M. Regardless this call
> -	 *  is harmless)
> -	 */
> -	blk_queue_physical_block_size(brd->brd_queue, PAGE_SIZE);
> -	disk = brd->brd_disk = alloc_disk(max_part);
> +	disk = brd->brd_disk = blk_alloc_disk(NUMA_NO_NODE);
>   	if (!disk)
> -		goto out_free_queue;
> +		goto out_free_dev;
> +
>   	disk->major		= RAMDISK_MAJOR;
>   	disk->first_minor	= i * max_part;
> +	disk->minors		= max_part;
>   	disk->fops		= &brd_fops;
>   	disk->private_data	= brd;
>   	disk->flags		= GENHD_FL_EXT_DEVT;
>   	strlcpy(disk->disk_name, buf, DISK_NAME_LEN);
>   	set_capacity(disk, rd_size * 2);
> +	
> +	/*
> +	 * This is so fdisk will align partitions on 4k, because of
> +	 * direct_access API needing 4k alignment, returning a PFN
> +	 * (This is only a problem on very small devices <= 4M,
> +	 *  otherwise fdisk will align on 1M. Regardless this call
> +	 *  is harmless)
> +	 */
> +	blk_queue_physical_block_size(disk->queue, PAGE_SIZE);
>   

Maybe converting the comment to refer to 'PAGE_SIZE' instead of 4k while 
you're at it ...

>   	/* Tell the block layer that this is not a rotational device */
> -	blk_queue_flag_set(QUEUE_FLAG_NONROT, brd->brd_queue);
> -	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, brd->brd_queue);
> +	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
> +	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, disk->queue);
> +	add_disk(disk);
> +	list_add_tail(&brd->brd_list, &brd_devices);
>   
> -	return brd;
> +	return 0;
>   
> -out_free_queue:
> -	blk_cleanup_queue(brd->brd_queue);
>   out_free_dev:
>   	kfree(brd);
> -out:
> -	return NULL;
> -}
> -
> -static void brd_free(struct brd_device *brd)
> -{
> -	put_disk(brd->brd_disk);
> -	blk_cleanup_queue(brd->brd_queue);
> -	brd_free_pages(brd);
> -	kfree(brd);
> +	return -ENOMEM;
>   }
>   
>   static void brd_probe(dev_t dev)
>   {
> -	struct brd_device *brd;
>   	int i = MINOR(dev) / max_part;
> +	struct brd_device *brd;
>   
>   	mutex_lock(&brd_devices_mutex);
>   	list_for_each_entry(brd, &brd_devices, brd_list) {
> @@ -445,13 +434,7 @@ static void brd_probe(dev_t dev)
>   			goto out_unlock;
>   	}
>   
> -	brd = brd_alloc(i);
> -	if (brd) {
> -		brd->brd_disk->queue = brd->brd_queue;
> -		add_disk(brd->brd_disk);
> -		list_add_tail(&brd->brd_list, &brd_devices);
> -	}
> -
> +	brd_alloc(i);
>   out_unlock:
>   	mutex_unlock(&brd_devices_mutex);
>   }
> @@ -460,7 +443,9 @@ static void brd_del_one(struct brd_device *brd)
>   {
>   	list_del(&brd->brd_list);
>   	del_gendisk(brd->brd_disk);
> -	brd_free(brd);
> +	blk_cleanup_disk(brd->brd_disk);
> +	brd_free_pages(brd);
> +	kfree(brd);
>   }
>   
>   static inline void brd_check_and_reset_par(void)
> @@ -485,7 +470,7 @@ static inline void brd_check_and_reset_par(void)
>   static int __init brd_init(void)
>   {
>   	struct brd_device *brd, *next;
> -	int i;
> +	int err, i;
>   
>   	/*
>   	 * brd module now has a feature to instantiate underlying device
> @@ -511,22 +496,11 @@ static int __init brd_init(void)
>   
>   	mutex_lock(&brd_devices_mutex);
>   	for (i = 0; i < rd_nr; i++) {
> -		brd = brd_alloc(i);
> -		if (!brd)
> +		err = brd_alloc(i);
> +		if (err)
>   			goto out_free;
> -		list_add_tail(&brd->brd_list, &brd_devices);
>   	}
>   
> -	/* point of no return */
> -
> -	list_for_each_entry(brd, &brd_devices, brd_list) {
> -		/*
> -		 * associate with queue just before adding disk for
> -		 * avoiding to mess up failure path
> -		 */
> -		brd->brd_disk->queue = brd->brd_queue;
> -		add_disk(brd->brd_disk);
> -	}
>   	mutex_unlock(&brd_devices_mutex);
>   
>   	pr_info("brd: module loaded\n");
> @@ -535,15 +509,13 @@ static int __init brd_init(void)
>   out_free:
>   	debugfs_remove_recursive(brd_debugfs_dir);
>   
> -	list_for_each_entry_safe(brd, next, &brd_devices, brd_list) {
> -		list_del(&brd->brd_list);
> -		brd_free(brd);
> -	}
> +	list_for_each_entry_safe(brd, next, &brd_devices, brd_list)
> +		brd_del_one(brd);
>   	mutex_unlock(&brd_devices_mutex);
>   	unregister_blkdev(RAMDISK_MAJOR, "ramdisk");
>   
>   	pr_info("brd: module NOT loaded !!!\n");
> -	return -ENOMEM;
> +	return err;
>   }
>   
>   static void __exit brd_exit(void)
> 
Other than that:

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
