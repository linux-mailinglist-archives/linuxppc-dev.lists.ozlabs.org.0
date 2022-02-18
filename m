Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6B4BED8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 00:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2dBx1P39z3cBN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 10:03:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DR9bVPHY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=melanieplageman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DR9bVPHY; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0gY84SP6z3cRY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 05:42:36 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id z16so2990464pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSCF1doWbSbB9WONwhKgnOw0ZAntSdBq6sYX0+zsGrk=;
 b=DR9bVPHYInNCsMqhVhrUWzxkXHg9bhG1ppsF6xCDCWEt/LTxV0E4ZOMb77jpyQNsc+
 fpPB/7LB29z8lNULvzqe5GiwY7J53fxuLpe4TqGeEJGFoR28WM5x/FnmyoXDrJrnk+Wj
 Rx9rgBYylBke3c2rRvsESUEfHKo6Mj8Qc2b7lgXCLt0z6NTIsEE0rAv37qCPSdcQ2ZH5
 V/V0m7Ky0J5fLRxFiXpzg5dvuhovnn6bzQ4i15MqtoIvJE1hOUi932KZOTWBmdL1IYoA
 QTkgT8SjS0QrMSX8O7V7HuVThGKquk2syi4grhIUZC5Kv6p+Q4raMPU3UZSjzdDeU69F
 tBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OSCF1doWbSbB9WONwhKgnOw0ZAntSdBq6sYX0+zsGrk=;
 b=uNGipzmdrytd1Z3wglpdB8MH/sgpIOp+n93ckFipV+9wLtC/vZtvrnBMc1NZ9nkt3O
 R+ORbFIjnn8OsSbf8orzN8jBO/QpdlBTyOPpOSq+3A45pAr9IrJfNP4bPDx3zUBk6uST
 U2KSl+wyCaTpv//VTbeDkC4STIaMXE1gNTytst47tAavmACsK2GqRTTa1wpy4lGwS22L
 OB7Xs6w+mGO9VQJkjGQJkGDICVfuv0hcpsi2My2rTJ7hJcAnajZPKkV3+R7Hy8va+d7W
 Q0Vzite6ClBwnwBJZEji+litgTZtI9/SmelfCJBsm3NwD83e8cjnaM+tUbMSRrqU3mOi
 DoNQ==
X-Gm-Message-State: AOAM5319CymlVNBOSME5Grdzu03PtLPLJX76HrVi4MUe+akydFr//6k7
 nocPANamBgFmgO7Fy5PQ2ao=
X-Google-Smtp-Source: ABdhPJzd0tfRvCfM2JPKWZZe7ujlWrCYgstMMrAl98cz7bweIIPLEa/FPSp4vbqqo+opnq9+lI3S5A==
X-Received: by 2002:a63:105c:0:b0:36c:33aa:cb24 with SMTP id
 28-20020a63105c000000b0036c33aacb24mr7311961pgq.221.1645209754781; 
 Fri, 18 Feb 2022 10:42:34 -0800 (PST)
