Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E021AF07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:56:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B32NG5WYvzDrLk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kE6fw/2R; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gc6rqszDrG2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:28 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id z2so4575754wrp.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUxLjLbDTYPDEi7E9qhfkUQ6YJD3u2Zjb67u2EA9IBc=;
 b=kE6fw/2RwwSg/v1dbkBpfE5n6B3vLNrOYwHjJMH8ylEIQnw2v1lR8u9ZrMm7et07hE
 KlNgXChltwD+oJplM0Ood9ozQPm8tnpFkEUgyViWVlUjQx+jT7t/RMD5h8EWIPilScQh
 nTWkOtMqD8GOTnklyghAP6EmElQJK3TYe7M4BNkodKfiTLB315vDrH3XAlCZm+FkYp4b
 R2W57705OzTpbZ4DzBHuViq6gOSEA0eQgfcbKGxXLCRiWGM+J9FAECT2fN56/ieeyRX4
 ZeQsy7+BFs8BwEcLEL6lUiGoWi/atU5lhBepEzmWnXhAj0lj7rbGjUsxSrkLabWS9rLN
 O4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XUxLjLbDTYPDEi7E9qhfkUQ6YJD3u2Zjb67u2EA9IBc=;
 b=o0FN6TUAUJAF/PBjVyevP0ecIKQmgiqN5mbb+3utw5Yq/85CbJmTpdpUMKwDRwOppJ
 +iTUyu0Hv4sreSSbZpfuPVORzZc+nr8ZRl2rWlll/GlcTQ57/Dpu28L62YKpMSmfaBek
 a6PakGftdvIYrTIjCP7SDYIGIG1ns6Cr2sLg6yHGPhHdvHsEFIsK85jHGFKG0NTFYOH8
 /gNYF7NIQT1ODroDs4BRI7Y2seiyAZZFufyPD4qSGSjWbTsPPDKtdEbtNHb4DK4nzZWn
 m0C0p0QKu0gOvDktLdk+1AvKn/Z6I/WAgR3/fUeMpSqdynVhGDhzutIMHa82cF4F8X4u
 ctZA==
X-Gm-Message-State: AOAM5327N2p53ULIOk26x+1FhVBP9NqjOFRmLBrGy9bw5RPV26oUfx1S
 0Swgbfr3FCeclcsTjctxYQ3wuUu7R6c=
X-Google-Smtp-Source: ABdhPJzEK3tKpjrNJfrUKkGMflNhBGQVQ6fLcw4ORQo8CENOszQSIqGClEIXBh+YEIVGEtGsTs3nmg==
X-Received: by 2002:adf:efcc:: with SMTP id i12mr65354547wrp.349.1594358666020; 
 Thu, 09 Jul 2020 22:24:26 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:25 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/15] powerpc/powernv/sriov: Move M64 BAR allocation into a
 helper
Date: Fri, 10 Jul 2020 15:23:38 +1000
Message-Id: <20200710052340.737567-14-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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

I want to refactor the loop this code is currently inside of. Hoist it on
out.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 31 ++++++++++++++--------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index d5699cd2ab7a..2f967aa4fbf5 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -416,6 +416,23 @@ static int64_t pnv_ioda_map_m64_single(struct pnv_phb *phb,
 	return rc;
 }
 
+static int pnv_pci_alloc_m64_bar(struct pnv_phb *phb, struct pnv_iov_data *iov)
+{
+	int win;
+
+	do {
+		win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
+				phb->ioda.m64_bar_idx + 1, 0);
+
+		if (win >= phb->ioda.m64_bar_idx + 1)
+			return -1;
+	} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
+
+	set_bit(win, iov->used_m64_bar_mask);
+
+	return win;
+}
+
 static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pnv_iov_data   *iov;
@@ -443,17 +460,9 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 			continue;
 
 		for (j = 0; j < m64_bars; j++) {
-
-			/* allocate a window ID for this BAR */
-			do {
-				win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
-						phb->ioda.m64_bar_idx + 1, 0);
-
-				if (win >= phb->ioda.m64_bar_idx + 1)
-					goto m64_failed;
-			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
-			set_bit(win, iov->used_m64_bar_mask);
-
+			win = pnv_pci_alloc_m64_bar(phb, iov);
+			if (win < 0)
+				goto m64_failed;
 
 			if (iov->m64_single_mode) {
 				int pe_num = iov->vf_pe_arr[j].pe_number;
-- 
2.26.2

