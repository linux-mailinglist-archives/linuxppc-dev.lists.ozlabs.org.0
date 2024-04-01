Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F9894550
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 21:11:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=poi3KbXQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7gbx17WFz3dWV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 06:11:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=poi3KbXQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wetzel-home.de (client-ip=2a03:4000:40:5b2::1; helo=ns2.wdyn.eu; envelope-from=alexander@wetzel-home.de; receiver=lists.ozlabs.org)
Received: from ns2.wdyn.eu (ns2.wdyn.eu [IPv6:2a03:4000:40:5b2::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7gbD2nr7z301T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 06:11:04 +1100 (AEDT)
From: Alexander Wetzel <Alexander@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1711998656;
	bh=l5AboQBubNlfjPSPGwV6zz3AoCLbpjWMoP+mef5uBv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=poi3KbXQgsHiQr2KDJqeSIxNTyd2cnWiuPiPokZfcHRvP9X0w5IMvYt/TVH/S60+w
	 JgONKIR4R1k/3YQZFFdJTJ39c6VTa8kMQhXXPlnuB9kJnNa9Xw+vpwp5F2oJw7vIsM
	 Z4p/5WjknXHBR7Qxrn/LUdUlxtkknYum/aYm/MyU=
To: dgilbert@interlog.com
Subject: [PATCH v3] scsi: sg: Avoid race in error handling & drop bogus warn
Date: Mon,  1 Apr 2024 21:10:38 +0200
Message-ID: <20240401191038.18359-1-Alexander@wetzel-home.de>
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
sg_device_destroy() was used after scsi_device_put().

sg_device_destroy() is accessing the parent scsi_device request_queue which
will already be set to NULL when the preceding call to scsi_device_put()
removed the last reference to the parent scsi_device.

Drop the incorrect WARN_ON_ONCE() - allowing more than one concurrent
access to the sg device - and make sure sg_device_destroy() is not used
after scsi_device_put() in the error handling.

Link: https://lore.kernel.org/all/5375B275-D137-4D5F-BE25-6AF8ACAE41EF@linux.ibm.com
Fixes: 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Wetzel <Alexander@wetzel-home.de>
---

Changes compared to V1: fixed commit message
Changes compared to V2: Fix use-after free
---
 drivers/scsi/sg.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 386981c6976a..baf870a03ecf 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -285,6 +285,7 @@ sg_open(struct inode *inode, struct file *filp)
 	int dev = iminor(inode);
 	int flags = filp->f_flags;
 	struct request_queue *q;
+	struct scsi_device *device;
 	Sg_device *sdp;
 	Sg_fd *sfp;
 	int retval;
@@ -301,11 +302,12 @@ sg_open(struct inode *inode, struct file *filp)
 
 	/* This driver's module count bumped by fops_get in <linux/fs.h> */
 	/* Prevent the device driver from vanishing while we sleep */
-	retval = scsi_device_get(sdp->device);
+	device = sdp->device;
+	retval = scsi_device_get(device);
 	if (retval)
 		goto sg_put;
 
-	retval = scsi_autopm_get_device(sdp->device);
+	retval = scsi_autopm_get_device(device);
 	if (retval)
 		goto sdp_put;
 
@@ -313,7 +315,7 @@ sg_open(struct inode *inode, struct file *filp)
 	 * check if O_NONBLOCK. Permits SCSI commands to be issued
 	 * during error recovery. Tread carefully. */
 	if (!((flags & O_NONBLOCK) ||
-	      scsi_block_when_processing_errors(sdp->device))) {
+	      scsi_block_when_processing_errors(device))) {
 		retval = -ENXIO;
 		/* we are in error recovery for this device */
 		goto error_out;
@@ -344,7 +346,7 @@ sg_open(struct inode *inode, struct file *filp)
 
 	if (sdp->open_cnt < 1) {  /* no existing opens */
 		sdp->sgdebug = 0;
-		q = sdp->device->request_queue;
+		q = device->request_queue;
 		sdp->sg_tablesize = queue_max_segments(q);
 	}
 	sfp = sg_add_sfp(sdp);
@@ -370,10 +372,11 @@ sg_open(struct inode *inode, struct file *filp)
 error_mutex_locked:
 	mutex_unlock(&sdp->open_rel_lock);
 error_out:
-	scsi_autopm_put_device(sdp->device);
+	scsi_autopm_put_device(device);
 sdp_put:
-	scsi_device_put(sdp->device);
-	goto sg_put;
+	kref_put(&sdp->d_ref, sg_device_destroy);
+	scsi_device_put(device);
+	return retval;
 }
 
 /* Release resources associated with a successful sg_open()
@@ -2233,7 +2236,6 @@ sg_remove_sfp_usercontext(struct work_struct *work)
 			"sg_remove_sfp: sfp=0x%p\n", sfp));
 	kfree(sfp);
 
-	WARN_ON_ONCE(kref_read(&sdp->d_ref) != 1);
 	kref_put(&sdp->d_ref, sg_device_destroy);
 	scsi_device_put(device);
 	module_put(THIS_MODULE);
-- 
2.44.0