Received: from vm-111.3frfxmc3btcupaqenzdpat1uec.xx.internal.cloudapp.net
 ([13.77.171.140]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090ab79100b001b89fd7e298sm130132pjr.4.2022.02.18.10.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 10:42:34 -0800 (PST)
From: "Melanie Plageman (Microsoft)" <melanieplageman@gmail.com>
To: mikelley@microsoft.com, jejb@linux.ibm.com, kys@microsoft.com,
 martin.petersen@oracle.com, mst@redhat.com, benh@kernel.crashing.org,
 decui@microsoft.com, don.brace@microchip.com,
 R-QLogic-Storage-Upstream@marvell.com, haiyangz@microsoft.com,
 jasowang@redhat.com, john.garry@huawei.com, kashyap.desai@broadcom.com,
 mpe@ellerman.id.au, njavali@marvell.com, pbonzini@redhat.com,
 paulus@samba.org, sathya.prakash@broadcom.com,
 shivasharan.srikanteshwara@broadcom.com, sreekanth.reddy@broadcom.com,
 stefanha@redhat.com, sthemmin@microsoft.com,
 suganath-prabu.subramani@broadcom.com, sumit.saxena@broadcom.com,
 tyreld@linux.ibm.com, wei.liu@kernel.org, linuxppc-dev@lists.ozlabs.org,
 megaraidlinux.pdl@broadcom.com, mpi3mr-linuxdrv.pdl@broadcom.com,
 storagedev@microchip.com, virtualization@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com
Subject: [PATCH RFC v1 3/5] scsi: core: Add per device tag sets
Date: Fri, 18 Feb 2022 18:41:55 +0000
Message-Id: <20220218184157.176457-4-melanieplageman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218184157.176457-1-melanieplageman@gmail.com>
References: <20220218184157.176457-1-melanieplageman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Feb 2022 10:00:38 +1100
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
Cc: andres@anarazel.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently a single blk_mq_tag_set is associated with a Scsi_Host. When
SCSI controllers are limited, attaching multiple devices to the same
controller is required. In cloud environments with relatively high
latency persistent storage, requiring all devices on a controller to
share a single blk_mq_tag_set negatively impacts performance.

For example: a device provisioned with high IOPS and BW limits on the
same controller as a smaller and slower device can starve the slower
device of tags. This is especially noticeable when the slower device's
workload has low iodepth tasks.

A common configuration for a journaling database application would be to
configure all IO except journaling writes to target one device and
target the journaling writes to another device. This can decrease
transaction commit latency and improve performance. However, given an
IO-bound database workload, for example one with a large number of
random reads on the device with high provisioned IOPS, the high IO depth
workload can consume all of the tags in the Scsi_Host tag set, resulting
in poor overall performance as the journaling writes experience high
latency.

To provide more independence for devices on a SCSI controller, introduce
the option of per-SCSI-device tag sets.  A LLD can opt-in to per-device
tag sets, in which case there is no Scsi_Host level tag set.

scsi_alloc_sdev() allocates the per-device’s blk_mq_tag_set and
__scsi_remove_device() frees it.

A LLD that opts-in to this behavior is responsible for submitting I/Os
to the device associated with a particular tag set and for matching
completions to tags in the correct tag set. For LLDs that do not opt-in
to this behavior, the existing Scsi_Host tag set continues to be used
and there is no functional change.

Signed-off-by: Melanie Plageman <melanieplageman@gmail.com>
---
 drivers/scsi/hosts.c       | 30 +++++++++++++++++++++-------
 drivers/scsi/scsi_lib.c    | 24 ++++++++++++++++------
 drivers/scsi/scsi_priv.h   |  2 +-
 drivers/scsi/scsi_scan.c   | 30 ++++++++++++++++++++++------
 drivers/scsi/scsi_sysfs.c  | 11 +++++++++-
 include/scsi/scsi_device.h |  1 +
 include/scsi/scsi_host.h   | 41 ++++++++++++++++++++++++++++++++++++++
 include/scsi/scsi_tcq.h    | 15 +++++++++-----
 8 files changed, 128 insertions(+), 26 deletions(-)

diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
index a364243fac7c..ce2899e4c1c8 100644
--- a/drivers/scsi/hosts.c
+++ b/drivers/scsi/hosts.c
@@ -229,9 +229,11 @@ int scsi_add_host_with_dma(struct Scsi_Host *shost, struct device *dev,
 	if (error)
 		goto fail;
 
-	error = scsi_mq_setup_tags(shost);
-	if (error)
-		goto fail;
+	if (!shost->per_device_tag_set) {
+		error = scsi_mq_setup_tags(shost, &shost->tag_set);
+		if (error)
+			goto fail;
+	}
 
 	if (!shost->shost_gendev.parent)
 		shost->shost_gendev.parent = dev ? dev : &platform_bus;
@@ -345,7 +347,7 @@ static void scsi_host_dev_release(struct device *dev)
 		kfree(dev_name(&shost->shost_dev));
 	}
 
-	if (shost->tag_set.tags)
+	if (!shost->per_device_tag_set && shost->tag_set.tags)
 		scsi_mq_destroy_tags(shost);
 
 	kfree(shost->shost_data);
@@ -427,6 +429,7 @@ struct Scsi_Host *scsi_host_alloc(struct scsi_host_template *sht, int privsize)
 	shost->cmd_per_lun = sht->cmd_per_lun;
 	shost->no_write_same = sht->no_write_same;
 	shost->hctx_share_tags = sht->hctx_share_tags;
+	shost->per_device_tag_set = sht->per_device_tag_set;
 
 	if (shost_eh_deadline == -1 || !sht->eh_host_reset_handler)
 		shost->eh_deadline = -1;
@@ -566,7 +569,7 @@ struct Scsi_Host *scsi_host_get(struct Scsi_Host *shost)
 }
 EXPORT_SYMBOL(scsi_host_get);
 
