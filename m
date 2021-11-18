Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E2D455D93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 15:09:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw1rp5Ph2z3c53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 01:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h4pBbCLr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h4pBbCLr; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw1r829cgz2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 01:09:12 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id b4so5399611pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 06:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBBH/Q+4DT6MMFzudxxMo6qTH2zDvIqJYCuHRS/x8Gs=;
 b=h4pBbCLrdpXpef+w/kUpZbJP1X3ldT63Q8bGt/bh2RhSlt94aUaf0PVnzja8+EzyiX
 5iYMNQKu/SyG4Nub6ksbx6VzPbGJRE/BZuFwnSSp+NgUjuqj2NhPYTKPM4zl6GDf1tKk
 eK61KC8EUBYRAicc/ZNdM+7b7GmVwetmqBzyBFB975MngUwTm9aw4E2AL054rU9cFaPo
 j+lKkLALHvmJGsPT61Y0tz5nJQZn9IMSHtNRdhRP9Yeb4mcwTwBjq2MzY9LTbmoj3JWS
 x19JINYr4ISze+T9+hz9gOPl/KfmZVS+6YlJCCcOTFIQsQZYOt6jbkfEFPctsM8nThJQ
 wFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBBH/Q+4DT6MMFzudxxMo6qTH2zDvIqJYCuHRS/x8Gs=;
 b=eJZyZSgUW3tqanQh6DtB8h/nzIR3IUqEeOAmJlXW4FuVT4Nq53jotnAwHV/GIVzIMn
 Cg2viCSfNQkZrjOEeDrH1ROKUUsOmQnQgy8OmKoxLXfsJsM5BglGdxlqSc6VQREaQUiY
 +ga6lVtaCx29qZqbYrBsFyV0baY7dk19NCYsMNtqInf4SVbS7d3wo/V4ieVIre6PoMEf
 Dd5FCzNughGD+gAqMDLxon9mBqu/8t+YSAxEitkUKvKeSgqqVjkxXgFm5tI/BUYLEPmu
 2YmF1WXcFG8y2hP5c8uNfaG36FICG9KBcHPk6OuEgN1sctLZFJ7ZgTOGIFGDDF88LeJT
 vQlQ==
X-Gm-Message-State: AOAM5328EfsrOO7Bk/10w/1/BOIR8ZWjZXWJhvGk4bAGeLeBoBiQ7q7G
 Xaq94Jh0EA4QQfIXrgLtDTc=
X-Google-Smtp-Source: ABdhPJx6pongqUzF2GCWPf3PPjoh1vz7OEj8FQ/voPke/8ceAr1mP50zFni4Hu2G4gWzSziUIk45mQ==
X-Received: by 2002:a63:ff23:: with SMTP id k35mr11505864pgi.28.1637244548964; 
 Thu, 18 Nov 2021 06:09:08 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:09:08 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 19/25] PCI/DPC: Use PCI_POSSIBLE_ERROR() to check read from
 hardware
Date: Thu, 18 Nov 2021 19:33:29 +0530
Message-Id: <9b0632f1f183432149f495cf12bdd5a72cc597a4.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
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
Cc: "open list:PCI ENHANCED ERROR HANDLING EEH FOR POWERPC"
 <linuxppc-dev@lists.ozlabs.org>, linux-pci@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use PCI_POSSIBLE_ERROR() to check the response we get when we read
data from hardware.

This helps unify PCI error response checking and make error checks
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index c556e7beafe3..3e9afee02e8d 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -79,7 +79,7 @@ static bool dpc_completed(struct pci_dev *pdev)
 	u16 status;
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
-	if ((status != 0xffff) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
+	if ((!PCI_POSSIBLE_ERROR(status)) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
 		return false;
 
 	if (test_bit(PCI_DPC_RECOVERING, &pdev->priv_flags))
@@ -312,7 +312,7 @@ static irqreturn_t dpc_irq(int irq, void *context)
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 
-	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || status == (u16)(~0))
+	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || PCI_POSSIBLE_ERROR(status))
 		return IRQ_NONE;
 
 	pci_write_config_word(pdev, cap + PCI_EXP_DPC_STATUS,
-- 
2.25.1

