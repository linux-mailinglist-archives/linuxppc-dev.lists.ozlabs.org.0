Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904E421A15
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNb7018XWz3fRL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:31:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WJdx7P1T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WJdx7P1T; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNNV40zx4z2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:32:43 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id b22so25766pls.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=WJdx7P1TcAyVmEBiXMfx3i9JFf4eNjyW5Vq4oC9/fr/nJcEBpUnxCpI18WECXbYHf/
 KB0FXtM9rD6QyJDHR1zVnlxE6P4XVj8uhGsKSNaP+QdsP3oGBF7fsZcQGjOtCIGFAuZl
 8IyyhVKmRUEZzn8r6VE20PgzYSuV7j4ULaVauXMsqj3kjQetN3trtemqs1QXNMkPh7Ck
 rQEK80gn8TSK+com0w/V2PsVKRY3D5UyJNqo6SPhnAUSfeAhEDsOTWKWQ2ym4UnUGw53
 RLjTjWvlr9RUBdPDUiSj4Tqn6XWMh+eALMls0QIVsiNPuUn6GEDyb4kQ/aYbEJDb0fc5
 ORuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=DOe4bIseDp4+JnF2Y1pO8hztzecC3BVNZyB6wIGdOFryeJqg0hzfNxAEiwLf0RaE48
 R203zVV5zpZUj9kq6U7QjhjaZ5AdkIuBFrqzYuikiEfr4deuEeZBrSJM7rvj4HqufQiX
 bxuojTGhBKpsDxa73zs13UGRh7lDSW0ftviXckP8kLFCjVpl63ASPbVJXHE+GvsYE7sU
 DMIKtsm5AVawg/84l2LxssUNhnuBpS9FgYh34YK2x4MsTPN06AzmhZ5C1Q22Ur8lp6qr
 V37igsYDHup0uzHlUL72I+h7eUOfTMfhNNrAACrSMO8Ep7xv7kljIvnNpZEytLv9LgC/
 hCcQ==
X-Gm-Message-State: AOAM531JIQaW+Cva+rMTpAvz1EYcO9DsXW2pihkBEdbYCdABw/VMhzJm
 h6dgviuEdlt/LytnSfEkHDw=
X-Google-Smtp-Source: ABdhPJxtTQJnIxU5EdOGKPVOhIsZXoI5Jz8mKWOddwDBmK5s1XWXwrVNaKGUsgVKJPp+b6Hs3D14Jg==
X-Received: by 2002:a17:90a:1db:: with SMTP id
 27mr37619533pjd.106.1633357961959; 
 Mon, 04 Oct 2021 07:32:41 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:32:41 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 4/8] PCI/DPC: Use pci_aer_clear_status() in
 dpc_process_error()
Date: Mon,  4 Oct 2021 20:00:00 +0530
Message-Id: <71cec6aef2535b48911bd98bd010012643eb0bd0.1633357368.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633357368.git.naveennaidu479@gmail.com>
References: <cover.1633357368.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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