-static bool scsi_host_check_in_flight(struct request *rq, void *data,
+bool scsi_check_in_flight(struct request *rq, void *data,
 				      bool reserved)
 {
 	int *count = data;
@@ -585,9 +588,17 @@ static bool scsi_host_check_in_flight(struct request *rq, void *data,
 int scsi_host_busy(struct Scsi_Host *shost)
 {
 	int cnt = 0;
+	if (shost->per_device_tag_set) {
 
-	blk_mq_tagset_busy_iter(&shost->tag_set,
-				scsi_host_check_in_flight, &cnt);
+		struct scsi_device *sdev;
+
+		shost_for_each_device(sdev, shost) {
+			blk_mq_tagset_busy_iter(sdev->request_queue->tag_set,
+						scsi_check_in_flight, &cnt);
+		}
+	} else
+		blk_mq_tagset_busy_iter(&shost->tag_set, scsi_check_in_flight,
+					&cnt);
 	return cnt;
 }
 EXPORT_SYMBOL(scsi_host_busy);
@@ -687,6 +698,8 @@ static bool complete_all_cmds_iter(struct request *rq, void *data, bool rsvd)
 void scsi_host_complete_all_commands(struct Scsi_Host *shost,
 				     enum scsi_host_status status)
 {
+	if (shost->per_device_tag_set)
+		return;
 	blk_mq_tagset_busy_iter(&shost->tag_set, complete_all_cmds_iter,
 				&status);
 }
@@ -724,6 +737,9 @@ void scsi_host_busy_iter(struct Scsi_Host *shost,
 		.priv = priv,
 	};
 
+	if (shost->per_device_tag_set)
+		return;
+
 	blk_mq_tagset_busy_iter(&shost->tag_set, __scsi_host_busy_iter_fn,
 				&iter_data);
 }
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index bba66e29d38c..ec69a526c397 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1369,6 +1369,17 @@ static inline int scsi_target_queue_ready(struct Scsi_Host *shost,
 	return 0;
 }
 
+static int scsi_tag_set_busy(struct scsi_device *sdevice)
+{
+	struct blk_mq_tag_set *tag_set = sdevice->request_queue->tag_set;
+
+	int cnt = 0;
+
+	blk_mq_tagset_busy_iter(tag_set,
+				scsi_check_in_flight, &cnt);
+	return cnt;
+}
+
 /*
  * scsi_host_queue_ready: if we can send requests to shost, return 1 else
  * return 0. We must end up running the queue again whenever 0 is
@@ -1383,9 +1394,11 @@ static inline int scsi_host_queue_ready(struct request_queue *q,
 		return 0;
 
 	if (atomic_read(&shost->host_blocked) > 0) {
-		if (scsi_host_busy(shost) > 0)
+		if (shost->per_device_tag_set) {
+			if (scsi_tag_set_busy(sdev) > 0)
+				goto starved;
+		} else if (scsi_host_busy(shost) > 0)
 			goto starved;
-
 		/*
 		 * unblock after host_blocked iterates to zero
 		 */
@@ -1961,11 +1974,9 @@ static const struct blk_mq_ops scsi_mq_ops = {
 	.get_rq_budget_token = scsi_mq_get_rq_budget_token,
 };
 
-int scsi_mq_setup_tags(struct Scsi_Host *shost)
+int scsi_mq_setup_tags(struct Scsi_Host *shost, struct blk_mq_tag_set *tag_set)
 {
 	unsigned int cmd_size, sgl_size;
-	struct blk_mq_tag_set *tag_set = &shost->tag_set;
-
 	sgl_size = max_t(unsigned int, sizeof(struct scatterlist),
 				scsi_mq_inline_sgl_size(shost));
 	cmd_size = sizeof(struct scsi_cmnd) + shost->hostt->cmd_size + sgl_size;
@@ -2955,7 +2966,8 @@ scsi_host_block(struct Scsi_Host *shost)
 	 * SCSI never enables blk-mq's BLK_MQ_F_BLOCKING flag so
 	 * calling synchronize_rcu() once is enough.
 	 */
-	WARN_ON_ONCE(shost->tag_set.flags & BLK_MQ_F_BLOCKING);
+	if (!shost->per_device_tag_set)
+		WARN_ON_ONCE(shost->tag_set.flags & BLK_MQ_F_BLOCKING);
 
 	if (!ret)
 		synchronize_rcu();
diff --git a/drivers/scsi/scsi_priv.h b/drivers/scsi/scsi_priv.h
index 5c4786310a31..aac2fbfb7d94 100644
--- a/drivers/scsi/scsi_priv.h
+++ b/drivers/scsi/scsi_priv.h
@@ -93,7 +93,7 @@ extern void scsi_io_completion(struct scsi_cmnd *, unsigned int);
 extern void scsi_run_host_queues(struct Scsi_Host *shost);
 extern void scsi_requeue_run_queue(struct work_struct *work);
 extern void scsi_start_queue(struct scsi_device *sdev);
-extern int scsi_mq_setup_tags(struct Scsi_Host *shost);
+extern int scsi_mq_setup_tags(struct Scsi_Host *shost, struct blk_mq_tag_set *tag_set);
 extern void scsi_mq_destroy_tags(struct Scsi_Host *shost);
 extern void scsi_exit_queue(void);
 extern void scsi_evt_thread(struct work_struct *work);
diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index f4e6c68ac99e..3d213da4a87f 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -276,6 +276,7 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 	unsigned int depth;
 	struct scsi_device *sdev;
 	struct request_queue *q;
+	struct blk_mq_tag_set *tag_set;
 	int display_failure_msg = 1, ret;
 	struct Scsi_Host *shost = dev_to_shost(starget->dev.parent);
 
@@ -324,16 +325,27 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 	 * doesn't
 	 */
 	sdev->borken = 1;
+	if (shost->per_device_tag_set) {
+		tag_set = kzalloc(sizeof(struct blk_mq_tag_set), GFP_KERNEL);
+		sdev->tag_set = tag_set;
+		if (!tag_set)
+			goto out;
+		if (scsi_mq_setup_tags(shost, tag_set))
+			goto out_free_tag_set;
+	} else {
+		tag_set = &shost->tag_set;
+		sdev->tag_set = NULL;
+	}
 
 	sdev->sg_reserved_size = INT_MAX;
 
-	q = blk_mq_init_queue(&sdev->host->tag_set);
+	q = blk_mq_init_queue(tag_set);
 	if (IS_ERR(q)) {
 		/* release fn is set up in scsi_sysfs_device_initialise, so
 		 * have to free and put manually here */
 		put_device(&starget->dev);
 		kfree(sdev);
-		goto out;
+		goto out_free_tag_set;
 	}
 	sdev->request_queue = q;
 	q->queuedata = sdev;
@@ -351,7 +363,7 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 	if (scsi_realloc_sdev_budget_map(sdev, depth)) {
 		put_device(&starget->dev);
 		kfree(sdev);
-		goto out;
+		goto out_free_tag_set;
 	}
 
 	scsi_change_queue_depth(sdev, depth);
@@ -367,14 +379,20 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_target *starget,
 			 */
 			if (ret == -ENXIO)
 				display_failure_msg = 0;
-			goto out_device_destroy;
+			__scsi_remove_device(sdev);
+			/*
+			 * __scsi_remove_device() will free the tag_set, so go
+			 * to "out" label.
+			 */
+			goto out;
 		}
 	}
 
 	return sdev;
 
-out_device_destroy:
-	__scsi_remove_device(sdev);
+out_free_tag_set:
+	if (shost->per_device_tag_set)
+		kfree(tag_set);
 out:
 	if (display_failure_msg)
 		printk(ALLOC_FAILURE_MSG, __func__);
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index f1e0c131b77c..dd11f3d59663 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -399,7 +399,10 @@ show_nr_hw_queues(struct device *dev, struct device_attribute *attr, char *buf)
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct blk_mq_tag_set *tag_set = &shost->tag_set;
 
-	return snprintf(buf, 20, "%d\n", tag_set->nr_hw_queues);
+	if (shost->per_device_tag_set)
+		return 0;
+	else
+		return snprintf(buf, 20, "%d\n", tag_set->nr_hw_queues);
 }
 static DEVICE_ATTR(nr_hw_queues, S_IRUGO, show_nr_hw_queues, NULL);
 
