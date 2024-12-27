Return-Path: <linuxppc-dev+bounces-4486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE29FD0A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 07:53:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKGR96Rcnz2xWT;
	Fri, 27 Dec 2024 17:53:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735282389;
	cv=none; b=gAidql9MyOgvdtrVPOvt/FQoca+qDsQAsm7bLKo+4vpkcFBHtrggK6mb5i+Vx1rMI/nmMs2sLvfxlcR1oiUYcUAFi2X81Pp2W7qzThdlpqqR9lDXC3qq5NOqnK6vG2ZNU4VVr4SBdApXs3FpdV/bUjvC5YmiQxoD0i/UiII+8xWGsdVPRT4B8z73QCeLjfrF8t7MezOOoNN1Gq5pSjSTGgOIBzEiCtEbRp4sIEKbws4VfQCBw4AS0Y8JBoKI+8mcDQ4EWqyC5KMwsN3k/hm9Xa+ywU4w4rC5E8xtBEJ7Vnlj6rHdwl6InHLu8ZC5e9LPrhOj3V0otDZRppux4HZRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735282389; c=relaxed/relaxed;
	bh=j3gYkbbfi3lIdz0EUXPWD1ceNd1AYXhoB3nzoejKLA8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Eu2oP0sh1AJC9OEuQ7J9myj73SZq7/cACuCgN0nxp9npiNaoZ07BgyuvgPees+aCPu4XssoEOZd1JfVv5c2saWOpcqAevnY5lEvVTym4dcBgNC6vw9qiHEAa7Ad50W/NuK/tTlQmFBj1b1zzEhlsZ73etp+sL77YqlHSrRKAEbK+qHb7qFfGD5fP+tQWJI6zcvD3OXfGMNuEpgmIOTwNMNuWlaJ7iYk9T5Bf66D5ud0oeflRzuQtSRlo8koZjHufw7zLpnyDetlgkjEaOop7M9JXTBogBq4eMdwWwXf2b2VXBvFWYf8E96PYd3Ej7LmhYQonE5tE0zpLjqocEpD1kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YdrFDKdO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YdrFDKdO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKGR80sJRz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 17:53:07 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-219f8263ae0so46701545ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 22:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735282383; x=1735887183; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3gYkbbfi3lIdz0EUXPWD1ceNd1AYXhoB3nzoejKLA8=;
        b=YdrFDKdOl8fSC9xLyB7IS4B8kSRSFqM7x7+JMNsftfLgKJoC38f6UoAJ729zd9q+8e
         BluoaSFvUGgL52TvzxEMdoKaIBeWBnqZF/NKtjBWK8hJEV9sRFRgGKRyawBBhVvsdu6A
         ChT5so05rOCRYAkaXRr07QjHRJlX2P5x4hQQJMolipwneQgLxaZiWaTtY5gJ7SzHNGhF
         AdWX8ow5X9nOwQtl1HzUyJb2kM2IlkToy3HiKHKxhxmZv3nDvQUphmzzX466mbUR3f2J
         C1o5QMQ4p61LArlu+zGKaNgk6xtgUQJ5du9YRYDLI4l4mXKP3ivyJHEGDYNN0w44aZSe
         PamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735282383; x=1735887183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3gYkbbfi3lIdz0EUXPWD1ceNd1AYXhoB3nzoejKLA8=;
        b=mZ1TGfEi13DPjPq+KnSgW1yrJDMBSCiYK00j0F2LOY68dTG0zYBRE2aSRi+3MWScEz
         qzPInVQMLvTwXBqs7hgiPENOgJR4jAA14i68aWEhzcrBOnAxw92lerdtqVvy3bwEVueb
         SaGq1F/MTwadLXqTAiSxCoTgrl8KtUP3x58gE8W9AQGcD5NJJQtRJCETMGKq37hKE9mX
         7wGrvV2L/HfTmA/rjiDnCzvLg2Ge6yYs1D+C5M/NmnsfzH2ajISZQ7WUkYPT4Db3afOz
         cSqOpDZrtOKTvs16JIr+EsnndtdlwekOoLafjGG35dh27mpWQcYSjqJnN6n4KHq1y6nh
         rAUg==
X-Forwarded-Encrypted: i=1; AJvYcCXfY49JflGUZvl1OFfGy8GvR6fr1mwXBP6yMpmyR6ztzUzGzyRWaCGnum0QfukQfBGNGF/IZHqFaTVUGKU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuPF1iB7hvlik3c96JzdoCbBmwq3lN+YMpebWnvQVVhVdnhXxs
	ExAStFRK3Geo+W0q07m+PzLHbWgDJ8nsJVHeLxqUGdKs/BTlYS+l
X-Gm-Gg: ASbGncvTAv+lxfPMt1KnmSFVE7VUzP77CABw/5YxioI/+HXvzhKjXcfncHSDIXxWIp2
	tEa9o6X1gy8t8ZcQEdJ9gQaNKTcGxr3+zUPT564L1P56hs5lK8p39M4+/prlIxMgQ9ykKN7j4dS
	KDOaT0HIiM0uR2LbQJQR+adnPy75eyV+uDZIT1QMB/AwJi2+dFebkX9TR1YaZr9x7N+CJAXu+5i
	rO28+lmu26lZGo61q9RXnDU01wOi2lsY6HyCj0Oqcrbors1bHS5B8M70KxPa00AlJTeeuxr2Q==
X-Google-Smtp-Source: AGHT+IFPGELX2PWQE4yHJKlKfSRfNyM1fiNC2n+BqoCOE0VCWCmRkUXWjJNZ0U1jChDx4VJSHa8HaA==
X-Received: by 2002:a05:6a21:6d88:b0:1e0:cc8c:acc4 with SMTP id adf61e73a8af0-1e5e081ca16mr43836085637.37.1735282383124;
        Thu, 26 Dec 2024 22:53:03 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:45c8:7d73:4193:45c:684e:d99c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81572dsm13981232b3a.14.2024.12.26.22.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 22:53:02 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI/ERR: use panic instead pci_info for device recovery failure in PCIe
Date: Fri, 27 Dec 2024 12:22:53 +0530
Message-Id: <20241227065253.72323-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

update failed in drivers/pci/pcie/err.c to 
trigger a kernel panic instead of pci_info

Thanks

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/pci/pcie/err.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffc..2630b88564d8 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -271,8 +271,8 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
-	/* TODO: Should kernel panic here? */
-	pci_info(bridge, "device recovery failed\n");
+
+	panic("Kernel Panic: %s: Device recovery failed\n", pci_name(bridge));
 
 	return status;
 }
-- 
2.39.5


