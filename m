Return-Path: <linuxppc-dev+bounces-11233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E3B3333B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 00:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c986N3l05z2xQ1;
	Mon, 25 Aug 2025 08:41:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::832"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756061121;
	cv=none; b=jrzVP27Qdy7BxIlUUD3XlKCWdeugCjI8Iop/+oLekktI+BeyLEeAZrDLGguQNJ7zD02Fz2plCxP91y6Ap9qhM7u0cbTyjYAqEtwGNkZMeITSV34JgvM/G1DlnToOJR1s9zhPZcHGRpI3cv2/ZkYi+XNzwbYXx7vm5cDdbpVUgEojqLzfbGX04UEopbvw4xvGNHtJS9Lp9iFfIathSag9PxFRob14eCIUiFBKDiM8WfDVYmvxbnJwiauyv+hu5/Rp/OFGOivv820XB9selQQg+4xMYX/bgr7hgAIcNUBIQPVc/3/J2RNJITV8Rm9Riw8xh6Py5Ut9K9SZd/Ir/TyIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756061121; c=relaxed/relaxed;
	bh=9jf8pvuIHsijmo+aLexlCckPmDErJY+IsD9aTk8QLyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7/+yAPR5LP2WyldRk5duVtoQw3auCDqwp039bkH+quRH01p13NyF66a0RV4IYCfEnR1pj2Zm0oYNrfeItjI93mnnlRf2S2vk/BD8JL2VaajNBk+gUVrGBDQnL+h73EUwAgmmABKYtsANtiKnZyfMk9sDgCioXwZmj1YF/i29TGCSAYLV5ozHpYe9XKjoEc/+WpUy2KtEYPKwdXoTBqF/3ZF5bGiyXWVyfRoYiTKI3FYfSimGTuRwMYgLm9sGkg6XIq8TGHRoM1CgLNacVw7oPPK4TWP1C5Wn/0W7gFiSlZjPkHES8b30hzDXehljGmYE3+yuRN1XOELMd2kw9nZIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iGl55aPg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=chelsyratnawat2001@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iGl55aPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=chelsyratnawat2001@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c92t75dD6z3091
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 04:45:18 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4b109914034so48589911cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Aug 2025 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756061115; x=1756665915; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jf8pvuIHsijmo+aLexlCckPmDErJY+IsD9aTk8QLyo=;
        b=iGl55aPgWgkLfidOsvpURTVqh1/xohPqchvK/cNE1oa3MR0RHHUs1+Pu3LZ+S91mA2
         tzyUEyR2L+entp7tPlylbENfnf1DbTy+NaMpyGn2XLfXx1yqHD1RsKqCMe4WqyOyzAWV
         XrR0uhTQcENF+v8/S6rY/EbqbINwFLuYcZ4A31WTV9xB2ks8bxmApBiywslUIj9YxNmp
         z2WGsFibluDRrKRRM5QPng8iHsGp66AZBVzyVsBRRi4ipu2GyW62oUmccNI/VsL7IAlU
         becPlAbzX/k7xbOcp29FIEyLIHME2v/86Y3KloIV4oTcBBQB1a7QFpjDFhYTR/0AlJ/Y
         jEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756061115; x=1756665915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jf8pvuIHsijmo+aLexlCckPmDErJY+IsD9aTk8QLyo=;
        b=xLxIsoz6s7rN/y8vnWdibj7D1T7mQ/2dVf4/AWezXzqw0CjYn04SzQlqzdLpHnLQHD
         Xy6b/ZqTz3pIthovlBiSg0QWaV3dfFCStXlJJp4/iYCLJB0Qq4ZkR4iU5icmkkhHC4Tt
         qpzp5c48qceJt5dyrK3XfM9PoEnqLkLX3si1LQwn4bhGsFDplyjlE/wxe53QYgMRf9lB
         yqOgki3jDYAq0pwbApWrev0MnOgFzXt0tUnguwHexp/rwrys0x9EhbTYuRoIMQ3D5ye0
         YQ5xqWqkwjA3J/Ur9OypQ6eJN5tJZzOCqnLrtHOuVpVYQzMmH9E0RtBgA1TMyZU0QJ7b
         TdKw==
