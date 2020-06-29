Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC420DCF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 22:45:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wfdq02JHzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 06:45:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+0d14f5278154a06d8b22+6154+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=jp2//oEP; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wdBY1dL8zDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 05:40:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3KtfeNzZdLsCnAjCvxW1DBD4WxMV4ZDQlQSI8d7Mwk4=; b=jp2//oEPcVIAhsxPrq8qBuXVAq
 xKf75K0mzRfxbpQc+ng43aPk2ilI52qaJBFdd1MjZQCouKkXKHuQCFqXxuIpW0bmNRR1W1ejaiMln
 NrR/GC5GstjpyJH0n3UWI1/70m9n0EgltZt41m0kPzvh/1h1457cqDGnG8HNCoG4hJIUWEpw3ixb0
 jXWYP/kRvK76nR3LcEZwmb4mpChZle+dNFFPV7Wxz6xd07YzuxDxaC6V6X8dnF6zdlgHfInEfpGRi
 pqGat6fkY/XZaWo+GtU36a3/r3Djgweo223/eql7RiOVhfPbiTzC40AZ9bLD8EOSKmQFb5a7Njhn3
 +nT5fD8Q==;
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpzdf-0004Ng-5x; Mon, 29 Jun 2020 19:40:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 17/20] block: rename generic_make_request to submit_bio_noacct
Date: Mon, 29 Jun 2020 21:39:44 +0200
Message-Id: <20200629193947.2705954-18-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

generic_make_request has always been very confusingly misnamed, so rename
it to submit_bio_noacct to make it clear that it is submit_bio minus
accounting and a few checks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/block/biodoc.rst                |  2 +-
 .../fault-injection/fault-injection.rst       |  2 +-
 Documentation/trace/ftrace.rst                |  4 +--
 block/bio.c                                   | 14 +++++-----
 block/blk-core.c                              | 23 ++++++++-------
 block/blk-crypto-fallback.c                   |  2 +-
 block/blk-crypto.c                            |  2 +-
 block/blk-merge.c                             |  2 +-
 block/blk-throttle.c                          |  4 +--
 block/bounce.c                                |  2 +-
 drivers/block/drbd/drbd_int.h                 |  6 ++--
 drivers/block/drbd/drbd_main.c                |  2 +-
 drivers/block/drbd/drbd_receiver.c            |  2 +-
 drivers/block/drbd/drbd_req.c                 |  2 +-
 drivers/block/drbd/drbd_worker.c              |  2 +-
 drivers/block/pktcdvd.c                       |  2 +-
 drivers/lightnvm/pblk-read.c                  |  2 +-
 drivers/md/bcache/bcache.h                    |  2 +-
 drivers/md/bcache/btree.c                     |  2 +-
 drivers/md/bcache/request.c                   |  7 ++---
 drivers/md/dm-cache-target.c                  |  6 ++--
 drivers/md/dm-clone-target.c                  | 10 +++----
 drivers/md/dm-crypt.c                         |  6 ++--
 drivers/md/dm-delay.c                         |  2 +-
 drivers/md/dm-era-target.c                    |  2 +-
 drivers/md/dm-integrity.c                     |  4 +--
 drivers/md/dm-mpath.c                         |  2 +-
 drivers/md/dm-raid1.c                         |  2 +-
 drivers/md/dm-snap-persistent.c               |  2 +-
 drivers/md/dm-snap.c                          |  6 ++--
 drivers/md/dm-thin.c                          |  4 +--
 drivers/md/dm-verity-target.c                 |  2 +-
 drivers/md/dm-writecache.c                    |  2 +-
 drivers/md/dm-zoned-target.c                  |  2 +-
 drivers/md/dm.c                               | 10 +++----
 drivers/md/md-faulty.c                        |  4 +--
 drivers/md/md-linear.c                        |  4 +--
 drivers/md/md-multipath.c                     |  4 +--
 drivers/md/raid0.c                            |  8 +++---
 drivers/md/raid1.c                            | 14 +++++-----
 drivers/md/raid10.c                           | 28 +++++++++----------
 drivers/md/raid5.c                            | 10 +++----
 drivers/nvme/host/multipath.c                 |  2 +-
 include/linux/blkdev.h                        |  2 +-
 44 files changed, 111 insertions(+), 113 deletions(-)

diff --git a/Documentation/block/biodoc.rst b/Documentation/block/biodoc.rst
index 267384159bf793..afda5e30a82e5a 100644
--- a/Documentation/block/biodoc.rst
+++ b/Documentation/block/biodoc.rst
@@ -1036,7 +1036,7 @@ Now the generic block layer performs partition-remapping early and thus
 provides drivers with a sector number relative to whole device, rather than
 having to take partition number into account in order to arrive at the true
 sector number. The routine blk_partition_remap() is invoked by
-generic_make_request even before invoking the queue specific ->submit_bio,
+submit_bio_noacct even before invoking the queue specific ->submit_bio,
 so the i/o scheduler also gets to operate on whole disk sector numbers. This
 should typically not require changes to block drivers, it just never gets
 to invoke its own partition sector offset calculations since all bios
diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index f51bb21d20e44b..f850ad018b70a8 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -24,7 +24,7 @@ Available fault injection capabilities
 
   injects disk IO errors on devices permitted by setting
   /sys/block/<device>/make-it-fail or
-  /sys/block/<device>/<partition>/make-it-fail. (generic_make_request())
+  /sys/block/<device>/<partition>/make-it-fail. (submit_bio_noacct())
 
 - fail_mmc_request
 
diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 430a16283103d4..80ba765a82379e 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -1453,7 +1453,7 @@ function-trace, we get a much larger output::
    => __blk_run_queue_uncond
    => __blk_run_queue
    => blk_queue_bio
