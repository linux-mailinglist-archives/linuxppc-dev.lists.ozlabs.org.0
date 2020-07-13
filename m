Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C717A21D73D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 15:32:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B54MJ5yflzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 23:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ayIR4bAO; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B548k3rpLzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:23:17 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id dp18so17118900ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lE8AN0pbCu/dDP6jrScw+PxyAG3fiRl3vN639OZNf9c=;
 b=ayIR4bAOLjTG4FPDTwj9Bv/rT1Mu5DSxUxmly1JRltd3/t49vc11ms35/6SaQTBnDW
 grgTbiRcbvJv/DP8VfCI2t5YIAma/O83HsL8bg6F3jmYn8DjHIHlFyBlPbwgK9NZvLpV
 NhVTBRZ7lKyJjY2HhB4nOgVrjuzjGx7Gbvx/0Ct/jc4ZoZkaXRHDGimKOxD6qy9dBCS+
 sqcnADgH9diLoghHvHkKw+ljTOKr7vUjZGCiVth+JL4t+Oj2ZMh2VG+Nl97H8BDvhtip
 06AOHg8fxgsVax5a7Dn03qBbGWuJCeSxlPhhmGspiYLN45bio5jqhu1ESiQs78Ezc6ow
 QJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lE8AN0pbCu/dDP6jrScw+PxyAG3fiRl3vN639OZNf9c=;
 b=oiW7CA2XFTJVMH8RdEsQ7MBc21b5Q8SR5pSD39u47Vo4TGrPBSBST69YpzL/FSwCDx
 Ut239rOTK4syWNKb3RQgKMDDgQSUViL2wCWaVQOLCJluGyvj1auajz9YNBjInMe3EGaD
 89ZQyPfYbldPHdoKycXTdS8I2MSg1czdxqJdC0mOxk68h/C9E/Lvox4hieyNf3GV7338
 vy0PXEv73k3cW/TNdyWggH2S6KcRRAwzeSXMqZ7tsOu0SWkIN1b/30m+zHErH3675MlI
 zjrhV/zSgZBFrRmaYXh5l9lPDicgeo2/aR4DmYm/K3veJ5mMWJ7V4bZYK6l826hPPF+F
 h00g==
X-Gm-Message-State: AOAM532SjbDsfQP7WkWGgeYzM8/SYTCY1RlmmFCDsRLxKMse1UoU6Psb
 kH8tHCnRTySUkH2HrB4j5l0=
X-Google-Smtp-Source: ABdhPJxhwheaZHFk6xB+rN51Yz6X0yo6JNfKZG64pSHUWsziY38Td4p53F5FZbITqU6TE36B/dChCA==
X-Received: by 2002:a17:906:c24e:: with SMTP id
 bl14mr71978064ejb.285.1594646593479; 
 Mon, 13 Jul 2020 06:23:13 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:13 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [RFC PATCH 27/35] powerpc: Tidy Success/Failure checks
Date: Mon, 13 Jul 2020 14:22:39 +0200
Message-Id: <20200713122247.10985-28-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, bjorn@helgaas.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 26/35

 arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
 arch/powerpc/platforms/pseries/eeh_pseries.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 92f145dc9c1d..834cb6175cc4 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -318,7 +318,7 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 
 	if (!edev || !edev->pcie_cap)
 		return 0;
-	if (pnv_pci_cfg_read(pdn, pos, 4, &header) != 0)
+	if (pnv_pci_cfg_read(pdn, pos, 4, &header))
 		return 0;
 	else if (!header)
 		return 0;
@@ -331,7 +331,7 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 		if (pos < 256)
 			break;
 
-		if (pnv_pci_cfg_read(pdn, pos, 4, &header) != 0)
+		if (pnv_pci_cfg_read(pdn, pos, 4, &header))
 			break;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 9c023b928f2c..aec6f76879a9 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -200,7 +200,7 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
 
 	if (!edev || !edev->pcie_cap)
 		return 0;
-	if (rtas_read_config(pdn, pos, 4, &header) != 0)
+	if (rtas_read_config(pdn, pos, 4, &header))
 		return 0;
 	else if (!header)
 		return 0;
@@ -213,7 +213,7 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
 		if (pos < 256)
 			break;
 
-		if (rtas_read_config(pdn, pos, 4, &header) != 0)
+		if (rtas_read_config(pdn, pos, 4, &header))
 			break;
 	}
 
-- 
2.18.2

