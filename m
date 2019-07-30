Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C079EE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 04:46:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yLXd01bKzDqGM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 12:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=afcidk@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VmG+Y5P5"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yLVH0plGzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 12:44:04 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id ay6so28299720plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 19:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lic9FsBbFIhilgJH9jdHsI1bCHTQauGCm3mQSU4XvTM=;
 b=VmG+Y5P5Dh2me3MuRE5xoeE8+31ZRDRtvUDuryelSgr1QOdkF5UR4sfAhfawGrnF4o
 5z+N42GmX4JOKqZ419NY+2NeE03748lWU8fiklu8RZ45CTP6kfm07+wnuBPZD0l/m5eZ
 sj/oDPdL0HQ6u9F5Hg+63dtbGim4BW6TYSL7dMhLzzjxpFh+aeB4uJjvYW9ZLnsBn1Cy
 S4n5cNVSOCaep4vWkFG9oDjODxzzuZwA+Rwztr0UpO+gASp2OxeVjMX2U1or+lSZLknx
 AtwaNIAqMlMZm2/n9t8nvsT0txtyJvMaBHXwN6XKLSfsykgh1nxG6imehh5Pjy7OYhtV
 6rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lic9FsBbFIhilgJH9jdHsI1bCHTQauGCm3mQSU4XvTM=;
 b=RAJDKK2s/xSWvZVoESMqjS399/gdeERHTwvqFDiZAC4mgeLpsYjj7kCyReCTgDEsy6
 qLt9D+SELgZGNTpmYlIG8D1D7LTO4QG48n62RKyhB1ws8YtkpBhDt7nVNevXf6RNNmAr
 1Gm8h6LDrEMt3a+I3q8m/e69AEqeYD3v6934GUvVIQpyYXDEfH1dK1xFp6IiE5W0MCYs
 NbUrJKA+1TGpj3nYBaZHwgJXFOr+w76+nMRabi3Xm8l85qODcwUNMrwaPn521yjCbP2h
 nE3RRyykhshPhS4CRdHJttFTJWzdzYUJ9Tf32qarjKa6QqYZ42Q1phpkIhrq2AWtVdgV
 lGQw==
X-Gm-Message-State: APjAAAXfeah2kFoEV4yoEsXZia+55isDoL+qKJAQJ05Tx1w9KfsnXy85
 5UL5SKfKSldSrV6sX1/Eqtw=
X-Google-Smtp-Source: APXvYqzNN+4+CjaPSeMWQ2/PLSQRyBZtcEjOJ6XJ3AsKOmbbAHM9cei4O5VqaExHC48K6xXqNKYu5w==
X-Received: by 2002:a17:902:1107:: with SMTP id
 d7mr11773332pla.184.1564454641476; 
 Mon, 29 Jul 2019 19:44:01 -0700 (PDT)
Received: from localhost.localdomain (220-128-162-163.HINET-IP.hinet.net.
 [220.128.162.163]) by smtp.googlemail.com with ESMTPSA id
 v185sm70944442pfb.14.2019.07.29.19.43.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 19:44:01 -0700 (PDT)
From: Pei-Hsuan Hung <afcidk@gmail.com>
To: 
Subject: [PATCH v2] Fix typo reigster to register
Date: Tue, 30 Jul 2019 10:42:32 +0800
Message-Id: <20190730024235.26273-1-afcidk@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <liviu.dudau@arm.com>
References: <liviu.dudau@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Oliver O'Halloran <oohall@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-scsi@vger.kernel.org,
 James Smart <james.smart@broadcom.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Pei-Hsuan Hung <afcidk@gmail.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Kalle Valo <kvalo@codeaurora.org>,
 trivial@kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian Starkey <brian.starkey@arm.com>, Jeremy Kerr <jk@ozlabs.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Pei-Hsuan Hung <afcidk@gmail.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Cc: trivial@kernel.org
