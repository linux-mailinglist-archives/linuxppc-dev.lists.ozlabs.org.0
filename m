Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8F38DA08
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 10:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FntQ73kKxz3bs4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 18:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bmLKYtBm;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TpSTAzMP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=hare@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bmLKYtBm; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TpSTAzMP; 
 dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FntPd53Cvz2xfm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 18:12:53 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621757571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QPb9JWvY5Mv2CQaqhfS/CQ9rp49Qt1b0dGLtKqWAHI=;
 b=bmLKYtBm8+NBy0rlZh5vgGqGnuUZQLXD5BUZHEsC9KLWeRov/Kd6myZf3F/3Hji8xMjQ4e
 XjNGXj+P/iVCSJDfUijcHK/6GnQs8Q24V+00sjOXcvV369Y7JMbEdHVZbnUo2wP5SwFvtR
 NE9Ud+kiuo+RtjyO7YO79/Vtotp8i1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621757571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QPb9JWvY5Mv2CQaqhfS/CQ9rp49Qt1b0dGLtKqWAHI=;
 b=TpSTAzMPXkVgQoDLdk+dThL13YkgxTUpmMsPvWCAi0674zr0yAyJez4vAZgVjbOQTqHQTY
 aFmfGWmflFT7I3Ag==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 009B9AC3A;
 Sun, 23 May 2021 08:12:51 +0000 (UTC)
Subject: Re: [PATCH 14/26] md: convert to blk_alloc_disk/blk_cleanup_disk
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
 <20210521055116.1053587-15-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e65de9e6-337c-3e41-b5c2-d033ff236582@suse.de>
Date: Sun, 23 May 2021 10:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-15-hch@lst.de>
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
> Convert the md driver to use the blk_alloc_disk and blk_cleanup_disk
> helpers to simplify gendisk and request_queue allocation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/md/md.c | 25 +++++++++----------------
>   1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 49f897fbb89b..d806be8cc210 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -5598,12 +5598,10 @@ static void md_free(struct kobject *ko)
>   	if (mddev->sysfs_level)
>   		sysfs_put(mddev->sysfs_level);
>   
> -	if (mddev->gendisk)
> +	if (mddev->gendisk) {
>   		del_gendisk(mddev->gendisk);
> -	if (mddev->queue)
> -		blk_cleanup_queue(mddev->queue);
> -	if (mddev->gendisk)
> -		put_disk(mddev->gendisk);
> +		blk_cleanup_disk(mddev->gendisk);
> +	}
>   	percpu_ref_exit(&mddev->writes_pending);
>   
>   	bioset_exit(&mddev->bio_set);
> @@ -5711,20 +5709,13 @@ static int md_alloc(dev_t dev, char *name)
>   		goto abort;
>   
>   	error = -ENOMEM;
> -	mddev->queue = blk_alloc_queue(NUMA_NO_NODE);
> -	if (!mddev->queue)
> +	disk = blk_alloc_disk(NUMA_NO_NODE);
> +	if (!disk)
>   		goto abort;
>   
> -	blk_set_stacking_limits(&mddev->queue->limits);
> -
> -	disk = alloc_disk(1 << shift);
> -	if (!disk) {
> -		blk_cleanup_queue(mddev->queue);
> -		mddev->queue = NULL;
> -		goto abort;
> -	}
>   	disk->major = MAJOR(mddev->unit);
>   	disk->first_minor = unit << shift;
> +	disk->minors = 1 << shift;
>   	if (name)
>   		strcpy(disk->disk_name, name);
>   	else if (partitioned)
> @@ -5733,7 +5724,9 @@ static int md_alloc(dev_t dev, char *name)
>   		sprintf(disk->disk_name, "md%d", unit);
>   	disk->fops = &md_fops;
>   	disk->private_data = mddev;
> -	disk->queue = mddev->queue;
> +
> +	mddev->queue = disk->queue;
> +	blk_set_stacking_limits(&mddev->queue->limits);
>   	blk_queue_write_cache(mddev->queue, true, true);
>   	/* Allow extended partitions.  This makes the
>   	 * 'mdp' device redundant, but we can't really
> 
Wouldn't it make sense to introduce a helper 'blk_queue_from_disk()' or 
somesuch to avoid having to keep an explicit 'queue' pointer?


Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