@@ -1467,6 +1470,12 @@ void __scsi_remove_device(struct scsi_device *sdev)
 		sdev->host->hostt->slave_destroy(sdev);
 	transport_destroy_device(dev);
 
+	if (sdev->host->per_device_tag_set) {
+		blk_mq_free_tag_set(sdev->tag_set);
+		kfree(sdev->tag_set);
+		sdev->tag_set = NULL;
+	}
+
 	/*
 	 * Paired with the kref_get() in scsi_sysfs_initialize().  We have
 	 * removed sysfs visibility from the device, so make the target
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index 647c53b26105..aa8c7f860a34 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -103,6 +103,7 @@ struct scsi_vpd {
 struct scsi_device {
 	struct Scsi_Host *host;
 	struct request_queue *request_queue;
+	struct blk_mq_tag_set *tag_set;
 
 	/* the next two are protected by the host->host_lock */
 	struct list_head    siblings;   /* list of all devices on this host */
diff --git a/include/scsi/scsi_host.h b/include/scsi/scsi_host.h
index 1255e8c164f6..a625a8490ea8 100644
--- a/include/scsi/scsi_host.h
+++ b/include/scsi/scsi_host.h
@@ -456,7 +456,39 @@ struct scsi_host_template {
 	/* True if the controller does not support WRITE SAME */
 	unsigned no_write_same:1;
 
+	/*
+	 * True if hardware queues will share blk_mq_tags
+	 * (BLK_MQ_F_TAG_HCTX_SHARED will be set)
+	 */
 	unsigned hctx_share_tags:1;
+	/*
+	 * True if the LLD will create blk_mq_tag_sets for each scsi_device
+	 * If False, request_queues will share the single blk_mq_tag_set in the
+	 * Scsi_Host.
+	 *
+	 * If per_device_tag_set is False and hctx_share_tags is True, all
+	 * devices on the Scsi_Host share a single blk_mq_tag_set referenced
+	 * through the host and all hardware queues share a blk_mq_tags.
+	 *
+	 * If per_device_tag_set is True and hctx_share_tags is True, all
+	 * devices on the Scsi_Host have their own blk_mq_tag_set, allocated and
+	 * maintained by the LLD, and all hardware queues on a given device
+	 * share one blk_mq_tags.
+	 *
+	 * If per_device_tag_set is False and hctx_share_tags is False, all
+	 * devices on the Scsi_Host share a single blk_mq_tag_set referenced
+	 * through the host and hardware queues have their own blk_mq_tags. That
+	 * is, hardware context 1 from device 1 and hardware context 1 from
+	 * device 2 will share the same blk_mq_tags in the host blk_mq_tag_set
+	 * but, hardware context 2 from device 1 and hardware context 2 from
+	 * device 2 will share another blk_mq_tags in the host blk_mq_tag_set.
+	 *
+	 * If per_device_tag_set is True and hctx_share_tags is False, all
+	 * devices on the Scsi_Host will have their own blk_mq_tag_set and all
+	 * hardware queues will have their own blk_mq_tags.
+	 */
+	unsigned per_device_tag_set:1;
+
 
 	/*
 	 * Countdown for host blocking with no commands outstanding.
@@ -649,8 +681,14 @@ struct Scsi_Host {
 	/* The controller does not support WRITE SAME */
 	unsigned no_write_same:1;
 
+	/*
+	 * See comment in struct scsi_host_template for details on how
+	 * hctx_share_tags and per_device_tag_set interact.
+	 */
 	unsigned hctx_share_tags:1;
 
+	unsigned per_device_tag_set:1;
+
 	/* Host responded with short (<36 bytes) INQUIRY result */
 	unsigned short_inquiry:1;
 
@@ -754,6 +792,9 @@ extern void scsi_rescan_device(struct device *);
 extern void scsi_remove_host(struct Scsi_Host *);
 extern struct Scsi_Host *scsi_host_get(struct Scsi_Host *);
 extern int scsi_host_busy(struct Scsi_Host *shost);
+// TODO: does this belong in another file?
+extern bool scsi_check_in_flight(struct request *rq, void *data,
+				      bool reserved);
 extern void scsi_host_put(struct Scsi_Host *t);
 extern struct Scsi_Host *scsi_host_lookup(unsigned short);
 extern const char *scsi_host_state_name(enum scsi_host_state);
diff --git a/include/scsi/scsi_tcq.h b/include/scsi/scsi_tcq.h
index ea7848e74d25..443e4d917dd3 100644
--- a/include/scsi/scsi_tcq.h
+++ b/include/scsi/scsi_tcq.h
@@ -19,18 +19,17 @@
  * Note: for devices using multiple hardware queues tag must have been
  * generated by blk_mq_unique_tag().
  **/
-static inline struct scsi_cmnd *scsi_host_find_tag(struct Scsi_Host *shost,
-		int tag)
+static inline struct scsi_cmnd *scsi_find_tag(struct blk_mq_tag_set *tag_set, int tag)
 {
 	struct request *req = NULL;
 	u16 hwq;
 
 	if (tag == SCSI_NO_TAG)
 		return NULL;
-
 	hwq = blk_mq_unique_tag_to_hwq(tag);
-	if (hwq < shost->tag_set.nr_hw_queues) {
-		req = blk_mq_tag_to_rq(shost->tag_set.tags[hwq],
+
+	if (hwq < tag_set->nr_hw_queues) {
+		req = blk_mq_tag_to_rq(tag_set->tags[hwq],
 					blk_mq_unique_tag_to_tag(tag));
 	}
 
@@ -39,5 +38,11 @@ static inline struct scsi_cmnd *scsi_host_find_tag(struct Scsi_Host *shost,
 	return blk_mq_rq_to_pdu(req);
 }
 
+static inline struct scsi_cmnd *scsi_host_find_tag(struct Scsi_Host *shost,
+		int tag)
+{
+	return scsi_find_tag(&shost->tag_set, tag);
+}
+
 #endif /* CONFIG_BLOCK */
 #endif /* _SCSI_SCSI_TCQ_H */
-- 
2.25.1

