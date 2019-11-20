Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D4103137
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:37:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HlgH0pC8zDqjy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:37:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxLsdf0l"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlTt2hqSzDqfb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:22 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id k13so12479984pgh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtgqkxSWi2w1d1QU1z4IFspFkqbNCoGtSdhlxzlVyP4=;
 b=bxLsdf0lndxdxAyLIHQpsUe2Si+7uEhAMRgz5FrwKSiM6YM+JWVc+2crX9/t9zb3GA
 7ieDfu68UM7ZNtthqNR6//dhiXpoe24WrYXGqSavrnlAZQ/6hL5uSPc0kdkaYEnVwVgP
 uV9pcwiM0x3RHHYnJxps1C//48a2qM65dd3wBjxWzV69Oe0k1v0XZRbKMTDR1LfjxTwU
 Nkx4RWTIB469bFQj4DhE+6e8hQJAIE7CsQ3cLnmrPtmvggwt60axgGBGmeeA1FhLOPz1
 KP3mfZjw0ZcpIonLOd1sSowkZUl+N+eR4z1G9llqsP4/kkBMu6awmcqmEPfU7w9eSbR0
 iy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtgqkxSWi2w1d1QU1z4IFspFkqbNCoGtSdhlxzlVyP4=;
 b=GAhFYFDdJbe/deE9Z+1XAKGrCGzLwQsm7lUMxrODj/BSytX8U+qtM5S2ZrOsYtAvR6
 cidMEMtzgwN9G2gPptnHUGiemSJ7cN9KrkNXI/FZFUvlMMrF1tP3jGeYLKY1w6Rqpt2s
 hvTtxg9nnC0gVPnpiK9JbfYxXnWdg4OlWqFLsc+1Uob4KNh6HGjIvLbAQaW5Xva+NHJl
 6Tk366kV3Y4If8tZvcScntbvCrXBTObiYGP3rqYCZ5KyQaDWwY8C7Fz+eNBhI1wh2WTd
 qIvsLDuy7T3/01aNtaBrYtAM0LQzCJ5LMm5E6uTbEJ2jl0Mxk7QhDkqmfkWGgOmTPMII
 yM8w==
X-Gm-Message-State: APjAAAWp+Y4ypNPt2NlcqmeY7jKZYHPlFjRpIyJMTB+8Akb/GMGYlweS
 QQ4IaCIg5XtbvwKJl8c/yG1Vs/Ry
X-Google-Smtp-Source: APXvYqyQU/5lGNpnUDdgZtz+WHmsvvsjXwckDsNmOaGuFhWbThOO3EuB3/3FDF5YAp04UwdLhG//eQ==
X-Received: by 2002:a65:424a:: with SMTP id d10mr189496pgq.122.1574213359129; 
 Tue, 19 Nov 2019 17:29:19 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:18 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 03/46] powernv/pci: Remove dma_dev_setup() for NPU PHBs
Date: Wed, 20 Nov 2019 12:28:16 +1100
Message-Id: <20191120012859.23300-4-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pnv_pci_dma_dev_setup() only does something when:

1) There PHB contains VFs, or
2) The PHB defines a dma_dev_setup() callback in the pnv_phb structure.

Neither is true for NPU PHBs, so don't set the callback in the pci_controller_ops.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 65b5b121ebad..099c0bb1a9b9 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3652,7 +3652,6 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 };
 
 static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
-	.dma_dev_setup		= pnv_pci_dma_dev_setup,
 	.setup_msi_irqs		= pnv_setup_msi_irqs,
 	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
 	.enable_device_hook	= pnv_pci_enable_device_hook,
-- 
2.21.0

