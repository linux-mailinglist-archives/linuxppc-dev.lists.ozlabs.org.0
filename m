Return-Path: <linuxppc-dev+bounces-3943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A49EBCBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 23:04:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7CRl41Nmz30Qk;
	Wed, 11 Dec 2024 09:03:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733868227;
	cv=none; b=hVeCjQx01ggku3cLZN0hZ3PR7+SbxYLYwN1cMC1GSe6k5knBe2sq5dFSYQEthQwL7IrldSLXvdVAHNwPmGmTESlh6OgKUKJD9kGHWPG8SPQSoG8g85553lJ+8kKeLQ5wZd9YrQ+GJ/e2byP9Uvv4alcTdqKc+hXaJioC83dnlP3Ep9bHLM4pEeLiJMvJ/cTD9ylVLgAVkcPBOPRfMsf6tP03Z9s+czCYOM1AUFiztheu/1ihfilI33KQUZoRYSQDl4jG+kZ5KLAQAr9q/5JK1eRu0XAJJqTlIJWQcZSc/9eIlgz60g5hKvPyEXORJ/91E7vKMt0RXbuqlInvB6Ot8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733868227; c=relaxed/relaxed;
	bh=4PsoF6SsPfbe/epEx07m/H71eMXFwTragWU3TWb95lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0qr9C8A/igSZzIF2KMjheJ9BPEBLVkAW18ogI338B9W+2t9gDyU0Ql3x938bV9BM3KSXqvXbKz/fQZ6m8AVr/j82mkZPUfQCg6YF3+NGXfSqrYaLQMWi4x2ispltZgQwuxlarczcIHIrySuRC1wRsWHTUHrfrtL6nR3Qgnd4/T663ISUW/2BwsFPHmYe+WLyADXBsrn5lXfmC3yic4uimxmKKHXejgyZKWN8tKuQUZ8EZJ0mzLzAGxsTPZ2g750wG1GR9XyT+3bUDvf8WbSNwWHAiGN12bBicFI4YfpJOmfBKAA0QrgrQ0YudgTk+yD3UffQOlqz+Hg4zPwaoBNWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=h7xNg+CJ; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=h7xNg+CJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7CRh5WFGz30CN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 09:03:44 +1100 (AEDT)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id 102E5204722E;
	Tue, 10 Dec 2024 14:02:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 102E5204722E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733868158;
	bh=4PsoF6SsPfbe/epEx07m/H71eMXFwTragWU3TWb95lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h7xNg+CJMXTd5DQ9X3jMinLoN7vSFDg8Wc8ctVRvzEZXRU6zr2IuGvATvzcH5C5mv
	 8tZpWnxa3guMlnaHImjL8p97Vyif6Q4iPn6nrKcU0WRTq12Y7YJw/78q0d2IIYZwV/
	 HU4b3GuDdaH6l3YJ/3viq/heQZ5TTvrnm5sB3x44=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Tue, 10 Dec 2024 22:02:40 +0000
Subject: [PATCH v3 09/19] scsi: lpfc: Convert timeouts to secs_to_jiffies()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-converge-secs-to-jiffies-v3-9-ddfefd7e9f2a@linux.microsoft.com>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org, 
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org, 
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org, 
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
secs_to_jiffies(). As the value here is a multiple of 1000, use
secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.

This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
the following Coccinelle rules:

@@ constant C; @@

- msecs_to_jiffies(C * 1000)
+ secs_to_jiffies(C)

@@ constant C; @@

- msecs_to_jiffies(C * MSEC_PER_SEC)
+ secs_to_jiffies(C)

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/scsi/lpfc/lpfc_init.c      | 18 +++++++++---------
 drivers/scsi/lpfc/lpfc_nportdisc.c |  8 ++++----
 drivers/scsi/lpfc/lpfc_nvme.c      |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c       |  4 ++--
 drivers/scsi/lpfc/lpfc_vmid.c      |  2 +-
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 7f57397d91a90d8fea689a6d095c30c974fd63f6..4fed2e1243e05896c7e67902b6a9924bed1a5ea9 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -598,7 +598,7 @@ lpfc_config_port_post(struct lpfc_hba *phba)
 		  jiffies + msecs_to_jiffies(1000 * timeout));
 	/* Set up heart beat (HB) timer */
 	mod_timer(&phba->hb_tmofunc,
-		  jiffies + msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL));
+		  jiffies + secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	clear_bit(HBA_HBEAT_INP, &phba->hba_flag);
 	clear_bit(HBA_HBEAT_TMO, &phba->hba_flag);
 	phba->last_completion_time = jiffies;
