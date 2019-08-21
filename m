Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309697243
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 08:32:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CyWf5R67zDqmf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 16:32:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AvisLceN"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CyPb1DbfzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 16:27:14 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f19so771125plr.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 23:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GnQVGpsnX61rE/A7MqN3ByGbE6DIpr5uxhUPfp+aW3w=;
 b=AvisLceNIWJgbJyFRA+xnp/F6B3qmv4OYQ/+NUybeyaXAPX4hTcS+jLrnCdw6Qhr0Y
 dBZd6E34hpdqfIfOxGtQor3X/3JAFlsBo9QreGTFEyUSxjuJQ14CYWxnzhHD3vQV/4u8
 cdLQCwssJoi8qE+qO/yBoTYUTQI5Eu1iffgI5ceD/26FsDoZfsAM81UyeguVDZx9wGA9
 khsflQQccsNLqP5Z1v9PEw2GGmOyKtu1a61TcmiXgDyacfTNZTE5u2HCXh8b8S3JtYpu
 SXTGPbMH6P0j+tQ7CRI7p2smAG8Cd9b+ACrBFPVDyd69mDOMHhpJSwUWbV6eg5sQ1z6N
 fLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GnQVGpsnX61rE/A7MqN3ByGbE6DIpr5uxhUPfp+aW3w=;
 b=GkyFt9xsFLJZ9zdKZkou6d283QPo8L+0McsFIVQ+GiZ00FQNthNbCciMKDbvBVMdwr
 CX1ZLXtz3SOL7yFIWgaiqWzqOfede9HvFq9dg/ndVXlw2w0rVvggjiZrSNzowACe6KDl
 yQEjFAbmnR3BY8MkqT5P5wPQ2O11Qh7J50fiZkwNxLNoy0/ZeL9zf7HRY1oG4LywM5wa
 ftALe30l4Gg8LX2AJryBgvZWyCf73ziI91d1dvct+r8UVyLvXhxqQOcw5G1Ohn2Ls7qp
 X0MyK5SrU3YwfWLdcOHqfmg+uaCjD8RknOB2ubOobgJpZJxLW1ulcpnEAK9kq2wGlQy5
 E/ww==
X-Gm-Message-State: APjAAAXvVvOtANyEz4RMkGkLff8oS1jzyAzNVflaZIk3mFXHlS6r0+Xk
 mrZtpzfOKpgrnBtwkjSf+Ic3pzDP
X-Google-Smtp-Source: APXvYqwzUwvIu0vUpJativRMc+fLoAIxHD1RPjRZHzMy7O6mahLa13sIpanxlTW8WYeOE0tdsbSo2g==
X-Received: by 2002:a17:902:8602:: with SMTP id
 f2mr12972456plo.235.1566368832950; 
 Tue, 20 Aug 2019 23:27:12 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id v27sm34694103pgn.76.2019.08.20.23.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 23:27:12 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/pcidn: Warn when sriov pci_dn management is used
 incorrectly
Date: Wed, 21 Aug 2019 16:26:55 +1000
Message-Id: <20190821062655.19735-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821062655.19735-1-oohall@gmail.com>
References: <20190821062655.19735-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These functions can only be used on a SR-IOV capable physical function and
they're only called in pcibios_sriov_enable / disable. Make them emit a
warning in the future if they're used incorrectly and remove the dead
code that checks if the device is a VF.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/pci_dn.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 24da1d8..69dafc3 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -158,8 +158,8 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
 	int i;
 
 	/* Only support IOV for now */
-	if (!pdev->is_physfn)
-		return pci_get_pdn(pdev);
+	if (WARN_ON(!pdev->is_physfn))
+		return NULL;
 
 	/* Check if VFs have been populated */
 	pdn = pci_get_pdn(pdev);
@@ -199,19 +199,8 @@ void remove_sriov_vf_pdns(struct pci_dev *pdev)
 	struct pci_dn *pdn, *tmp;
 	int i;
 
-	/*
-	 * VF and VF PE are created/released dynamically, so we need to
-	 * bind/unbind them.  Otherwise the VF and VF PE would be mismatched
-	 * when re-enabling SR-IOV.
-	 */
-	if (pdev->is_virtfn) {
-		pdn = pci_get_pdn(pdev);
-		pdn->pe_number = IODA_INVALID_PE;
-		return;
-	}
-
 	/* Only support IOV PF for now */
-	if (!pdev->is_physfn)
+	if (WARN_ON(!pdev->is_physfn))
 		return;
 
 	/* Check if VFs have been populated */
-- 
2.9.5

