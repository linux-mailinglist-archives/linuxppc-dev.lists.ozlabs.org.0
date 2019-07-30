Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB1E7B411
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 22:13:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ynmw5cR8zDqXT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 06:13:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 340 seconds by postgrey-1.36 at bilbo;
 Wed, 31 Jul 2019 06:05:19 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ynbg3xYnzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 06:05:18 +1000 (AEST)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N63mC-1iPTLI09aS-016Nh4; Tue, 30 Jul 2019 21:59:08 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v5 14/29] compat_ioctl: use correct compat_ptr() translation
 in drivers
Date: Tue, 30 Jul 2019 21:55:30 +0200
Message-Id: <20190730195819.901457-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190730195819.901457-1-arnd@arndb.de>
References: <20190730192552.4014288-1-arnd@arndb.de>
 <20190730195819.901457-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NR2XEl6+AoboPzHACO6k3v5xd19rmW+nghDi36gUHs44bTK8aTX
 j4qhcD2DWMgm3+w5BQbm37jRIwRUO1gaZlXowaZzD69dFljMBUlpDumVE2ajIdx5obcNlti
 nAmFEkrJj+t317mLhm+zRAyT+KpWBS/M4DUVEBLFC8zstuJ6l7ocOS0FIwjCL5iNxhFm2a0
 dHq1Q5oHD7ND7iQ6+MUZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lWRxKHh1Tj0=:a6h3cR+Z78d2AqDDugX2RN
 /sRdU9fpil0d1k7/E1TVsehEA5BoJ/qa9ow3nhHZ07QuORYebzEi+gPI62FwLlbZKAi8XEHQr
 cdW1Om+pGp/wIYKm6oNzRXh2XV3UjxHfhcdIHu9GR0yy8ygXGytDK9f+NNqphYNq5g+QWDBbc
 JwSPhtJM1J6QS5xbF7VV3C66cCaYB/OEj5SJKnpYPFJ0WgSr5CGg5lQ0Fymo5BVrBKUZlV5HO
 /1DMRYjdc/X1pbVpQJMH9zIkvK/Uzq7cOrm3+mz1sUlfBWTyjC/zkr+TRjD+yhG7pKgIRdOn/
 QgI5Xu3OAyN/dMoHhi8zferk7Cd7m0ETqWBKr4du4i9wtetSrNNdPqZVXBjHqBO/s/bAt6cLr
 wtPv7yo+pzgzAr9/cZhrIW8zrKtdllys9THiAibk8SKxGGpzZBRWraItALRUU4r+7H33m/NWu
 9GQjAaKADYoPg014yEWzfeNE7Rit2WH0TTmCq3TrM0PHyi9I67a0ajPz392PKfPx/7/0fVZ17
 Le6kNZLZB5WbENbq5kODw54g87807rP3F7hBF0rrvspOD7XfZe6hDm+PebelsWPdylVgXf3iT
 nBx8ZukYqEvHPbEMQ0LZU71KOrYS+2YNRUXbOJGyl82BpLhQVLzrPuIpfmOI9yhgdNBLuOXDj
 GI8oL8XY34+FneY/Ib95Pp/t5o9wpgN4UfGut0GDMJXEtEKOgwct28+racPrchLc2MemvrSd6
 DE7tLJGO5GFUdCDqA0mCvER07dvu5mN3HGvhfQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-usb@vger.kernel.org,
 Frank Haverkamp <haver@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kashyap Desai <kashyap.desai@broadcom.com>, linux-scsi@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 megaraidlinux.pdl@broadcom.com, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A handful of drivers all have a trivial wrapper around their ioctl
handler, but don't call the compat_ptr() conversion function at the
moment. In practice this does not matter, since none of them are used
on the s390 architecture and for all other architectures, compat_ptr()
does not do anything, but using the new compat_ptr_ioctl()
helper makes it more correct in theory, and simplifies the code.

I checked that all ioctl handlers in these files are compatible
and take either pointer arguments or no argument.

Acked-by: Al Viro <viro@zeniv.linux.org.uk>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/misc/cxl/flash.c            |  8 +-------
 drivers/misc/genwqe/card_dev.c      | 23 +----------------------
 drivers/scsi/megaraid/megaraid_mm.c | 28 +---------------------------
 drivers/usb/gadget/function/f_fs.c  | 12 +-----------
 4 files changed, 4 insertions(+), 67 deletions(-)

diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
index 4d6836f19489..cb9cca35a226 100644
--- a/drivers/misc/cxl/flash.c
+++ b/drivers/misc/cxl/flash.c
@@ -473,12 +473,6 @@ static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return -EINVAL;
 }
 
