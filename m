Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80A1F9468
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 12:14:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lnHQ0hDNzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 20:14:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GmX+599K; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ll2R1R4LzDqGY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 18:32:46 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id l26so13708664wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 01:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XDfq5bojR6b05CC1Lwj10IkyAFKBu8BIbutGTPyHRj0=;
 b=GmX+599KgK3+4CQD4ut6Unl0dQe37gJnaQMa7HXIKFLnkM36mjZce93Qnal55lQXme
 DPXNferZ2/2tadOcdmNTCDJ2fFb4JhxDbYnUVRlKL8lwVO9L5c+u+5XKNcLMEK6tfIt0
 QkCoHNi2Owqh2Z1Eob2bkqXIlxe1ufktC98YZwFTXudBA47isWtl0Umv8NBacCLFgSHp
 h8YK5ujbYfa1WKMnCT6t/nA3KdDJ/IpwmYI7Hh4ey8SWAv890eL1ce7gENW5nY6Ca9Aq
 bk3N+kQixJyXij2ldZTm51qFtu5ZtspA8ZS3OfDfwFsBNfO4puqm94RtgR+RhP996L+4
 ehhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XDfq5bojR6b05CC1Lwj10IkyAFKBu8BIbutGTPyHRj0=;
 b=fZn83kMvXVDTIyHs9yV5nwtACnC7qzaUiQzPDe2BQ5EqB9+Ao9r2TA1putkg9kbM0H
 81+jVXX+RRVdubYNO0zcjvyBuORfbb7zUU/01hijPBBW9Pji7xLdIK/FGZczVSFIf/if
 L4j4tKnYKPPNE8o6RCtx/SdGDY9tiTFCZd9NrgF4uGbcfgOlp0Pn0Wdw9DdkIKs/eL/6
 fkdtD8yEd6WPiWhZp7myEGK47kjqvktFjV00kG3L5DsiBicd3l5SZG/J/kDgmRIFAr6s
 Ew2ZSqvZ5AFQ2nG8b7W14i0VHjQPnoN7chiXWDk4eokImNQRuh2h635TpnxNLnbibxPE
 GGdw==
X-Gm-Message-State: AOAM530Vd+vxrjEaCzIwwSnbASVV1USQ2rpmjNMWlbHpSgjj4qwN31+W
 F0a16I6PStqXXhncDa1Hhe8=
X-Google-Smtp-Source: ABdhPJzbGIfVEFGGh/6f5AcJQG40GJvG1GbBmlTLY3eBcSJ95HGy+b4zQLrPxNrp05rwJL+y2MMAeg==
X-Received: by 2002:a1c:dc44:: with SMTP id t65mr12783227wmg.128.1592209962974; 
 Mon, 15 Jun 2020 01:32:42 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:42 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Subject: [PATCH v2 7/8] PCI/AER: Convert PCIBIOS_* errors to generic -E* errors
Date: Mon, 15 Jun 2020 09:32:24 +0200
Message-Id: <20200615073225.24061-8-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 20:10:47 +1000
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 skhan@linuxfoundation.org, bjorn@helgaas.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

pci_disable_pcie_error_reporting() returns PCIBIOS_ error code which were
passed down the call heirarchy from PCIe capability accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative error values.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pcie/aer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 95d480a52078..53e2ecb64c72 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -365,11 +365,15 @@ EXPORT_SYMBOL_GPL(pci_enable_pcie_error_reporting);
 
 int pci_disable_pcie_error_reporting(struct pci_dev *dev)
 {
+	int rc;
+
 	if (pcie_aer_get_firmware_first(dev))
 		return -EIO;
 
-	return pcie_capability_clear_word(dev, PCI_EXP_DEVCTL,
+	rc = pcie_capability_clear_word(dev, PCI_EXP_DEVCTL,
 					  PCI_EXP_AER_FLAGS);
+
+	return pcibios_err_to_errno(rc);
 }
 EXPORT_SYMBOL_GPL(pci_disable_pcie_error_reporting);
 
-- 
2.18.2