X-Forwarded-Encrypted: i=1; AJvYcCUlHKlsQNJ2cTlk0m40y3znCQlQLe2DKyqoP4gDKirG39Ri9bbJ2bjG8Z+8jWu6nqmYr5ghVnvB30E9uCY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxENsNunzwM3KouhQhWcI1fErc+A0TaOCwyPFgzDxNnflre5yzB
	qM6A96MTycsLdHtrAMhR21/K12h0O0zqFeg1jy11k5kOY5ob7QVARA5A
X-Gm-Gg: ASbGncsKdU7o2hNb86kya118Jve01XNoyBBbpuMjMz50duRtSMobvjytjdkSKbIeSGU
	63eCAUeVo4GocppHuYvcK+u+ajEeawTmR7T7Jb/bGTmOtIxk2ZwUZ54Rey3tiqafaFLgWyWPCfD
	/jpT5+vqNqqQIt2fhSjIDwU7vxZGR+tvYnie3b08dGS/hwdVLR3WUDraLMIW16Wkh5L73IimNn2
	iqnfd9WpIYdBAF1tQZ7jdd+q1By9mio75JLLhTbHnFfqY6bIMGCKFusOtzpICqNxX1UAH56FMxB
	nnIbtA2qNTEuQNQzFQSmegdn3FXzxa3FR9rkU4Yvr94F+iqQBAt6FQ4eJ4UAxk2ICBZ41dt+uR/
	QP4zllUQA3qzPuJqg4hofHhnNViwWoIrs2nNYzSZifGmEgE0Zv46WSRjPEQ==
X-Google-Smtp-Source: AGHT+IF1mE3pDzONuvbDVw/ZD9A7vT/q4p1ackzTZzK3ILDE7f8/7efvTJvZZVeu2N+pNirC5d7OsA==
X-Received: by 2002:ac8:7f0f:0:b0:4b2:9bd2:8176 with SMTP id d75a77b69052e-4b2aaa8128amr133033991cf.27.1756061115173;
        Sun, 24 Aug 2025 11:45:15 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e45c4asm36600501cf.46.2025.08.24.11.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 11:45:14 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: fischer@norbit.de,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	don.brace@microchip.com,
	brking@us.ibm.com,
	sathya.prakash@broadcom.com,
	willy@infradead.org
Cc: linux-scsi@vger.kernel.org,
	storagedev@microchip.com,
	linuxppc-dev@lists.ozlabs.org,
	open-iscsi@googlegroups.com,
	megaraidlinux.pdl@broadcom.com,
	MPT-FusionLinux.pdl@broadcom.com,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] scsi: Use string choices helpers
Date: Sun, 24 Aug 2025 11:44:57 -0700
Message-ID: <20250824184457.2423422-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use string_choices.h helpers instead of hard-coded strings.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/scsi/aha152x.c                    | 17 +++++++++--------
 drivers/scsi/aic7xxx/aic79xx_pci.c        |  3 ++-
 drivers/scsi/be2iscsi/be_iscsi.c          |  5 +++--
 drivers/scsi/hpsa.c                       |  5 +++--
 drivers/scsi/ibmvscsi/ibmvfc.c            |  3 ++-
 drivers/scsi/ipr.c                        |  3 ++-
 drivers/scsi/libiscsi.c                   |  5 +++--
 drivers/scsi/megaraid/megaraid_sas_base.c |  9 +++++----
 drivers/scsi/mpt3sas/mpt3sas_base.c       |  3 ++-
 drivers/scsi/nsp32.c                      |  3 ++-
 drivers/scsi/qedf/qedf_debugfs.c          |  3 ++-
 drivers/scsi/qla2xxx/qla_attr.c           |  3 ++-
 drivers/scsi/qla2xxx/qla_init.c           |  5 +++--
 drivers/scsi/qla2xxx/qla_os.c             |  4 ++--
 drivers/scsi/sd.c                         |  5 +++--
 drivers/scsi/st.c                         |  3 ++-
 drivers/scsi/sym53c8xx_2/sym_glue.c       |  3 ++-
 17 files changed, 49 insertions(+), 33 deletions(-)

