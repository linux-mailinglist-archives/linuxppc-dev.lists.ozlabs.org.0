Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E45A78939D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 11:58:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=OVDxb2V3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7RKJ4v6vz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 20:58:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=OVDxb2V3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wetzel-home.de (client-ip=2a03:4000:40:5b2::1; helo=ns2.wdyn.eu; envelope-from=alexander@wetzel-home.de; receiver=lists.ozlabs.org)
Received: from ns2.wdyn.eu (ns2.wdyn.eu [IPv6:2a03:4000:40:5b2::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7RJV3nHlz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Apr 2024 20:57:27 +1100 (AEDT)
From: Alexander Wetzel <Alexander@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1711965440;
	bh=VQZhdw09jrXTFrGwzX+rLaXVEw+XW/mOek8JIA6cGZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OVDxb2V3ZvrNNEUNEbfcoMuWiqa9QKUV+uMtT+2IHg1rw2OI9CbY47okrm8rOqDSY
	 cLk7eqXhB3ap6DsRA9Kf9mGu9957NQtiu4UkDxwx62342UPUtt1v51QRsG52DyMA6E
	 vKBPcM5TA3RUtjFGq6FxEPRsjabOReBmuT7iG27Y=
To: dgilbert@interlog.com
Subject: [PATCH] scsi: sg: Avoid race in error handling & drop bogus warn
Date: Mon,  1 Apr 2024 11:56:29 +0200
Message-ID: <20240401095629.5089-1-Alexander@wetzel-home.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
References: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
MIME-Version: 1.0
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
Cc: bvanassche@acm.org, linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, stable@vger.kernel.org, Alexander@wetzel-home.de, sachinp@linux.ibm.com, martin.petersen@oracle.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")
introduced an incorrect WARN_ON_ONCE() and missed a sequence where
sg_device_destroy() after scsi_device_put() when handling errors.

sg_device_destroy() is accessing the parent scsi_device request_queue which
will already be set to NULL when the preceding call to scsi_device_put()
removed the last reference to the parent scsi_device.

Drop the incorrect WARN_ON_ONCE() - allowing more than one concurrent
access to the sg device -  and make sure sg_device_destroy() is not used
after scsi_device_put() in the error handling.

Link: https://lore.kernel.org/all/5375B275-D137-4D5F-BE25-6AF8ACAE41EF@linux.ibm.com
Fixes: 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Wetzel <Alexander@wetzel-home.de>
---

The WARN_ON_ONCE() was kind of stupid to add:
We get add reference for each sg_open(). So opening a second session and
then closing either one will trigger the warning... Nothing to warn
about here.

Alexander
---
 drivers/scsi/sg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 386981c6976a..833c9277419b 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -372,8 +372,9 @@ sg_open(struct inode *inode, struct file *filp)
 error_out:
 	scsi_autopm_put_device(sdp->device);
 sdp_put:
+	kref_put(&sdp->d_ref, sg_device_destroy);
 	scsi_device_put(sdp->device);
-	goto sg_put;
+	return retval;
 }
 
 /* Release resources associated with a successful sg_open()
@@ -2233,7 +2234,6 @@ sg_remove_sfp_usercontext(struct work_struct *work)
 			"sg_remove_sfp: sfp=0x%p\n", sfp));
 	kfree(sfp);
 
-	WARN_ON_ONCE(kref_read(&sdp->d_ref) != 1);
 	kref_put(&sdp->d_ref, sg_device_destroy);
 	scsi_device_put(device);
 	module_put(THIS_MODULE);
-- 
2.44.0

