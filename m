Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C1D8FDA2F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 01:11:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jkPO1PIX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvjr23fmvz3cTv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jkPO1PIX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=jain.abhinav177@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvjqK0Gn7z30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 09:10:19 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-6bfd4b88608so263312a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717629017; x=1718233817; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfqo8SpJ+6G4s4wmk6y7o8hH2xAWf7/sXOwEQu/ezXs=;
        b=jkPO1PIXjdILSBTL6uwH9uHqB1NIT3pggTccfVuH98fKvXeWn8piMCGztRWpVI7Kkj
         lF73s4KYfzsWXVSJSIF6nBVj/NW87QI22tRZMiFqVG+hilSfD53cDyhoYokV83/RBrU7
         1Pswv14ljvB8/9o1fBcR2xuCAa4G8h+SNHhvSySt8rpAGtAI/luZxLlu1lCUs0+AQDSr
         2/PL1c9daIiAoAgYRLEUjUXiOlVlE1UDeEl6BdNqAYyDWXoUvZ5NGP7icnMOqxBW1n7U
         R6rKxzQnZvurYXVLD27ThRBzWkI5fbTcKFKfjpKGDph5sT7C71x9ZLqQhJzgqwiR9Zk5
         v98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717629017; x=1718233817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mfqo8SpJ+6G4s4wmk6y7o8hH2xAWf7/sXOwEQu/ezXs=;
        b=uXcKd1bB0CY+GfXzGJA8FVLNJufHR8WJVJj9Ak91Px/Qenc6nHxYIO4Cah+QMLVHsm
         Quf4uRcRSVbKRi5YBoTfySG6+qS3T4PE++oJ9m8wvq4S7EJLuKEqoby+fLkRG6HnixZj
         6D0yleJOvlMfgWS7nFmKcI+OYYRz1tyhTeKp0lRTiH7tG0ps0EsKUBksIROuWzFpHENk
         GjOP2KcaXxDy42IPV6WiNkMZBRxbdN2reNCpf9Up843r+JyBhNdp2P23pww68aGvvmjl
         fzxA6WlvatlulR7LpM+mx3qLna2HFrZJKzsSKlDXrfbyonMxznwJISz0XwlRyTcEC4An
         3U2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDas+XdkVh1xIavjt8PSdRnFxdoBhAC8QKXwDhkVGYApEmieCuTSqR/bmIAgiMGVkG0jgtHFpXU/Gr/8TVPrzeH3tetsOP2V83yTU3RQ==
X-Gm-Message-State: AOJu0YxMcG/6KArSe4x23aLsCzxCCL1wSnuwpMZnuW8tZpqdnVnOGayY
	IE47bDWkWuISah2vvZ9F6BD8ys0PPTSRT+VaZL8nqgqMsu8xeQPA
X-Google-Smtp-Source: AGHT+IFlRibt1HmJPsoOQnfwix6H7u/g4nSL0HZ2m1iS08mkDy8ml0ygiSVOBol4eJWWadYR1TyGHQ==
X-Received: by 2002:a17:90b:4016:b0:2c1:a068:ba83 with SMTP id 98e67ed59e1d1-2c27db0ebb0mr4023969a91.11.1717629017487;
        Wed, 05 Jun 2024 16:10:17 -0700 (PDT)
Received: from dev0.. ([49.43.162.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c20d8afsm139596a91.2.2024.06.05.16.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 16:10:17 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: mahesh@linux.ibm.com,
	oohall@gmail.com,
	bhelgaas@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] PCI/AER: Log error message if there are too many PCI devices with errors
Date: Wed,  5 Jun 2024 23:09:54 +0000
Message-Id: <20240605230954.22911-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: javier.carrasco.cruz@gmail.com, jain.abhinav177@gmail.com, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Added pci_err() to log PCI device information on which iteration fails.
Added pci_err() to log note if there are too many failed devices.

Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---

PATCH v2:
https://lore.kernel.org/all/20240605212344.21808-1-jain.abhinav177@gmail.com/

Changes since v2:
 - Switched to pci_err() to log failing PCI device
 - Included the historical note below the "---" line
 - Fixed other style changes in the patch
---
 drivers/pci/pcie/aer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 8b820a74dd6b..0bca83827ac1 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -882,11 +882,13 @@ static int find_device_iter(struct pci_dev *dev, void *data)
 	struct aer_err_info *e_info = (struct aer_err_info *)data;
 
 	if (is_error_source(dev, e_info)) {
+		/* Log error for the device */
+		pci_err(dev, "Error detected on device: %s\n", pci_name(dev));
+
 		/* List this device */
 		if (add_error_device(e_info, dev)) {
 			/* We cannot handle more... Stop iteration */
-			pr_notice("%s: Cannot handle more devices - iteration stopped\n",
-					__func__);
+			pci_err(dev, "Too many error devices encountered. Stopping iteration.\n");
 			return 1;
 		}
 
-- 
2.34.1

