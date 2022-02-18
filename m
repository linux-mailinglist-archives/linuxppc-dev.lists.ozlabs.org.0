Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583464BED89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 00:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2d9T4DDdz3cTK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 10:02:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GD+HH9G1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=melanieplageman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GD+HH9G1; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0gY16Krjz3cQ4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 05:42:29 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id l19so2996997pfu.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkymO2cXo8u4iSmYrUr7FnoXj72C6tZYNpfdDviMOVo=;
 b=GD+HH9G1aw2T0H+c9H3Ryk4K4clDEqR6kBgmh+ybYGEhmOg8EZh5Wo4ZxIk4XCSesY
 cyddMcI04UUPDj/dmgKJqBjBn0Q3JBehRcOikNCsZNvjNJTE8go8QKuVfoEZJF9lcycS
 pkx0m+YQ8aw+/Pv4z5ztuiaFKZfag2uHbQvWfJZZ+FqJIWFZYiEhLAiv6Ff7A5Mp9Giu
 yoCU0vnb+2pJMjtwZy2675+dwZm3wGYbiR0nMaGId7bcA3a5PV2ZWecQlJYv3X5cc9Sw
 3tiY991yvjnkoFQHP17j7Xnk56xfUZvlHhdnj4hrwlN8FVsdfDdHSNS4XOVYZ6YvP8ju
 lYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkymO2cXo8u4iSmYrUr7FnoXj72C6tZYNpfdDviMOVo=;
 b=oXb09Ko40JBfUEdrXoSoRxlcYf+3OpInXAx0eALT1EnxR/uO6zE6n9CuOK0YGsFgux
 gDJlTvTQkFlOWiVqAwiGS8Yfvzj0mDqVN7VTktbcMyQVyAfwkLWGyqgc/orBFFDozF8D
 +Ms9K+6+uTuoRoe/uBQvuPUygiQr1NeY6/+pPFSUxNdau7Ja4V6s3HZIub1YTRp3r7Ex
 DxIOkV4gRNHpydp13DhLlKnYRjjYsfomq93y6XkpTgddc5yXYOr8lZwtRtN/R2gazrpW
 qooJheyx+bBhr7F1MDD6tUWCLUeoB7HIIUSO9qOgCy58Z01W0lUuCb6BAp3282Zlw82S
 mYsw==
X-Gm-Message-State: AOAM532XU/IYuGIPNkE+nY70tGH1/CfxckUVbWuvJUTKxD/mhBZCoGWl
 OgZFodmbK+7lH6P6W4R2oKM=
X-Google-Smtp-Source: ABdhPJwTQjDu6FOGV6lkRBTSQZVlHD66eEEgjiWe1xEsdqQiVwWV3IclSMUGYua+t+CSo3cPnfNO9Q==
X-Received: by 2002:a63:445f:0:b0:373:d43f:2b42 with SMTP id
 t31-20020a63445f000000b00373d43f2b42mr3804983pgk.125.1645209748167; 
 Fri, 18 Feb 2022 10:42:28 -0800 (PST)
