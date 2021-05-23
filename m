Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319238D9FC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 10:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FntMW74Vsz30L4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 18:11:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D1NxWkYm;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=er1d+U01;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=hare@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D1NxWkYm; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=er1d+U01; 
 dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FntM345XCz2xfm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 18:10:39 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621757436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6ZAhxnlslJAzzx7sKAzPpcSbekXBLAV3/YPtrS6OLY=;
 b=D1NxWkYmjMQpRiSLlKY8Sja0G/IpCIx6G/gcHzmCMSOHVzwjfIe5W+xcM9lcW/dMxuvn6J
 GX9L8uskVnxXEmhBzlzW/erIxAktXG6bzgw2aEH1RbZTk0dusDk3QXHn4Y/CDQ3r1VNe4S
 ZEYuEFIXysdiuYaC/dwFArCRQpU9tfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621757436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6ZAhxnlslJAzzx7sKAzPpcSbekXBLAV3/YPtrS6OLY=;
 b=er1d+U01C9aUpwZ6Y7V+oivz26INFThTuDK5a2cmXuzpBgQNZaStW/8o6Izga5eq8QPu/J
 kmLlzNehZilQrADA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FA31AB6D;
 Sun, 23 May 2021 08:10:36 +0000 (UTC)
Subject: Re: [PATCH 13/26] dm: convert to blk_alloc_disk/blk_cleanup_disk
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
 <20210521055116.1053587-14-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <de3b0976-1299-17d8-240a-2ecd8b9fbc2d@suse.de>
Date: Sun, 23 May 2021 10:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-14-hch@lst.de>
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
> Convert the dm driver to use the blk_alloc_disk and blk_cleanup_disk
> helpers to simplify gendisk and request_queue allocation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/md/dm.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index ca2aedd8ee7d..3c7c2d257018 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1801,13 +1801,13 @@ static void cleanup_mapped_device(struct mapped_device *md)
>   		md->disk->private_data = NULL;
>   		spin_unlock(&_minor_lock);
>   		del_gendisk(md->disk);
> -		put_disk(md->disk);
>   	}
>   
> -	if (md->queue) {
> +	if (md->queue)
>   		dm_queue_destroy_keyslot_manager(md->queue);
> -		blk_cleanup_queue(md->queue);
> -	}
> +
> +	if (md->disk)
> +		blk_cleanup_disk(md->disk);
>   
>   	cleanup_srcu_struct(&md->io_barrier);
>   

Can't these conditionals be merged into a single 'if (md->disk)'?
Eg like:

	if (md->disk) {
		spin_lock(&_minor_lock);
		md->disk->private_data = NULL;
		spin_unlock(&_minor_lock);
		del_gendisk(md->disk);
		dm_queue_destroy_keyslot_manager(md->queue);
		blk_cleanup_disk(md->queue);
	}

We're now always allocating 'md->disk' and 'md->queue' together,
so how can we end up in a situation where one is set without the other?

> @@ -1869,13 +1869,10 @@ static struct mapped_device *alloc_dev(int minor)
>   	 * established. If request-based table is loaded: blk-mq will
>   	 * override accordingly.
>   	 */
> -	md->queue = blk_alloc_queue(numa_node_id);
> -	if (!md->queue)
> -		goto bad;
> -
> -	md->disk = alloc_disk_node(1, md->numa_node_id);
> +	md->disk = blk_alloc_disk(md->numa_node_id);
>   	if (!md->disk)
>   		goto bad;
> +	md->queue = md->disk->queue;
>   
>   	init_waitqueue_head(&md->wait);
>   	INIT_WORK(&md->work, dm_wq_work);
> @@ -1888,6 +1885,7 @@ static struct mapped_device *alloc_dev(int minor)
>   
>   	md->disk->major = _major;
>   	md->disk->first_minor = minor;
> +	md->disk->minors = 1;
>   	md->disk->fops = &dm_blk_dops;
>   	md->disk->queue = md->queue;
>   	md->disk->private_data = md;
> 
Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
