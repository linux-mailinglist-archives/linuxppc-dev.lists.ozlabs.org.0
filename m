Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5BE43659E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 17:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZrcn4Bfvz3brX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:14:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KywtvjBq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KywtvjBq; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZrc40w0Nz2xKb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:14:10 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso789770pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ueS5g3AKfHONQw39HmC4BG+JBhrOhxPXeZpNcIeTYs=;
 b=KywtvjBqhXdKM5saP8ozIqwgJ1NpLQLuxi/61QKyCXpnntRLwkq8K5y5JhWK9uoW6Z
 0jSWeu/SyIc02VfO8a6JoLBiYzlSPjWZ20SYexAhgBC/z07hAtVPJ7QgWkRncMdPGA31
 G+G4yvY8iittk/SzgGlbZwEKZfPj6GG+TH+ImdA82fnqP3CCUoiH7FO1xDdFjZdC3ZsJ
 /7d0DrNHCe9LDuYC1oGxvkMnosURXlrc7hTQEyDnk3SHVGRxWMLavT1EvQXPT21trhij
 Gel3YJCPzYH0Ffqi85lDLXSVjBnyeAPT4N8wWWz+kwPkAn/HDytKYVsugxca9gdebLex
 x3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ueS5g3AKfHONQw39HmC4BG+JBhrOhxPXeZpNcIeTYs=;
 b=pLtcX9a7cw9lUMUFS0GUIpzwQWenHr1S7orwIZzuX1TxY4krgnpTPQ6poe9+bClLuZ
 ea2EEj/tGn0+U0P9ADgllhw9hA8WH/R6FpaMPOqBbbyg2vika8bGeByb26egcT8M+GLN
 lXIk483oF6yA5DS0z5Ww8ll3/xtfFSoENVdBDZDUoCOEpy+onc34qUR4DObkQclJJj67
 +S5P/l6aXP6NQNBQFKdqKgGLNNmtXcqH6ugwLWq3Nm9P16s9szjgw6R56bG3fWcwfTn5
 EFa5h87rgnyDfQLBe35ZTg5+ypty6vzeH94+wHmKRGLxsEhztXUBVO8tR88VVEBPJDnO
 bGSg==
X-Gm-Message-State: AOAM5300TAwm41XyL91m3Bz41BkOKVJe28BoveiW9+/LizENcgNJnc6P
 GYIeeh+/JenwZKz2mtb1y+M=
X-Google-Smtp-Source: ABdhPJy/rYBKMVB2biY8nPCP0z+l7gmEi9mx9wbhq8VWJmK58SGug5h7FWR8XUw6e5oMZab3QioSpg==
X-Received: by 2002:a17:902:b615:b0:13f:fc88:6479 with SMTP id
 b21-20020a170902b61500b0013ffc886479mr3621816pls.53.1634829247879; 
 Thu, 21 Oct 2021 08:14:07 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:14:07 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 19/25] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Thu, 21 Oct 2021 20:37:44 +0530
Message-Id: <6e19df51a431da05dbd5577f11dd31d0c2801911.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
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

Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
data from hardware.

This helps unify PCI error response checking and make error checks
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index c556e7beafe3..4a051a096075 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -79,7 +79,7 @@ static bool dpc_completed(struct pci_dev *pdev)
 	u16 status;
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
-	if ((status != 0xffff) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
+	if ((!RESPONSE_IS_PCI_ERROR(status)) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
 		return false;
 
 	if (test_bit(PCI_DPC_RECOVERING, &pdev->priv_flags))
@@ -312,7 +312,7 @@ static irqreturn_t dpc_irq(int irq, void *context)
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 
-	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || status == (u16)(~0))
+	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || RESPONSE_IS_PCI_ERROR(status))
 		return IRQ_NONE;
 
 	pci_write_config_word(pdev, cap + PCI_EXP_DPC_STATUS,
-- 
2.25.1

