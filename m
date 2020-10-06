Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3B9284B93
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 14:25:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5GrF5BlzzDqBN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 23:25:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5Glb3kB4zDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 23:20:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=go3kc30A; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4C5GlX73bMz9sTf; Tue,  6 Oct 2020 23:20:56 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5GlX4BTvz9sTm; Tue,  6 Oct 2020 23:20:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1601986856;
 bh=6nmyE1bNPBbC5a4bo7vQRjQ4M0Cs5B11lgHwVLwzBhY=;
 h=From:To:Cc:Subject:Date:From;
 b=go3kc30AcuKE6oAPSVpEH3ZvoUo6WtALhtilH84QKMmtL6PakfCozczqgqxTxRHFE
 Y/7Yyhp7H25xRXvnNQKC4Gy9WR08IUElFnnDYsYLLCE5r0xKCVe53WYBC/D7eB+uAb
 LU6/iCgIp+P5EjU7+uR2hWCpomUmW4Lr1VwzZwQ+jP/ya/hnSpBH8cFmMrORln3qWa
 jnwL/a0eCEn9iVbpAC8coNedU42D9P0k3Ors7amPdk1srlzFPgv9HaRG/K9RsZOY4N
 zdQCgf9ECVOy9qUOulGlwRqjLRV0EtJWQopO9gSH89r6QVvtSnh2MuH1eZL8R3182W
 sOvAtc8Y4TGqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v5] powerpc/powernv/elog: Fix race while processing OPAL error
 log event.
Date: Tue,  6 Oct 2020 23:20:51 +1100
Message-Id: <20201006122051.190176-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: aneesh.kumar@linux.ibm.com, oohall@gmail.com, hegdevasant@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Every error log reported by OPAL is exported to userspace through a
sysfs interface and notified using kobject_uevent(). The userspace
daemon (opal_errd) then reads the error log and acknowledges the error
log is saved safely to disk. Once acknowledged the kernel removes the
respective sysfs file entry causing respective resources to be
released including kobject.

However it's possible the userspace daemon may already be scanning
elog entries when a new sysfs elog entry is created by the kernel.
User daemon may read this new entry and ack it even before kernel can
notify userspace about it through kobject_uevent() call. If that
happens then we have a potential race between
elog_ack_store->kobject_put() and kobject_uevent which can lead to
use-after-free of a kernfs object resulting in a kernel crash. eg:

  BUG: Unable to handle kernel data access on read at 0x6b6b6b6b6b6b6bfb
  Faulting instruction address: 0xc0000000008ff2a0
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
  CPU: 27 PID: 805 Comm: irq/29-opal-elo Not tainted 5.9.0-rc2-gcc-8.2.0-00214-g6f56a67bcbb5-dirty #363
  ...
  NIP kobject_uevent_env+0xa0/0x910
  LR  elog_event+0x1f4/0x2d0
  Call Trace:
    0x5deadbeef0000122 (unreliable)
    elog_event+0x1f4/0x2d0
    irq_thread_fn+0x4c/0xc0
    irq_thread+0x1c0/0x2b0
    kthread+0x1c4/0x1d0
    ret_from_kernel_thread+0x5c/0x6c

This patch fixes this race by protecting the sysfs file
creation/notification by holding a reference count on kobject until we
safely send kobject_uevent().

The function create_elog_obj() returns the elog object which if used
by caller function will end up in use-after-free problem again.
However, the return value of create_elog_obj() function isn't being
used today and there is no need as well. Hence change it to return
void to make this fix complete.

Fixes: 774fea1a38c6 ("powerpc/powernv: Read OPAL error log and export it through sysfs")
Cc: stable@vger.kernel.org # v3.15+
Reported-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
[mpe: Rework the logic to use a single return, reword comments, add oops]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/opal-elog.c | 33 +++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

v5: mpe: Rework the logic to use a single return, ie. move the kobject_uevent()
         into the success case of the if.
	 Reword comments.
	 Add example oops to change log.

Change in v4:
  - Re-worded comments. No code change.
Change in v3:
  - Change create_elog_obj function signature to return void.
Change in v2:
  - Instead of mutex and use extra reference count on kobject to avoid the race.

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 62ef7ad995da..5e33b1fc67c2 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -179,14 +179,14 @@ static ssize_t raw_attr_read(struct file *filep, struct kobject *kobj,
 	return count;
 }
 
-static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
+static void create_elog_obj(uint64_t id, size_t size, uint64_t type)
 {
 	struct elog_obj *elog;
 	int rc;
 
 	elog = kzalloc(sizeof(*elog), GFP_KERNEL);
 	if (!elog)
-		return NULL;
+		return;
 
 	elog->kobj.kset = elog_kset;
 
@@ -219,18 +219,37 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
 	rc = kobject_add(&elog->kobj, NULL, "0x%llx", id);
 	if (rc) {
 		kobject_put(&elog->kobj);
-		return NULL;
+		return;
 	}
 
+	/*
+	 * As soon as the sysfs file for this elog is created/activated there is
+	 * a chance the opal_errd daemon (or any userspace) might read and
+	 * acknowledge the elog before kobject_uevent() is called. If that
+	 * happens then there is a potential race between
+	 * elog_ack_store->kobject_put() and kobject_uevent() which leads to a
+	 * use-after-free of a kernfs object resulting in a kernel crash.
+	 *
+	 * To avoid that, we need to take a reference on behalf of the bin file,
+	 * so that our reference remains valid while we call kobject_uevent().
+	 * We then drop our reference before exiting the function, leaving the
+	 * bin file to drop the last reference (if it hasn't already).
+	 */
+
+	/* Take a reference for the bin file */
+	kobject_get(&elog->kobj);
 	rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
-	if (rc) {
+	if (rc == 0) {
+		kobject_uevent(&elog->kobj, KOBJ_ADD);
+	} else {
+		/* Drop the reference taken for the bin file */
 		kobject_put(&elog->kobj);
-		return NULL;
 	}
 
-	kobject_uevent(&elog->kobj, KOBJ_ADD);
+	/* Drop our reference */
+	kobject_put(&elog->kobj);
 
-	return elog;
+	return;
 }
 
 static irqreturn_t elog_event(int irq, void *data)
-- 
2.25.1