-   => generic_make_request
+   => submit_bio_noacct
    => submit_bio
    => submit_bh
    => __ext3_get_inode_loc
@@ -1738,7 +1738,7 @@ tracers.
    => __blk_run_queue_uncond
    => __blk_run_queue
    => blk_queue_bio
-   => generic_make_request
+   => submit_bio_noacct
    => submit_bio
    => submit_bh
    => ext3_bread
diff --git a/block/bio.c b/block/bio.c
index fc1299f9d86a24..ef91782fd668ce 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -358,7 +358,7 @@ static void bio_alloc_rescue(struct work_struct *work)
 		if (!bio)
 			break;
 
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 	}
 }
 
@@ -416,19 +416,19 @@ static void punt_bios_to_rescuer(struct bio_set *bs)
  *   submit the previously allocated bio for IO before attempting to allocate
  *   a new one. Failure to do so can cause deadlocks under memory pressure.
  *
- *   Note that when running under generic_make_request() (i.e. any block
+ *   Note that when running under submit_bio_noacct() (i.e. any block
  *   driver), bios are not submitted until after you return - see the code in
- *   generic_make_request() that converts recursion into iteration, to prevent
+ *   submit_bio_noacct() that converts recursion into iteration, to prevent
  *   stack overflows.
  *
  *   This would normally mean allocating multiple bios under
- *   generic_make_request() would be susceptible to deadlocks, but we have
+ *   submit_bio_noacct() would be susceptible to deadlocks, but we have
  *   deadlock avoidance code that resubmits any blocked bios from a rescuer
  *   thread.
  *
  *   However, we do not guarantee forward progress for allocations from other
  *   mempools. Doing multiple allocations from the same mempool under
- *   generic_make_request() should be avoided - instead, use bio_set's front_pad
+ *   submit_bio_noacct() should be avoided - instead, use bio_set's front_pad
  *   for per bio allocations.
  *
  *   RETURNS:
@@ -457,14 +457,14 @@ struct bio *bio_alloc_bioset(gfp_t gfp_mask, unsigned int nr_iovecs,
 				 nr_iovecs > 0))
 			return NULL;
 		/*
-		 * generic_make_request() converts recursion to iteration; this
+		 * submit_bio_noacct() converts recursion to iteration; this
 		 * means if we're running beneath it, any bios we allocate and
 		 * submit will not be submitted (and thus freed) until after we
 		 * return.
 		 *
 		 * This exposes us to a potential deadlock if we allocate
 		 * multiple bios from the same bio_set() while running
-		 * underneath generic_make_request(). If we were to allocate
+		 * underneath submit_bio_noacct(). If we were to allocate
 		 * multiple bios (say a stacking block driver that was splitting
 		 * bios), we would deadlock if we exhausted the mempool's
 		 * reserve.
diff --git a/block/blk-core.c b/block/blk-core.c
index cb07a726dd7117..1caeb01e127768 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -956,8 +956,7 @@ static inline blk_status_t blk_check_zone_append(struct request_queue *q,
 	return BLK_STS_OK;
 }
 
-static noinline_for_stack bool
-generic_make_request_checks(struct bio *bio)
+static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 {
 	struct request_queue *q = bio->bi_disk->queue;
 	blk_status_t status = BLK_STS_IOERR;
@@ -1087,7 +1086,7 @@ static blk_qc_t do_make_request(struct bio *bio)
 }
 
 /**
- * generic_make_request - re-submit a bio to the block device layer for I/O
+ * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
  *
  * This is a version of submit_bio() that shall only be used for I/O that is
@@ -1095,7 +1094,7 @@ static blk_qc_t do_make_request(struct bio *bio)
  * systems and other upper level users of the block layer should use
  * submit_bio() instead.
  */
-blk_qc_t generic_make_request(struct bio *bio)
+blk_qc_t submit_bio_noacct(struct bio *bio)
 {
 	/*
 	 * bio_list_on_stack[0] contains bios submitted by the current
@@ -1106,7 +1105,7 @@ blk_qc_t generic_make_request(struct bio *bio)
 	struct bio_list bio_list_on_stack[2];
 	blk_qc_t ret = BLK_QC_T_NONE;
 
-	if (!generic_make_request_checks(bio))
+	if (!submit_bio_checks(bio))
 		goto out;
 
 	/*
@@ -1114,7 +1113,7 @@ blk_qc_t generic_make_request(struct bio *bio)
 	 * stack usage with stacked devices could be a problem.  So use
 	 * current->bio_list to keep a list of requests submited by a
 	 * ->submit_bio method.  current->bio_list is also used as a
-	 * flag to say if generic_make_request is currently active in this
+	 * flag to say if submit_bio_noacct is currently active in this
 	 * task or not.  If it is NULL, then no make_request is active.  If
 	 * it is non-NULL, then a make_request is active, and new requests
 	 * should be added at the tail
@@ -1132,7 +1131,7 @@ blk_qc_t generic_make_request(struct bio *bio)
 	 * we assign bio_list to a pointer to the bio_list_on_stack,
 	 * thus initialising the bio_list of new bios to be
 	 * added.  ->submit_bio() may indeed add some more bios
-	 * through a recursive call to generic_make_request.  If it
+	 * through a recursive call to submit_bio_noacct.  If it
 	 * did, we find a non-NULL value in bio_list and re-enter the loop
 	 * from the top.  In this case we really did just take the bio
 	 * of the top of the list (no pretending) and so remove it from
@@ -1174,13 +1173,13 @@ blk_qc_t generic_make_request(struct bio *bio)
 out:
 	return ret;
 }
-EXPORT_SYMBOL(generic_make_request);
+EXPORT_SYMBOL(submit_bio_noacct);
 
 /**
  * direct_make_request - hand a buffer directly to its device driver for I/O
  * @bio:  The bio describing the location in memory and on the device.
  *
- * This function behaves like generic_make_request(), but does not protect
+ * This function behaves like submit_bio_noacct(), but does not protect
  * against recursion.  Must only be used if the called driver is known
  * to be blk-mq based.
  */
@@ -1192,7 +1191,7 @@ blk_qc_t direct_make_request(struct bio *bio)
 		bio_io_error(bio);
 		return BLK_QC_T_NONE;
 	}
