Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBE39EA2E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 01:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzV5w6TbVz3bnW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 09:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 08 Jun 2021 09:32:18 AEST
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzV5Z1xMSz2xfx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 09:32:18 +1000 (AEST)
IronPort-SDR: izBJdFNDpF0iPOW6MoWELpOni/d5h98Ro89NGzGMNxMoF1tF1WCMQSdoHEqkrpObkzuIyIDGxP
 xJFpFUCqWnTw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265888275"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="265888275"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:31:03 -0700
IronPort-SDR: W3dspCDkbCxzCDbE4kaCmB4/JnDzW5+/WmymGvff2AqghGNL1jAlcNvGlBg8Dfu9NFjHGx+iW/
 LSQyds8najVA==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449288977"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:31:03 -0700
Subject: [PATCH] libnvdimm/pmem: Fix blk_cleanup_disk() usage
From: Dan Williams <dan.j.williams@intel.com>
To: axboe@kernel.dk
Date: Mon, 07 Jun 2021 16:31:02 -0700
Message-ID: <162310861219.1571453.6561642225122047071.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, nvdimm@lists.linux.dev,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-block@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The queue_to_disk() helper can not be used after del_gendisk()
communicate @disk via the pgmap->owner.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Fixes: 87eb73b2ca7c ("nvdimm-pmem: convert to blk_alloc_disk/blk_cleanup_disk")
Cc: Christoph Hellwig <hch@lst.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
Jens,

Please take or fold this into your tree after Sachin has a chance
to test it out. It's passing my tests.

 drivers/nvdimm/pmem.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 31f3c4bd6f72..fc6b78dd2d24 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -337,8 +337,9 @@ static void pmem_pagemap_cleanup(struct dev_pagemap *pgmap)
 {
 	struct request_queue *q =
 		container_of(pgmap->ref, struct request_queue, q_usage_counter);
+	struct pmem_device *pmem = pgmap->owner;
 
-	blk_cleanup_disk(queue_to_disk(q));
+	blk_cleanup_disk(pmem->disk);
 }
 
 static void pmem_release_queue(void *pgmap)
@@ -427,6 +428,7 @@ static int pmem_attach_disk(struct device *dev,
 	q = disk->queue;
 
 	pmem->disk = disk;
+	pmem->pgmap.owner = pmem;
 	pmem->pfn_flags = PFN_DEV;
 	pmem->pgmap.ref = &q->q_usage_counter;
 	if (is_nd_pfn(dev)) {

