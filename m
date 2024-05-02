Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD88BA19D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 22:36:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=bie3dzYO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVm1T6Bxfz3d9V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 06:36:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=bie3dzYO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVlzy5Sx0z3cVw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 06:35:10 +1000 (AEST)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id 92A15206B4FA;
	Thu,  2 May 2024 13:34:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 92A15206B4FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714682078;
	bh=oCr1E7WKZWMwHhiMGOeSaUYgFZtQ1WSeTVrS0XRiyXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bie3dzYO2aZTymHL9fxUz2FPnUxejl/0eXLwGpd8bghRrIvCNqjq/WJ6U7lFvdwe8
	 EIWGKQg7+kD2apX1FCVQKjBM46cOsvCqugtNJ5LYVd95V9VNGD3Pzyfrd2/c7ZZUo7
	 XtEjuOyKIqH4emHjZVvlxuMsLpI31xbjxmv0G+go=
From: Allen Pais <apais@linux.microsoft.com>
To: linux-scsi@vger.kernel.org
Subject: [PATCH] [RFC] scsi: Convert from tasklet to BH workqueue
Date: Thu,  2 May 2024 20:34:33 +0000
Message-Id: <20240502203433.15811-2-apais@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240502203433.15811-1-apais@linux.microsoft.com>
References: <20240502203433.15811-1-apais@linux.microsoft.com>
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
Cc: tyreld@linux.ibm.com, hare@suse.com, linuxdrivers@attotech.com, martin.petersen@oracle.com, shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, kashyap.desai@broadcom.com, aneesh.kumar@kernel.org, sumit.saxena@broadcom.com, chandrakanth.patil@broadcom.com, target-devel@vger.kernel.org, artur.paszkiewicz@intel.co, naveen.n.rao@linux.ibm.com, jinpu.wang@cloud.ionos.com, linuxppc-dev@lists.ozlabs.org, megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only generic interface to execute asynchronously in the BH context is
tasklet; however, it's marked deprecated and has some design flaws. To
replace tasklets, BH workqueue support was recently added. A BH workqueue
behaves similarly to regular workqueues except that the queued work items
are executed in the BH context.