-	if (!generic_make_request_checks(bio))
+	if (!submit_bio_checks(bio))
 		return BLK_QC_T_NONE;
 	if (unlikely(bio_queue_enter(bio)))
 		return BLK_QC_T_NONE;
@@ -1263,13 +1262,13 @@ blk_qc_t submit_bio(struct bio *bio)
 		blk_qc_t ret;
 
 		psi_memstall_enter(&pflags);
-		ret = generic_make_request(bio);
+		ret = submit_bio_noacct(bio);
 		psi_memstall_leave(&pflags);
 
 		return ret;
 	}
 
-	return generic_make_request(bio);
+	return submit_bio_noacct(bio);
 }
 EXPORT_SYMBOL(submit_bio);
 
diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index 6e49688a2d8023..c162b754efbd6a 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -228,7 +228,7 @@ static bool blk_crypto_split_bio_if_needed(struct bio **bio_ptr)
 			return false;
 		}
 		bio_chain(split_bio, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		*bio_ptr = split_bio;
 	}
 
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 6533c9b36ab80a..2d5e60023b08bb 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -239,7 +239,7 @@ void __blk_crypto_free_request(struct request *rq)
  * kernel crypto API. When the crypto API fallback is used for encryption,
  * blk-crypto may choose to split the bio into 2 - the first one that will
  * continue to be processed and the second one that will be resubmitted via
- * generic_make_request. A bounce bio will be allocated to encrypt the contents
+ * submit_bio_noacct. A bounce bio will be allocated to encrypt the contents
  * of the aforementioned "first one", and *bio_ptr will be updated to this
  * bounce bio.
  *
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 20fa2290604105..5196dc14527016 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -338,7 +338,7 @@ void __blk_queue_split(struct bio **bio, unsigned int *nr_segs)
 
 		bio_chain(split, *bio);
 		trace_block_split(q, split, (*bio)->bi_iter.bi_sector);
-		generic_make_request(*bio);
+		submit_bio_noacct(*bio);
 		*bio = split;
 	}
 }
diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index ad37043297ed58..fee3325edf27b9 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -1339,8 +1339,8 @@ static void blk_throtl_dispatch_work_fn(struct work_struct *work)
 
 	if (!bio_list_empty(&bio_list_on_stack)) {
 		blk_start_plug(&plug);
-		while((bio = bio_list_pop(&bio_list_on_stack)))
-			generic_make_request(bio);
+		while ((bio = bio_list_pop(&bio_list_on_stack)))
+			submit_bio_noacct(bio);
 		blk_finish_plug(&plug);
 	}
 }
diff --git a/block/bounce.c b/block/bounce.c
index c3aaed07012467..431be88a024050 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -309,7 +309,7 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
 	if (!passthrough && sectors < bio_sectors(*bio_orig)) {
 		bio = bio_split(*bio_orig, sectors, GFP_NOIO, &bounce_bio_split);
 		bio_chain(bio, *bio_orig);
-		generic_make_request(*bio_orig);
+		submit_bio_noacct(*bio_orig);
 		*bio_orig = bio;
 	}
 	bio = bounce_clone_bio(*bio_orig, GFP_NOIO, passthrough ? NULL :
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 0327408da79c7a..fe6cb99eb91764 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1576,12 +1576,12 @@ void drbd_set_my_capacity(struct drbd_device *device, sector_t size);
 /*
  * used to submit our private bio
  */
-static inline void drbd_generic_make_request(struct drbd_device *device,
+static inline void drbd_submit_bio_noacct(struct drbd_device *device,
 					     int fault_type, struct bio *bio)
 {
 	__release(local);
 	if (!bio->bi_disk) {
-		drbd_err(device, "drbd_generic_make_request: bio->bi_disk == NULL\n");
+		drbd_err(device, "drbd_submit_bio_noacct: bio->bi_disk == NULL\n");
 		bio->bi_status = BLK_STS_IOERR;
 		bio_endio(bio);
 		return;
@@ -1590,7 +1590,7 @@ static inline void drbd_generic_make_request(struct drbd_device *device,
 	if (drbd_insert_fault(device, fault_type))
 		bio_io_error(bio);
 	else
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 }
 
 void drbd_bump_write_ordering(struct drbd_resource *resource, struct drbd_backing_dev *bdev,
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 2b05de0896e282..7c34cc0ad8ccdf 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2325,7 +2325,7 @@ static void do_retry(struct work_struct *ws)
 		 * workqueues instead.
 		 */
 
-		/* We are not just doing generic_make_request(),
+		/* We are not just doing submit_bio_noacct(),
 		 * as we want to keep the start_time information. */
 		inc_ap_bio(device);
 		__drbd_make_request(device, bio, start_jif);
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 3a3f2b6a821f39..c74f561b4eab51 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1723,7 +1723,7 @@ int drbd_submit_peer_request(struct drbd_device *device,
 		bios = bios->bi_next;
 		bio->bi_next = NULL;
 
-		drbd_generic_make_request(device, fault_type, bio);
+		drbd_submit_bio_noacct(device, fault_type, bio);
 	} while (bios);
 	return 0;
 
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index c7e14c9a6e5f83..674be09b2da94a 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1164,7 +1164,7 @@ drbd_submit_req_private_bio(struct drbd_request *req)
 		else if (bio_op(bio) == REQ_OP_DISCARD)
 			drbd_process_discard_or_zeroes_req(req, EE_TRIM);
 		else
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		put_ldev(device);
 	} else
 		bio_io_error(bio);
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 2b89c9f2ca7075..7c903de5c4e103 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1525,7 +1525,7 @@ int w_restart_disk_io(struct drbd_work *w, int cancel)
 
 	drbd_req_make_private_bio(req, req->master_bio);
 	bio_set_dev(req->private_bio, device->ldev->backing_bdev);
-	generic_make_request(req->private_bio);
+	submit_bio_noacct(req->private_bio);
 
 	return 0;
 }
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 5588bd4cd267e8..4becc1efe775fc 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -913,7 +913,7 @@ static void pkt_iosched_process_queue(struct pktcdvd_device *pd)
 		}
 
 		atomic_inc(&pd->cdrw.pending_bios);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 	}
 }
 
