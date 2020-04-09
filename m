Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE61A2F12
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:15:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yW9251l8zDr7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 16:15:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GSYV1Cym; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yW750S7wzDr8g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 16:13:52 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id z3so845742pjr.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGN/VCUYn0scxbNchjV/dthstF9pLeK7b44vcgM6QQI=;
 b=GSYV1CymUmvrU8mUYOID0FTya9jRLOkrn0nwbyw9efhwPNqfaNs4e4hWILKFq6270s
 pZm8//dmSmgE2z0OHilQ1naVBNFuYPFy8SmwdGv+/P0BQQ7Hm5a9LA+UPyxN+/d5XZWo
 ipxzP5nILm95Rw2L0IFZMKI6hctD7DTWstjpZxcFtS7rIWgnOHVAn7g26ZVBjULdWE4n
 zr29SbeBioWal7GA1vvf6jgc2pHbYI/HXLAkS+xAnMbkLEmeIKnhncN0jfi7od0OPXgA
 RvBGiABDL7dCdnt6NXVqElDr6k3Q4KTYdaBvSrJFv0hmZIK5itBN9+Kt4wPJqHWAjvkD
 6dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGN/VCUYn0scxbNchjV/dthstF9pLeK7b44vcgM6QQI=;
 b=QNzdrm2CSDRbq56T9wSdwh4nSjT3nf370fNSYKrmrfk+Sq7t60GcuzRajL6QwDKAgu
 tHKsi2GsDKj3F5XLcLPyy7zVPS651+Yq4bYluQ3BlzmCpMaEGPHrxG5890E3Ib6csvet
 tEcAghqRQT/L5gmnRl5AkXNo7PgDn65LQl9ZrU7HGXP+OJfXkEEtXOR1sNQfoYlL5fO2
 ud7R3SDlYdhkDglbUFiIIZ+dszxwLxl7wAeHAy4tN58nxlfHBkmzgkWAKSojCNHTXXqX
 Bm17d5fk67v21zNaZaDz/P0GO9A6qazuB9vW14fnxU5isGSK+BFNfIURHcfuyst/9Yar
 EG5w==
X-Gm-Message-State: AGi0PuZ7n69aEkvGIyRQto5ua+qHOEYhoGrAKV/YEG1aflfvwCl5C55N
 5vY/u7UDOjTnd6r8EVwKncqyYhwd
X-Google-Smtp-Source: APiQypKdHfr9+qlTiSNGJGr6YgrXyi20Bu7zdLDEe4xdSxtbe1FEZFbbjQaWAVoLNTq0LZQ3r4/fNQ==
X-Received: by 2002:a17:90b:19cf:: with SMTP id
 nm15mr9587743pjb.68.1586412829063; 
 Wed, 08 Apr 2020 23:13:49 -0700 (PDT)
Received: from localhost.ibm.com (194-193-37-106.tpgi.com.au. [194.193.37.106])
 by smtp.gmail.com with ESMTPSA id b11sm17029488pfr.155.2020.04.08.23.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 23:13:48 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powernv/pci: Print an error when device enable is blocked
Date: Thu,  9 Apr 2020 16:13:37 +1000
Message-Id: <20200409061337.9187-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the platform decides to block enabling the device nothing is printed
currently. This can lead to some confusion since the dmesg output will
usually print an error with no context e.g.

	e1000e: probe of 0022:01:00.0 failed with error -22

This shouldn't be spammy since pci_enable_device() already prints a
messages when it succeeds.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index cda0933..17fdf46 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3296,8 +3296,10 @@ static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 		return true;
 
 	pdn = pci_get_pdn(dev);
-	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
+	if (!pdn || pdn->pe_number == IODA_INVALID_PE) {
+		pci_err("pci_enable_device() blocked, no PE assigned.\n");
 		return false;
+	}
 
 	return true;
 }
-- 
2.9.5

