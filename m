Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A409B4219DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZsk4BJZz3cW6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:20:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fWTORTQP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fWTORTQP; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMd94c3mz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 00:53:49 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id on6so737231pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=fWTORTQPU8zQx0fTickf1QWb8zSvKCJC9iMT0nF+cbY7ifH6UZBUFjBx+ekqHPTao0
 oOCuCk/G5yHAO9Gs3xoqHMtFHrAjyMJlxD8P4du5XDgdXFpYjGkqJmiUjR0L3Ha6m3Po
 FZU/E9sDpckZY2MPRYob36bDyQBEb/jam8meXQHTqbhp95pMfIpvgoaX/6r/sx0aUTyq
 O5xla6vl2UkRcpUinYFtux0SaRFgvgLClCuHxsFByvVkkMJd5N4qqXTxnE2EQ6wABe/q
 8ybUXu3452USf3wXIhY6OBOIjNqzlaOUmfRfkF841Kq+cKujfakiwtylB/Pyek9HCmwb
 yLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=0nchhUaY27jn65LZ3CqjtPMw/kixUOeprjGS4VJRke6tcC8+g5J+0DR8ERL1JASsMX
 3+6qulrFgoX3+dZq3HVuoAM9+XeQjFdGB9qv+Itqkz4U6pBK9ncxJnGhQSX7qirOs1qC
 RPg5tsWpCdijwYfhs9dHDH/oEgckyQ8bTlPYUf1IouZKvkpouhUWfIOmSliJuN9zOWvC
 PrIncr0fBLTf0dtycsnxJICpzOK/tmRBsUk4avR0yGqmSVoAmona2MrvWcabfiqMZLJT
 mkbt0NrMWRSvL5g0rwcSCGN6gqJXL0WEPLoSePeyx5+xwf8prELLgDRHv71kIN7fDNfX
 IkxA==
X-Gm-Message-State: AOAM531bLnK8BGOalhKW3ouVm7/ylMrzWrcNnMTBL1cpZSIdCw9cBxgR
 VgLNoF7TBj77IAR22F2mOY42Cg80Nh55pyVb
X-Google-Smtp-Source: ABdhPJxx10R9wyzIvpYNiy7S0UB2Mcvw0yPJXJXTjXVhsjOsf5P+ExnKCZXIlghvhRuiDJmHz3+7YA==
X-Received: by 2002:a17:90a:af86:: with SMTP id
 w6mr31205496pjq.8.1633355627328; 
 Mon, 04 Oct 2021 06:53:47 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:46 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
Date: Mon,  4 Oct 2021 19:22:39 +0530
Message-Id: <71cec6aef2535b48911bd98bd010012643eb0bd0.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: Naveen Naidu <naveennaidu479@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dpc_process_error() clears both AER fatal and non fatal status
registers. Instead of clearing each status registers via a different
function call use pci_aer_clear_status().

This helps clean up the code a bit.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index df3f3a10f8bc..faf4a1e77fab 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_nonfatal_status(pdev);
-		pci_aer_clear_fatal_status(pdev);
+		pci_aer_clear_status(pdev);
 	}
 }
 
-- 
2.25.1