diff --git a/drivers/lightnvm/pblk-read.c b/drivers/lightnvm/pblk-read.c
index 140927ebf41e9a..c28537a489bc10 100644
--- a/drivers/lightnvm/pblk-read.c
+++ b/drivers/lightnvm/pblk-read.c
@@ -320,7 +320,7 @@ void pblk_submit_read(struct pblk *pblk, struct bio *bio)
 		split_bio = bio_split(bio, nr_secs * NR_PHY_IN_LOG, GFP_KERNEL,
 					&pblk_bio_set);
 		bio_chain(split_bio, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 
 		/* New bio contains first N sectors of the previous one, so
 		 * we can continue to use existing rqd, but we need to shrink
diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
index 221e0191b6870f..3c708e8b5e2d34 100644
--- a/drivers/md/bcache/bcache.h
+++ b/drivers/md/bcache/bcache.h
@@ -929,7 +929,7 @@ static inline void closure_bio_submit(struct cache_set *c,
 		bio_endio(bio);
 		return;
 	}
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 }
 
 /*
diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index 6548a601edf0e4..d5c51e33204679 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -959,7 +959,7 @@ static struct btree *mca_alloc(struct cache_set *c, struct btree_op *op,
  * bch_btree_node_get - find a btree node in the cache and lock it, reading it
  * in from disk if necessary.
  *
- * If IO is necessary and running under generic_make_request, returns -EAGAIN.
+ * If IO is necessary and running under submit_bio_noacct, returns -EAGAIN.
  *
  * The btree node will have either a read or a write lock held, depending on
  * level and op->lock.
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index fc5702b10074d6..dd012ebface012 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -1115,7 +1115,7 @@ static void detached_dev_do_request(struct bcache_device *d, struct bio *bio)
 	    !blk_queue_discard(bdev_get_queue(dc->bdev)))
 		bio->bi_end_io(bio);
 	else
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 }
 
 static void quit_max_writeback_rate(struct cache_set *c,
@@ -1197,7 +1197,7 @@ blk_qc_t cached_dev_submit_bio(struct bio *bio)
 		if (!bio->bi_iter.bi_size) {
 			/*
 			 * can't call bch_journal_meta from under
-			 * generic_make_request
+			 * submit_bio_noacct
 			 */
 			continue_at_nobarrier(&s->cl,
 					      cached_dev_nodata,
@@ -1311,8 +1311,7 @@ blk_qc_t flash_dev_submit_bio(struct bio *bio)
 
 	if (!bio->bi_iter.bi_size) {
 		/*
-		 * can't call bch_journal_meta from under
-		 * generic_make_request
+		 * can't call bch_journal_meta from under submit_bio_noacct
 		 */
 		continue_at_nobarrier(&s->cl,
 				      flash_dev_nodata,
diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index d3bb355819a421..9eccced928960a 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -886,7 +886,7 @@ static void accounted_complete(struct cache *cache, struct bio *bio)
 static void accounted_request(struct cache *cache, struct bio *bio)
 {
 	accounted_begin(cache, bio);
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 }
 
 static void issue_op(struct bio *bio, void *context)
@@ -1792,7 +1792,7 @@ static bool process_bio(struct cache *cache, struct bio *bio)
 	bool commit_needed;
 
 	if (map_bio(cache, bio, get_bio_block(cache, bio), &commit_needed) == DM_MAPIO_REMAPPED)
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 
 	return commit_needed;
 }
@@ -1858,7 +1858,7 @@ static bool process_discard_bio(struct cache *cache, struct bio *bio)
 
 	if (cache->features.discard_passdown) {
 		remap_to_origin(cache, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 	} else
 		bio_endio(bio);
 
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index 5ce96ddf1ce1eb..59ed8a67c2e34f 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -330,7 +330,7 @@ static void submit_bios(struct bio_list *bios)
 	blk_start_plug(&plug);
 
 	while ((bio = bio_list_pop(bios)))
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 
 	blk_finish_plug(&plug);
 }
@@ -346,7 +346,7 @@ static void submit_bios(struct bio_list *bios)
 static void issue_bio(struct clone *clone, struct bio *bio)
 {
 	if (!bio_triggers_commit(clone, bio)) {
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		return;
 	}
 
@@ -473,7 +473,7 @@ static void complete_discard_bio(struct clone *clone, struct bio *bio, bool succ
 		bio_region_range(clone, bio, &rs, &nr_regions);
 		trim_bio(bio, region_to_sector(clone, rs),
 			 nr_regions << clone->region_shift);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 	} else
 		bio_endio(bio);
 }
@@ -865,7 +865,7 @@ static void hydration_overwrite(struct dm_clone_region_hydration *hd, struct bio
 	bio->bi_private = hd;
 
 	atomic_inc(&hd->clone->hydrations_in_flight);
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 }
 
 /*
@@ -1281,7 +1281,7 @@ static void process_deferred_flush_bios(struct clone *clone)
 			 */
 			bio_endio(bio);
 		} else {
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		}
 	}
 }
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 000ddfab5ba058..ad324abb8c497e 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1789,7 +1789,7 @@ static int kcryptd_io_read(struct dm_crypt_io *io, gfp_t gfp)
 		return 1;
 	}
 
