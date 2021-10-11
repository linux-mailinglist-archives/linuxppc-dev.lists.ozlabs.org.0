Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7334295E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 19:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSmHV0RMhz300b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 04:38:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HwHRRV+S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HwHRRV+S; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSmGr0lmYz2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 04:38:11 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id v20so4718256plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTDymu/kK4gMRJAHOJpsOJeHyCsZ/lww9DjrtPbDpJ4=;
 b=HwHRRV+S/RE+GIDbxexsfa91uds8RaTJQMPwbLhyAkzd491qats0xSsaC4mhiRl6Jq
 gXXjtWMCRFCl24UDsqtfCnqLD1Cbtd/93S7HO5AgB4ueGG4bEHV+hcSl1HJMqS26/8sA
 AKDOYmV4WnzsAqwxPmP3185eWqTzwnWRl2QPIf3ODwukpfqNg79k8CXYXbmjBmwmlM7H
 JLjBNNDOGJ+Mxf3ToELn+xPiqYpbj9hM9X5kn0apcvp1wMCYCAV20W1pQqigoIPr8oqY
 TGxAUPwne4Rec2JXIdYu17BaZHyNtS6uIqjuojEWOKeCG+TbAaPT/AAhWcUg9ysN4hhq
 wH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTDymu/kK4gMRJAHOJpsOJeHyCsZ/lww9DjrtPbDpJ4=;
 b=RY4ai3FVI9fxt+yewpJ1OFufs6N4WmOOfwLCUXofjOi3ftLGD+8Dzmd4PaF+JyKOBO
 7APV0mAV4+nvJaypW0Q/UJcmbgK/KbQqHc5oOLHCF7YMMYxQpZrCJr2qeDj4sEpE5ka4
 PBYJZQBQ5oL5N7Ey8UcrC+Yi1WjqmXV6c3roNJzo/5jzd+VtqUiIyKqSO12qOSQWhXAv
 +INIXqmKYkz3wOrK9vPnptf56Hx6cVzaNw+HhiL/MyHDpYOTKxrOxHECOUp7W3ardNKK
 fhqQb1BaX+pIc+NEDg5tyN7xFYMr0W8UvsPyvFHDYggjBWmLo9/LGnNLM3XOvi7ZIPvc
 TdhA==
X-Gm-Message-State: AOAM531Awo6ansTSH+ourEGh3+qMmqsAP+ZnY5AQldfYI4p+7skLq3zk
 qAWkRiVbr9T7fGH/Eo1Uu2c=
X-Google-Smtp-Source: ABdhPJxEBdoXamrVCKeesJUkEsfNWnP0PDrt34jLeyC7FqCvn2xqaY1LwruNHL9Qwq4e9o9alifRPA==
X-Received: by 2002:a17:90a:67c1:: with SMTP id
 g1mr335114pjm.177.1633973888608; 
 Mon, 11 Oct 2021 10:38:08 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 c12sm8456919pfc.161.2021.10.11.10.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:38:08 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 01/22] PCI: Add PCI_ERROR_RESPONSE and it's related defintions
Date: Mon, 11 Oct 2021 23:07:53 +0530
Message-Id: <5b4ba38fa56c7625d391383a3aed47dea6726946.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-mediatek@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Add a PCI_ERROR_RESPONSE definition for that and use it where
appropriate to make these checks consistent and easier to find.

Also add helper definitions SET_PCI_ERROR_RESPONSE and
RESPONSE_IS_PCI_ERROR to make the code more readable.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 include/linux/pci.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index cd8aa6fce204..928c589bb5c4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -154,6 +154,15 @@ enum pci_interrupt_pin {
 /* The number of legacy PCI INTx interrupts */
 #define PCI_NUM_INTX	4
 
+/*
+ * Reading from a device that doesn't respond typically returns ~0.  A
+ * successful read from a device may also return ~0, so you need additional
+ * information to reliably identify errors.
+ */
+#define PCI_ERROR_RESPONSE			(~0ULL)
+#define SET_PCI_ERROR_RESPONSE(val)	(*val = ((typeof(*val)) PCI_ERROR_RESPONSE))
+#define RESPONSE_IS_PCI_ERROR(val)	(*val == ((typeof(*val)) PCI_ERROR_RESPONSE))
+
 /*
  * pci_power_t values must match the bits in the Capabilities PME_Support
  * and Control/Status PowerState fields in the Power Management capability.
-- 
2.25.1

