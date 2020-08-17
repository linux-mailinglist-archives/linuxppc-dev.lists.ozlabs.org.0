Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1CF246593
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:39:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXBH225XzDqMx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:39:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O1KR3V0x; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSXz32VtzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:54:59 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id u10so7166995plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MVeuxsGilJwDL1o41vPJ1mEVYW9QRgNmhG//SeEinm0=;
 b=O1KR3V0xt4SN/ZoKkNI3dZUiICUjTsddCUbWlu6xJyQX2dkRzE5xFbbKhZZeergtlg
 63B9sFolljH7d9AXSVyuoNmD9Q8TbIxjlqgVN1gA6PoSC9b9poCTF/1nQqgD8wGFfgqv
 /rgl9fAJezU0La98PCZfWBtdnG9+7Vm5DcXYbtsUFyNkrx2X3wt3KyyY/h02l1HQOapd
 s40GTgbKIEbOXV10TZKdgkaJbUNxiL5WwlskC2ReFPqW2G8RzC04aUhYsBr3YD6dtC13
 KyCNUe1CeZT5tlB06UxZoBocmfFpHearUksDtHK/nURWZ12LzTuMTrPO6Rg1UbAMUl8O
 ayAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MVeuxsGilJwDL1o41vPJ1mEVYW9QRgNmhG//SeEinm0=;
 b=DzbpIXw9rzq4psfIjPtO2DPU6GrZq+w+sXqymoP/3lpNGPIcCmGeRbMA6S7Qzz81Kq
 KY/IyH7xsXDLR881HwO1Be4ESZYDrL+wSW7CZb58VrgRVp4V6ucTGXv058JTTb+sHwJn
 p27HBeJ9GKUbH/aKUwGsAU4nBleRCEi4HvDS2At7UZLOlCqrYzo0JqKheBge8gG3u5H3
 FggQVrWXqel6smj94ut31TU6D8WdK6wGIt1JpEGWhqc/HYMq1xZ3rEn4fIyp5BYsrRlA
 os7IVn5weDeoG/iBSeNzFI5ECbEwnmHV8fio7glWHqzq0oQWlUVhykrT2azuq2jGhC8v
 Pw7g==
X-Gm-Message-State: AOAM531LxTiwuMnyNQ6mq5V5U9+uKnP50tdOPSrl+amA6In4ZzDA6wM6
 ifpPci0UZGrPeTGm5xGUTmk=
X-Google-Smtp-Source: ABdhPJwTYhGdSFSvnvbCYxYT5raIJmcHlwmf7/MdtOZWzcK9+tdf9lhZ8Svj9gLMlxhtozJBDyxnlQ==
X-Received: by 2002:a17:902:b28b:: with SMTP id
 u11mr10332716plr.317.1597654497255; 
 Mon, 17 Aug 2020 01:54:57 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id x12sm18236990pff.48.2020.08.17.01.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:54:56 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com
Subject: [PATCH 6/8] scsi: mvsas: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 14:24:07 +0530
Message-Id: <20200817085409.25268-7-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085409.25268-1-allen.cryptic@gmail.com>
References: <20200817085409.25268-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 21:23:57 +1000
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
Cc: keescook@chromium.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 target-devel@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/scsi/mvsas/mv_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/mvsas/mv_init.c b/drivers/scsi/mvsas/mv_init.c
index 978f5283c883..53b2d463fa13 100644
--- a/drivers/scsi/mvsas/mv_init.c
+++ b/drivers/scsi/mvsas/mv_init.c
@@ -147,13 +147,14 @@ static void mvs_free(struct mvs_info *mvi)
 }
 
 #ifdef CONFIG_SCSI_MVSAS_TASKLET
-static void mvs_tasklet(unsigned long opaque)
+static void mvs_tasklet(struct tasklet_struct *t)
 {
 	u32 stat;
 	u16 core_nr, i = 0;
 
 	struct mvs_info *mvi;
-	struct sas_ha_struct *sha = (struct sas_ha_struct *)opaque;
+	struct mvs_prv_info *mpi = from_tasklet(mpi, t, mv_tasklet);
+	struct sas_ha_struct *sha = pci_get_drvdata(mpi->mvi[0]->pdev);
 
 	core_nr = ((struct mvs_prv_info *)sha->lldd_ha)->n_host;
 	mvi = ((struct mvs_prv_info *)sha->lldd_ha)->mvi[0];
@@ -564,8 +565,7 @@ static int mvs_pci_init(struct pci_dev *pdev, const struct pci_device_id *ent)
 	} while (nhost < chip->n_host);
 	mpi = (struct mvs_prv_info *)(SHOST_TO_SAS_HA(shost)->lldd_ha);
 #ifdef CONFIG_SCSI_MVSAS_TASKLET
-	tasklet_init(&(mpi->mv_tasklet), mvs_tasklet,
-		     (unsigned long)SHOST_TO_SAS_HA(shost));
+	tasklet_setup(&(mpi->mv_tasklet), mvs_tasklet);
 #endif
 
 	mvs_post_sas_ha_init(shost, chip);
-- 
2.17.1