This patch converts drivers/scsi/* from tasklet to BH workqueue.

Based on the work done by Tejun Heo <tj@kernel.org>
Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/scsi/aic7xxx/aic7xxx_osm.c          |  2 +-
 drivers/scsi/aic94xx/aic94xx_hwi.c          | 14 ++--
 drivers/scsi/aic94xx/aic94xx_hwi.h          |  5 +-
 drivers/scsi/aic94xx/aic94xx_scb.c          | 36 +++++-----
 drivers/scsi/aic94xx/aic94xx_task.c         | 14 ++--
 drivers/scsi/aic94xx/aic94xx_tmf.c          | 34 ++++-----
 drivers/scsi/esas2r/esas2r.h                | 12 ++--
 drivers/scsi/esas2r/esas2r_init.c           | 14 ++--
 drivers/scsi/esas2r/esas2r_int.c            | 18 ++---
 drivers/scsi/esas2r/esas2r_io.c             |  2 +-
 drivers/scsi/esas2r/esas2r_main.c           | 16 ++---
 drivers/scsi/ibmvscsi/ibmvfc.c              | 16 ++---
 drivers/scsi/ibmvscsi/ibmvfc.h              |  3 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c            | 16 ++---
 drivers/scsi/ibmvscsi/ibmvscsi.h            |  3 +-
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c    | 15 ++--
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h    |  3 +-
 drivers/scsi/isci/host.c                    | 12 ++--
 drivers/scsi/isci/host.h                    |  8 +--
 drivers/scsi/isci/init.c                    |  4 +-
 drivers/scsi/megaraid/mega_common.h         |  5 +-
 drivers/scsi/megaraid/megaraid_mbox.c       | 21 +++---
 drivers/scsi/megaraid/megaraid_sas.h        |  4 +-
 drivers/scsi/megaraid/megaraid_sas_base.c   | 32 ++++-----
 drivers/scsi/megaraid/megaraid_sas_fusion.c | 16 ++---
 drivers/scsi/mvsas/mv_init.c                | 27 ++++---
 drivers/scsi/mvsas/mv_sas.h                 |  9 +--
 drivers/scsi/pm8001/pm8001_init.c           | 55 ++++++++-------
 drivers/scsi/pm8001/pm8001_sas.h            |  2 +-
 drivers/scsi/pmcraid.c                      | 78 +++++++++++----------
 drivers/scsi/pmcraid.h                      |  5 +-
 31 files changed, 251 insertions(+), 250 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7xxx_osm.c
index b0c4f2345321..42f76391f589 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
@@ -797,7 +797,7 @@ struct scsi_host_template aic7xxx_driver_template = {
 	.target_destroy		= ahc_linux_target_destroy,
 };
 
-/**************************** Tasklet Handler *********************************/
+/**************************** Work Handler *********************************/
 
 
 static inline unsigned int ahc_build_scsiid(struct ahc_softc *ahc,
diff --git a/drivers/scsi/aic94xx/aic94xx_hwi.c b/drivers/scsi/aic94xx/aic94xx_hwi.c
index 9dda296c0152..b08f0231e562 100644
--- a/drivers/scsi/aic94xx/aic94xx_hwi.c
+++ b/drivers/scsi/aic94xx/aic94xx_hwi.c
@@ -246,7 +246,7 @@ static void asd_get_max_scb_ddb(struct asd_ha_struct *asd_ha)
 
 /* ---------- Done List initialization ---------- */
 
-static void asd_dl_tasklet_handler(unsigned long);
+static void asd_dl_work_handler(struct work_struct *);
 
 static int asd_init_dl(struct asd_ha_struct *asd_ha)
 {
@@ -259,8 +259,7 @@ static int asd_init_dl(struct asd_ha_struct *asd_ha)
 	asd_ha->seq.dl = asd_ha->seq.actual_dl->vaddr;
 	asd_ha->seq.dl_toggle = ASD_DEF_DL_TOGGLE;
 	asd_ha->seq.dl_next = 0;
-	tasklet_init(&asd_ha->seq.dl_tasklet, asd_dl_tasklet_handler,
-		     (unsigned long) asd_ha);
+	INIT_WORK(&asd_ha->seq.dl_work, asd_dl_work_handler);
 
 	return 0;
 }
@@ -709,10 +708,9 @@ static void asd_chip_reset(struct asd_ha_struct *asd_ha)
 
 /* ---------- Done List Routines ---------- */
 
-static void asd_dl_tasklet_handler(unsigned long data)
+static void asd_dl_work_handler(struct work_struct *t)
 {
-	struct asd_ha_struct *asd_ha = (struct asd_ha_struct *) data;
-	struct asd_seq_data *seq = &asd_ha->seq;
+	struct asd_seq_data *seq = from_work(seq, t, dl_work);
 	unsigned long flags;
 
 	while (1) {
@@ -739,7 +737,7 @@ static void asd_dl_tasklet_handler(unsigned long data)
 		seq->pending--;
 		spin_unlock_irqrestore(&seq->pend_q_lock, flags);
 	out:
-		ascb->tasklet_complete(ascb, dl);
+		ascb->work_complete(ascb, dl);
 
 	next_1:
 		seq->dl_next = (seq->dl_next + 1) & (ASD_DL_SIZE-1);
@@ -756,7 +754,7 @@ static void asd_dl_tasklet_handler(unsigned long data)
  */
 static void asd_process_donelist_isr(struct asd_ha_struct *asd_ha)
 {
-	tasklet_schedule(&asd_ha->seq.dl_tasklet);
+	queue_work(system_bh_wq, &asd_ha->seq.dl_work);
 }
 
 /**
diff --git a/drivers/scsi/aic94xx/aic94xx_hwi.h b/drivers/scsi/aic94xx/aic94xx_hwi.h
index 930e192b1cd4..2cc6fb7aa1a7 100644
--- a/drivers/scsi/aic94xx/aic94xx_hwi.h
+++ b/drivers/scsi/aic94xx/aic94xx_hwi.h
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/dma-mapping.h>
+#include <linux/workqueue.h>
 
 #include <scsi/libsas.h>
 
@@ -117,7 +118,7 @@ struct asd_ascb {
 	struct asd_dma_tok dma_scb;
 	struct asd_dma_tok *sg_arr;
 
-	void (*tasklet_complete)(struct asd_ascb *, struct done_list_struct *);
+	void (*work_complete)(struct asd_ascb *, struct done_list_struct *);
 	u8     uldd_timer:1;
 
 	/* internally generated command */
@@ -152,7 +153,7 @@ struct asd_seq_data {
 	void *tc_index_bitmap;
 	int   tc_index_bitmap_bits;
 
-	struct tasklet_struct dl_tasklet;
+	struct work_struct dl_work;
 	struct done_list_struct *dl; /* array of done list entries, equals */
 	struct asd_dma_tok *actual_dl; /* actual_dl->vaddr */
 	int    dl_toggle;
diff --git a/drivers/scsi/aic94xx/aic94xx_scb.c b/drivers/scsi/aic94xx/aic94xx_scb.c
index 68214a58b160..256800811553 100644
--- a/drivers/scsi/aic94xx/aic94xx_scb.c
+++ b/drivers/scsi/aic94xx/aic94xx_scb.c
@@ -64,7 +64,7 @@ static void get_lrate_mode(struct asd_phy *phy, u8 oob_mode)
 		phy->sas_phy.oob_mode = SATA_OOB_MODE;
 }
 
-static void asd_phy_event_tasklet(struct asd_ascb *ascb,
+static void asd_phy_event_work(struct asd_ascb *ascb,
 					 struct done_list_struct *dl)
 {
 	struct asd_ha_struct *asd_ha = ascb->ha;
@@ -215,7 +215,7 @@ static void asd_deform_port(struct asd_ha_struct *asd_ha, struct asd_phy *phy)
 	spin_unlock_irqrestore(&asd_ha->asd_ports_lock, flags);
 }
 
-static void asd_bytes_dmaed_tasklet(struct asd_ascb *ascb,
+static void asd_bytes_dmaed_work(struct asd_ascb *ascb,
 				    struct done_list_struct *dl,
 				    int edb_id, int phy_id)
 {
@@ -237,7 +237,7 @@ static void asd_bytes_dmaed_tasklet(struct asd_ascb *ascb,
 	sas_notify_port_event(&phy->sas_phy, PORTE_BYTES_DMAED, GFP_ATOMIC);
 }
 
-static void asd_link_reset_err_tasklet(struct asd_ascb *ascb,
+static void asd_link_reset_err_work(struct asd_ascb *ascb,
 				       struct done_list_struct *dl,
 				       int phy_id)
 {
@@ -290,7 +290,7 @@ static void asd_link_reset_err_tasklet(struct asd_ascb *ascb,
 	;
 }
 
-static void asd_primitive_rcvd_tasklet(struct asd_ascb *ascb,
+static void asd_primitive_rcvd_work(struct asd_ascb *ascb,
 				       struct done_list_struct *dl,
 				       int phy_id)
 {
@@ -361,7 +361,7 @@ static void asd_primitive_rcvd_tasklet(struct asd_ascb *ascb,
  *
  * After an EDB has been invalidated, if all EDBs in this ESCB have been
  * invalidated, the ESCB is posted back to the sequencer.
- * Context is tasklet/IRQ.
+ * Context is BH work/IRQ.
  */
 void asd_invalidate_edb(struct asd_ascb *ascb, int edb_id)
 {
@@ -396,7 +396,7 @@ void asd_invalidate_edb(struct asd_ascb *ascb, int edb_id)
 	}
 }
 
-static void escb_tasklet_complete(struct asd_ascb *ascb,
+static void escb_work_complete(struct asd_ascb *ascb,
 				  struct done_list_struct *dl)
 {
 	struct asd_ha_struct *asd_ha = ascb->ha;
@@ -546,21 +546,21 @@ static void escb_tasklet_complete(struct asd_ascb *ascb,
 	switch (sb_opcode) {
 	case BYTES_DMAED:
 		ASD_DPRINTK("%s: phy%d: BYTES_DMAED\n", __func__, phy_id);
-		asd_bytes_dmaed_tasklet(ascb, dl, edb, phy_id);
+		asd_bytes_dmaed_work(ascb, dl, edb, phy_id);
 		break;
 	case PRIMITIVE_RECVD:
 		ASD_DPRINTK("%s: phy%d: PRIMITIVE_RECVD\n", __func__,
 			    phy_id);
-		asd_primitive_rcvd_tasklet(ascb, dl, phy_id);
+		asd_primitive_rcvd_work(ascb, dl, phy_id);
 		break;
 	case PHY_EVENT:
 		ASD_DPRINTK("%s: phy%d: PHY_EVENT\n", __func__, phy_id);
-		asd_phy_event_tasklet(ascb, dl);
+		asd_phy_event_work(ascb, dl);
 		break;
 	case LINK_RESET_ERROR:
 		ASD_DPRINTK("%s: phy%d: LINK_RESET_ERROR\n", __func__,
 			    phy_id);
-		asd_link_reset_err_tasklet(ascb, dl, phy_id);
+		asd_link_reset_err_work(ascb, dl, phy_id);
 		break;
 	case TIMER_EVENT:
 		ASD_DPRINTK("%s: phy%d: TIMER_EVENT, lost dw sync\n",
@@ -600,7 +600,7 @@ int asd_init_post_escbs(struct asd_ha_struct *asd_ha)
 	int i;
 
 	for (i = 0; i < seq->num_escbs; i++)
-		seq->escb_arr[i]->tasklet_complete = escb_tasklet_complete;
+		seq->escb_arr[i]->work_complete = escb_work_complete;
 
 	ASD_DPRINTK("posting %d escbs\n", i);
 	return asd_post_escb_list(asd_ha, seq->escb_arr[0], seq->num_escbs);
@@ -613,7 +613,7 @@ int asd_init_post_escbs(struct asd_ha_struct *asd_ha)
 			    | CURRENT_OOB_ERROR)
 
 /**
- * control_phy_tasklet_complete -- tasklet complete for CONTROL PHY ascb
+ * control_phy_work_complete -- BH work complete for CONTROL PHY ascb
  * @ascb: pointer to an ascb
  * @dl: pointer to the done list entry
  *
@@ -623,7 +623,7 @@ int asd_init_post_escbs(struct asd_ha_struct *asd_ha)
  *  - if a device is connected to the LED, it is lit,
  *  - if no device is connected to the LED, is is dimmed (off).
  */
-static void control_phy_tasklet_complete(struct asd_ascb *ascb,
+static void control_phy_work_complete(struct asd_ascb *ascb,
 					 struct done_list_struct *dl)
 {
 	struct asd_ha_struct *asd_ha = ascb->ha;
@@ -758,9 +758,9 @@ static void set_speed_mask(u8 *speed_mask, struct asd_phy_desc *pd)
  *
  * This function builds a CONTROL PHY scb.  No allocation of any kind
  * is performed. @ascb is allocated with the list function.
- * The caller can override the ascb->tasklet_complete to point
+ * The caller can override the ascb->work_complete to point
  * to its own callback function.  It must call asd_ascb_free()
- * at its tasklet complete function.
+ * at its BH work complete function.
  * See the default implementation.
  */
 void asd_build_control_phy(struct asd_ascb *ascb, int phy_id, u8 subfunc)
@@ -806,14 +806,14 @@ void asd_build_control_phy(struct asd_ascb *ascb, int phy_id, u8 subfunc)
 
 	control_phy->conn_handle = cpu_to_le16(0xFFFF);
 
-	ascb->tasklet_complete = control_phy_tasklet_complete;
+	ascb->work_complete = control_phy_work_complete;
 }
 
 /* ---------- INITIATE LINK ADM TASK ---------- */
 
 #if 0
 
-static void link_adm_tasklet_complete(struct asd_ascb *ascb,
+static void link_adm_work_complete(struct asd_ascb *ascb,
 				      struct done_list_struct *dl)
 {
 	u8 opcode = dl->opcode;
@@ -842,7 +842,7 @@ void asd_build_initiate_link_adm_task(struct asd_ascb *ascb, int phy_id,
 	link_adm->sub_func = subfunc;
 	link_adm->conn_handle = cpu_to_le16(0xFFFF);
 
-	ascb->tasklet_complete = link_adm_tasklet_complete;
+	ascb->work_complete = link_adm_work_complete;
 }
 
 #endif  /*  0  */
diff --git a/drivers/scsi/aic94xx/aic94xx_task.c b/drivers/scsi/aic94xx/aic94xx_task.c
index 4bfd03724ad6..2e1e30ba5555 100644
--- a/drivers/scsi/aic94xx/aic94xx_task.c
+++ b/drivers/scsi/aic94xx/aic94xx_task.c
@@ -138,9 +138,9 @@ static void asd_unmap_scatterlist(struct asd_ascb *ascb)
 			     task->num_scatter, task->data_dir);
 }
 
-/* ---------- Task complete tasklet ---------- */
+/* ---------- Task complete BH work ---------- */
 
-static void asd_get_response_tasklet(struct asd_ascb *ascb,
+static void asd_get_response_work(struct asd_ascb *ascb,
 				     struct done_list_struct *dl)
 {
 	struct asd_ha_struct *asd_ha = ascb->ha;
@@ -194,7 +194,7 @@ static void asd_get_response_tasklet(struct asd_ascb *ascb,
 	asd_invalidate_edb(escb, edb_id);
 }
 
-static void asd_task_tasklet_complete(struct asd_ascb *ascb,
+static void asd_task_work_complete(struct asd_ascb *ascb,
 				      struct done_list_struct *dl)
 {
 	struct sas_task *task = ascb->uldd_task;
@@ -224,7 +224,7 @@ static void asd_task_tasklet_complete(struct asd_ascb *ascb,
 	case TC_ATA_RESP:
 		ts->resp = SAS_TASK_COMPLETE;
 		ts->stat = SAS_PROTO_RESPONSE;
-		asd_get_response_tasklet(ascb, dl);
+		asd_get_response_work(ascb, dl);
 		break;
 	case TF_OPEN_REJECT:
 		ts->resp = SAS_TASK_UNDELIVERED;
@@ -392,7 +392,7 @@ static int asd_build_ata_ascb(struct asd_ascb *ascb, struct sas_task *task,
 
 		scb->ata_task.flags = 0;
 	}
-	ascb->tasklet_complete = asd_task_tasklet_complete;
+	ascb->work_complete = asd_task_work_complete;
 
 	if (likely(!task->ata_task.device_control_reg_update))
 		res = asd_map_scatterlist(task, scb->ata_task.sg_element,
@@ -440,7 +440,7 @@ static int asd_build_smp_ascb(struct asd_ascb *ascb, struct sas_task *task,
 	scb->smp_task.conn_handle = cpu_to_le16((u16)
 						(unsigned long)dev->lldd_dev);
 
-	ascb->tasklet_complete = asd_task_tasklet_complete;
+	ascb->work_complete = asd_task_work_complete;
 
 	return 0;
 }
@@ -490,7 +490,7 @@ static int asd_build_ssp_ascb(struct asd_ascb *ascb, struct sas_task *task,
 	scb->ssp_task.data_dir = data_dir_flags[task->data_dir];
 	scb->ssp_task.retry_count = scb->ssp_task.retry_count;
 
-	ascb->tasklet_complete = asd_task_tasklet_complete;
+	ascb->work_complete = asd_task_work_complete;
 
 	res = asd_map_scatterlist(task, scb->ssp_task.sg_element, gfp_flags);
 
diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94xx_tmf.c
index 27d32b8c2987..5eb0cc57ed2a 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -15,13 +15,13 @@
 /* ---------- Internal enqueue ---------- */
 
 static int asd_enqueue_internal(struct asd_ascb *ascb,
-		void (*tasklet_complete)(struct asd_ascb *,
+		void (*work_complete)(struct asd_ascb *,
 					 struct done_list_struct *),
 				void (*timed_out)(struct timer_list *t))
 {
 	int res;
 
-	ascb->tasklet_complete = tasklet_complete;
+	ascb->work_complete = work_complete;
 	ascb->uldd_timer = 1;
 
 	ascb->timer.function = timed_out;
@@ -37,7 +37,7 @@ static int asd_enqueue_internal(struct asd_ascb *ascb,
 
 /* ---------- CLEAR NEXUS ---------- */
 
-struct tasklet_completion_status {
+struct work_completion_status {
 	int	dl_opcode;
 	int	tmf_state;
 	u8	tag_valid:1;
@@ -45,7 +45,7 @@ struct tasklet_completion_status {
 };
 
 #define DECLARE_TCS(tcs) \
-	struct tasklet_completion_status tcs = { \
+	struct work_completion_status tcs = { \
 		.dl_opcode = 0, \
 		.tmf_state = 0, \
 		.tag_valid = 0, \
@@ -53,10 +53,10 @@ struct tasklet_completion_status {
 	}
 
 
-static void asd_clear_nexus_tasklet_complete(struct asd_ascb *ascb,
+static void asd_clear_nexus_work_complete(struct asd_ascb *ascb,
 					     struct done_list_struct *dl)
 {
-	struct tasklet_completion_status *tcs = ascb->uldd_task;
+	struct work_completion_status *tcs = ascb->uldd_task;
 	ASD_DPRINTK("%s: here\n", __func__);
 	if (!del_timer(&ascb->timer)) {
 		ASD_DPRINTK("%s: couldn't delete timer\n", __func__);
@@ -71,7 +71,7 @@ static void asd_clear_nexus_tasklet_complete(struct asd_ascb *ascb,
 static void asd_clear_nexus_timedout(struct timer_list *t)
 {
 	struct asd_ascb *ascb = from_timer(ascb, t, timer);
-	struct tasklet_completion_status *tcs = ascb->uldd_task;
+	struct work_completion_status *tcs = ascb->uldd_task;
 
 	ASD_DPRINTK("%s: here\n", __func__);
 	tcs->dl_opcode = TMF_RESP_FUNC_FAILED;
@@ -98,7 +98,7 @@ static void asd_clear_nexus_timedout(struct timer_list *t)
 
 #define CLEAR_NEXUS_POST        \
 	ASD_DPRINTK("%s: POST\n", __func__); \
-	res = asd_enqueue_internal(ascb, asd_clear_nexus_tasklet_complete, \
+	res = asd_enqueue_internal(ascb, asd_clear_nexus_work_complete, \
 				   asd_clear_nexus_timedout);              \
 	if (res)                \
 		goto out_err;   \
@@ -245,14 +245,14 @@ static int asd_clear_nexus_index(struct sas_task *task)
 static void asd_tmf_timedout(struct timer_list *t)
 {
 	struct asd_ascb *ascb = from_timer(ascb, t, timer);
-	struct tasklet_completion_status *tcs = ascb->uldd_task;
+	struct work_completion_status *tcs = ascb->uldd_task;
 
 	ASD_DPRINTK("tmf timed out\n");
 	tcs->tmf_state = TMF_RESP_FUNC_FAILED;
 	complete(ascb->completion);
 }
 
-static int asd_get_tmf_resp_tasklet(struct asd_ascb *ascb,
+static int asd_get_tmf_resp_work(struct asd_ascb *ascb,
 				    struct done_list_struct *dl)
 {
 	struct asd_ha_struct *asd_ha = ascb->ha;
@@ -270,7 +270,7 @@ static int asd_get_tmf_resp_tasklet(struct asd_ascb *ascb,
 	struct ssp_response_iu   *ru;
 	int res = TMF_RESP_FUNC_FAILED;
 
-	ASD_DPRINTK("tmf resp tasklet\n");
+	ASD_DPRINTK("tmf resp BH work\n");
 
 	spin_lock_irqsave(&asd_ha->seq.tc_index_lock, flags);
 	escb = asd_tc_index_find(&asd_ha->seq,
@@ -298,21 +298,21 @@ static int asd_get_tmf_resp_tasklet(struct asd_ascb *ascb,
 	return res;
 }
 
-static void asd_tmf_tasklet_complete(struct asd_ascb *ascb,
+static void asd_tmf_work_complete(struct asd_ascb *ascb,
 				     struct done_list_struct *dl)
 {
-	struct tasklet_completion_status *tcs;
+	struct work_completion_status *tcs;
 
 	if (!del_timer(&ascb->timer))
 		return;
 
 	tcs = ascb->uldd_task;
-	ASD_DPRINTK("tmf tasklet complete\n");
+	ASD_DPRINTK("tmf BH work complete\n");
 
 	tcs->dl_opcode = dl->opcode;
 
 	if (dl->opcode == TC_SSP_RESP) {
-		tcs->tmf_state = asd_get_tmf_resp_tasklet(ascb, dl);
+		tcs->tmf_state = asd_get_tmf_resp_work(ascb, dl);
 		tcs->tag_valid = ascb->tag_valid;
 		tcs->tag = ascb->tag;
 	}
@@ -452,7 +452,7 @@ int asd_abort_task(struct sas_task *task)
 	scb->abort_task.index = cpu_to_le16((u16)tascb->tc_index);
 	scb->abort_task.itnl_to = cpu_to_le16(ITNL_TIMEOUT_CONST);
 
-	res = asd_enqueue_internal(ascb, asd_tmf_tasklet_complete,
+	res = asd_enqueue_internal(ascb, asd_tmf_work_complete,
 				   asd_tmf_timedout);
 	if (res)
 		goto out_free;
@@ -600,7 +600,7 @@ static int asd_initiate_ssp_tmf(struct domain_device *dev, u8 *lun,
 	if (tmf == TMF_QUERY_TASK)
 		scb->ssp_tmf.index = cpu_to_le16(index);
 
-	res = asd_enqueue_internal(ascb, asd_tmf_tasklet_complete,
+	res = asd_enqueue_internal(ascb, asd_tmf_work_complete,
 				   asd_tmf_timedout);
 	if (res)
 		goto out_err;
diff --git a/drivers/scsi/esas2r/esas2r.h b/drivers/scsi/esas2r/esas2r.h
index ed63f7a9ea54..7c9db9e80576 100644
--- a/drivers/scsi/esas2r/esas2r.h
+++ b/drivers/scsi/esas2r/esas2r.h
@@ -900,7 +900,7 @@ struct esas2r_adapter {
 	struct esas2r_flash_context flash_context;
 	u32 num_targets_backend;
 	u32 ioctl_tunnel;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 	struct pci_dev *pcid;
 	struct Scsi_Host *host;
 	unsigned int index;
@@ -992,7 +992,7 @@ int esas2r_write_vda(struct esas2r_adapter *a, const char *buf, long off,
 int esas2r_read_fs(struct esas2r_adapter *a, char *buf, long off, int count);
 int esas2r_write_fs(struct esas2r_adapter *a, const char *buf, long off,
 		    int count);
-void esas2r_adapter_tasklet(unsigned long context);
+void esas2r_adapter_work(struct work_struct *work);
 irqreturn_t esas2r_interrupt(int irq, void *dev_id);
 irqreturn_t esas2r_msi_interrupt(int irq, void *dev_id);
 void esas2r_kickoff_timer(struct esas2r_adapter *a);
@@ -1022,7 +1022,7 @@ bool esas2r_init_adapter_hw(struct esas2r_adapter *a, bool init_poll);
 void esas2r_start_request(struct esas2r_adapter *a, struct esas2r_request *rq);
 bool esas2r_send_task_mgmt(struct esas2r_adapter *a,
 			   struct esas2r_request *rqaux, u8 task_mgt_func);
-void esas2r_do_tasklet_tasks(struct esas2r_adapter *a);
+void esas2r_do_work_tasks(struct esas2r_adapter *a);
 void esas2r_adapter_interrupt(struct esas2r_adapter *a);
 void esas2r_do_deferred_processes(struct esas2r_adapter *a);
 void esas2r_reset_bus(struct esas2r_adapter *a);
@@ -1283,7 +1283,7 @@ static inline void esas2r_rq_destroy_request(struct esas2r_request *rq,
 	rq->data_buf = NULL;
 }
 
-static inline bool esas2r_is_tasklet_pending(struct esas2r_adapter *a)
+static inline bool esas2r_is_work_pending(struct esas2r_adapter *a)
 {
 
 	return test_bit(AF_BUSRST_NEEDED, &a->flags) ||
@@ -1327,11 +1327,11 @@ static inline void esas2r_enable_chip_interrupts(struct esas2r_adapter *a)
 /* Schedule a TASKLET to perform non-interrupt tasks that may require delays
  * or long completion times.
  */
-static inline void esas2r_schedule_tasklet(struct esas2r_adapter *a)
+static inline void esas2r_schedule_work(struct esas2r_adapter *a)
 {
 	/* make sure we don't schedule twice */
 	if (!test_and_set_bit(AF_TASKLET_SCHEDULED, &a->flags))
-		tasklet_hi_schedule(&a->tasklet);
+		queue_work(system_bh_highpri_wq, &a->work);
 }
 
 static inline void esas2r_enable_heartbeat(struct esas2r_adapter *a)
diff --git a/drivers/scsi/esas2r/esas2r_init.c b/drivers/scsi/esas2r/esas2r_init.c
index c1a5ab662dc8..cf149a69ec55 100644
--- a/drivers/scsi/esas2r/esas2r_init.c
+++ b/drivers/scsi/esas2r/esas2r_init.c
@@ -401,9 +401,7 @@ int esas2r_init_adapter(struct Scsi_Host *host, struct pci_dev *pcid,
 		return 0;
 	}
 
-	tasklet_init(&a->tasklet,
-		     esas2r_adapter_tasklet,
-		     (unsigned long)a);
+	INIT_WORK(&a->work, esas2r_adapter_work);
 
 	/*
 	 * Disable chip interrupts to prevent spurious interrupts
@@ -441,7 +439,7 @@ static void esas2r_adapter_power_down(struct esas2r_adapter *a,
 	    &&  (!test_bit(AF_DEGRADED_MODE, &a->flags))) {
 		if (!power_management) {
 			del_timer_sync(&a->timer);
-			tasklet_kill(&a->tasklet);
+			cancel_work_sync(&a->work);
 		}
 		esas2r_power_down(a);
 
@@ -1346,7 +1344,7 @@ bool esas2r_init_adapter_hw(struct esas2r_adapter *a, bool init_poll)
 		u32 deltatime;
 
 		/*
-		 * Block Tasklets from getting scheduled and indicate this is
+		 * Block Works from getting scheduled and indicate this is
 		 * polled discovery.
 		 */
 		set_bit(AF_TASKLET_SCHEDULED, &a->flags);
@@ -1394,8 +1392,8 @@ bool esas2r_init_adapter_hw(struct esas2r_adapter *a, bool init_poll)
 				nexttick -= deltatime;
 
 			/* Do any deferred processing */
-			if (esas2r_is_tasklet_pending(a))
-				esas2r_do_tasklet_tasks(a);
+			if (esas2r_is_work_pending(a))
+				esas2r_do_work_tasks(a);
 
 		}
 
@@ -1463,7 +1461,7 @@ void esas2r_reset_adapter(struct esas2r_adapter *a)
 {
 	set_bit(AF_OS_RESET, &a->flags);
 	esas2r_local_reset_adapter(a);
-	esas2r_schedule_tasklet(a);
+	esas2r_schedule_work(a);
 }
 
 void esas2r_reset_chip(struct esas2r_adapter *a)
diff --git a/drivers/scsi/esas2r/esas2r_int.c b/drivers/scsi/esas2r/esas2r_int.c
index 5281d9356327..54e6eea522f8 100644
--- a/drivers/scsi/esas2r/esas2r_int.c
+++ b/drivers/scsi/esas2r/esas2r_int.c
@@ -97,7 +97,7 @@ irqreturn_t esas2r_interrupt(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	set_bit(AF2_INT_PENDING, &a->flags2);
-	esas2r_schedule_tasklet(a);
+	esas2r_schedule_work(a);
 
 	return IRQ_HANDLED;
 }
@@ -162,7 +162,7 @@ irqreturn_t esas2r_msi_interrupt(int irq, void *dev_id)
 	if (likely(atomic_read(&a->disable_cnt) == 0))
 		esas2r_do_deferred_processes(a);
 
-	esas2r_do_tasklet_tasks(a);
+	esas2r_do_work_tasks(a);
 
 	return 1;
 }
@@ -327,8 +327,8 @@ void esas2r_do_deferred_processes(struct esas2r_adapter *a)
 
 	/* Clear off the completed list to be processed later. */
 
-	if (esas2r_is_tasklet_pending(a)) {
-		esas2r_schedule_tasklet(a);
+	if (esas2r_is_work_pending(a)) {
+		esas2r_schedule_work(a);
 
 		startreqs = 0;
 	}
@@ -476,7 +476,7 @@ static void esas2r_process_bus_reset(struct esas2r_adapter *a)
 	esas2r_trace_exit();
 }
 
-static void esas2r_chip_rst_needed_during_tasklet(struct esas2r_adapter *a)
+static void esas2r_chip_rst_needed_during_work(struct esas2r_adapter *a)
 {
 
 	clear_bit(AF_CHPRST_NEEDED, &a->flags);
@@ -558,7 +558,7 @@ static void esas2r_chip_rst_needed_during_tasklet(struct esas2r_adapter *a)
 	}
 }
 
-static void esas2r_handle_chip_rst_during_tasklet(struct esas2r_adapter *a)
+static void esas2r_handle_chip_rst_during_work(struct esas2r_adapter *a)
 {
 	while (test_bit(AF_CHPRST_DETECTED, &a->flags)) {
 		/*
@@ -614,15 +614,15 @@ static void esas2r_handle_chip_rst_during_tasklet(struct esas2r_adapter *a)
 
 
 /* Perform deferred tasks when chip interrupts are disabled */
-void esas2r_do_tasklet_tasks(struct esas2r_adapter *a)
+void esas2r_do_work_tasks(struct esas2r_adapter *a)
 {
 
 	if (test_bit(AF_CHPRST_NEEDED, &a->flags) ||
 	    test_bit(AF_CHPRST_DETECTED, &a->flags)) {
 		if (test_bit(AF_CHPRST_NEEDED, &a->flags))
-			esas2r_chip_rst_needed_during_tasklet(a);
+			esas2r_chip_rst_needed_during_work(a);
 
-		esas2r_handle_chip_rst_during_tasklet(a);
+		esas2r_handle_chip_rst_during_work(a);
 	}
 
 	if (test_bit(AF_BUSRST_NEEDED, &a->flags)) {
diff --git a/drivers/scsi/esas2r/esas2r_io.c b/drivers/scsi/esas2r/esas2r_io.c
index a8df916cd57a..d45e6e16a858 100644
--- a/drivers/scsi/esas2r/esas2r_io.c
+++ b/drivers/scsi/esas2r/esas2r_io.c
@@ -851,7 +851,7 @@ void esas2r_reset_bus(struct esas2r_adapter *a)
 		set_bit(AF_BUSRST_PENDING, &a->flags);
 		set_bit(AF_OS_RESET, &a->flags);
 
-		esas2r_schedule_tasklet(a);
+		esas2r_schedule_work(a);
 	}
 }
 
diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index f700a16cd885..e4e378adf7ed 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -1543,10 +1543,10 @@ void esas2r_complete_request_cb(struct esas2r_adapter *a,
 	esas2r_free_request(a, rq);
 }
 
-/* Run tasklet to handle stuff outside of interrupt context. */
-void esas2r_adapter_tasklet(unsigned long context)
+/* Run BH work to handle stuff outside of interrupt context. */
+void esas2r_adapter_work(struct work_struct *t)
 {
-	struct esas2r_adapter *a = (struct esas2r_adapter *)context;
+	struct esas2r_adapter *a = from_work(a, t, work);
 
 	if (unlikely(test_bit(AF2_TIMER_TICK, &a->flags2))) {
 		clear_bit(AF2_TIMER_TICK, &a->flags2);
@@ -1558,14 +1558,14 @@ void esas2r_adapter_tasklet(unsigned long context)
 		esas2r_adapter_interrupt(a);
 	}
 
-	if (esas2r_is_tasklet_pending(a))
-		esas2r_do_tasklet_tasks(a);
+	if (esas2r_is_work_pending(a))
+		esas2r_do_work_tasks(a);
 
-	if (esas2r_is_tasklet_pending(a)
+	if (esas2r_is_work_pending(a)
 	    || (test_bit(AF2_INT_PENDING, &a->flags2))
 	    || (test_bit(AF2_TIMER_TICK, &a->flags2))) {
 		clear_bit(AF_TASKLET_SCHEDULED, &a->flags);
-		esas2r_schedule_tasklet(a);
+		esas2r_schedule_work(a);
 	} else {
 		clear_bit(AF_TASKLET_SCHEDULED, &a->flags);
 	}
@@ -1589,7 +1589,7 @@ static void esas2r_timer_callback(struct timer_list *t)
 
 	set_bit(AF2_TIMER_TICK, &a->flags2);
 
-	esas2r_schedule_tasklet(a);
+	esas2r_schedule_work(a);
 
 	esas2r_kickoff_timer(a);
 }
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 05b126bfd18b..6a8ecd3358c4 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -899,7 +899,7 @@ static void ibmvfc_release_crq_queue(struct ibmvfc_host *vhost)
 
 	ibmvfc_dbg(vhost, "Releasing CRQ\n");
 	free_irq(vdev->irq, vhost);
-	tasklet_kill(&vhost->tasklet);
+	cancel_work_sync(&vhost->work);
 	do {
 		if (rc)
 			msleep(100);
@@ -3767,21 +3767,21 @@ static irqreturn_t ibmvfc_interrupt(int irq, void *dev_instance)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	vio_disable_interrupts(to_vio_dev(vhost->dev));
-	tasklet_schedule(&vhost->tasklet);
+	queue_work(system_bh_wq, &vhost->work);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	return IRQ_HANDLED;
 }
 
 /**
- * ibmvfc_tasklet - Interrupt handler tasklet
+ * ibmvfc_work - Interrupt handler work
  * @data:		ibmvfc host struct
  *
  * Returns:
  *	Nothing
  **/
-static void ibmvfc_tasklet(void *data)
+static void ibmvfc_work(struct work_struct *t)
 {
-	struct ibmvfc_host *vhost = data;
+	struct ibmvfc_host *vhost = from_work(vhost, t, work);
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
 	struct ibmvfc_crq *crq;
 	struct ibmvfc_async_crq *async;
@@ -5885,7 +5885,7 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 
 	retrc = 0;
 
-	tasklet_init(&vhost->tasklet, (void *)ibmvfc_tasklet, (unsigned long)vhost);
+	INIT_WORK(&vhost->work, ibmvfc_work);
 
 	if ((rc = request_irq(vdev->irq, ibmvfc_interrupt, 0, IBMVFC_NAME, vhost))) {
 		dev_err(dev, "Couldn't register irq 0x%x. rc=%d\n", vdev->irq, rc);
@@ -5901,7 +5901,7 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 	return retrc;
 
 req_irq_failed:
-	tasklet_kill(&vhost->tasklet);
+	cancel_work_sync(&vhost->work);
 	do {
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
@@ -6474,7 +6474,7 @@ static int ibmvfc_resume(struct device *dev)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	vio_disable_interrupts(vdev);
-	tasklet_schedule(&vhost->tasklet);
+	queue_work(system_bh_wq, &vhost->work);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	return 0;
 }
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 745ad5ac7251..42861ee62bf9 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -12,6 +12,7 @@
 
 #include <linux/list.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 #include <scsi/viosrp.h>
 
 #define IBMVFC_NAME	"ibmvfc"
@@ -910,7 +911,7 @@ struct ibmvfc_host {
 	char partition_name[97];
 	void (*job_step) (struct ibmvfc_host *);
 	struct task_struct *work_thread;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 	struct work_struct rport_add_work_q;
 	wait_queue_head_t init_wait_q;
 	wait_queue_head_t work_wait_q;
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 71f3e9563520..91e1600bf219 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -125,7 +125,7 @@ static irqreturn_t ibmvscsi_handle_event(int irq, void *dev_instance)
 	struct ibmvscsi_host_data *hostdata =
 	    (struct ibmvscsi_host_data *)dev_instance;
 	vio_disable_interrupts(to_vio_dev(hostdata->dev));
-	tasklet_schedule(&hostdata->srp_task);
+	queue_work(system_bh_wq, &hostdata->srp_task);
 	return IRQ_HANDLED;
 }
 
@@ -145,7 +145,7 @@ static void ibmvscsi_release_crq_queue(struct crq_queue *queue,
 	long rc = 0;
 	struct vio_dev *vdev = to_vio_dev(hostdata->dev);
 	free_irq(vdev->irq, (void *)hostdata);
-	tasklet_kill(&hostdata->srp_task);
+	cancel_work_sync(&hostdata->srp_task);
 	do {
 		if (rc)
 			msleep(100);
@@ -367,8 +367,7 @@ static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
 	queue->cur = 0;
 	spin_lock_init(&queue->lock);
 
-	tasklet_init(&hostdata->srp_task, (void *)ibmvscsi_task,
-		     (unsigned long)hostdata);
+	INIT_WORK(&hostdata->srp_task, ibmvscsi_work);
 
 	if (request_irq(vdev->irq,
 			ibmvscsi_handle_event,
@@ -387,7 +386,7 @@ static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
 	return retrc;
 
       req_irq_failed:
-	tasklet_kill(&hostdata->srp_task);
+	cancel_work_sync(&hostdata->srp_task);
 	rc = 0;
 	do {
 		if (rc)
@@ -2194,9 +2193,10 @@ static int ibmvscsi_work_to_do(struct ibmvscsi_host_data *hostdata)
 	return rc;
 }
 
-static int ibmvscsi_work(void *data)
+static int ibmvscsi_work(struct work_struct *t)
 {
-	struct ibmvscsi_host_data *hostdata = data;
+	struct ibmvscsi_host_data *hostdata =
+		from_work(hostdata, t, srp_task);
 	int rc;
 
 	set_user_nice(current, MIN_NICE);
@@ -2371,7 +2371,7 @@ static int ibmvscsi_resume(struct device *dev)
 {
 	struct ibmvscsi_host_data *hostdata = dev_get_drvdata(dev);
 	vio_disable_interrupts(to_vio_dev(hostdata->dev));
-	tasklet_schedule(&hostdata->srp_task);
+	queue_work(system_bh_wq, &hostdata->srp_task);
 
 	return 0;
 }
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.h b/drivers/scsi/ibmvscsi/ibmvscsi.h
index e60916ef7a49..cfc0a70c434c 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.h
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.h
@@ -19,6 +19,7 @@
 #include <linux/list.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 #include <scsi/viosrp.h>
 
 struct scsi_cmnd;
@@ -90,7 +91,7 @@ struct ibmvscsi_host_data {
 	struct device *dev;
 	struct event_pool pool;
 	struct crq_queue queue;
-	struct tasklet_struct srp_task;
+	struct work_struct srp_task;
 	struct list_head sent;
 	struct Scsi_Host *host;
 	struct task_struct *work_thread;
diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
index 68b99924ee4f..204975fb61ba 100644
--- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
+++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
@@ -2948,7 +2948,7 @@ static irqreturn_t ibmvscsis_interrupt(int dummy, void *data)
 	struct scsi_info *vscsi = data;
 
 	vio_disable_interrupts(vscsi->dma_dev);
-	tasklet_schedule(&vscsi->work_task);
+	queue_work(system_bh_wq, &scsi->work_task);
 
 	return IRQ_HANDLED;
 }
@@ -3309,7 +3309,7 @@ static int ibmvscsis_rdma(struct ibmvscsis_cmd *cmd, struct scatterlist *sg,
 
 /**
  * ibmvscsis_handle_crq() - Handle CRQ
- * @data:	Pointer to our adapter structure
+ * @t:	Pointer to work_struct
  *
  * Read the command elements from the command queue and copy the payloads
  * associated with the command elements to local memory and execute the
@@ -3317,9 +3317,9 @@ static int ibmvscsis_rdma(struct ibmvscsis_cmd *cmd, struct scatterlist *sg,
  *
  * Note: this is an edge triggered interrupt. It can not be shared.
  */
-static void ibmvscsis_handle_crq(unsigned long data)
+static void ibmvscsis_handle_crq(struct work_struct *t)
 {
-	struct scsi_info *vscsi = (struct scsi_info *)data;
+	struct scsi_info *vscsi = from_work(scsi, t, work_task);
 	struct viosrp_crq *crq;
 	long rc;
 	bool ack = true;
@@ -3530,8 +3530,7 @@ static int ibmvscsis_probe(struct vio_dev *vdev,
 	dev_dbg(&vscsi->dev, "probe hrc %ld, client partition num %d\n",
 		hrc, vscsi->client_data.partition_number);
 
-	tasklet_init(&vscsi->work_task, ibmvscsis_handle_crq,
-		     (unsigned long)vscsi);
+	INIT_WORK(&vscsi->work_task, ibmvscsis_handle_crq);
 
 	init_completion(&vscsi->wait_idle);
 	init_completion(&vscsi->unconfig);
@@ -3565,7 +3564,7 @@ static int ibmvscsis_probe(struct vio_dev *vdev,
 free_buf:
 	kfree(vscsi->map_buf);
 destroy_queue:
-	tasklet_kill(&vscsi->work_task);
+	cancel_work_sync(&vscsi->work_task);
 	ibmvscsis_unregister_command_q(vscsi);
 	ibmvscsis_destroy_command_q(vscsi);
 free_timer:
@@ -3602,7 +3601,7 @@ static void ibmvscsis_remove(struct vio_dev *vdev)
 	dma_unmap_single(&vdev->dev, vscsi->map_ioba, PAGE_SIZE,
 			 DMA_BIDIRECTIONAL);
 	kfree(vscsi->map_buf);
-	tasklet_kill(&vscsi->work_task);
+	cancel_work_sync(&vscsi->work_task);
 	ibmvscsis_destroy_command_q(vscsi);
 	ibmvscsis_freetimer(vscsi);
 	ibmvscsis_free_cmds(vscsi);
diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h
index 7ae074e5d7a1..e7dea32e4dbc 100644
--- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h
+++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h
@@ -18,6 +18,7 @@
 #define __H_IBMVSCSI_TGT
 
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 #include "libsrp.h"
 
 #define SYS_ID_NAME_LEN		64
@@ -295,7 +296,7 @@ struct scsi_info {
 	struct vio_dev *dma_dev;
 	struct srp_target target;
 	struct ibmvscsis_tport tport;
-	struct tasklet_struct work_task;
+	struct work_struct work_task;
 	struct work_struct proc_work;
 };
 
diff --git a/drivers/scsi/isci/host.c b/drivers/scsi/isci/host.c
index 35589b6af90d..d911dc159809 100644
--- a/drivers/scsi/isci/host.c
+++ b/drivers/scsi/isci/host.c
@@ -220,7 +220,7 @@ irqreturn_t isci_msix_isr(int vec, void *data)
 	struct isci_host *ihost = data;
 
 	if (sci_controller_isr(ihost))
-		tasklet_schedule(&ihost->completion_tasklet);
+		queue_work(system_bh_wq, &ihost->completion_work);
 
 	return IRQ_HANDLED;
 }
@@ -610,7 +610,7 @@ irqreturn_t isci_intx_isr(int vec, void *data)
 
 	if (sci_controller_isr(ihost)) {
 		writel(SMU_ISR_COMPLETION, &ihost->smu_registers->interrupt_status);
-		tasklet_schedule(&ihost->completion_tasklet);
+		queue_work(system_bh_wq, &ihost->completion_work);
 		ret = IRQ_HANDLED;
 	} else if (sci_controller_error_isr(ihost)) {
 		spin_lock(&ihost->scic_lock);
@@ -1106,14 +1106,14 @@ void ireq_done(struct isci_host *ihost, struct isci_request *ireq, struct sas_ta
 /**
  * isci_host_completion_routine() - This function is the delayed service
  *    routine that calls the sci core library's completion handler. It's
- *    scheduled as a tasklet from the interrupt service routine when interrupts
+ *    scheduled as a BH work from the interrupt service routine when interrupts
  *    in use, or set as the timeout function in polled mode.
- * @data: This parameter specifies the ISCI host object
+ * @t: pointer to the work_struct
  *
  */
-void isci_host_completion_routine(unsigned long data)
+void isci_host_completion_routine(struct work_struct *t)
 {
-	struct isci_host *ihost = (struct isci_host *)data;
+	struct isci_host *ihost = from_work(ihost, t, completion_work);
 	u16 active;
 
 	spin_lock_irq(&ihost->scic_lock);
diff --git a/drivers/scsi/isci/host.h b/drivers/scsi/isci/host.h
index 52388374cf31..8350e70bfb3a 100644
--- a/drivers/scsi/isci/host.h
+++ b/drivers/scsi/isci/host.h
@@ -131,8 +131,8 @@ struct sci_port_configuration_agent {
  * @device_table: rni (hw remote node index) to remote device lookup table
  * @available_remote_nodes: rni allocator
  * @power_control: manage device spin up
- * @io_request_sequence: generation number for tci's (task contexts)
- * @task_context_table: hw task context table
+ * @io_request_sequence: generation number for tci's (bh contexts)
+ * @task_context_table: hw bh context table
  * @remote_node_context_table: hw remote node context table
  * @completion_queue: hw-producer driver-consumer communication ring
  * @completion_queue_get: tracks the driver 'head' of the ring to notify hw
@@ -203,7 +203,7 @@ struct isci_host {
 	#define IHOST_IRQ_ENABLED 2
 	unsigned long flags;
 	wait_queue_head_t eventq;
-	struct tasklet_struct completion_tasklet;
+	struct work_struct completion_work;
 	spinlock_t scic_lock;
 	struct isci_request *reqs[SCI_MAX_IO_REQUESTS];
 	struct isci_remote_device devices[SCI_MAX_REMOTE_DEVICES];
@@ -478,7 +478,7 @@ void isci_tci_free(struct isci_host *ihost, u16 tci);
 void ireq_done(struct isci_host *ihost, struct isci_request *ireq, struct sas_task *task);
 
 int isci_host_init(struct isci_host *);
-void isci_host_completion_routine(unsigned long data);
+void isci_host_completion_routine(struct work_struct *t);
 void isci_host_deinit(struct isci_host *);
 void sci_controller_disable_interrupts(struct isci_host *ihost);
 bool sci_controller_has_remote_devices_stopping(struct isci_host *ihost);
diff --git a/drivers/scsi/isci/init.c b/drivers/scsi/isci/init.c
index c582a3932cea..605e4d965e04 100644
--- a/drivers/scsi/isci/init.c
+++ b/drivers/scsi/isci/init.c
@@ -510,8 +510,8 @@ static struct isci_host *isci_host_alloc(struct pci_dev *pdev, int id)
 	init_waitqueue_head(&ihost->eventq);
 	ihost->sas_ha.dev = &ihost->pdev->dev;
 	ihost->sas_ha.lldd_ha = ihost;
-	tasklet_init(&ihost->completion_tasklet,
-		     isci_host_completion_routine, (unsigned long)ihost);
+	INIT_WORK(&ihost->completion_work,
+		     isci_host_completion_routine);
 
 	/* validate module parameters */
 	/* TODO: kill struct sci_user_parameters and reference directly */
diff --git a/drivers/scsi/megaraid/mega_common.h b/drivers/scsi/megaraid/mega_common.h
index 2ad0aa2f837d..cff3e98dbe31 100644
--- a/drivers/scsi/megaraid/mega_common.h
+++ b/drivers/scsi/megaraid/mega_common.h
@@ -24,6 +24,7 @@
 #include <linux/list.h>
 #include <linux/moduleparam.h>
 #include <linux/dma-mapping.h>
+#include <linux/workqueue.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_device.h>
@@ -95,7 +96,7 @@ typedef struct {
 
 /**
  * struct adapter_t - driver's initialization structure
- * @aram dpc_h			: tasklet handle
+ * @aram dpc_h			: work handle
  * @pdev			: pci configuration pointer for kernel
  * @host			: pointer to host structure of mid-layer
  * @lock			: synchronization lock for mid-layer and driver
@@ -149,7 +150,7 @@ typedef struct {
 #define VERSION_SIZE	16
 
 typedef struct {
-	struct tasklet_struct	dpc_h;
+	struct work_struct	dpc_h;
 	struct pci_dev		*pdev;
 	struct Scsi_Host	*host;
 	spinlock_t		lock;
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index bc867da650b6..4ce033cb9554 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -119,7 +119,7 @@ static void megaraid_mbox_prepare_epthru(adapter_t *, scb_t *,
 
 static irqreturn_t megaraid_isr(int, void *);
 
-static void megaraid_mbox_dpc(unsigned long);
+static void megaraid_mbox_dpc(struct work_struct *);
 
 static ssize_t megaraid_mbox_app_hndl_show(struct device *, struct device_attribute *attr, char *);
 static ssize_t megaraid_mbox_ld_show(struct device *, struct device_attribute *attr, char *);
@@ -879,9 +879,8 @@ megaraid_init_mbox(adapter_t *adapter)
 		}
 	}
 
-	// setup tasklet for DPC
-	tasklet_init(&adapter->dpc_h, megaraid_mbox_dpc,
-			(unsigned long)adapter);
+	/* Initialize the work for DPC */
+	INIT_WORK(&adapter->dpc_h, megaraid_mbox_dpc);
 
 	con_log(CL_DLEVEL1, (KERN_INFO
 		"megaraid mbox hba successfully initialized\n"));
@@ -917,7 +916,7 @@ megaraid_fini_mbox(adapter_t *adapter)
 	// flush all caches
 	megaraid_mbox_flush_cache(adapter);
 
-	tasklet_kill(&adapter->dpc_h);
+	cancel_work_sync(&adapter->dpc_h);
 
 	megaraid_sysfs_free_resources(adapter);
 
@@ -2127,7 +2126,7 @@ megaraid_ack_sequence(adapter_t *adapter)
 
 	// schedule the DPC if there is some work for it
 	if (handled)
-		tasklet_schedule(&adapter->dpc_h);
+		queue_work(system_bh_wq, &adapter->dpc_h);
 
 	return handled;
 }
@@ -2158,17 +2157,17 @@ megaraid_isr(int irq, void *devp)
 
 
 /**
- * megaraid_mbox_dpc - the tasklet to complete the commands from completed list
- * @devp	: pointer to HBA soft state
+ * megaraid_mbox_dpc - the work handler to complete the commands from completed list
+ * @t	: pointer to work_struct
  *
  * Pick up the commands from the completed list and send back to the owners.
  * This is a reentrant function and does not assume any locks are held while
  * it is being called.
  */
 static void
-megaraid_mbox_dpc(unsigned long devp)
+megaraid_mbox_dpc(struct work_struct *t)
 {
-	adapter_t		*adapter = (adapter_t *)devp;
+	adapter_t		*adapter = from_work(adapter, t, dpc_h);
 	mraid_device_t		*raid_dev;
 	struct list_head	clist;
 	struct scatterlist	*sgl;
@@ -3812,7 +3811,7 @@ megaraid_sysfs_free_resources(adapter_t *adapter)
  * megaraid_sysfs_get_ldmap_done - callback for get ldmap
  * @uioc	: completed packet
  *
- * Callback routine called in the ISR/tasklet context for get ldmap call
+ * Callback routine called in the ISR/BH context for get ldmap call
  */
 static void
 megaraid_sysfs_get_ldmap_done(uioc_t *uioc)
diff --git a/drivers/scsi/megaraid/megaraid_sas.h b/drivers/scsi/megaraid/megaraid_sas.h
index 56624cbf7fa5..8de7a678e096 100644
--- a/drivers/scsi/megaraid/megaraid_sas.h
+++ b/drivers/scsi/megaraid/megaraid_sas.h
@@ -2389,7 +2389,7 @@ struct megasas_instance {
 	atomic64_t high_iops_outstanding;
 
 	struct megasas_instance_template *instancet;
-	struct tasklet_struct isr_tasklet;
+	struct work_struct isr_work;
 	struct work_struct work_init;
 	struct delayed_work fw_fault_work;
 	struct workqueue_struct *fw_fault_work_q;
@@ -2551,7 +2551,7 @@ struct megasas_instance_template {
 	int (*check_reset)(struct megasas_instance *, \
 		struct megasas_register_set __iomem *);
 	irqreturn_t (*service_isr)(int irq, void *devp);
-	void (*tasklet)(unsigned long);
+	void (*work)(struct work_struct *);
 	u32 (*init_adapter)(struct megasas_instance *);
 	u32 (*build_and_issue_cmd) (struct megasas_instance *,
 				    struct scsi_cmnd *);
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 3d4f13da1ae8..dd935943ae4f 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -234,7 +234,7 @@ megasas_init_adapter_mfi(struct megasas_instance *instance);
 u32
 megasas_build_and_issue_cmd(struct megasas_instance *instance,
 			    struct scsi_cmnd *scmd);
-static void megasas_complete_cmd_dpc(unsigned long instance_addr);
+static void megasas_complete_cmd_dpc(struct work_struct *t);
 int
 wait_and_poll(struct megasas_instance *instance, struct megasas_cmd *cmd,
 	int seconds);
@@ -615,7 +615,7 @@ static struct megasas_instance_template megasas_instance_template_xscale = {
 	.adp_reset = megasas_adp_reset_xscale,
 	.check_reset = megasas_check_reset_xscale,
 	.service_isr = megasas_isr,
-	.tasklet = megasas_complete_cmd_dpc,
+	.work = megasas_complete_cmd_dpc,
 	.init_adapter = megasas_init_adapter_mfi,
 	.build_and_issue_cmd = megasas_build_and_issue_cmd,
 	.issue_dcmd = megasas_issue_dcmd,
@@ -754,7 +754,7 @@ static struct megasas_instance_template megasas_instance_template_ppc = {
 	.adp_reset = megasas_adp_reset_xscale,
 	.check_reset = megasas_check_reset_ppc,
 	.service_isr = megasas_isr,
-	.tasklet = megasas_complete_cmd_dpc,
+	.work = megasas_complete_cmd_dpc,
 	.init_adapter = megasas_init_adapter_mfi,
 	.build_and_issue_cmd = megasas_build_and_issue_cmd,
 	.issue_dcmd = megasas_issue_dcmd,
@@ -895,7 +895,7 @@ static struct megasas_instance_template megasas_instance_template_skinny = {
 	.adp_reset = megasas_adp_reset_gen2,
 	.check_reset = megasas_check_reset_skinny,
 	.service_isr = megasas_isr,
-	.tasklet = megasas_complete_cmd_dpc,
+	.work = megasas_complete_cmd_dpc,
 	.init_adapter = megasas_init_adapter_mfi,
 	.build_and_issue_cmd = megasas_build_and_issue_cmd,
 	.issue_dcmd = megasas_issue_dcmd,
@@ -1095,7 +1095,7 @@ static struct megasas_instance_template megasas_instance_template_gen2 = {
 	.adp_reset = megasas_adp_reset_gen2,
 	.check_reset = megasas_check_reset_gen2,
 	.service_isr = megasas_isr,
-	.tasklet = megasas_complete_cmd_dpc,
+	.work = megasas_complete_cmd_dpc,
 	.init_adapter = megasas_init_adapter_mfi,
 	.build_and_issue_cmd = megasas_build_and_issue_cmd,
 	.issue_dcmd = megasas_issue_dcmd,
@@ -2269,18 +2269,18 @@ megasas_check_and_restore_queue_depth(struct megasas_instance *instance)
 
 /**
  * megasas_complete_cmd_dpc	 -	Returns FW's controller structure
- * @instance_addr:			Address of adapter soft state
+ * @t:					pointer to the work_struct
  *
- * Tasklet to complete cmds
+ * Work to complete cmds
  */
-static void megasas_complete_cmd_dpc(unsigned long instance_addr)
+static void megasas_complete_cmd_dpc(struct work_struct *t)
 {
 	u32 producer;
 	u32 consumer;
 	u32 context;
 	struct megasas_cmd *cmd;
 	struct megasas_instance *instance =
-				(struct megasas_instance *)instance_addr;
+				from_work(instance, t, isr_work);
 	unsigned long flags;
 
 	/* If we have already declared adapter dead, donot complete cmds */
@@ -2825,7 +2825,7 @@ static int megasas_wait_for_outstanding(struct megasas_instance *instance)
 			 * Call cmd completion routine. Cmd to be
 			 * be completed directly without depending on isr.
 			 */
-			megasas_complete_cmd_dpc((unsigned long)instance);
+			megasas_complete_cmd_dpc(&instance->isr_work);
 		}
 
 		msleep(1000);
@@ -4073,7 +4073,7 @@ megasas_deplete_reply_queue(struct megasas_instance *instance,
 		}
 	}
 
-	tasklet_schedule(&instance->isr_tasklet);
+	queue_work(system_bh_wq, &instance->isr_work);
 	return IRQ_HANDLED;
 }
 
@@ -6313,8 +6313,7 @@ static int megasas_init_fw(struct megasas_instance *instance)
 	dev_info(&instance->pdev->dev,
 		"RDPQ mode\t: (%s)\n", instance->is_rdpq ? "enabled" : "disabled");
 
-	tasklet_init(&instance->isr_tasklet, instance->instancet->tasklet,
-		(unsigned long)instance);
+	INIT_WORK(&instance->isr_work, instance->instancet->work);
 
 	/*
 	 * Below are default value for legacy Firmware.
@@ -7757,7 +7756,7 @@ megasas_suspend(struct device *dev)
 		instance->ev = NULL;
 	}
 
-	tasklet_kill(&instance->isr_tasklet);
+	cancel_work_sync(&instance->isr_work);
 
 	pci_set_drvdata(instance->pdev, instance);
 	instance->instancet->disable_intr(instance);
@@ -7865,8 +7864,7 @@ megasas_resume(struct device *dev)
 	if (megasas_get_ctrl_info(instance) != DCMD_SUCCESS)
 		goto fail_init_mfi;
 
-	tasklet_init(&instance->isr_tasklet, instance->instancet->tasklet,
-		     (unsigned long)instance);
+	INIT_WORK(&instance->isr_work, instance->instancet->work);
 
 	if (instance->msix_vectors ?
 			megasas_setup_irqs_msix(instance, 0) :
@@ -7997,7 +7995,7 @@ static void megasas_detach_one(struct pci_dev *pdev)
 	/* cancel all wait events */
 	wake_up_all(&instance->int_cmd_wait_q);
 
-	tasklet_kill(&instance->isr_tasklet);
+	cancel_work_sync(&instance->isr_work);
 
 	/*
 	 * Take the instance off the instance array. Note that we will not
diff --git a/drivers/scsi/megaraid/megaraid_sas_fusion.c b/drivers/scsi/megaraid/megaraid_sas_fusion.c
index c60014e07b44..7dd036b31a0c 100644
--- a/drivers/scsi/megaraid/megaraid_sas_fusion.c
+++ b/drivers/scsi/megaraid/megaraid_sas_fusion.c
@@ -3821,15 +3821,15 @@ int megasas_irqpoll(struct irq_poll *irqpoll, int budget)
 
 /**
  * megasas_complete_cmd_dpc_fusion -	Completes command
- * @instance_addr:			Adapter soft state address
+ * @t:					pointer to the work_struct
  *
- * Tasklet to complete cmds
+ * Work to complete cmds
  */
 static void
-megasas_complete_cmd_dpc_fusion(unsigned long instance_addr)
+megasas_complete_cmd_dpc_fusion(struct work_struct *t)
 {
 	struct megasas_instance *instance =
-		(struct megasas_instance *)instance_addr;
+		from_work(instance, t, isr_work);
 	struct megasas_irq_context *irq_ctx = NULL;
 	u32 count, MSIxIndex;
 
@@ -4180,7 +4180,7 @@ megasas_wait_for_outstanding_fusion(struct megasas_instance *instance,
 	if (reason == MFI_IO_TIMEOUT_OCR) {
 		dev_info(&instance->pdev->dev,
 			"MFI command is timed out\n");
-		megasas_complete_cmd_dpc_fusion((unsigned long)instance);
+		megasas_complete_cmd_dpc_fusion(&instance->isr_work);
 		if (instance->snapdump_wait_time)
 			megasas_trigger_snap_dump(instance);
 		retval = 1;
@@ -4196,7 +4196,7 @@ megasas_wait_for_outstanding_fusion(struct megasas_instance *instance,
 				   "FW in FAULT state Fault code:0x%x subcode:0x%x func:%s\n",
 				   abs_state & MFI_STATE_FAULT_CODE,
 				   abs_state & MFI_STATE_FAULT_SUBCODE, __func__);
-			megasas_complete_cmd_dpc_fusion((unsigned long)instance);
+			megasas_complete_cmd_dpc_fusion(&instance->isr_work);
 			if (instance->requestorId && reason) {
 				dev_warn(&instance->pdev->dev, "SR-IOV Found FW in FAULT"
 				" state while polling during"
@@ -4240,7 +4240,7 @@ megasas_wait_for_outstanding_fusion(struct megasas_instance *instance,
 			}
 		}
 
-		megasas_complete_cmd_dpc_fusion((unsigned long)instance);
+		megasas_complete_cmd_dpc_fusion(&instance->isr_work);
 		outstanding = atomic_read(&instance->fw_outstanding);
 		if (!outstanding)
 			goto out;
@@ -5371,7 +5371,7 @@ struct megasas_instance_template megasas_instance_template_fusion = {
 	.adp_reset = megasas_adp_reset_fusion,
 	.check_reset = megasas_check_reset_fusion,
 	.service_isr = megasas_isr_fusion,
-	.tasklet = megasas_complete_cmd_dpc_fusion,
+	.work = megasas_complete_cmd_dpc_fusion,
 	.init_adapter = megasas_init_adapter_fusion,
 	.build_and_issue_cmd = megasas_build_and_issue_cmd_fusion,
 	.issue_dcmd = megasas_issue_dcmd_fusion,
diff --git a/drivers/scsi/mvsas/mv_init.c b/drivers/scsi/mvsas/mv_init.c
index 43ebb331e216..c8b3c18cfc6c 100644
--- a/drivers/scsi/mvsas/mv_init.c
+++ b/drivers/scsi/mvsas/mv_init.c
@@ -144,14 +144,14 @@ static void mvs_free(struct mvs_info *mvi)
 	kfree(mvi);
 }
 
-#ifdef CONFIG_SCSI_MVSAS_TASKLET
-static void mvs_tasklet(unsigned long opaque)
+#ifdef CONFIG_SCSI_MVSAS_WORK
+static void mvs_work(struct work_struct *t)
 {
 	u32 stat;
 	u16 core_nr, i = 0;
 
-	struct mvs_info *mvi;
-	struct sas_ha_struct *sha = (struct sas_ha_struct *)opaque;
+	struct mvs_info *mvi = from_work(mvi, t, mv_work);
+	struct sas_ha_struct *sha = mvi->sha;
 
 	core_nr = ((struct mvs_prv_info *)sha->lldd_ha)->n_host;
 	mvi = ((struct mvs_prv_info *)sha->lldd_ha)->mvi[0];
@@ -178,7 +178,7 @@ static irqreturn_t mvs_interrupt(int irq, void *opaque)
 	u32 stat;
 	struct mvs_info *mvi;
 	struct sas_ha_struct *sha = opaque;
-#ifndef CONFIG_SCSI_MVSAS_TASKLET
+#ifndef CONFIG_SCSI_MVSAS_WORK
 	u32 i;
 	u32 core_nr;
 
@@ -189,20 +189,20 @@ static irqreturn_t mvs_interrupt(int irq, void *opaque)
 
 	if (unlikely(!mvi))
 		return IRQ_NONE;
-#ifdef CONFIG_SCSI_MVSAS_TASKLET
+#ifdef CONFIG_SCSI_MVSAS_WORK
 	MVS_CHIP_DISP->interrupt_disable(mvi);
 #endif
 
 	stat = MVS_CHIP_DISP->isr_status(mvi, irq);
 	if (!stat) {
-	#ifdef CONFIG_SCSI_MVSAS_TASKLET
+	#ifdef CONFIG_SCSI_MVSAS_WORK
 		MVS_CHIP_DISP->interrupt_enable(mvi);
 	#endif
 		return IRQ_NONE;
 	}
 
-#ifdef CONFIG_SCSI_MVSAS_TASKLET
-	tasklet_schedule(&((struct mvs_prv_info *)sha->lldd_ha)->mv_tasklet);
+#ifdef CONFIG_SCSI_MVSAS_WORK
+	queue_work(system_bh_wq, &((struct mvs_prv_info *)sha->lldd_ha)->mv_work);
 #else
 	for (i = 0; i < core_nr; i++) {
 		mvi = ((struct mvs_prv_info *)sha->lldd_ha)->mvi[i];
@@ -553,12 +553,11 @@ static int mvs_pci_init(struct pci_dev *pdev, const struct pci_device_id *ent)
 		}
 		nhost++;
 	} while (nhost < chip->n_host);
-#ifdef CONFIG_SCSI_MVSAS_TASKLET
+#ifdef CONFIG_SCSI_MVSAS_WORK
 	{
 	struct mvs_prv_info *mpi = SHOST_TO_SAS_HA(shost)->lldd_ha;
 
-	tasklet_init(&(mpi->mv_tasklet), mvs_tasklet,
-		     (unsigned long)SHOST_TO_SAS_HA(shost));
+	INIT_WORK(&(mpi->mv_work), mvs_work);
 	}
 #endif
 
@@ -603,8 +602,8 @@ static void mvs_pci_remove(struct pci_dev *pdev)
 	core_nr = ((struct mvs_prv_info *)sha->lldd_ha)->n_host;
 	mvi = ((struct mvs_prv_info *)sha->lldd_ha)->mvi[0];
 
-#ifdef CONFIG_SCSI_MVSAS_TASKLET
-	tasklet_kill(&((struct mvs_prv_info *)sha->lldd_ha)->mv_tasklet);
+#ifdef CONFIG_SCSI_MVSAS_WORK
+	cancel_work_sync(&((struct mvs_prv_info *)sha->lldd_ha)->mv_work);
 #endif
 
 	sas_unregister_ha(sha);
diff --git a/drivers/scsi/mvsas/mv_sas.h b/drivers/scsi/mvsas/mv_sas.h
index 68df771e2975..2bf1af51e2a4 100644
--- a/drivers/scsi/mvsas/mv_sas.h
+++ b/drivers/scsi/mvsas/mv_sas.h
@@ -23,6 +23,7 @@
 #include <linux/irq.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/workqueue.h>
 #include <asm/unaligned.h>
 #include <scsi/libsas.h>
 #include <scsi/scsi.h>
@@ -402,7 +403,7 @@ struct mvs_prv_info{
 	u8 scan_finished;
 	u8 reserve;
 	struct mvs_info *mvi[2];
-	struct tasklet_struct mv_tasklet;
+	struct work_struct mv_work;
 };
 
 struct mvs_wq {
@@ -432,8 +433,8 @@ void mvs_set_sas_addr(struct mvs_info *mvi, int port_id, u32 off_lo,
 		      u32 off_hi, u64 sas_addr);
 void mvs_scan_start(struct Scsi_Host *shost);
 int mvs_scan_finished(struct Scsi_Host *shost, unsigned long time);
-int mvs_queue_command(struct sas_task *task, gfp_t gfp_flags);
-int mvs_abort_task(struct sas_task *task);
+int mvs_queue_command(struct sas_task *work, gfp_t gfp_flags);
+int mvs_abort_task(struct sas_task *work);
 void mvs_port_formed(struct asd_sas_phy *sas_phy);
 void mvs_port_deformed(struct asd_sas_phy *sas_phy);
 int mvs_dev_found(struct domain_device *dev);
@@ -441,7 +442,7 @@ void mvs_dev_gone(struct domain_device *dev);
 int mvs_lu_reset(struct domain_device *dev, u8 *lun);
 int mvs_slot_complete(struct mvs_info *mvi, u32 rx_desc, u32 flags);
 int mvs_I_T_nexus_reset(struct domain_device *dev);
-int mvs_query_task(struct sas_task *task);
+int mvs_query_task(struct sas_task *work);
 void mvs_release_task(struct mvs_info *mvi,
 			struct domain_device *dev);
 void mvs_do_release_task(struct mvs_info *mvi, int phy_no,
diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index ed6b7d954dda..bda175682785 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -60,8 +60,8 @@ bool pm8001_use_msix = true;
 module_param_named(use_msix, pm8001_use_msix, bool, 0444);
 MODULE_PARM_DESC(zoned, "Use MSIX interrupts. Default: true");
 
-static bool pm8001_use_tasklet = true;
-module_param_named(use_tasklet, pm8001_use_tasklet, bool, 0444);
+static bool pm8001_use_bh_work = true;
+module_param_named(use_bh_work, pm8001_use_bh_work, bool, 0444);
 MODULE_PARM_DESC(zoned, "Use MSIX interrupts. Default: true");
 
 static bool pm8001_read_wwn = true;
@@ -213,14 +213,17 @@ static void pm8001_free(struct pm8001_hba_info *pm8001_ha)
 }
 
 /**
- * pm8001_tasklet() - tasklet for 64 msi-x interrupt handler
- * @opaque: the passed general host adapter struct
- * Note: pm8001_tasklet is common for pm8001 & pm80xx
+ * pm8001_work() - BH work for 64 msi-x interrupt handler
+ * @t: pointer to work_struct
+ * Note: pm8001_work is common for pm8001 & pm80xx
  */
-static void pm8001_tasklet(unsigned long opaque)
+static void pm8001_work(struct work_struct *t)
 {
-	struct isr_param *irq_vector = (struct isr_param *)opaque;
-	struct pm8001_hba_info *pm8001_ha = irq_vector->drv_inst;
+	/*FIXME: Since we don't know the index, we need a
+	 * mechanism to determine it or always use index 0
+	 */
+	struct pm8001_hba_info *pm8001_ha = from_work(pm8001_ha, t, work[0]);
+	struct isr_param *irq_vector = pm8001_ha->irq_vector;
 
 	if (WARN_ON_ONCE(!pm8001_ha))
 		return;
@@ -228,41 +231,39 @@ static void pm8001_tasklet(unsigned long opaque)
 	PM8001_CHIP_DISP->isr(pm8001_ha, irq_vector->irq_id);
 }
 
-static void pm8001_init_tasklet(struct pm8001_hba_info *pm8001_ha)
+static void pm8001_init_work(struct pm8001_hba_info *pm8001_ha)
 {
 	int i;
 
-	if (!pm8001_use_tasklet)
+	if (!pm8001_use_bh_work)
 		return;
 
-	/*  Tasklet for non msi-x interrupt handler */
+	/*  Work for non msi-x interrupt handler */
 	if ((!pm8001_ha->pdev->msix_cap || !pci_msi_enabled()) ||
 	    (pm8001_ha->chip_id == chip_8001)) {
-		tasklet_init(&pm8001_ha->tasklet[0], pm8001_tasklet,
-			     (unsigned long)&(pm8001_ha->irq_vector[0]));
+		INIT_WORK(&pm8001_ha->work[0], pm8001_work);
 		return;
 	}
 	for (i = 0; i < PM8001_MAX_MSIX_VEC; i++)
-		tasklet_init(&pm8001_ha->tasklet[i], pm8001_tasklet,
-			     (unsigned long)&(pm8001_ha->irq_vector[i]));
+		INIT_WORK(&pm8001_ha->work[i], pm8001_work);
 }
 
-static void pm8001_kill_tasklet(struct pm8001_hba_info *pm8001_ha)
+static void pm8001_cancel_work(struct pm8001_hba_info *pm8001_ha)
 {
 	int i;
 
-	if (!pm8001_use_tasklet)
+	if (!pm8001_use_bh_work)
 		return;
 
 	/* For non-msix and msix interrupts */
 	if ((!pm8001_ha->pdev->msix_cap || !pci_msi_enabled()) ||
 	    (pm8001_ha->chip_id == chip_8001)) {
-		tasklet_kill(&pm8001_ha->tasklet[0]);
+		cancel_work_sync(&pm8001_ha->work[0]);
 		return;
 	}
 
 	for (i = 0; i < PM8001_MAX_MSIX_VEC; i++)
-		tasklet_kill(&pm8001_ha->tasklet[i]);
+		cancel_work_sync(&pm8001_ha->work[i]);
 }
 
 static irqreturn_t pm8001_handle_irq(struct pm8001_hba_info *pm8001_ha,
@@ -274,10 +275,10 @@ static irqreturn_t pm8001_handle_irq(struct pm8001_hba_info *pm8001_ha,
 	if (!PM8001_CHIP_DISP->is_our_interrupt(pm8001_ha))
 		return IRQ_NONE;
 
-	if (!pm8001_use_tasklet)
+	if (!pm8001_use_bh_work)
 		return PM8001_CHIP_DISP->isr(pm8001_ha, irq);
 
-	tasklet_schedule(&pm8001_ha->tasklet[irq]);
+	queue_work(system_bh_wq, &pm8001_ha->work[irq]);
 	return IRQ_HANDLED;
 }
 
@@ -580,7 +581,7 @@ static struct pm8001_hba_info *pm8001_pci_alloc(struct pci_dev *pdev,
 	else
 		pm8001_ha->iomb_size = IOMB_SIZE_SPC;
 
-	pm8001_init_tasklet(pm8001_ha);
+	pm8001_init_work(pm8001_ha);
 
 	if (pm8001_ioremap(pm8001_ha))
 		goto failed_pci_alloc;
@@ -1318,7 +1319,7 @@ static void pm8001_pci_remove(struct pci_dev *pdev)
 	PM8001_CHIP_DISP->chip_soft_rst(pm8001_ha);
 
 	pm8001_free_irq(pm8001_ha);
-	pm8001_kill_tasklet(pm8001_ha);
+	pm8001_cancel_work(pm8001_ha);
 	scsi_host_put(pm8001_ha->shost);
 
 	for (i = 0; i < pm8001_ha->ccb_count; i++) {
@@ -1361,7 +1362,7 @@ static int __maybe_unused pm8001_pci_suspend(struct device *dev)
 	PM8001_CHIP_DISP->chip_soft_rst(pm8001_ha);
 
 	pm8001_free_irq(pm8001_ha);
-	pm8001_kill_tasklet(pm8001_ha);
+	pm8001_cancel_work(pm8001_ha);
 
 	pm8001_info(pm8001_ha, "pdev=0x%p, slot=%s, entering "
 		      "suspended state\n", pdev,
@@ -1410,7 +1411,7 @@ static int __maybe_unused pm8001_pci_resume(struct device *dev)
 	if (rc)
 		goto err_out_disable;
 
-	pm8001_init_tasklet(pm8001_ha);
+	pm8001_init_work(pm8001_ha);
 
 	PM8001_CHIP_DISP->interrupt_enable(pm8001_ha, 0);
 	if (pm8001_ha->chip_id != chip_8001) {
@@ -1543,8 +1544,8 @@ static int __init pm8001_init(void)
 {
 	int rc = -ENOMEM;
 
-	if (pm8001_use_tasklet && !pm8001_use_msix)
-		pm8001_use_tasklet = false;
+	if (pm8001_use_bh_work && !pm8001_use_msix)
+		pm8001_use_bh_work = false;
 
 	pm8001_wq = alloc_workqueue("pm80xx", 0, 0);
 	if (!pm8001_wq)
diff --git a/drivers/scsi/pm8001/pm8001_sas.h b/drivers/scsi/pm8001/pm8001_sas.h
index 3ccb7371902f..08ab597406c7 100644
--- a/drivers/scsi/pm8001/pm8001_sas.h
+++ b/drivers/scsi/pm8001/pm8001_sas.h
@@ -522,7 +522,7 @@ struct pm8001_hba_info {
 	int			number_of_intr;/*will be used in remove()*/
 	char			intr_drvname[PM8001_MAX_MSIX_VEC]
 				[PM8001_NAME_LENGTH+1+3+1];
-	struct tasklet_struct	tasklet[PM8001_MAX_MSIX_VEC];
+	struct work_struct	work[PM8001_MAX_MSIX_VEC];
 	u32			logging_level;
 	u32			link_rate;
 	u32			fw_status;
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index e8bcc3a88732..be21c0ffe002 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -859,7 +859,7 @@ static void _pmcraid_fire_command(struct pmcraid_cmd *cmd)
 	/* Add this command block to pending cmd pool. We do this prior to
 	 * writting IOARCB to ioarrin because IOA might complete the command
 	 * by the time we are about to add it to the list. Response handler
-	 * (isr/tasklet) looks for cmd block in the pending pending list.
+	 * (isr/BH work) looks for cmd block in the pending list.
 	 */
 	spin_lock_irqsave(&pinstance->pending_pool_lock, lock_flags);
 	list_add_tail(&cmd->free_list, &pinstance->pending_cmd_pool);
@@ -1077,7 +1077,7 @@ static void pmcraid_identify_hrrq(struct pmcraid_cmd *cmd)
 
 	/* Subsequent commands require HRRQ identification to be successful.
 	 * Note that this gets called even during reset from SCSI mid-layer
-	 * or tasklet
+	 * or BH work
 	 */
 	pmcraid_send_cmd(cmd, done_function,
 			 PMCRAID_INTERNAL_TIMEOUT,
@@ -1843,7 +1843,7 @@ static void pmcraid_unregister_hcams(struct pmcraid_cmd *cmd)
 {
 	struct pmcraid_instance *pinstance = cmd->drv_inst;
 
-	/* During IOA bringdown, HCAM gets fired and tasklet proceeds with
+	/* During IOA bringdown, HCAM gets fired and BH work proceeds with
 	 * handling hcam response though it is not necessary. In order to
 	 * prevent this, set 'ignore', so that bring-down sequence doesn't
 	 * re-send any more hcams
@@ -1916,7 +1916,7 @@ static void pmcraid_soft_reset(struct pmcraid_cmd *cmd)
 	u32 doorbell;
 
 	/* There will be an interrupt when Transition to Operational bit is
-	 * set so tasklet would execute next reset task. The timeout handler
+	 * set so BH work would execute next reset task. The timeout handler
 	 * would re-initiate a reset
 	 */
 	cmd->cmd_done = pmcraid_ioa_reset;
@@ -2039,7 +2039,7 @@ static void pmcraid_fail_outstanding_cmds(struct pmcraid_instance *pinstance)
  * @cmd: pointer to the cmd block to be used for entire reset process
  *
  * This function executes most of the steps required for IOA reset. This gets
- * called by user threads (modprobe/insmod/rmmod) timer, tasklet and midlayer's
+ * called by user threads (modprobe/insmod/rmmod) timer, BH work and midlayer's
  * 'eh_' thread. Access to variables used for controlling the reset sequence is
  * synchronized using host lock. Various functions called during reset process
  * would make use of a single command block, pointer to which is also stored in
@@ -2199,7 +2199,7 @@ static void pmcraid_ioa_reset(struct pmcraid_cmd *cmd)
 		pinstance->ioa_state = IOA_STATE_IN_BRINGUP;
 
 		/* Initialization commands start with HRRQ identification. From
-		 * now on tasklet completes most of the commands as IOA is up
+		 * now on BH work completes most of the commands as IOA is up
 		 * and intrs are enabled
 		 */
 		pmcraid_identify_hrrq(cmd);
@@ -2261,7 +2261,7 @@ static void pmcraid_ioa_reset(struct pmcraid_cmd *cmd)
 
 /**
  * pmcraid_initiate_reset - initiates reset sequence. This is called from
- * ISR/tasklet during error interrupts including IOA unit check. If reset
+ * ISR/BH work during error interrupts including IOA unit check. If reset
  * is already in progress, it just returns, otherwise initiates IOA reset
  * to bring IOA up to operational state.
  *
@@ -2303,7 +2303,7 @@ static void pmcraid_initiate_reset(struct pmcraid_instance *pinstance)
  * @target_state: expected target state after reset
  *
  * Note: This command initiates reset and waits for its completion. Hence this
- * should not be called from isr/timer/tasklet functions (timeout handlers,
+ * should not be called from isr/timer/BH work functions (timeout handlers,
  * error response handlers and interrupt handlers).
  *
  * Return Value
@@ -2449,7 +2449,7 @@ static void pmcraid_request_sense(struct pmcraid_cmd *cmd)
 	ioadl->flags = IOADL_FLAGS_LAST_DESC;
 
 	/* request sense might be called as part of error response processing
-	 * which runs in tasklets context. It is possible that mid-layer might
+	 * which runs in works context. It is possible that mid-layer might
 	 * schedule queuecommand during this time, hence, writting to IOARRIN
 	 * must be protect by host_lock
 	 */
@@ -2566,7 +2566,7 @@ static void pmcraid_frame_auto_sense(struct pmcraid_cmd *cmd)
  * @cmd: pointer to pmcraid_cmd that has failed
  *
  * This function determines whether or not to initiate ERP on the affected
- * device. This is called from a tasklet, which doesn't hold any locks.
+ * device. This is called from a BH work, which doesn't hold any locks.
  *
  * Return value:
  *	 0 it caller can complete the request, otherwise 1 where in error
@@ -2825,7 +2825,7 @@ static int _pmcraid_io_done(struct pmcraid_cmd *cmd, int reslen, int ioasc)
  *
  * @cmd: pointer to pmcraid command struct
  *
- * This function is invoked by tasklet/mid-layer error handler to completing
+ * This function is invoked by BH work/mid-layer error handler to completing
  * the SCSI ops sent from mid-layer.
  *
  * Return value
@@ -3743,7 +3743,7 @@ static irqreturn_t pmcraid_isr_msix(int irq, void *dev_id)
 		}
 	}
 
-	tasklet_schedule(&(pinstance->isr_tasklet[hrrq_id]));
+	queue_work(system_bh_wq, &(pinstance->isr_work[hrrq_id]));
 
 	return IRQ_HANDLED;
 }
@@ -3811,8 +3811,8 @@ static irqreturn_t pmcraid_isr(int irq, void *dev_id)
 			ioread32(
 				pinstance->int_regs.ioa_host_interrupt_clr_reg);
 
-			tasklet_schedule(
-					&(pinstance->isr_tasklet[hrrq_id]));
+			queue_work(system_bh_wq,
+					&(pinstance->isr_work[hrrq_id]));
 		}
 	}
 
@@ -3918,14 +3918,14 @@ static void pmcraid_worker_function(struct work_struct *workp)
 }
 
 /**
- * pmcraid_tasklet_function - Tasklet function
+ * pmcraid_work_function - Work function
  *
- * @instance: pointer to msix param structure
+ * @t:  pointer to work_struct
  *
  * Return Value
  *	None
  */
-static void pmcraid_tasklet_function(unsigned long instance)
+static void pmcraid_work_function(struct work_struct *t)
 {
 	struct pmcraid_isr_param *hrrq_vector;
 	struct pmcraid_instance *pinstance;
@@ -3936,14 +3936,17 @@ static void pmcraid_tasklet_function(unsigned long instance)
 	int id;
 	u32 resp;
 
-	hrrq_vector = (struct pmcraid_isr_param *)instance;
-	pinstance = hrrq_vector->drv_inst;
+	/* FIXME: Since we don't know the index, we need a
+	 * mechanism to determine it or always use index 0
+	 */
+	pinstance = from_work(pinstance, t, isr_work[0]);
+	hrrq_vector = pinstance->hrrq_vector;
 	id = hrrq_vector->hrrq_id;
 	lockp = &(pinstance->hrrq_lock[id]);
 
 	/* loop through each of the commands responded by IOA. Each HRRQ buf is
 	 * protected by its own lock. Traversals must be done within this lock
-	 * as there may be multiple tasklets running on multiple CPUs. Note
+	 * as there may be multiple works running on multiple CPUs. Note
 	 * that the lock is held just for picking up the response handle and
 	 * manipulating hrrq_curr/toggle_bit values.
 	 */
@@ -4416,35 +4419,34 @@ static int pmcraid_allocate_config_buffers(struct pmcraid_instance *pinstance)
 }
 
 /**
- * pmcraid_init_tasklets - registers tasklets for response handling
+ * pmcraid_init_works - registers works for response handling
  *
  * @pinstance: pointer adapter instance structure
  *
  * Return value
  *	none
  */
-static void pmcraid_init_tasklets(struct pmcraid_instance *pinstance)
+static void pmcraid_init_works(struct pmcraid_instance *pinstance)
 {
 	int i;
 	for (i = 0; i < pinstance->num_hrrq; i++)
-		tasklet_init(&pinstance->isr_tasklet[i],
-			     pmcraid_tasklet_function,
-			     (unsigned long)&pinstance->hrrq_vector[i]);
+		INIT_WORK(&pinstance->isr_work[i],
+			     pmcraid_work_function);
 }
 
 /**
- * pmcraid_kill_tasklets - destroys tasklets registered for response handling
+ * pmcraid_kill_works - destroys works registered for response handling
  *
  * @pinstance: pointer to adapter instance structure
  *
  * Return value
  *	none
  */
-static void pmcraid_kill_tasklets(struct pmcraid_instance *pinstance)
+static void pmcraid_kill_works(struct pmcraid_instance *pinstance)
 {
 	int i;
 	for (i = 0; i < pinstance->num_hrrq; i++)
-		tasklet_kill(&pinstance->isr_tasklet[i]);
+		cancel_work_sync(&pinstance->isr_work[i]);
 }
 
 /**
@@ -4770,7 +4772,7 @@ static void pmcraid_remove(struct pci_dev *pdev)
 	pmcraid_disable_interrupts(pinstance, ~0);
 	flush_work(&pinstance->worker_q);
 
-	pmcraid_kill_tasklets(pinstance);
+	pmcraid_kill_works(pinstance);
 	pmcraid_unregister_interrupt_handler(pinstance);
 	pmcraid_release_buffers(pinstance);
 	iounmap(pinstance->mapped_dma_addr);
@@ -4794,7 +4796,7 @@ static int __maybe_unused pmcraid_suspend(struct device *dev)
 
 	pmcraid_shutdown(pdev);
 	pmcraid_disable_interrupts(pinstance, ~0);
-	pmcraid_kill_tasklets(pinstance);
+	pmcraid_kill_works(pinstance);
 	pmcraid_unregister_interrupt_handler(pinstance);
 
 	return 0;
@@ -4836,7 +4838,7 @@ static int __maybe_unused pmcraid_resume(struct device *dev)
 		goto release_host;
 	}
 
-	pmcraid_init_tasklets(pinstance);
+	pmcraid_init_works(pinstance);
 	pmcraid_enable_interrupts(pinstance, PMCRAID_PCI_INTERRUPTS);
 
 	/* Start with hard reset sequence which brings up IOA to operational
@@ -4850,14 +4852,14 @@ static int __maybe_unused pmcraid_resume(struct device *dev)
 	if (pmcraid_reset_bringup(pinstance)) {
 		dev_err(&pdev->dev, "couldn't initialize IOA\n");
 		rc = -ENODEV;
-		goto release_tasklets;
+		goto release_works;
 	}
 
 	return 0;
 
-release_tasklets:
+release_works:
 	pmcraid_disable_interrupts(pinstance, ~0);
-	pmcraid_kill_tasklets(pinstance);
+	pmcraid_kill_works(pinstance);
 	pmcraid_unregister_interrupt_handler(pinstance);
 
 release_host:
@@ -4869,7 +4871,7 @@ static int __maybe_unused pmcraid_resume(struct device *dev)
 }
 
 /**
- * pmcraid_complete_ioa_reset - Called by either timer or tasklet during
+ * pmcraid_complete_ioa_reset - Called by either timer or BH work during
  *				completion of the ioa reset
  * @cmd: pointer to reset command block
  */
@@ -5014,7 +5016,7 @@ static void pmcraid_init_res_table(struct pmcraid_cmd *cmd)
 
 	/* resource list is protected by pinstance->resource_lock.
 	 * init_res_table can be called from probe (user-thread) or runtime
-	 * reset (timer/tasklet)
+	 * reset (timer/BH work)
 	 */
 	spin_lock_irqsave(&pinstance->resource_lock, lock_flags);
 
@@ -5281,7 +5283,7 @@ static int pmcraid_probe(struct pci_dev *pdev,
 		goto out_scsi_host_put;
 	}
 
-	pmcraid_init_tasklets(pinstance);
+	pmcraid_init_works(pinstance);
 
 	/* allocate verious buffers used by LLD.*/
 	rc = pmcraid_init_buffers(pinstance);
@@ -5337,7 +5339,7 @@ static int pmcraid_probe(struct pci_dev *pdev,
 	pmcraid_release_buffers(pinstance);
 
 out_unregister_isr:
-	pmcraid_kill_tasklets(pinstance);
+	pmcraid_kill_works(pinstance);
 	pmcraid_unregister_interrupt_handler(pinstance);
 
 out_scsi_host_put:
diff --git a/drivers/scsi/pmcraid.h b/drivers/scsi/pmcraid.h
index 9f59930e8b4f..2c17b1f4b57e 100644
--- a/drivers/scsi/pmcraid.h
+++ b/drivers/scsi/pmcraid.h
@@ -20,6 +20,7 @@
 #include <net/netlink.h>
 #include <net/genetlink.h>
 #include <linux/connector.h>
+#include <linux/workqueue.h>
 /*
  * Driver name   : string representing the driver name
  * Device file   : /dev file to be used for management interfaces
@@ -752,8 +753,8 @@ struct pmcraid_instance {
 	spinlock_t free_pool_lock;		/* free pool lock */
 	spinlock_t pending_pool_lock;		/* pending pool lock */
 
-	/* Tasklet to handle deferred processing */
-	struct tasklet_struct isr_tasklet[PMCRAID_NUM_MSIX_VECTORS];
+	/* BH work to handle deferred processing */
+	struct work_struct isr_work[PMCRAID_NUM_MSIX_VECTORS];
 
 	/* Work-queue (Shared) for deferred reset processing */
 	struct work_struct worker_q;
-- 
2.17.1

