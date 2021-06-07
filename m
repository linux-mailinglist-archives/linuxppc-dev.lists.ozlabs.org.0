Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F207639EA77
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 01:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVZ03B02z3bxd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 09:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVYG1mGKz2yjJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 09:52:48 +1000 (AEST)
IronPort-SDR: PdEKKWiom0gG1z2JuSfapHc8H9irV4lpQVGRhQg4C4jxmK/sOyDSHprYe8+BebRCoWF/1yWB64
 eiwAVZwRQm/g==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="290368378"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="290368378"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:52:44 -0700
IronPort-SDR: +eswq4V239YUexroUSETX2OcgDXl5VgubeMsGBVUQ3UVECkD4mKgcQj5OoR5B13rK9iiRn7mcA
 8hlnWFuewtmA==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="634889789"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:52:43 -0700
Subject: [PATCH v2] libnvdimm/pmem: Fix blk_cleanup_disk() usage
From: Dan Williams <dan.j.williams@intel.com>
To: axboe@kernel.dk
Date: Mon, 07 Jun 2021 16:52:43 -0700
Message-ID: <162310994435.1571616.334551212901820961.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <162310861219.1571453.6561642225122047071.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <162310861219.1571453.6561642225122047071.stgit@dwillia2-desk3.amr.corp.intel.com>
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

Otherwise, queue_to_disk() returns NULL resulting in the splat below.

 Kernel attempted to read user page (330) - exploit attempt? (uid: 0)
 BUG: Kernel NULL pointer dereference on read at 0x00000330
 Faulting instruction address: 0xc000000000906344
 Oops: Kernel access of bad area, sig: 11 [#1]
 [..]
 NIP [c000000000906344] pmem_pagemap_cleanup+0x24/0x40
 LR [c0000000004701d4] memunmap_pages+0x1b4/0x4b0
 Call Trace:
 [c000000022cbb9c0] [c0000000009063c8] pmem_pagemap_kill+0x28/0x40 (unreliable)
 [c000000022cbb9e0] [c0000000004701d4] memunmap_pages+0x1b4/0x4b0
 [c000000022cbba90] [c0000000008b28a0] devm_action_release+0x30/0x50
 [c000000022cbbab0] [c0000000008b39c8] release_nodes+0x2f8/0x3e0
 [c000000022cbbb60] [c0000000008ac440] device_release_driver_internal+0x190/0x2b0
 [c000000022cbbba0] [c0000000008a8450] unbind_store+0x130/0x170

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Fixes: 87eb73b2ca7c ("nvdimm-pmem: convert to blk_alloc_disk/blk_cleanup_disk")
Link: http://lore.kernel.org/r/DFB75BA8-603F-4A35-880B-C5B23EF8FA7D@linux.vnet.ibm.com
Cc: Christoph Hellwig <hch@lst.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
Changes in v2 Improve the changelog.

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

