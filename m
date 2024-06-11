Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D61903841
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 11:58:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz3z93C5Tz3cbw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 19:58:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=hare@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz3ym3T2Sz30T7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 19:58:23 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B119320601;
	Tue, 11 Jun 2024 09:58:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 565AB13A55;
	Tue, 11 Jun 2024 09:58:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Igo1E7wfaGa8fAAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 11 Jun 2024 09:58:20 +0000
Message-ID: <34a7b2a4-b0cb-4580-85c9-b598fd70449e@suse.de>
Date: Tue, 11 Jun 2024 11:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] block: move cache control settings out of
 queue->flags
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-14-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240611051929.513387-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: B119320601
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/24 07:19, Christoph Hellwig wrote:
> Move the cache control settings into the queue_limits so that they
> can be set atomically and all I/O is frozen when changing the
> flags.
> 
> Add new features and flags field for the driver set flags, and internal
> (usually sysfs-controlled) flags in the block layer.  Note that we'll
> eventually remove enough field from queue_limits to bring it back to the
> previous size.
> 
> The disable flag is inverted compared to the previous meaning, which
> means it now survives a rescan, similar to the max_sectors and
> max_discard_sectors user limits.
> 
> The FLUSH and FUA flags are now inherited by blk_stack_limits, which
> simplified the code in dm a lot, but also causes a slight behavior
> change in that dm-switch and dm-unstripe now advertise a write cache
> despite setting num_flush_bios to 0.  The I/O path will handle this
> gracefully, but as far as I can tell the lack of num_flush_bios
> and thus flush support is a pre-existing data integrity bug in those
> targets that really needs fixing, after which a non-zero num_flush_bios
> should be required in dm for targets that map to underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   .../block/writeback_cache_control.rst         | 67 +++++++++++--------
>   arch/um/drivers/ubd_kern.c                    |  2 +-
>   block/blk-core.c                              |  2 +-
>   block/blk-flush.c                             |  9 ++-
>   block/blk-mq-debugfs.c                        |  2 -
>   block/blk-settings.c                          | 29 ++------
>   block/blk-sysfs.c                             | 29 +++++---
>   block/blk-wbt.c                               |  4 +-
>   drivers/block/drbd/drbd_main.c                |  2 +-
>   drivers/block/loop.c                          |  9 +--
>   drivers/block/nbd.c                           | 14 ++--
>   drivers/block/null_blk/main.c                 | 12 ++--
>   drivers/block/ps3disk.c                       |  7 +-
>   drivers/block/rnbd/rnbd-clt.c                 | 10 +--
>   drivers/block/ublk_drv.c                      |  8 ++-
>   drivers/block/virtio_blk.c                    | 20 ++++--
>   drivers/block/xen-blkfront.c                  |  9 ++-
>   drivers/md/bcache/super.c                     |  7 +-
>   drivers/md/dm-table.c                         | 39 +++--------
>   drivers/md/md.c                               |  8 ++-
>   drivers/mmc/core/block.c                      | 42 ++++++------
>   drivers/mmc/core/queue.c                      | 12 ++--
>   drivers/mmc/core/queue.h                      |  3 +-
>   drivers/mtd/mtd_blkdevs.c                     |  5 +-
>   drivers/nvdimm/pmem.c                         |  4 +-
>   drivers/nvme/host/core.c                      |  7 +-
>   drivers/nvme/host/multipath.c                 |  6 --
>   drivers/scsi/sd.c                             | 28 +++++---
>   include/linux/blkdev.h                        | 38 +++++++++--
>   29 files changed, 227 insertions(+), 207 deletions(-)
> 
> diff --git a/Documentation/block/writeback_cache_control.rst b/Documentation/block/writeback_cache_control.rst
> index b208488d0aae85..9cfe27f90253c7 100644
> --- a/Documentation/block/writeback_cache_control.rst
> +++ b/Documentation/block/writeback_cache_control.rst
> @@ -46,41 +46,50 @@ worry if the underlying devices need any explicit cache flushing and how
>   the Forced Unit Access is implemented.  The REQ_PREFLUSH and REQ_FUA flags
>   may both be set on a single bio.
>   
> +Feature settings for block drivers
> +----------------------------------
>   
> -Implementation details for bio based block drivers
> ---------------------------------------------------------------
> +For devices that do not support volatile write caches there is no driver
> +support required, the block layer completes empty REQ_PREFLUSH requests before
> +entering the driver and strips off the REQ_PREFLUSH and REQ_FUA bits from
> +requests that have a payload.
>   
> -These drivers will always see the REQ_PREFLUSH and REQ_FUA bits as they sit
> -directly below the submit_bio interface.  For remapping drivers the REQ_FUA
> -bits need to be propagated to underlying devices, and a global flush needs
> -to be implemented for bios with the REQ_PREFLUSH bit set.  For real device
> -drivers that do not have a volatile cache the REQ_PREFLUSH and REQ_FUA bits
> -on non-empty bios can simply be ignored, and REQ_PREFLUSH requests without
> -data can be completed successfully without doing any work.  Drivers for
> -devices with volatile caches need to implement the support for these
> -flags themselves without any help from the block layer.
> +For devices with volatile write caches the driver needs to tell the block layer
> +that it supports flushing caches by setting the
>   
> +   BLK_FEAT_WRITE_CACHE
>   
> -Implementation details for request_fn based block drivers
> ----------------------------------------------------------
> +flag in the queue_limits feature field.  For devices that also support the FUA
> +bit the block layer needs to be told to pass on the REQ_FUA bit by also setting
> +the
>   
> -For devices that do not support volatile write caches there is no driver
> -support required, the block layer completes empty REQ_PREFLUSH requests before
> -entering the driver and strips off the REQ_PREFLUSH and REQ_FUA bits from
> -requests that have a payload.  For devices with volatile write caches the
> -driver needs to tell the block layer that it supports flushing caches by
> -doing::
> +   BLK_FEAT_FUA
> +
> +flag in the features field of the queue_limits structure.
> +
> +Implementation details for bio based block drivers
> +--------------------------------------------------
> +
> +For bio based drivers the REQ_PREFLUSH and REQ_FUA bit are simplify passed on
> +to the driver if the drivers sets the BLK_FEAT_WRITE_CACHE flag and the drivers
> +needs to handle them.
> +
> +*NOTE*: The REQ_FUA bit also gets passed on when the BLK_FEAT_FUA flags is
> +_not_ set.  Any bio based driver that sets BLK_FEAT_WRITE_CACHE also needs to
> +handle REQ_FUA.
>   
> -	blk_queue_write_cache(sdkp->disk->queue, true, false);
> +For remapping drivers the REQ_FUA bits need to be propagated to underlying
> +devices, and a global flush needs to be implemented for bios with the
> +REQ_PREFLUSH bit set.
>   
> -and handle empty REQ_OP_FLUSH requests in its prep_fn/request_fn.  Note that
> -REQ_PREFLUSH requests with a payload are automatically turned into a sequence
> -of an empty REQ_OP_FLUSH request followed by the actual write by the block
> -layer.  For devices that also support the FUA bit the block layer needs
> -to be told to pass through the REQ_FUA bit using::
> +Implementation details for blk-mq drivers
> +-----------------------------------------
>   
> -	blk_queue_write_cache(sdkp->disk->queue, true, true);
> +When the BLK_FEAT_WRITE_CACHE flag is set, REQ_OP_WRITE | REQ_PREFLUSH requests
> +with a payload are automatically turned into a sequence of a REQ_OP_FLUSH
> +request followed by the actual write by the block layer.
>   
> -and the driver must handle write requests that have the REQ_FUA bit set
> -in prep_fn/request_fn.  If the FUA bit is not natively supported the block
> -layer turns it into an empty REQ_OP_FLUSH request after the actual write.
> +When the BLK_FEA_FUA flags is set, the REQ_FUA bit simplify passed on for the
> +REQ_OP_WRITE request, else a REQ_OP_FLUSH request is sent by the block layer
> +after the completion of the write request for bio submissions with the REQ_FUA
> +bit set.
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index cdcb75a68989dd..19e01691ea0ea7 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -835,6 +835,7 @@ static int ubd_add(int n, char **error_out)
>   	struct queue_limits lim = {
>   		.max_segments		= MAX_SG,
>   		.seg_boundary_mask	= PAGE_SIZE - 1,
> +		.features		= BLK_FEAT_WRITE_CACHE,
>   	};
>   	struct gendisk *disk;
>   	int err = 0;
> @@ -882,7 +883,6 @@ static int ubd_add(int n, char **error_out)
>   	}
>   
>   	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
> -	blk_queue_write_cache(disk->queue, true, false);
>   	disk->major = UBD_MAJOR;
>   	disk->first_minor = n << UBD_SHIFT;
>   	disk->minors = 1 << UBD_SHIFT;
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 82c3ae22d76d88..2b45a4df9a1aa1 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -782,7 +782,7 @@ void submit_bio_noacct(struct bio *bio)
>   		if (WARN_ON_ONCE(bio_op(bio) != REQ_OP_WRITE &&
>   				 bio_op(bio) != REQ_OP_ZONE_APPEND))
>   			goto end_io;
> -		if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
> +		if (!bdev_write_cache(bdev)) {
>   			bio->bi_opf &= ~(REQ_PREFLUSH | REQ_FUA);
>   			if (!bio_sectors(bio)) {
>   				status = BLK_STS_OK;
> diff --git a/block/blk-flush.c b/block/blk-flush.c
> index 2234f8b3fc05f2..30b9d5033a2b85 100644
> --- a/block/blk-flush.c
> +++ b/block/blk-flush.c
> @@ -381,8 +381,8 @@ static void blk_rq_init_flush(struct request *rq)
>   bool blk_insert_flush(struct request *rq)
>   {
>   	struct request_queue *q = rq->q;
> -	unsigned long fflags = q->queue_flags;	/* may change, cache */
>   	struct blk_flush_queue *fq = blk_get_flush_queue(q, rq->mq_ctx);
> +	bool supports_fua = q->limits.features & BLK_FEAT_FUA;

Shouldn't we have a helper like blk_feat_fua() here?

>   	unsigned int policy = 0;
>   
>   	/* FLUSH/FUA request must never be merged */
> @@ -394,11 +394,10 @@ bool blk_insert_flush(struct request *rq)
>   	/*
>   	 * Check which flushes we need to sequence for this operation.
>   	 */
> -	if (fflags & (1UL << QUEUE_FLAG_WC)) {
> +	if (blk_queue_write_cache(q)) {
>   		if (rq->cmd_flags & REQ_PREFLUSH)
>   			policy |= REQ_FSEQ_PREFLUSH;
> -		if (!(fflags & (1UL << QUEUE_FLAG_FUA)) &&
> -		    (rq->cmd_flags & REQ_FUA))
> +		if ((rq->cmd_flags & REQ_FUA) && !supports_fua)
>   			policy |= REQ_FSEQ_POSTFLUSH;
>   	}
>   
> @@ -407,7 +406,7 @@ bool blk_insert_flush(struct request *rq)
>   	 * REQ_PREFLUSH and FUA for the driver.
>   	 */
>   	rq->cmd_flags &= ~REQ_PREFLUSH;
> -	if (!(fflags & (1UL << QUEUE_FLAG_FUA)))
> +	if (!supports_fua)
>   		rq->cmd_flags &= ~REQ_FUA;
>   
>   	/*
> diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
> index 770c0c2b72faaa..e8b9db7c30c455 100644
> --- a/block/blk-mq-debugfs.c
> +++ b/block/blk-mq-debugfs.c
> @@ -93,8 +93,6 @@ static const char *const blk_queue_flag_name[] = {
>   	QUEUE_FLAG_NAME(INIT_DONE),
>   	QUEUE_FLAG_NAME(STABLE_WRITES),
>   	QUEUE_FLAG_NAME(POLL),
> -	QUEUE_FLAG_NAME(WC),
> -	QUEUE_FLAG_NAME(FUA),
>   	QUEUE_FLAG_NAME(DAX),
>   	QUEUE_FLAG_NAME(STATS),
>   	QUEUE_FLAG_NAME(REGISTERED),
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index f11c8676eb4c67..536ee202fcdccb 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -261,6 +261,9 @@ static int blk_validate_limits(struct queue_limits *lim)
>   		lim->misaligned = 0;
>   	}
>   
> +	if (!(lim->features & BLK_FEAT_WRITE_CACHE))
> +		lim->features &= ~BLK_FEAT_FUA;
> +
>   	err = blk_validate_integrity_limits(lim);
>   	if (err)
>   		return err;
> @@ -454,6 +457,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>   {
>   	unsigned int top, bottom, alignment, ret = 0;
>   
> +	t->features |= (b->features & BLK_FEAT_INHERIT_MASK);
> +
>   	t->max_sectors = min_not_zero(t->max_sectors, b->max_sectors);
>   	t->max_user_sectors = min_not_zero(t->max_user_sectors,
>   			b->max_user_sectors);
> @@ -711,30 +716,6 @@ void blk_set_queue_depth(struct request_queue *q, unsigned int depth)
>   }
>   EXPORT_SYMBOL(blk_set_queue_depth);
>   
> -/**
> - * blk_queue_write_cache - configure queue's write cache
> - * @q:		the request queue for the device
> - * @wc:		write back cache on or off
> - * @fua:	device supports FUA writes, if true
> - *
> - * Tell the block layer about the write cache of @q.
> - */
> -void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
> -{
> -	if (wc) {
> -		blk_queue_flag_set(QUEUE_FLAG_HW_WC, q);
> -		blk_queue_flag_set(QUEUE_FLAG_WC, q);
> -	} else {
> -		blk_queue_flag_clear(QUEUE_FLAG_HW_WC, q);
> -		blk_queue_flag_clear(QUEUE_FLAG_WC, q);
> -	}
> -	if (fua)
> -		blk_queue_flag_set(QUEUE_FLAG_FUA, q);
> -	else
> -		blk_queue_flag_clear(QUEUE_FLAG_FUA, q);
> -}
> -EXPORT_SYMBOL_GPL(blk_queue_write_cache);
> -
>   int bdev_alignment_offset(struct block_device *bdev)
>   {
>   	struct request_queue *q = bdev_get_queue(bdev);
> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> index 5c787965b7d09e..4f524c1d5e08bd 100644
> --- a/block/blk-sysfs.c
> +++ b/block/blk-sysfs.c
> @@ -423,32 +423,41 @@ static ssize_t queue_io_timeout_store(struct request_queue *q, const char *page,
>   
>   static ssize_t queue_wc_show(struct request_queue *q, char *page)
>   {
> -	if (test_bit(QUEUE_FLAG_WC, &q->queue_flags))
> -		return sprintf(page, "write back\n");
> -
> -	return sprintf(page, "write through\n");
> +	if (q->limits.features & BLK_FLAGS_WRITE_CACHE_DISABLED)

Where is the difference between 'flags' and 'features'?
Ie why is is named BLK_FEAT_FUA but BLK_FLAGS_WRITE_CACHE_DISABLED?
And if the feature is the existence of a capability, and the flag is
the setting of that capability, can you make it clear in the documentation?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

