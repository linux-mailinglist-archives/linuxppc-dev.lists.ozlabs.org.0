Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9F429687
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 20:09:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSmyw2Phkz304J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 05:09:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Br70NNJ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Br70NNJ3; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSmyJ3y57z2xss
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 05:08:55 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id oa4so13142942pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHENHhkpkZLornjDw8P+cbQvSFGcu3v2lE8jdyEkvRc=;
 b=Br70NNJ34I4Yegy0eEKartu/w5zPNCFTVWKFcc+0SH9riN481Yw03dpvxVCyDtFDXl
 SAGytifw3UMmpq3lnw8ankHQcppUplykvHGQN3JYCCcGRPSFfUvVibqUQWk6LKV4jSAx
 vwuTdXxOL0wPIJfLv2QZAKykGNtc07syqHF+0tjqKVLvwKPqq21ziVPb/FpNrBNI1gwA
 kWniU6LOcTTwgTMTNq5y8zxlj65oBXev1Y4/2VArihAVHVhSq82Ax4vyAq0S1YGr0b1t
 nbpb5I7m3Gm1ep5Ukn4lB4YDMTGjThfuBcygzwFGLdlN0zU2wX+Q7ZyxL3t82eKCMNPD
 vogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHENHhkpkZLornjDw8P+cbQvSFGcu3v2lE8jdyEkvRc=;
 b=yFP48UGcCagK1Zw/1FTUNexcXUhOsleIA/fPUpvOHKcbIbBmqCBaLp3/k05cLV02WN
 Lp1/91JOgQ8Vr9abtUKHB5l4Pjjge/SBTd5uVAMaCH81kk58I8E9GHR7ZignYKgW+XGp
 MSbfY4cLna/XHRVjdDy5LHnnaD1gsGCHs884gNeDLJN+8fulUwk6QPcaaEB9G2mOhkLu
 2yTURIFOKoQskJiyM4sGuzfhZi66E1VxEOUJi0eFqz3fRjPM5R+ovQ5BZlVZ//lZS815
 94HR8qHNLvkpQswJP4dgnws5p5LinyzXGhMZUABZ4D182qRICzNAz6mjKcPQ41L6ZE9/
 oQyw==
X-Gm-Message-State: AOAM532yUgv8KcCnKyTCBqMPzRGpS0JIgVxEJko8kGHEbR0ss/azfAqR
 JECPCsmn0upsjPLd56d23oc=
X-Google-Smtp-Source: ABdhPJxg6bu3T2mprP33rb4kjg4OQn9iK/yPDYAEI5T0dMHwN1Br2zmBANHMy1ks/11wEZhbExnAkg==
X-Received: by 2002:a17:90a:9f95:: with SMTP id
 o21mr515839pjp.21.1633975733419; 
 Mon, 11 Oct 2021 11:08:53 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 u74sm8480423pfc.87.2021.10.11.11.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:08:53 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 17/22] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from
 hardware
Date: Mon, 11 Oct 2021 23:38:27 +0530
Message-Id: <8de64c63fa1559929c83a94a0da8e8f42f0b5377.1633972263.git.naveennaidu479@gmail.com>
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