---
Hi Liviu, thanks for your reply.
This patch is generated by a script so at first I didn't notice there is
also a typo in the word coefficient. I've fixed the typo in this
version.

 arch/powerpc/kernel/eeh.c                           | 2 +-
 arch/powerpc/platforms/cell/spufs/switch.c          | 4 ++--
 drivers/extcon/extcon-rt8973a.c                     | 2 +-
 drivers/gpu/drm/arm/malidp_regs.h                   | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.h | 2 +-
 drivers/scsi/lpfc/lpfc_hbadisc.c                    | 2 +-
 fs/userfaultfd.c                                    | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index c0e4b73191f3..d75c9c24ec4d 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1030,7 +1030,7 @@ int __init eeh_ops_register(struct eeh_ops *ops)
 }
 
 /**
- * eeh_ops_unregister - Unreigster platform dependent EEH operations
+ * eeh_ops_unregister - Unregister platform dependent EEH operations
  * @name: name of EEH platform operations
  *
  * Unregister the platform dependent EEH operation callback
diff --git a/arch/powerpc/platforms/cell/spufs/switch.c b/arch/powerpc/platforms/cell/spufs/switch.c
index 5c3f5d088c3b..9548a086937b 100644
--- a/arch/powerpc/platforms/cell/spufs/switch.c
+++ b/arch/powerpc/platforms/cell/spufs/switch.c
@@ -574,7 +574,7 @@ static inline void save_mfc_rag(struct spu_state *csa, struct spu *spu)
 {
 	/* Save, Step 38:
 	 *     Save RA_GROUP_ID register and the
-	 *     RA_ENABLE reigster in the CSA.
+	 *     RA_ENABLE register in the CSA.
 	 */
 	csa->priv1.resource_allocation_groupID_RW =
 		spu_resource_allocation_groupID_get(spu);
@@ -1227,7 +1227,7 @@ static inline void restore_mfc_rag(struct spu_state *csa, struct spu *spu)
 {
 	/* Restore, Step 29:
 	 *     Restore RA_GROUP_ID register and the
-	 *     RA_ENABLE reigster from the CSA.
+	 *     RA_ENABLE register from the CSA.
 	 */
 	spu_resource_allocation_groupID_set(spu,
 			csa->priv1.resource_allocation_groupID_RW);
diff --git a/drivers/extcon/extcon-rt8973a.c b/drivers/extcon/extcon-rt8973a.c
index 40c07f4d656e..e75c03792398 100644
--- a/drivers/extcon/extcon-rt8973a.c
+++ b/drivers/extcon/extcon-rt8973a.c
@@ -270,7 +270,7 @@ static int rt8973a_muic_get_cable_type(struct rt8973a_muic_info *info)
 	}
 	cable_type = adc & RT8973A_REG_ADC_MASK;
 
-	/* Read Device 1 reigster to identify correct cable type */
+	/* Read Device 1 register to identify correct cable type */
 	ret = regmap_read(info->regmap, RT8973A_REG_DEV1, &dev1);
 	if (ret) {
 		dev_err(info->dev, "failed to read DEV1 register\n");
diff --git a/drivers/gpu/drm/arm/malidp_regs.h b/drivers/gpu/drm/arm/malidp_regs.h
index 993031542fa1..9b4f95d8ccec 100644
--- a/drivers/gpu/drm/arm/malidp_regs.h
+++ b/drivers/gpu/drm/arm/malidp_regs.h
@@ -145,7 +145,7 @@
 #define     MALIDP_SE_COEFFTAB_DATA_MASK	0x3fff
 #define     MALIDP_SE_SET_COEFFTAB_DATA(x) \
 		((x) & MALIDP_SE_COEFFTAB_DATA_MASK)
-/* Enhance coeffents reigster offset */
+/* Enhance coefficients register offset */
 #define MALIDP_SE_IMAGE_ENH			0x3C
 /* ENH_LIMITS offset 0x0 */
 #define     MALIDP_SE_ENH_LOW_LEVEL		24
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.h
index 99c6f7eefd85..d03c8f12a15c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.h
@@ -58,7 +58,7 @@ struct fw_priv {
 	/* 0x81: PCI-AP, 01:PCIe, 02: 92S-U,
 	 * 0x82: USB-AP, 0x12: 72S-U, 03:SDIO */
 	u8 hci_sel;
-	/* the same value as reigster value  */
+	/* the same value as register value  */
 	u8 chip_version;
 	/* customer  ID low byte */
 	u8 customer_id_0;
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index 28ecaa7fc715..42b125602d72 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -6551,7 +6551,7 @@ lpfc_sli4_unregister_fcf(struct lpfc_hba *phba)
  * lpfc_unregister_fcf_rescan - Unregister currently registered fcf and rescan
  * @phba: Pointer to hba context object.
  *
- * This function unregisters the currently reigstered FCF. This function
+ * This function unregisters the currently registered FCF. This function
  * also tries to find another FCF for discovery by rescan the HBA FCF table.
  */
 void
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index ccbdbd62f0d8..612dc1240f90 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -267,7 +267,7 @@ static inline bool userfaultfd_huge_must_wait(struct userfaultfd_ctx *ctx,
 #endif /* CONFIG_HUGETLB_PAGE */
 
 /*
- * Verify the pagetables are still not ok after having reigstered into
+ * Verify the pagetables are still not ok after having registered into
  * the fault_pending_wqh to avoid userland having to UFFDIO_WAKE any
  * userfault that has already been resolved, if userfaultfd_read and
  * UFFDIO_COPY|ZEROPAGE are being run simultaneously on two different
-- 
2.17.1