diff --git a/drivers/scsi/aha152x.c b/drivers/scsi/aha152x.c
index e94c0a19c435..f42328781d1c 100644
--- a/drivers/scsi/aha152x.c
+++ b/drivers/scsi/aha152x.c
@@ -243,6 +243,7 @@
 #include <linux/workqueue.h>
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -796,11 +797,11 @@ struct Scsi_Host *aha152x_probe_one(struct aha152x_setup *setup)
 	       shpnt->io_port, HOSTIOPORT0, HOSTIOPORT1,
 	       shpnt->irq,
 	       shpnt->this_id,
-	       RECONNECT ? "enabled" : "disabled",
-	       PARITY ? "enabled" : "disabled",
-	       SYNCHRONOUS ? "enabled" : "disabled",
+	       str_enabled_disabled(RECONNECT),
+	       str_enabled_disabled(PARITY),
+	       str_enabled_disabled(SYNCHRONOUS),
 	       DELAY,
-	       EXT_TRANS ? "enabled" : "disabled");
+	       str_enabled_disabled(EXT_TRANS));
 
 	/* not expecting any interrupts */
 	SETPORT(SIMODE0, 0);
@@ -2616,7 +2617,7 @@ static void get_ports(struct seq_file *m, struct Scsi_Host *shpnt)
 
 	seq_puts(m, "); ");
 
-	seq_printf(m, "INTSTAT (%s); ", TESTHI(DMASTAT, INTSTAT) ? "hi" : "lo");
+	seq_printf(m, "INTSTAT (%s); ", str_hi_lo(TESTHI(DMASTAT, INTSTAT)));
 
 	seq_puts(m, "SSTAT( ");
 	s = GETPORT(SSTAT0);
@@ -2867,11 +2868,11 @@ static int aha152x_show_info(struct seq_file *m, struct Scsi_Host *shpnt)
 		shpnt->io_port, shpnt->io_port + shpnt->n_io_port - 1);
 	seq_printf(m, "interrupt 0x%02x\n", shpnt->irq);
 	seq_printf(m, "disconnection/reconnection %s\n",
-		RECONNECT ? "enabled" : "disabled");
+		str_enabled_disabled(RECONNECT));
 	seq_printf(m, "parity checking %s\n",
-		PARITY ? "enabled" : "disabled");
+		str_enabled_disabled(PARITY));
 	seq_printf(m, "synchronous transfers %s\n",
-		SYNCHRONOUS ? "enabled" : "disabled");
+		str_enabled_disabled(SYNCHRONOUS));
 	seq_printf(m, "%d commands currently queued\n", HOSTDATA(shpnt)->commands);
 
 	if(SYNCHRONOUS) {
diff --git a/drivers/scsi/aic7xxx/aic79xx_pci.c b/drivers/scsi/aic7xxx/aic79xx_pci.c
index 5fad41b1ab58..a4bd68da4549 100644
--- a/drivers/scsi/aic7xxx/aic79xx_pci.c
+++ b/drivers/scsi/aic7xxx/aic79xx_pci.c
@@ -44,6 +44,7 @@
 #include "aic79xx_osm.h"
 #include "aic79xx_inline.h"
 #include "aic79xx_pci.h"
+#include <linux/string_choices.h>
 
 static inline uint64_t
 ahd_compose_id(u_int device, u_int vendor, u_int subdevice, u_int subvendor)
@@ -647,7 +648,7 @@ ahd_configure_termination(struct ahd_softc *ahd, u_int adapter_control)
 		devconfig |= STPWLEVEL;
 	if (bootverbose)
 		printk("%s: STPWLEVEL is %s\n",
-		       ahd_name(ahd), (devconfig & STPWLEVEL) ? "on" : "off");
+		       ahd_name(ahd), str_on_off(devconfig & STPWLEVEL));
 	ahd_pci_write_config(ahd->dev_softc, DEVCONFIG, devconfig, /*bytes*/4);
  
 	/* Make sure current sensing is off. */