@@ -1267,7 +1267,7 @@ lpfc_hb_mbox_cmpl(struct lpfc_hba * phba, LPFC_MBOXQ_t * pmboxq)
 	    !test_bit(FC_UNLOADING, &phba->pport->load_flag))
 		mod_timer(&phba->hb_tmofunc,
 			  jiffies +
-			  msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL));
+			  secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	return;
 }
 
@@ -1555,7 +1555,7 @@ lpfc_hb_timeout_handler(struct lpfc_hba *phba)
 		/* If IOs are completing, no need to issue a MBX_HEARTBEAT */
 		spin_lock_irq(&phba->pport->work_port_lock);
 		if (time_after(phba->last_completion_time +
-				msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL),
+				secs_to_jiffies(LPFC_HB_MBOX_INTERVAL),
 				jiffies)) {
 			spin_unlock_irq(&phba->pport->work_port_lock);
 			if (test_bit(HBA_HBEAT_INP, &phba->hba_flag))
@@ -3354,7 +3354,7 @@ lpfc_block_mgmt_io(struct lpfc_hba *phba, int mbx_action)
 	spin_unlock_irqrestore(&phba->hbalock, iflag);
 	if (mbx_action == LPFC_MBX_NO_WAIT)
 		return;
-	timeout = msecs_to_jiffies(LPFC_MBOX_TMO * 1000) + jiffies;
+	timeout = secs_to_jiffies(LPFC_MBOX_TMO) + jiffies;
 	spin_lock_irqsave(&phba->hbalock, iflag);
 	if (phba->sli.mbox_active) {
 		actcmd = phba->sli.mbox_active->u.mb.mbxCommand;
@@ -4924,14 +4924,14 @@ int lpfc_scan_finished(struct Scsi_Host *shost, unsigned long time)
 		stat = 1;
 		goto finished;
 	}
-	if (time >= msecs_to_jiffies(30 * 1000)) {
+	if (time >= secs_to_jiffies(30)) {
 		lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
 				"0461 Scanning longer than 30 "
 				"seconds.  Continuing initialization\n");
 		stat = 1;
 		goto finished;
 	}
-	if (time >= msecs_to_jiffies(15 * 1000) &&
+	if (time >= secs_to_jiffies(15) &&
 	    phba->link_state <= LPFC_LINK_DOWN) {
 		lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
 				"0465 Link down longer than 15 "
@@ -4945,7 +4945,7 @@ int lpfc_scan_finished(struct Scsi_Host *shost, unsigned long time)
 	if (vport->num_disc_nodes || vport->fc_prli_sent)
 		goto finished;
 	if (!atomic_read(&vport->fc_map_cnt) &&
-	    time < msecs_to_jiffies(2 * 1000))
+	    time < secs_to_jiffies(2))
 		goto finished;
 	if ((phba->sli.sli_flag & LPFC_SLI_MBOX_ACTIVE) != 0)
 		goto finished;
@@ -5179,8 +5179,8 @@ lpfc_vmid_poll(struct timer_list *t)
 		lpfc_worker_wake_up(phba);
 
 	/* restart the timer for the next iteration */
-	mod_timer(&phba->inactive_vmid_poll, jiffies + msecs_to_jiffies(1000 *
-							LPFC_VMID_TIMER));
+	mod_timer(&phba->inactive_vmid_poll,
+		  jiffies + secs_to_jiffies(LPFC_VMID_TIMER));
 }
 
 /**
diff --git a/drivers/scsi/lpfc/lpfc_nportdisc.c b/drivers/scsi/lpfc/lpfc_nportdisc.c
index 4d88cfe71caed398d376030c9ae06d3aad6ae00c..08a7f5c6157ff984d6e37751ca5398adbf80b607 100644
--- a/drivers/scsi/lpfc/lpfc_nportdisc.c
+++ b/drivers/scsi/lpfc/lpfc_nportdisc.c
@@ -906,7 +906,7 @@ lpfc_rcv_logo(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 		    (ndlp->nlp_state >= NLP_STE_ADISC_ISSUE ||
 		     ndlp->nlp_state <= NLP_STE_PRLI_ISSUE)) {
 			mod_timer(&ndlp->nlp_delayfunc,
-				  jiffies + msecs_to_jiffies(1000 * 1));
+				  jiffies + secs_to_jiffies(1));
 			set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 			ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
 			lpfc_printf_vlog(vport, KERN_INFO,
@@ -1332,7 +1332,7 @@ lpfc_rcv_els_plogi_issue(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 	}
 
 	/* Put ndlp in npr state set plogi timer for 1 sec */
-	mod_timer(&ndlp->nlp_delayfunc, jiffies + msecs_to_jiffies(1000 * 1));
+	mod_timer(&ndlp->nlp_delayfunc, jiffies + secs_to_jiffies(1));
 	set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 	ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
 	ndlp->nlp_prev_state = NLP_STE_PLOGI_ISSUE;
@@ -1936,7 +1936,7 @@ lpfc_cmpl_reglogin_reglogin_issue(struct lpfc_vport *vport,
 
 		/* Put ndlp in npr state set plogi timer for 1 sec */
 		mod_timer(&ndlp->nlp_delayfunc,
-			  jiffies + msecs_to_jiffies(1000 * 1));
+			  jiffies + secs_to_jiffies(1));
 		set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 		ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
 
@@ -2743,7 +2743,7 @@ lpfc_rcv_prlo_npr_node(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 
 	if (!test_bit(NLP_DELAY_TMO, &ndlp->nlp_flag)) {
 		mod_timer(&ndlp->nlp_delayfunc,
-			  jiffies + msecs_to_jiffies(1000 * 1));
+			  jiffies + secs_to_jiffies(1));
 		set_bit(NLP_DELAY_TMO, &ndlp->nlp_flag);
 		clear_bit(NLP_NPR_ADISC, &ndlp->nlp_flag);
 		ndlp->nlp_last_elscmd = ELS_CMD_PLOGI;
diff --git a/drivers/scsi/lpfc/lpfc_nvme.c b/drivers/scsi/lpfc/lpfc_nvme.c
index 43dc1da4a1567c05d6ac5f8bda19032737998e64..b1adb9f59097d083a3ae24f4ddf6413350a0368d 100644
--- a/drivers/scsi/lpfc/lpfc_nvme.c
+++ b/drivers/scsi/lpfc/lpfc_nvme.c
@@ -2237,7 +2237,7 @@ lpfc_nvme_lport_unreg_wait(struct lpfc_vport *vport,
 	 * wait. Print a message if a 10 second wait expires and renew the
 	 * wait. This is unexpected.
 	 */
-	wait_tmo = msecs_to_jiffies(LPFC_NVME_WAIT_TMO * 1000);
+	wait_tmo = secs_to_jiffies(LPFC_NVME_WAIT_TMO);
 	while (true) {
 		ret = wait_for_completion_timeout(lport_unreg_cmp, wait_tmo);
 		if (unlikely(!ret)) {
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 874644b31a3ebd815d5bf55bc4b3464c94d9cfa6..3fd9723cd271c8a024b6f34e583668e973404e6f 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -9012,7 +9012,7 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 
 	/* Start heart beat timer */
 	mod_timer(&phba->hb_tmofunc,
-		  jiffies + msecs_to_jiffies(1000 * LPFC_HB_MBOX_INTERVAL));
+		  jiffies + secs_to_jiffies(LPFC_HB_MBOX_INTERVAL));
 	clear_bit(HBA_HBEAT_INP, &phba->hba_flag);
 	clear_bit(HBA_HBEAT_TMO, &phba->hba_flag);
 	phba->last_completion_time = jiffies;
@@ -13323,7 +13323,7 @@ lpfc_sli_mbox_sys_shutdown(struct lpfc_hba *phba, int mbx_action)
 		lpfc_sli_mbox_sys_flush(phba);
 		return;
 	}
-	timeout = msecs_to_jiffies(LPFC_MBOX_TMO * 1000) + jiffies;
+	timeout = secs_to_jiffies(LPFC_MBOX_TMO) + jiffies;
 
 	/* Disable softirqs, including timers from obtaining phba->hbalock */
 	local_bh_disable();
diff --git a/drivers/scsi/lpfc/lpfc_vmid.c b/drivers/scsi/lpfc/lpfc_vmid.c
index cc3e4736f2fe29e1fd4afe221c9c7c40ecf382d4..14dbfe954e423acc47d1b1c80160ff193783f500 100644
--- a/drivers/scsi/lpfc/lpfc_vmid.c
+++ b/drivers/scsi/lpfc/lpfc_vmid.c
@@ -278,7 +278,7 @@ int lpfc_vmid_get_appid(struct lpfc_vport *vport, char *uuid,
 		if (!(vport->phba->pport->vmid_flag & LPFC_VMID_TIMER_ENBLD)) {
 			mod_timer(&vport->phba->inactive_vmid_poll,
 				  jiffies +
-				  msecs_to_jiffies(1000 * LPFC_VMID_TIMER));
+				  secs_to_jiffies(LPFC_VMID_TIMER));
 			vport->phba->pport->vmid_flag |= LPFC_VMID_TIMER_ENBLD;
 		}
 	}

-- 
2.43.0


