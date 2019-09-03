Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF5A6684
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:25:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N34q6x4hzDqKS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:25:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D4VE2hsI"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tK5LvDzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:41 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n190so8891243pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C1iS+RL4q+QhrDqkliqsS+ww2p1EQX8D5Uk0RM3jUNU=;
 b=D4VE2hsIm/C0dSNKV7etdOu3t31ViodPzVnI0xH+5BV2WNkqEOHNNlL0Cok/o6GPMH
 Y27CYZ+q962A9lVHrChvp2i01+4oD283NyRuWR/tExrshEQg6huUurDSlYxgSzTcbJk7
 Y+2dcEE7LBEQ5j5Dkt6A+lV+SZevO8UmO8/g5+zWXZ0XsBzc9nsJRgpH7viuLfau3rUY
 Wr0YPkSGSEsIzYP9TYARe+75x7LeBqL0ed2SQ5p8w+h6X2b+nlNAwEUfS9MzYafjT11I
 2BP8SqrbOzNaJkjw3IB/M0HjYUbb6hjFowMEapf0bnlmoDKXP/6IlQ2CVQ+MSr7NEUZn
 AQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C1iS+RL4q+QhrDqkliqsS+ww2p1EQX8D5Uk0RM3jUNU=;
 b=VqWzKeVSKQ/cdkkeW64qtsnaVLTgssniMu5o4a4YUuP707Ikh80P4Zohv+QMY0O4Fv
 cuwmS5x/0dUIa4z6sR2haZq0GGp8ylX2ZHh++5AAyT/Y0PuXf/gY5II4QJxyaiA2PZWG
 xt+W1fktwfWs2txnGYqSWXD8YuWpGCRfbD+yWyR4OCQiEPJS6d1tEQtcqxiTZvefSlx3
 Bv2uIzYO+Kzc0/dkQX39+3f66IYbxMdmIGKpRHRd4bdiFtcVgtEACExkRN9ODL8CHVDy
 HMxByJxTFwzm521yL7iowSNEN8o6GeRHPG6l0jf1Bh9y+Sv7iRxaF5lPHlQpm3VSgqjY
 Hl8A==
X-Gm-Message-State: APjAAAWj8h0uMSYJqeK5QoHNd5XlVbjUAGkxXHwpkIZAZ2ZjPOITUKE9
 DNf21BCnT5B3XgLx+TgIy4yzMHNx
X-Google-Smtp-Source: APXvYqzT0LX4nlTxV+gjx4Eg950j0cmaA/HonJi88mgtc/WwWOlOH5QQF9FyJcY76YYElpIz5zs6kg==
X-Received: by 2002:a17:90a:ba85:: with SMTP id
 t5mr17116082pjr.26.1567505798715; 
 Tue, 03 Sep 2019 03:16:38 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:38 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/14] powerpc/eeh: Make permanently failed devices
 non-actionable
Date: Tue,  3 Sep 2019 20:15:54 +1000
Message-Id: <20190903101605.2890-4-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903101605.2890-1-oohall@gmail.com>
References: <20190903101605.2890-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a device is torn down by a hotplug slot driver it's marked as removed
and marked as permaantly failed. There's no point in trying to recover a
permernantly failed device so it should be considered un-actionable.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_driver.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 75266156943f..18a69fac4d80 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -96,8 +96,16 @@ static bool eeh_dev_removed(struct eeh_dev *edev)
 
 static bool eeh_edev_actionable(struct eeh_dev *edev)
 {
-	return (edev->pdev && !eeh_dev_removed(edev) &&
-		!eeh_pe_passed(edev->pe));
+	if (!edev->pdev)
+		return false;
+	if (edev->pdev->error_state == pci_channel_io_perm_failure)
+		return false;
+	if (eeh_dev_removed(edev))
+		return false;
+	if (eeh_pe_passed(edev->pe))
+		return false;
+
+	return true;
 }
 
 /**
-- 
2.21.0

