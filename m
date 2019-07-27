Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9A77D1A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 03:16:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45x4dc2bfJzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 11:16:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=afcidk@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T+UzIYi/"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wp6X0fDPzDqJh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 00:21:36 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 19so25842669pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2019 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=y63nlDdoReiitfVEZgVBo7xRRyCxoDD8AEYgo5/VomM=;
 b=T+UzIYi/1THcC8I6GGTQVftBbmYmneEqyzoZFaOOV0bsgkD4/yotJY+aT39yhYMbKU
 hP7XuGXa26yH/rd2Nj/oFrTDYEcp5JUuY3kmmuDDU7fPuMGddkQghGbGlfTO+H8pKvVB
 pSe3h0PTMAUsbiz2LBWk2Z19ayzMznrnydOiG1Hn9M1yV6yTmgyr6pygeBUIKivIxRkK
 AslNgkHOQWvuyAhddym0LYgEWCybK94ah26A3c+j6bFoy1BFojsB3uQ/zIoW1PPLaFzG
 iRc8ls7OCAbEHg78NFqB9lL8kFZRs8DzukHcVHBv38OGkga6Mp045UeW3iThwjfRKg8C
 KTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y63nlDdoReiitfVEZgVBo7xRRyCxoDD8AEYgo5/VomM=;
 b=c8Oc7r6TmYyc8jlfGETHIWxLdW3tlKr52QKSTXzXnaNlK/rqm5A7zfv0OOUQ94pta3
 4ZuYrUBO1KlDK6/dXxf32cVgC3e+qtmQSZmD9MiBBrAO7SslyWHW6iQYdyKVhKzyhBBD
 qO4NFUe4GXMCLaMNQFBMjdkcPG+gfvQncD5pdr1m2A4ufc0JKoiN5oMIMTF/ohXMCjM1
 jUZwLehj+AggCzWPD052AbSXi/YxXmSpUMr92w7iM5txg9kXaUO806R2YDa7/8G/rB2P
 f5cJkKqT5aZZTdDnbWEPMj95Mfww2YJpBRVpLOJOGPUGKvF9KJVmtHZyPiIOHJjfX84d
 w3SQ==
X-Gm-Message-State: APjAAAUHwZcE6kQoCQPQ6C96g5Y1g20zTqt2NkXEa3FzoI39ELQ1QB/b
 WHxOW/BwYE/0N6NCtPsBzzQ=
X-Google-Smtp-Source: APXvYqwImUJ0RccHZPsxX4PaZHY9X78k754oNQpfDLf2SEuy6uSlyklXeLtGbLK7+kjMFAkrLZ0G0A==
X-Received: by 2002:a65:5cca:: with SMTP id b10mr98493196pgt.365.1564237291919; 
 Sat, 27 Jul 2019 07:21:31 -0700 (PDT)
Received: from localhost.localdomain (36-238-206-183.dynamic-ip.hinet.net.
 [36.238.206.183])
 by smtp.googlemail.com with ESMTPSA id c8sm63671109pjq.2.2019.07.27.07.21.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Jul 2019 07:21:31 -0700 (PDT)
From: Pei Hsuan Hung <afcidk@gmail.com>
To: 
Subject: [PATCH] Fix typo reigster to register
Date: Sat, 27 Jul 2019 22:21:09 +0800
Message-Id: <20190727142111.20039-1-afcidk@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 28 Jul 2019 11:11:13 +1000
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
 MyungJoo Ham <myungjoo.ham@samsung.com>, afcidk@gmail.com,
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

Signed-off-by: Pei Hsuan Hung <afcidk@gmail.com>
Cc: trivial@kernel.org
---
 arch/powerpc/kernel/eeh.c                           | 2 +-
 arch/powerpc/platforms/cell/spufs/switch.c          | 4 ++--
 drivers/extcon/extcon-rt8973a.c                     | 2 +-
 drivers/gpu/drm/arm/malidp_regs.h                   | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.h | 2 +-
 drivers/scsi/lpfc/lpfc_hbadisc.c                    | 4 ++--
 fs/userfaultfd.c                                    | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

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
index 993031542fa1..0d81b34a4212 100644
--- a/drivers/gpu/drm/arm/malidp_regs.h
+++ b/drivers/gpu/drm/arm/malidp_regs.h
@@ -145,7 +145,7 @@
 #define     MALIDP_SE_COEFFTAB_DATA_MASK	0x3fff
 #define     MALIDP_SE_SET_COEFFTAB_DATA(x) \
 		((x) & MALIDP_SE_COEFFTAB_DATA_MASK)
-/* Enhance coeffents reigster offset */
+/* Enhance coeffents register offset */
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
index 28ecaa7fc715..9e116bd79836 100644
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
@@ -6609,7 +6609,7 @@ lpfc_unregister_fcf_rescan(struct lpfc_hba *phba)
  * lpfc_unregister_fcf - Unregister the currently registered fcf record
  * @phba: Pointer to hba context object.
  *
- * This function just unregisters the currently reigstered FCF. It does not
+ * This function just unregisters the currently registered FCF. It does not
  * try to find another FCF for discovery.
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