-	generic_make_request(clone);
+	submit_bio_noacct(clone);
 	return 0;
 }
 
@@ -1815,7 +1815,7 @@ static void kcryptd_io_write(struct dm_crypt_io *io)
 {
 	struct bio *clone = io->ctx.bio_out;
 
-	generic_make_request(clone);
+	submit_bio_noacct(clone);
 }
 
 #define crypt_io_from_node(node) rb_entry((node), struct dm_crypt_io, rb_node)
@@ -1893,7 +1893,7 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
 	clone->bi_iter.bi_sector = cc->start + io->sector;
 
 	if (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) {
-		generic_make_request(clone);
+		submit_bio_noacct(clone);
 		return;
 	}
 
diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index f496213f8b6753..2628a832787b04 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -72,7 +72,7 @@ static void flush_bios(struct bio *bio)
 	while (bio) {
 		n = bio->bi_next;
 		bio->bi_next = NULL;
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		bio = n;
 	}
 }
diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
index bdb84b8e71621d..566ddbdb16a4ef 100644
--- a/drivers/md/dm-era-target.c
+++ b/drivers/md/dm-era-target.c
@@ -1265,7 +1265,7 @@ static void process_deferred_bios(struct era *era)
 			bio_io_error(bio);
 	else
 		while ((bio = bio_list_pop(&marked_bios)))
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 }
 
 static void process_rpc_calls(struct era *era)
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 81dc5ff0890956..ae866e469e1b98 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -2115,12 +2115,12 @@ static void dm_integrity_map_continue(struct dm_integrity_io *dio, bool from_map
 		dio->in_flight = (atomic_t)ATOMIC_INIT(1);
 		dio->completion = NULL;
 
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 
 		return;
 	}
 
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 
 	if (need_sync_io) {
 		wait_for_completion_io(&read_comp);
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 78cff42d987ee5..73bb23de6336f1 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -677,7 +677,7 @@ static void process_queued_bios(struct work_struct *work)
 			bio_endio(bio);
 			break;
 		case DM_MAPIO_REMAPPED:
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 			break;
 		case DM_MAPIO_SUBMITTED:
 			break;
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 2f655d9f420064..fa09bc4e4c54a1 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -779,7 +779,7 @@ static void do_writes(struct mirror_set *ms, struct bio_list *writes)
 			wakeup_mirrord(ms);
 		} else {
 			map_bio(get_default_mirror(ms), bio);
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		}
 	}
 }
diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
index 963d3774c93e28..2d1d4a4c399cdc 100644
--- a/drivers/md/dm-snap-persistent.c
+++ b/drivers/md/dm-snap-persistent.c
@@ -252,7 +252,7 @@ static int chunk_io(struct pstore *ps, void *area, chunk_t chunk, int op,
 
 	/*
 	 * Issue the synchronous I/O from a different thread
-	 * to avoid generic_make_request recursion.
+	 * to avoid submit_bio_noacct recursion.
 	 */
 	INIT_WORK_ONSTACK(&req.work, do_metadata);
 	queue_work(ps->metadata_wq, &req.work);
diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 6b11a266299f14..4668b2cd98f4e2 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -1568,7 +1568,7 @@ static void flush_bios(struct bio *bio)
 	while (bio) {
 		n = bio->bi_next;
 		bio->bi_next = NULL;
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		bio = n;
 	}
 }
@@ -1588,7 +1588,7 @@ static void retry_origin_bios(struct dm_snapshot *s, struct bio *bio)
 		bio->bi_next = NULL;
 		r = do_origin(s->origin, bio, false);
 		if (r == DM_MAPIO_REMAPPED)
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		bio = n;
 	}
 }
@@ -1829,7 +1829,7 @@ static void start_full_bio(struct dm_snap_pending_exception *pe,
 	bio->bi_end_io = full_bio_end_io;
 	bio->bi_private = callback_data;
 
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 }
 
 static struct dm_snap_pending_exception *
diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index fa8d5464c1fb51..fe2de28887096f 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -758,7 +758,7 @@ static void issue(struct thin_c *tc, struct bio *bio)
 	struct pool *pool = tc->pool;
 
 	if (!bio_triggers_commit(tc, bio)) {
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		return;
 	}
 
@@ -2394,7 +2394,7 @@ static void process_deferred_bios(struct pool *pool)
 		if (bio->bi_opf & REQ_PREFLUSH)
 			bio_endio(bio);
 		else
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 	}
 }
 
diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index eec9f252e9354b..75fa4d9b761717 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -681,7 +681,7 @@ static int verity_map(struct dm_target *ti, struct bio *bio)
 
 	verity_submit_prefetch(v, io);
 
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 
 	return DM_MAPIO_SUBMITTED;
 }
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 74f3c506f08487..62421554b83851 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -1238,7 +1238,7 @@ static int writecache_flush_thread(void *data)
 					   bio_end_sector(bio));
 			wc_unlock(wc);
 			bio_set_dev(bio, wc->dev->bdev);
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		} else {
 			writecache_flush(wc);
 			wc_unlock(wc);
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index a907a9446c0b5c..05a3cfefe93728 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -140,7 +140,7 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 	bio_advance(bio, clone->bi_iter.bi_size);
 
 	refcount_inc(&bioctx->ref);
-	generic_make_request(clone);
+	submit_bio_noacct(clone);
 
 	if (bio_op(bio) == REQ_OP_WRITE && dmz_is_seq(zone))
 		zone->wp_block += nr_blocks;
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5acfaba3700dfc..b32b539dbace56 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1305,7 +1305,7 @@ static blk_qc_t __map_bio(struct dm_target_io *tio)
 		if (md->type == DM_TYPE_NVME_BIO_BASED)
 			ret = direct_make_request(clone);
 		else
-			ret = generic_make_request(clone);
+			ret = submit_bio_noacct(clone);
 		break;
 	case DM_MAPIO_KILL:
 		free_tio(tio);
@@ -1652,7 +1652,7 @@ static blk_qc_t __split_and_process_bio(struct mapped_device *md,
 			error = __split_and_process_non_flush(&ci);
 			if (current->bio_list && ci.sector_count && !error) {
 				/*
-				 * Remainder must be passed to generic_make_request()
+				 * Remainder must be passed to submit_bio_noacct()
 				 * so that it gets handled *after* bios already submitted
 				 * have been completely processed.
 				 * We take a clone of the original to store in
@@ -1677,7 +1677,7 @@ static blk_qc_t __split_and_process_bio(struct mapped_device *md,
 
 				bio_chain(b, bio);
 				trace_block_split(md->queue, b, bio->bi_iter.bi_sector);
-				ret = generic_make_request(bio);
+				ret = submit_bio_noacct(bio);
 				break;
 			}
 		}
@@ -1745,7 +1745,7 @@ static void dm_queue_split(struct mapped_device *md, struct dm_target *ti, struc
 
 		bio_chain(split, *bio);
 		trace_block_split(md->queue, split, (*bio)->bi_iter.bi_sector);
-		generic_make_request(*bio);
+		submit_bio_noacct(*bio);
 		*bio = split;
 	}
 }
@@ -2500,7 +2500,7 @@ static void dm_wq_work(struct work_struct *work)
 			break;
 
 		if (dm_request_based(md))
-			(void) generic_make_request(c);
+			(void) submit_bio_noacct(c);
 		else
 			(void) dm_process_bio(md, map, c);
 	}
diff --git a/drivers/md/md-faulty.c b/drivers/md/md-faulty.c
index 50ad4ba86f0e74..fda4cb3f936f39 100644
--- a/drivers/md/md-faulty.c
+++ b/drivers/md/md-faulty.c
@@ -169,7 +169,7 @@ static bool faulty_make_request(struct mddev *mddev, struct bio *bio)
 	if (bio_data_dir(bio) == WRITE) {
 		/* write request */
 		if (atomic_read(&conf->counters[WriteAll])) {
-			/* special case - don't decrement, don't generic_make_request,
+			/* special case - don't decrement, don't submit_bio_noacct,
 			 * just fail immediately
 			 */
 			bio_io_error(bio);
@@ -214,7 +214,7 @@ static bool faulty_make_request(struct mddev *mddev, struct bio *bio)
 	} else
 		bio_set_dev(bio, conf->rdev->bdev);
 
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 	return true;
 }
 
diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index 26c75c0199fa1b..8efada3ee16f30 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -267,7 +267,7 @@ static bool linear_make_request(struct mddev *mddev, struct bio *bio)
 		struct bio *split = bio_split(bio, end_sector - bio_sector,
 					      GFP_NOIO, &mddev->bio_set);
 		bio_chain(split, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		bio = split;
 	}
 
@@ -286,7 +286,7 @@ static bool linear_make_request(struct mddev *mddev, struct bio *bio)
 					      bio_sector);
 		mddev_check_writesame(mddev, bio);
 		mddev_check_write_zeroes(mddev, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 	}
 	return true;
 
diff --git a/drivers/md/md-multipath.c b/drivers/md/md-multipath.c
index 152f9e65a22665..277fdfd9ee5480 100644
--- a/drivers/md/md-multipath.c
+++ b/drivers/md/md-multipath.c
@@ -131,7 +131,7 @@ static bool multipath_make_request(struct mddev *mddev, struct bio * bio)
 	mp_bh->bio.bi_private = mp_bh;
 	mddev_check_writesame(mddev, &mp_bh->bio);
 	mddev_check_write_zeroes(mddev, &mp_bh->bio);
-	generic_make_request(&mp_bh->bio);
+	submit_bio_noacct(&mp_bh->bio);
 	return true;
 }
 
@@ -348,7 +348,7 @@ static void multipathd(struct md_thread *thread)
 			bio->bi_opf |= REQ_FAILFAST_TRANSPORT;
 			bio->bi_end_io = multipath_end_request;
 			bio->bi_private = mp_bh;
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		}
 	}
 	spin_unlock_irqrestore(&conf->device_lock, flags);
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 322386ff5d225d..e9e91c8d8afcea 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -495,7 +495,7 @@ static void raid0_handle_discard(struct mddev *mddev, struct bio *bio)
 			zone->zone_end - bio->bi_iter.bi_sector, GFP_NOIO,
 			&mddev->bio_set);
 		bio_chain(split, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		bio = split;
 		end = zone->zone_end;
 	} else
@@ -559,7 +559,7 @@ static void raid0_handle_discard(struct mddev *mddev, struct bio *bio)
 			trace_block_bio_remap(bdev_get_queue(rdev->bdev),
 				discard_bio, disk_devt(mddev->gendisk),
 				bio->bi_iter.bi_sector);
-		generic_make_request(discard_bio);
+		submit_bio_noacct(discard_bio);
 	}
 	bio_endio(bio);
 }
