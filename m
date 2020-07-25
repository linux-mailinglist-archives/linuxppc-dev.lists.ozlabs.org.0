Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A922D617
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:30:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDK5N3jvyzDrNX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SroCZnID; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJjJ1Z6BzF153
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:13:08 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n5so6669329pgf.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lJlmXl6pBvTDXsdiFTXja7ULJdkdLlp+lmb/9r1QCLM=;
 b=SroCZnID/IOSheV0n+k2kuW0hoFtqt6MZauFO/LHx/a3GWILkSCKR4VS5gB4eatcbA
 OlRY6wBIAQf9Z8J63a+InCYHskpwrMhKUEhtp+fb1GxjQ3pmq2EBL3R09/7vHcT2ZEgp
 wvqJDjLlP8llRl3AA55EdN41yta5hdK8YzzIcl+zZG+wNbNBfQ7+Iez+ziMs6B5FB5/V
 xRjzaL/NEuXnsbfd1mDWiCNqO43hhtpw5+CuIwAfVU8BQ4xdpaWjwcv1vMCak0aUegOW
 huV1TvP8Cp5qwovXfkBbAcZR1AIxwovqfp+HYuZFwix2wMbuxxsRE5cotRr4S5bYfsP1
 VI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lJlmXl6pBvTDXsdiFTXja7ULJdkdLlp+lmb/9r1QCLM=;
 b=d+2dBySnczFTOHbTAXfEqhBLMJUGat56GXjnTBHcikBO8TGS+i0LoWRu1iqPqpOf65
 /O8pqnKRl55JrWw1FGPn2QAMSLd18QDd1iqcpNkWwhvKh+AVQbn6Q0fxHD77m3QdCOHw
 +Kyk3Kq+q4OONe9nibkj7UTOTcgInW0EXHfGehqdrJ8a46so+lwurPvLwwqYJeeFynkW
 T5bUVjxDYpGj3PvE28XiGYxVQ2tmLnviainvr/nX++NPdZzEwtNQANXsAp0Lmx824EMd
 2rOvAEDsxSZW9N7KUNdl5GF6op1KENJcNlC4lInnOJn9lSK0SvZ2abIfJT277KjozeZQ
 IOmQ==
X-Gm-Message-State: AOAM532TGcJsRdwh4hoegQSqDk9zA4TcR2sJmJ6jG+c24mfX94Kjp8CE
 nP/wJMzDcNfnSgxbWQtFgzi1plSHoiU=
X-Google-Smtp-Source: ABdhPJwijeiBHs2ybvge4Qt0NDiOAdmX1vbPSJqrgknfbA/Bk8qPKSy8RtekzPvnMR5AwnAqz6wbwQ==
X-Received: by 2002:a62:1494:: with SMTP id 142mr11665103pfu.216.1595664785407; 
 Sat, 25 Jul 2020 01:13:05 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:13:05 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/14] powerpc/eeh: Remove spurious use of pci_dn in
 eeh_dump_dev_log
Date: Sat, 25 Jul 2020 18:12:27 +1000
Message-Id: <20200725081231.39076-10-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
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

Retrieve the domain, bus, device, and function numbers from the edev.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no change
v3: no change
---
 arch/powerpc/kernel/eeh.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 1a12c8bdf61e..f203ffc5c57d 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -167,23 +167,17 @@ void eeh_show_enabled(void)
  */
 static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	u32 cfg;
 	int cap, i;
 	int n = 0, l = 0;
 	char buffer[128];
 
-	if (!pdn) {
-		pr_warn("EEH: Note: No error log for absent device.\n");
-		return 0;
-	}
-
 	n += scnprintf(buf+n, len-n, "%04x:%02x:%02x.%01x\n",
-		       pdn->phb->global_number, pdn->busno,
-		       PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+			edev->pe->phb->global_number, edev->bdfn >> 8,
+			PCI_SLOT(edev->bdfn), PCI_FUNC(edev->bdfn));
 	pr_warn("EEH: of node=%04x:%02x:%02x.%01x\n",
-		pdn->phb->global_number, pdn->busno,
-		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+		edev->pe->phb->global_number, edev->bdfn >> 8,
+		PCI_SLOT(edev->bdfn), PCI_FUNC(edev->bdfn));
 
 	eeh_ops->read_config(edev, PCI_VENDOR_ID, 4, &cfg);
 	n += scnprintf(buf+n, len-n, "dev/vend:%08x\n", cfg);
-- 
2.26.2

