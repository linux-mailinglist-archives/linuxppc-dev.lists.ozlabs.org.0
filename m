Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B668E42F623
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 16:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW8HW0kDYz3c55
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:47:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jvM5FjUO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jvM5FjUO; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW8Gr04jlz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 01:46:27 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so7415166pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHENHhkpkZLornjDw8P+cbQvSFGcu3v2lE8jdyEkvRc=;
 b=jvM5FjUOHTW4ZreWTNBrvcABxHTLtUwWgRZDjd0whn9aFrDhCENr73DWOHCxS5Fdkd
 qYr3Gcg+spaxksfjJrdlRHZsUccCng6zSdQRFt/mxs62ScyVAXmUaje7lK6uScfmUDsT
 lGbps+qki+QJGnSsqPGbnqpMb6m4fBQUHeHd/EswL3xnKPEESAf+zq58QLLatwmqqQXH
 n0zftEEaVPt+TW6yHN/5ySBqBmB/hW5lKXfPJr+DXYlPyb76LOjYCmNf5Q86iHIr4cN3
 6dwSlsKu7/hPuTC2UYJ8NE6goJaJKxUeHJGcDJCi9Z2MR77/3lEPZ+2usS0Ix1qA5Y1T
 rUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHENHhkpkZLornjDw8P+cbQvSFGcu3v2lE8jdyEkvRc=;
 b=HXqvmTup75Cv0snj+2H8lY6zLBNBjrTuvzXZ+6FU82PbSjJmo1qZv4r8wQm0WHu7OR
 zxv3IJy/3hpuhiL4pa4+A+IWNEftvK/Zon57JnjhP8iNwPWmH3H42UQEsImKToZWbBDv
 B6U2NUVNh+ZygF7mhEyQy0FrR2jsI2M0ybg6FdUP5QcHdpJVBsj60Zdsuq0BZPPo6y84
 kU/d9ZieKTrIiGRqGLXhaR8zCcfJ4qfGH/CtOZdk4TIbcQNjqwzM7rG+2htxYcQ0gpFI
 +IWbe5zPVZ33xXRFU+bHcDm2FtvR9GFH+Rjb/ykdajOxwhHObSJEziMiFvIkwonqRclW
 UWlQ==
X-Gm-Message-State: AOAM530UxpB3cinEPCAlCHfXk90gG5DiwFpSUc/3WBeMNRgVV03xxhlg
 UVhmbrYXXUO3SfOT4hCSuL0=
X-Google-Smtp-Source: ABdhPJz6Gwr1+vYiSF57ZmI6jf24pGsKXmwV6yIHG2L6BRqU1OKaExlx4wVky+9XnlcXwmw/z3FEuA==
X-Received: by 2002:a17:90a:4b4d:: with SMTP id
 o13mr28221614pjl.236.1634309183942; 
 Fri, 15 Oct 2021 07:46:23 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:46:23 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 19/24] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read
 from hardware
Date: Fri, 15 Oct 2021 20:09:00 +0530
Message-Id: <26d5188e961b91eca52b97f8d8107348538d1401.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org,
 "open list:PCI ENHANCED ERROR HANDLING EEH FOR POWERPC"
 <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
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
index c556e7beafe3..561c44d9429c 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -79,7 +79,7 @@ static bool dpc_completed(struct pci_dev *pdev)
 	u16 status;
 
 	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
-	if ((status != 0xffff) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
+	if ((!RESPONSE_IS_PCI_ERROR(&status)) && (status & PCI_EXP_DPC_STATUS_TRIGGER))
 		return false;
 
 	if (test_bit(PCI_DPC_RECOVERING, &pdev->priv_flags))
@@ -312,7 +312,7 @@ static irqreturn_t dpc_irq(int irq, void *context)
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 
-	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || status == (u16)(~0))
+	if (!(status & PCI_EXP_DPC_STATUS_INTERRUPT) || RESPONSE_IS_PCI_ERROR(&status))
 		return IRQ_NONE;
 
 	pci_write_config_word(pdev, cap + PCI_EXP_DPC_STATUS,
-- 
2.25.1