diff --git a/drivers/scsi/be2iscsi/be_iscsi.c b/drivers/scsi/be2iscsi/be_iscsi.c
index 8d374ae863ba..b35a2a5e0e11 100644
--- a/drivers/scsi/be2iscsi/be_iscsi.c
+++ b/drivers/scsi/be2iscsi/be_iscsi.c
@@ -22,6 +22,7 @@
 #include <scsi/scsi.h>
 
 #include "be_iscsi.h"
+#include <linux/string_choices.h>
 
 extern struct iscsi_transport beiscsi_iscsi_transport;
 
@@ -601,10 +602,10 @@ int beiscsi_iface_get_param(struct iscsi_iface *iface,
 	case ISCSI_NET_PARAM_IFACE_ENABLE:
 		if (iface->iface_type == ISCSI_IFACE_TYPE_IPV4)
 			len = sprintf(buf, "%s\n",
-				      phba->ipv4_iface ? "enable" : "disable");
+				      str_enable_disable(phba->ipv4_iface));
 		else if (iface->iface_type == ISCSI_IFACE_TYPE_IPV6)
 			len = sprintf(buf, "%s\n",
-				      phba->ipv6_iface ? "enable" : "disable");
+				      str_enable_disable(phba->ipv6_iface));
 		break;
 	case ISCSI_NET_PARAM_IPV4_GW:
 		memset(&gateway, 0, sizeof(gateway));
diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
index c73a71ac3c29..aa87a6e0aaa1 100644
--- a/drivers/scsi/hpsa.c
+++ b/drivers/scsi/hpsa.c
@@ -55,6 +55,7 @@
 #include <asm/div64.h>
 #include "hpsa_cmd.h"
 #include "hpsa.h"
+#include <linux/string_choices.h>
 
 /*
  * HPSA_DRIVER_VERSION must be 3 byte values (0-255) separated by '.'
@@ -465,7 +466,7 @@ static ssize_t host_store_hp_ssd_smart_path_status(struct device *dev,
 	h->acciopath_status = !!status;
 	dev_warn(&h->pdev->dev,
 		"hpsa: HP SSD Smart Path %s via sysfs update.\n",
-		h->acciopath_status ? "enabled" : "disabled");
+		str_enabled_disabled(h->acciopath_status));
 	return count;
 }
 
@@ -552,7 +553,7 @@ static ssize_t host_show_hp_ssd_smart_path_status(struct device *dev,
 
 	h = shost_to_hba(shost);
 	return snprintf(buf, 30, "HP SSD Smart Path %s\n",
-		(h->acciopath_status == 1) ?  "enabled" : "disabled");
+		str_enabled_disabled(h->acciopath_status == 1));
 }
 
 /* List of controllers which cannot be hard reset on kexec with reset_devices */
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 228daffb286d..08945f296635 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -31,6 +31,7 @@
 #include <scsi/scsi_transport_fc.h>
 #include <scsi/scsi_bsg_fc.h>
 #include "ibmvfc.h"
+#include <linux/string_choices.h>
 
 static unsigned int init_timeout = IBMVFC_INIT_TIMEOUT;
 static unsigned int default_timeout = IBMVFC_DEFAULT_TIMEOUT;
@@ -3854,7 +3855,7 @@ static int ibmvfc_toggle_scrq_irq(struct ibmvfc_queue *scrq, int enable)
 
 	if (rc)
 		dev_err(dev, "Couldn't %s sub-crq[%lu] irq. rc=%ld\n",
-			enable ? "enable" : "disable", scrq->hwq_id, rc);
+			str_enable_disable(enable), scrq->hwq_id, rc);
 
 	return rc;
 }
diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index d06b79f03538..9c711ce91b1e 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -70,6 +70,7 @@
 #include <scsi/scsi_eh.h>
 #include <scsi/scsi_cmnd.h>
 #include "ipr.h"
+#include <linux/string_choices.h>
 
 /*
  *   Global Data
@@ -4613,7 +4614,7 @@ static ssize_t ipr_store_raw_mode(struct device *dev,
 			len = strlen(buf);
 			if (res->sdev)
 				sdev_printk(KERN_INFO, res->sdev, "raw mode is %s\n",
-					res->raw_mode ? "enabled" : "disabled");
+					str_enabled_disabled(res->raw_mode));
 		} else
 			len = -EINVAL;
 	} else
diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index c9f410c50978..feb3c6153258 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -28,6 +28,7 @@
 #include <scsi/scsi_transport_iscsi.h>
 #include <scsi/libiscsi.h>
 #include <trace/events/iscsi.h>
+#include <linux/string_choices.h>
 
 static int iscsi_dbg_lib_conn;
 module_param_named(debug_libiscsi_conn, iscsi_dbg_lib_conn, int,
@@ -435,8 +436,8 @@ static int iscsi_prep_scsi_cmd_pdu(struct iscsi_task *task)
 	conn->scsicmd_pdus_cnt++;
 	ISCSI_DBG_SESSION(session, "iscsi prep [%s cid %d sc %p cdb 0x%x "
 			  "itt 0x%x len %d cmdsn %d win %d]\n",
-			  sc->sc_data_direction == DMA_TO_DEVICE ?
-			  "write" : "read", conn->id, sc, sc->cmnd[0],
+			  str_write_read(sc->sc_data_direction == DMA_TO_DEVICE),
+			  conn->id, sc, sc->cmnd[0],
 			  task->itt, transfer_length,
 			  session->cmdsn,
 			  session->max_cmdsn - session->exp_cmdsn + 1);
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 615e06fd4ee8..ae8af8064a5a 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -37,6 +37,7 @@
 #include <linux/poll.h>
 #include <linux/vmalloc.h>
 #include <linux/irq_poll.h>
+#include <linux/string_choices.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -6325,7 +6326,7 @@ static int megasas_init_fw(struct megasas_instance *instance)
 		"current msix/max num queues\t: (%d/%u)\n",
 		instance->msix_vectors, blk_mq_num_online_queues(0));
 	dev_info(&instance->pdev->dev,
-		"RDPQ mode\t: (%s)\n", instance->is_rdpq ? "enabled" : "disabled");
+		"RDPQ mode\t: (%s)\n", str_enabled_disabled(instance->is_rdpq));
 
 	tasklet_init(&instance->isr_tasklet, instance->instancet->tasklet,
 		(unsigned long)instance);
@@ -6484,11 +6485,11 @@ static int megasas_init_fw(struct megasas_instance *instance)
 		le16_to_cpu(ctrl_info->pci.sub_vendor_id),
 		le16_to_cpu(ctrl_info->pci.sub_device_id));
 	dev_info(&instance->pdev->dev, "unevenspan support	: %s\n",
-		instance->UnevenSpanSupport ? "yes" : "no");
+		str_yes_no(instance->UnevenSpanSupport));
 	dev_info(&instance->pdev->dev, "firmware crash dump	: %s\n",
-		instance->crash_dump_drv_support ? "yes" : "no");
+		str_yes_no(instance->crash_dump_drv_support));
 	dev_info(&instance->pdev->dev, "JBOD sequence map	: %s\n",
-		instance->use_seqnum_jbod_fp ? "enabled" : "disabled");
+		str_enabled_disabled(instance->use_seqnum_jbod_fp));
 
 	instance->max_sectors_per_req = instance->max_num_sge *
 						SGE_BUFFER_SIZE / 512;
diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index bd3efa5b46c7..c2e18a132dab 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -60,6 +60,7 @@
 #include <linux/ktime.h>
 #include <linux/kthread.h>
 #include <asm/page.h>        /* To get host page size per arch */