@@ -600,7 +600,7 @@ static bool raid0_make_request(struct mddev *mddev, struct bio *bio)
 		struct bio *split = bio_split(bio, sectors, GFP_NOIO,
 					      &mddev->bio_set);
 		bio_chain(split, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		bio = split;
 	}
 
@@ -633,7 +633,7 @@ static bool raid0_make_request(struct mddev *mddev, struct bio *bio)
 				disk_devt(mddev->gendisk), bio_sector);
 	mddev_check_writesame(mddev, bio);
 	mddev_check_write_zeroes(mddev, bio);
-	generic_make_request(bio);
+	submit_bio_noacct(bio);
 	return true;
 }
 
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index dcd27f3da84eca..2aa2649cca660e 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -834,7 +834,7 @@ static void flush_bio_list(struct r1conf *conf, struct bio *bio)
 			/* Just ignore it */
 			bio_endio(bio);
 		else
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		bio = next;
 		cond_resched();
 	}
@@ -1312,7 +1312,7 @@ static void raid1_read_request(struct mddev *mddev, struct bio *bio,
 		struct bio *split = bio_split(bio, max_sectors,
 					      gfp, &conf->bio_split);
 		bio_chain(split, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		bio = split;
 		r1_bio->master_bio = bio;
 		r1_bio->sectors = max_sectors;
@@ -1338,7 +1338,7 @@ static void raid1_read_request(struct mddev *mddev, struct bio *bio,
 	        trace_block_bio_remap(read_bio->bi_disk->queue, read_bio,
 				disk_devt(mddev->gendisk), r1_bio->sector);
 
-	generic_make_request(read_bio);
+	submit_bio_noacct(read_bio);
 }
 
 static void raid1_write_request(struct mddev *mddev, struct bio *bio,
@@ -1483,7 +1483,7 @@ static void raid1_write_request(struct mddev *mddev, struct bio *bio,
 		struct bio *split = bio_split(bio, max_sectors,
 					      GFP_NOIO, &conf->bio_split);
 		bio_chain(split, bio);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		bio = split;
 		r1_bio->master_bio = bio;
 		r1_bio->sectors = max_sectors;
@@ -2240,7 +2240,7 @@ static void sync_request_write(struct mddev *mddev, struct r1bio *r1_bio)
 		atomic_inc(&r1_bio->remaining);
 		md_sync_acct(conf->mirrors[i].rdev->bdev, bio_sectors(wbio));
 
-		generic_make_request(wbio);
+		submit_bio_noacct(wbio);
 	}
 
 	put_sync_write_buf(r1_bio, 1);
@@ -2926,7 +2926,7 @@ static sector_t raid1_sync_request(struct mddev *mddev, sector_t sector_nr,
 				md_sync_acct_bio(bio, nr_sectors);
 				if (read_targets == 1)
 					bio->bi_opf &= ~MD_FAILFAST;
-				generic_make_request(bio);
+				submit_bio_noacct(bio);
 			}
 		}
 	} else {
@@ -2935,7 +2935,7 @@ static sector_t raid1_sync_request(struct mddev *mddev, sector_t sector_nr,
 		md_sync_acct_bio(bio, nr_sectors);
 		if (read_targets == 1)
 			bio->bi_opf &= ~MD_FAILFAST;
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 	}
 	return nr_sectors;
 }
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index ec136e44aef7f8..e45fd56cf58450 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -917,7 +917,7 @@ static void flush_pending_writes(struct r10conf *conf)
 				/* Just ignore it */
 				bio_endio(bio);
 			else
-				generic_make_request(bio);
+				submit_bio_noacct(bio);
 			bio = next;
 		}
 		blk_finish_plug(&plug);
@@ -1102,7 +1102,7 @@ static void raid10_unplug(struct blk_plug_cb *cb, bool from_schedule)
 			/* Just ignore it */
 			bio_endio(bio);
 		else
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		bio = next;
 	}
 	kfree(plug);
@@ -1194,7 +1194,7 @@ static void raid10_read_request(struct mddev *mddev, struct bio *bio,
 					      gfp, &conf->bio_split);
 		bio_chain(split, bio);
 		allow_barrier(conf);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		wait_barrier(conf);
 		bio = split;
 		r10_bio->master_bio = bio;
@@ -1221,7 +1221,7 @@ static void raid10_read_request(struct mddev *mddev, struct bio *bio,
 	        trace_block_bio_remap(read_bio->bi_disk->queue,
 	                              read_bio, disk_devt(mddev->gendisk),
 	                              r10_bio->sector);
-	generic_make_request(read_bio);
+	submit_bio_noacct(read_bio);
 	return;
 }
 
@@ -1479,7 +1479,7 @@ static void raid10_write_request(struct mddev *mddev, struct bio *bio,
 					      GFP_NOIO, &conf->bio_split);
 		bio_chain(split, bio);
 		allow_barrier(conf);
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 		wait_barrier(conf);
 		bio = split;
 		r10_bio->master_bio = bio;
@@ -2099,7 +2099,7 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 			tbio->bi_opf |= MD_FAILFAST;
 		tbio->bi_iter.bi_sector += conf->mirrors[d].rdev->data_offset;
 		bio_set_dev(tbio, conf->mirrors[d].rdev->bdev);