-static long device_compat_ioctl(struct file *file, unsigned int cmd,
-				unsigned long arg)
-{
-	return device_ioctl(file, cmd, arg);
-}
-
 static int device_close(struct inode *inode, struct file *file)
 {
 	struct cxl *adapter = file->private_data;
@@ -514,7 +508,7 @@ static const struct file_operations fops = {
 	.owner		= THIS_MODULE,
 	.open		= device_open,
 	.unlocked_ioctl	= device_ioctl,
-	.compat_ioctl	= device_compat_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 	.release	= device_close,
 };
 
diff --git a/drivers/misc/genwqe/card_dev.c b/drivers/misc/genwqe/card_dev.c
index 0e34c0568fed..040a0bda3125 100644
--- a/drivers/misc/genwqe/card_dev.c
+++ b/drivers/misc/genwqe/card_dev.c
@@ -1215,34 +1215,13 @@ static long genwqe_ioctl(struct file *filp, unsigned int cmd,
 	return rc;
 }
 
-#if defined(CONFIG_COMPAT)
-/**
- * genwqe_compat_ioctl() - Compatibility ioctl
- *
- * Called whenever a 32-bit process running under a 64-bit kernel
- * performs an ioctl on /dev/genwqe<n>_card.
- *
- * @filp:        file pointer.
- * @cmd:         command.
- * @arg:         user argument.
- * Return:       zero on success or negative number on failure.
- */
-static long genwqe_compat_ioctl(struct file *filp, unsigned int cmd,
-				unsigned long arg)
-{
-	return genwqe_ioctl(filp, cmd, arg);
-}
-#endif /* defined(CONFIG_COMPAT) */
-
 static const struct file_operations genwqe_fops = {
 	.owner		= THIS_MODULE,
 	.open		= genwqe_open,
 	.fasync		= genwqe_fasync,
 	.mmap		= genwqe_mmap,
 	.unlocked_ioctl	= genwqe_ioctl,
-#if defined(CONFIG_COMPAT)
-	.compat_ioctl   = genwqe_compat_ioctl,
-#endif
+	.compat_ioctl   = compat_ptr_ioctl,
 	.release	= genwqe_release,
 };
 
diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/megaraid_mm.c
index 59cca898f088..e83163c66884 100644
--- a/drivers/scsi/megaraid/megaraid_mm.c
+++ b/drivers/scsi/megaraid/megaraid_mm.c
@@ -41,10 +41,6 @@ static int mraid_mm_setup_dma_pools(mraid_mmadp_t *);
 static void mraid_mm_free_adp_resources(mraid_mmadp_t *);
 static void mraid_mm_teardown_dma_pools(mraid_mmadp_t *);
 
-#ifdef CONFIG_COMPAT
-static long mraid_mm_compat_ioctl(struct file *, unsigned int, unsigned long);
-#endif
-
 MODULE_AUTHOR("LSI Logic Corporation");
 MODULE_DESCRIPTION("LSI Logic Management Module");
 MODULE_LICENSE("GPL");
@@ -68,9 +64,7 @@ static wait_queue_head_t wait_q;
 static const struct file_operations lsi_fops = {
 	.open	= mraid_mm_open,
 	.unlocked_ioctl = mraid_mm_unlocked_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl = mraid_mm_compat_ioctl,
-#endif
+	.compat_ioctl = compat_ptr_ioctl,
 	.owner	= THIS_MODULE,
 	.llseek = noop_llseek,
 };
@@ -224,7 +218,6 @@ mraid_mm_unlocked_ioctl(struct file *filep, unsigned int cmd,
 {
 	int err;
 
-	/* inconsistent: mraid_mm_compat_ioctl doesn't take the BKL */
 	mutex_lock(&mraid_mm_mutex);
 	err = mraid_mm_ioctl(filep, cmd, arg);
 	mutex_unlock(&mraid_mm_mutex);
@@ -1228,25 +1221,6 @@ mraid_mm_init(void)
 }
 
 
-#ifdef CONFIG_COMPAT
-/**
- * mraid_mm_compat_ioctl	- 32bit to 64bit ioctl conversion routine
- * @filep	: file operations pointer (ignored)
- * @cmd		: ioctl command
- * @arg		: user ioctl packet
- */
-static long
-mraid_mm_compat_ioctl(struct file *filep, unsigned int cmd,
-		      unsigned long arg)
-{
-	int err;
-
-	err = mraid_mm_ioctl(filep, cmd, arg);
-
-	return err;
-}
-#endif
-
 /**
  * mraid_mm_exit	- Module exit point
  */
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 213ff03c8a9f..7037ec33c424 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1351,14 +1351,6 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	return ret;
 }
 
-#ifdef CONFIG_COMPAT
-static long ffs_epfile_compat_ioctl(struct file *file, unsigned code,
-		unsigned long value)
-{
-	return ffs_epfile_ioctl(file, code, value);
-}
-#endif
-
 static const struct file_operations ffs_epfile_operations = {
 	.llseek =	no_llseek,
 
@@ -1367,9 +1359,7 @@ static const struct file_operations ffs_epfile_operations = {
 	.read_iter =	ffs_epfile_read_iter,
 	.release =	ffs_epfile_release,
 	.unlocked_ioctl =	ffs_epfile_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl = ffs_epfile_compat_ioctl,
-#endif
+	.compat_ioctl = compat_ptr_ioctl,
 };
 
 
-- 
2.20.0