Received: from vm-111.3frfxmc3btcupaqenzdpat1uec.xx.internal.cloudapp.net
 ([13.77.171.140]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090ab79100b001b89fd7e298sm130132pjr.4.2022.02.18.10.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 10:42:27 -0800 (PST)
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
Subject: [PATCH RFC v1 1/5] scsi: core: Rename host_tagset to hctx_share_tags
Date: Fri, 18 Feb 2022 18:41:53 +0000
Message-Id: <20220218184157.176457-2-melanieplageman@gmail.com>
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

Scsi_Host->host_tagset, which is set by LLD using the
scsi_host_template, determines whether or not to set the
BLK_MQ_F_TAG_HCTX_SHARED flag in the blk_mq_tag_set. This then
determines whether or not hardware contexts share blk_mq_tags.

The name host_tagset is misleading, as it sounds like it indicates
whether there is a host-wide blk_mq_tag_set.  Rename it to
hctx_share_tags to make this more evident, and so it doesn’t sound like
the opposite of the per_device_tag_set option that is introduced in a
subsequent patch.  No functional change.

Signed-off-by: Melanie Plageman <melanieplageman@gmail.com>
---
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c    |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c    |  2 +-
 drivers/scsi/hosts.c                      |  2 +-
 drivers/scsi/ibmvscsi/ibmvfc.c            |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c |  4 ++--
 drivers/scsi/mpt3sas/mpt3sas_base.c       |  6 +++---
 drivers/scsi/mpt3sas/mpt3sas_scsih.c      |  6 +++---
 drivers/scsi/scsi_debug.c                 |  2 +-
 drivers/scsi/scsi_lib.c                   |  2 +-
 drivers/scsi/smartpqi/smartpqi_init.c     |  2 +-
 include/scsi/scsi_host.h                  | 10 ++++------
 11 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index 64ed3e472e65..a3cf413f6990 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -3584,7 +3584,7 @@ static struct scsi_host_template sht_v2_hw = {
 	.shost_groups		= host_v2_hw_groups,
 	.host_reset		= hisi_sas_host_reset,
 	.map_queues		= map_queues_v2_hw,
-	.host_tagset		= 1,
+	.hctx_share_tags	= 1,
 };
 
 static const struct hisi_sas_hw hisi_sas_v2_hw = {
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index a01a3a7b706b..169eb5fbecfc 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -3172,7 +3172,7 @@ static struct scsi_host_template sht_v3_hw = {
 	.shost_groups		= host_v3_hw_groups,
 	.tag_alloc_policy	= BLK_TAG_ALLOC_RR,
 	.host_reset             = hisi_sas_host_reset,
-	.host_tagset		= 1,
+	.hctx_share_tags	= 1,
 };
 
 static const struct hisi_sas_hw hisi_sas_v3_hw = {
diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
index f69b77cbf538..a364243fac7c 100644
--- a/drivers/scsi/hosts.c
+++ b/drivers/scsi/hosts.c
@@ -426,7 +426,7 @@ struct Scsi_Host *scsi_host_alloc(struct scsi_host_template *sht, int privsize)
 	shost->sg_prot_tablesize = sht->sg_prot_tablesize;
 	shost->cmd_per_lun = sht->cmd_per_lun;
 	shost->no_write_same = sht->no_write_same;
-	shost->host_tagset = sht->host_tagset;
+	shost->hctx_share_tags = sht->hctx_share_tags;
 
 	if (shost_eh_deadline == -1 || !sht->eh_host_reset_handler)
 		shost->eh_deadline = -1;
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d0eab5700dc5..950be46c041f 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3625,7 +3625,7 @@ static struct scsi_host_template driver_template = {
 	.max_sectors = IBMVFC_MAX_SECTORS,
 	.shost_groups = ibmvfc_host_groups,
 	.track_queue_depth = 1,
-	.host_tagset = 1,
+	.hctx_share_tags = 1,
 };
 
 /**
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 82e1e24257bc..05db8f0b1e7e 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -6950,14 +6950,14 @@ static int megasas_io_attach(struct megasas_instance *instance)
 	 * Single msix_vectors in kdump, so shared host tag is also disabled.
 	 */
 
-	host->host_tagset = 0;
+	host->hctx_share_tags = 0;
 	host->nr_hw_queues = 1;
 
 	if ((instance->adapter_type != MFI_SERIES) &&
 		(instance->msix_vectors > instance->low_latency_index_start) &&
 		host_tagset_enable &&
 		instance->smp_affinity_enable) {
-		host->host_tagset = 1;
+		host->hctx_share_tags = 1;
 		host->nr_hw_queues = instance->msix_vectors -
 			instance->low_latency_index_start + instance->iopoll_q_count;
 		if (instance->iopoll_q_count)
diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index 511726f92d9a..eb85d74bd9d8 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -3414,12 +3414,12 @@ _base_enable_msix(struct MPT3SAS_ADAPTER *ioc)
 		ioc->smp_affinity_enable = 0;
 
 	if (!ioc->smp_affinity_enable || ioc->reply_queue_count <= 1)
-		ioc->shost->host_tagset = 0;
+		ioc->shost->hctx_share_tags = 0;
 
 	/*
-	 * Enable io uring poll queues only if host_tagset is enabled.
+	 * Enable io uring poll queues only if hctx_share_tags is enabled.
 	 */
-	if (ioc->shost->host_tagset)
+	if (ioc->shost->hctx_share_tags)
 		iopoll_q_count = poll_queues;
 
 	if (iopoll_q_count) {
diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 00792767c620..74cdf72ef837 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -12322,10 +12322,10 @@ _scsih_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_thread_fail;
 	}
 
-	shost->host_tagset = 0;
+	shost->hctx_share_tags = 0;
 
 	if (ioc->is_gen35_ioc && host_tagset_enable)
-		shost->host_tagset = 1;
+		shost->hctx_share_tags = 1;
 
 	ioc->is_driver_loading = 1;
 	if ((mpt3sas_base_attach(ioc))) {
@@ -12351,7 +12351,7 @@ _scsih_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	shost->nr_hw_queues = 1;
 
-	if (shost->host_tagset) {
+	if (shost->hctx_share_tags) {
 		shost->nr_hw_queues =
 		    ioc->reply_queue_count - ioc->high_iops_queues;
 
diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 2104973a35cd..af7ad912fabc 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -7614,7 +7614,7 @@ static int sdebug_driver_probe(struct device *dev)
 	 */
 	hpnt->nr_hw_queues = submit_queues;
 	if (sdebug_host_max_queue)
-		hpnt->host_tagset = 1;
+		hpnt->hctx_share_tags = 1;
 
 	/* poll queues are possible for nr_hw_queues > 1 */
 	if (hpnt->nr_hw_queues == 1 || (poll_queues < 1)) {
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 0a70aa763a96..61795bab83f7 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1987,7 +1987,7 @@ int scsi_mq_setup_tags(struct Scsi_Host *shost)
 	tag_set->flags |=
 		BLK_ALLOC_POLICY_TO_MQ_FLAG(shost->hostt->tag_alloc_policy);
 	tag_set->driver_data = shost;
-	if (shost->host_tagset)
+	if (shost->hctx_share_tags)
 		tag_set->flags |= BLK_MQ_F_TAG_HCTX_SHARED;
 
 	return blk_mq_alloc_tag_set(tag_set);
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index f0897d587454..31c0c2054d6a 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -7187,7 +7187,7 @@ static int pqi_register_scsi(struct pqi_ctrl_info *ctrl_info)
 	shost->irq = pci_irq_vector(ctrl_info->pci_dev, 0);
 	shost->unique_id = shost->irq;
 	shost->nr_hw_queues = ctrl_info->num_queue_groups;
-	shost->host_tagset = 1;
+	shost->hctx_share_tags = 1;
 	shost->hostdata[0] = (unsigned long)ctrl_info;
 
 	rc = scsi_add_host(shost, &ctrl_info->pci_dev->dev);
diff --git a/include/scsi/scsi_host.h b/include/scsi/scsi_host.h
index 72e1a347baa6..f7f330f9255b 100644
--- a/include/scsi/scsi_host.h
+++ b/include/scsi/scsi_host.h
@@ -456,8 +456,7 @@ struct scsi_host_template {
 	/* True if the controller does not support WRITE SAME */
 	unsigned no_write_same:1;
 
-	/* True if the host uses host-wide tagspace */
-	unsigned host_tagset:1;
+	unsigned hctx_share_tags:1;
 
 	/*
 	 * Countdown for host blocking with no commands outstanding.
@@ -617,8 +616,8 @@ struct Scsi_Host {
 	 * In scsi-mq mode, the number of hardware queues supported by the LLD.
 	 *
 	 * Note: it is assumed that each hardware queue has a queue depth of
-	 * can_queue. In other words, the total queue depth per host
-	 * is nr_hw_queues * can_queue. However, for when host_tagset is set,
+	 * can_queue. In other words, the total queue depth per host is
+	 * nr_hw_queues * can_queue. However, when hctx_share_tags is set,
 	 * the total queue depth is can_queue.
 	 */
 	unsigned nr_hw_queues;
@@ -650,8 +649,7 @@ struct Scsi_Host {
 	/* The controller does not support WRITE SAME */
 	unsigned no_write_same:1;
 
-	/* True if the host uses host-wide tagspace */
-	unsigned host_tagset:1;
+	unsigned hctx_share_tags:1;
 
 	/* Host responded with short (<36 bytes) INQUIRY result */
 	unsigned short_inquiry:1;
-- 
2.25.1