-		generic_make_request(tbio);
+		submit_bio_noacct(tbio);
 	}
 
 	/* Now write out to any replacement devices
@@ -2118,7 +2118,7 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 		atomic_inc(&r10_bio->remaining);
 		md_sync_acct(conf->mirrors[d].replacement->bdev,
 			     bio_sectors(tbio));
-		generic_make_request(tbio);
+		submit_bio_noacct(tbio);
 	}
 
 done:
@@ -2241,7 +2241,7 @@ static void recovery_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 	wbio = r10_bio->devs[1].bio;
 	wbio2 = r10_bio->devs[1].repl_bio;
 	/* Need to test wbio2->bi_end_io before we call
-	 * generic_make_request as if the former is NULL,
+	 * submit_bio_noacct as if the former is NULL,
 	 * the latter is free to free wbio2.
 	 */
 	if (wbio2 && !wbio2->bi_end_io)
@@ -2249,13 +2249,13 @@ static void recovery_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 	if (wbio->bi_end_io) {
 		atomic_inc(&conf->mirrors[d].rdev->nr_pending);
 		md_sync_acct(conf->mirrors[d].rdev->bdev, bio_sectors(wbio));
-		generic_make_request(wbio);
+		submit_bio_noacct(wbio);
 	}
 	if (wbio2) {
 		atomic_inc(&conf->mirrors[d].replacement->nr_pending);
 		md_sync_acct(conf->mirrors[d].replacement->bdev,
 			     bio_sectors(wbio2));
-		generic_make_request(wbio2);
+		submit_bio_noacct(wbio2);
 	}
 }
 
@@ -2889,7 +2889,7 @@ static void raid10_set_cluster_sync_high(struct r10conf *conf)
  * a number of r10_bio structures, one for each out-of-sync device.
  * As we setup these structures, we collect all bio's together into a list
  * which we then process collectively to add pages, and then process again
- * to pass to generic_make_request.
+ * to pass to submit_bio_noacct.
  *
  * The r10_bio structures are linked using a borrowed master_bio pointer.
  * This link is counted in ->remaining.  When the r10_bio that points to NULL
@@ -3496,7 +3496,7 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
 		if (bio->bi_end_io == end_sync_read) {
 			md_sync_acct_bio(bio, nr_sectors);
 			bio->bi_status = 0;
-			generic_make_request(bio);
+			submit_bio_noacct(bio);
 		}
 	}
 
@@ -4654,7 +4654,7 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
 	md_sync_acct_bio(read_bio, r10_bio->sectors);
 	atomic_inc(&r10_bio->remaining);
 	read_bio->bi_next = NULL;
-	generic_make_request(read_bio);
+	submit_bio_noacct(read_bio);
 	sectors_done += nr_sectors;
 	if (sector_nr <= last)
 		goto read_more;
@@ -4717,7 +4717,7 @@ static void reshape_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 		md_sync_acct_bio(b, r10_bio->sectors);
 		atomic_inc(&r10_bio->remaining);
 		b->bi_next = NULL;
-		generic_make_request(b);
+		submit_bio_noacct(b);
 	}
 	end_reshape_request(r10_bio);
 }
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index ab8067f9ce8c68..8dea4398b191ae 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -873,7 +873,7 @@ static void dispatch_bio_list(struct bio_list *tmp)
 	struct bio *bio;
 
 	while ((bio = bio_list_pop(tmp)))
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 }
 
 static int cmp_stripe(void *priv, struct list_head *a, struct list_head *b)
@@ -1151,7 +1151,7 @@ static void ops_run_io(struct stripe_head *sh, struct stripe_head_state *s)
 			if (should_defer && op_is_write(op))
 				bio_list_add(&pending_bios, bi);
 			else
-				generic_make_request(bi);
+				submit_bio_noacct(bi);
 		}
 		if (rrdev) {
 			if (s->syncing || s->expanding || s->expanded
@@ -1201,7 +1201,7 @@ static void ops_run_io(struct stripe_head *sh, struct stripe_head_state *s)
 			if (should_defer && op_is_write(op))
 				bio_list_add(&pending_bios, rbi);
 			else
-				generic_make_request(rbi);
+				submit_bio_noacct(rbi);
 		}
 		if (!rdev && !rrdev) {
 			if (op_is_write(op))
@@ -5289,7 +5289,7 @@ static int raid5_read_one_chunk(struct mddev *mddev, struct bio *raid_bio)
 			trace_block_bio_remap(align_bi->bi_disk->queue,
 					      align_bi, disk_devt(mddev->gendisk),
 					      raid_bio->bi_iter.bi_sector);
-		generic_make_request(align_bi);
+		submit_bio_noacct(align_bi);
 		return 1;
 	} else {
 		rcu_read_unlock();
@@ -5309,7 +5309,7 @@ static struct bio *chunk_aligned_read(struct mddev *mddev, struct bio *raid_bio)
 		struct r5conf *conf = mddev->private;
 		split = bio_split(raid_bio, sectors, GFP_NOIO, &conf->bio_split);
 		bio_chain(split, raid_bio);
-		generic_make_request(raid_bio);
+		submit_bio_noacct(raid_bio);
 		raid_bio = split;
 	}
 
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 89afcf943bf846..f07fa47c251d9d 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -351,7 +351,7 @@ static void nvme_requeue_work(struct work_struct *work)
 		 * path.
 		 */
 		bio->bi_disk = head->disk;
-		generic_make_request(bio);
+		submit_bio_noacct(bio);
 	}
 }
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 083ffc5bc51b09..b73cfa6a5141df 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -852,7 +852,7 @@ static inline void rq_flush_dcache_pages(struct request *rq)
 
 extern int blk_register_queue(struct gendisk *disk);
 extern void blk_unregister_queue(struct gendisk *disk);
-extern blk_qc_t generic_make_request(struct bio *bio);
+blk_qc_t submit_bio_noacct(struct bio *bio);
 extern blk_qc_t direct_make_request(struct bio *bio);
 extern void blk_rq_init(struct request_queue *q, struct request *rq);
 extern void blk_put_request(struct request *);
-- 
2.26.2