+#include <linux/string_choices.h>
 
 
 #include "mpt3sas_base.h"
@@ -3526,7 +3527,7 @@ _base_enable_msix(struct MPT3SAS_ADAPTER *ioc)
 	}
 
 	ioc_info(ioc, "High IOPs queues : %s\n",
-			ioc->high_iops_queues ? "enabled" : "disabled");
+			str_enabled_disabled(ioc->high_iops_queues));
 
 	return 0;
 
diff --git a/drivers/scsi/nsp32.c b/drivers/scsi/nsp32.c
index abc4ce9eae74..a484425f3fd2 100644
--- a/drivers/scsi/nsp32.c
+++ b/drivers/scsi/nsp32.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/ctype.h>
 #include <linux/dma-mapping.h>
+#include <linux/string_choices.h>
 
 #include <asm/dma.h>
 #include <asm/io.h>
@@ -1473,7 +1474,7 @@ static int nsp32_show_info(struct seq_file *m, struct Scsi_Host *host)
 
 #ifdef CONFIG_PM
 	seq_printf(m, "Power Management:      %s\n",
-		   (mode_reg & OPTF) ? "yes" : "no");
+		   str_yes_no(mode_reg & OPTF));
 #endif
 	seq_printf(m, "OEM:                   %ld, %s\n",
 		   (mode_reg & (OEM0|OEM1)), nsp32_model[model]);
diff --git a/drivers/scsi/qedf/qedf_debugfs.c b/drivers/scsi/qedf/qedf_debugfs.c
index 96174353e389..c03b61597e63 100644
--- a/drivers/scsi/qedf/qedf_debugfs.c
+++ b/drivers/scsi/qedf/qedf_debugfs.c
@@ -9,6 +9,7 @@
 #include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/vmalloc.h>
+#include <linux/string_choices.h>
 
 #include "qedf.h"
 #include "qedf_dbg.h"
@@ -201,7 +202,7 @@ qedf_dbg_stop_io_on_error_cmd_read(struct file *filp, char __user *buffer,
 
 	QEDF_INFO(qedf_dbg, QEDF_LOG_DEBUGFS, "entered\n");
 	cnt = scnprintf(cbuf, sizeof(cbuf), "%s\n",
-	    qedf->stop_io_on_error ? "true" : "false");
+	    str_true_false(qedf->stop_io_on_error));
 
 	return simple_read_from_buffer(buffer, count, ppos, cbuf, cnt);
 }
diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
index 2e584a8bf66b..e58658ade770 100644
--- a/drivers/scsi/qla2xxx/qla_attr.c
+++ b/drivers/scsi/qla2xxx/qla_attr.c
@@ -10,6 +10,7 @@
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 
 static int qla24xx_vport_disable(struct fc_vport *, bool);
 
@@ -1722,7 +1723,7 @@ qla2x00_allow_cna_fw_dump_show(struct device *dev,
 		return scnprintf(buf, PAGE_SIZE, "\n");
 	else
 		return scnprintf(buf, PAGE_SIZE, "%s\n",
-		    vha->hw->allow_cna_fw_dump ? "true" : "false");
+		    str_true_false(vha->hw->allow_cna_fw_dump));
 }
 
 static ssize_t
diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index be211ff22acb..9e035e1318a4 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/string_choices.h>
 
 #include "qla_devtbl.h"
 
@@ -4850,13 +4851,13 @@ qla2x00_init_rings(scsi_qla_host_t *vha)
 			(le32_to_cpu(mid_init_cb->init_cb.firmware_options_1) &
 			 BIT_7) != 0;
 		ql_dbg(ql_dbg_init, vha, 0x0191, "DPORT Support: %s.\n",
-		    (ha->flags.dport_enabled) ? "enabled" : "disabled");
+		    str_enabled_disabled(ha->flags.dport_enabled));
 		/* FA-WWPN Status */
 		ha->flags.fawwpn_enabled =
 			(le32_to_cpu(mid_init_cb->init_cb.firmware_options_1) &
 			 BIT_6) != 0;
 		ql_dbg(ql_dbg_init, vha, 0x00bc, "FA-WWPN Support: %s.\n",
-		    (ha->flags.fawwpn_enabled) ? "enabled" : "disabled");
+		    str_enabled_disabled(ha->flags.fawwpn_enabled));
 		/* Init_cb will be reused for other command(s).  Save a backup copy of port_name */
 		memcpy(ha->port_name, ha->init_cb->port_name, WWN_SIZE);
 	}
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index d4b484c0fd9d..b93f1186ab90 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -17,6 +17,7 @@
 #include <linux/crash_dump.h>
 #include <linux/trace_events.h>
 #include <linux/trace.h>
+#include <linux/string_choices.h>
 
 #include <scsi/scsi_tcq.h>
 #include <scsi/scsicam.h>
@@ -3221,8 +3222,7 @@ qla2x00_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	qla2x00_config_dma_addressing(ha);
 	ql_dbg_pci(ql_dbg_init, pdev, 0x0020,
 	    "64 Bit addressing is %s.\n",
-	    ha->flags.enable_64bit_addressing ? "enable" :
-	    "disable");
+	    str_enable_disable(ha->flags.enable_64bit_addressing));
 	ret = qla2x00_mem_alloc(ha, req_length, rsp_length, &req, &rsp);
 	if (ret) {
 		ql_log_pci(ql_log_fatal, pdev, 0x0031,
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 5b8668accf8e..984d91f39fd6 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -58,6 +58,7 @@
 #include <linux/t10-pi.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
+#include <linux/string_choices.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -3161,8 +3162,8 @@ sd_read_cache_type(struct scsi_disk *sdkp, unsigned char *buffer)
 		    old_rcd != sdkp->RCD || old_dpofua != sdkp->DPOFUA)
 			sd_printk(KERN_NOTICE, sdkp,
 				  "Write cache: %s, read cache: %s, %s\n",
-				  sdkp->WCE ? "enabled" : "disabled",
-				  sdkp->RCD ? "disabled" : "enabled",
+				  str_enabled_disabled(sdkp->WCE),
+				  str_disabled_enabled(sdkp->RCD),
 				  sdkp->DPOFUA ? "supports DPO and FUA"
 				  : "doesn't support DPO or FUA");
 
diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index 74a6830b7ed8..32ed32b0b31d 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -43,6 +43,7 @@ static const char *verstr = "20160209";
 #include <linux/idr.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/string_choices.h>
 
 #include <linux/uaccess.h>
 #include <asm/dma.h>
@@ -4434,7 +4435,7 @@ static int st_probe(struct device *dev)
 	sdev_printk(KERN_NOTICE, SDp,
 		    "Attached scsi tape %s\n", tpnt->name);
 	sdev_printk(KERN_INFO, SDp, "%s: try direct i/o: %s (alignment %d B)\n",
-		    tpnt->name, tpnt->try_dio ? "yes" : "no",
+		    tpnt->name, str_yes_no(tpnt->try_dio),
 		    queue_dma_alignment(SDp->request_queue) + 1);
 
 	return 0;
diff --git a/drivers/scsi/sym53c8xx_2/sym_glue.c b/drivers/scsi/sym53c8xx_2/sym_glue.c
index 57637a81776d..77fd6cc18d47 100644
--- a/drivers/scsi/sym53c8xx_2/sym_glue.c
+++ b/drivers/scsi/sym53c8xx_2/sym_glue.c
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_tcq.h>
 #include <scsi/scsi_device.h>
@@ -761,7 +762,7 @@ static void sym_tune_dev_queuing(struct sym_tcb *tp, int lun, u_short reqtags)
 	if (reqtags != oldtags) {
 		dev_info(&tp->starget->dev,
 		         "tagged command queuing %s, command queue depth %d.\n",
-		          lp->s.reqtags ? "enabled" : "disabled", reqtags);
+			 str_enabled_disabled(lp->s.reqtags), reqtags);
 	}
 }
 
-- 
2.47.3


