Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC0E229212
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:24:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRm45kFkzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:24:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EiIn3Fwa; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9x1py9zDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:57 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d7so470901plq.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3tAPaLbPOKzWTimgu274iEtdGXYBF7csg6GtMWWCoI=;
 b=EiIn3FwaJ5iuSF8ZpJXXB5lVvVrfT2qq6LMuzRHD+JfxAgwGQAQ8AUY+6tw9jdNrmj
 7iNog58RNf/l1hgnCvm3gr3/+B2o94wzhZSayTW4ctZBCl7OBiVxIsqRmd+BbsY+5RxL
 n/qqhetjfp8Q7kXd8hKz/ZQMgnkELMiGRRAlCbIBLx2/PNtHECsmaa/PZLMO3OzdJyrs
 tcXDV5kKDNTRg0bGszEmNqPdSYH30faRx4IxpRt+NI6LcmrbEecgAs1k6Rl4E7SYRL4P
 p0Kb4ucYB/ToEvqPWi79NxcCtwlay/hbl1tYp0e0mTXEN8du2oNmFxHl9B80oTUd961J
 Ambg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3tAPaLbPOKzWTimgu274iEtdGXYBF7csg6GtMWWCoI=;
 b=NYAJZnaMan0vPua+BMbpT6LO6Ib9//JNYONPxPJk6WLS6at7vuRepdfmyBOMIA3/3B
 6SlFrlZatXb87XTXhTRYw3h6BibVCHHDShNZmiA//QkaaYyoQrBjfFlktuxf0H0lSrVV
 4LE3xQd8HH/To/rK3On6WYwzrThBL2yD5eoqkr5giqfRGcfabJSpS4EWLDc3C/gUgfOF
 dphe1S6bHoGWpyzrhwceniyQMnHQeOBPm8Ygo7pst/qw+S5VROp8BBh66Ux++enzB5XR
 T9aBtK74OnmFj+T7QZPnyxpTIlbTKP4+UvI79asTJJiMDKjkQl722XjC9Mjcva/PBtXO
 kZvw==
X-Gm-Message-State: AOAM5316PfdqRtCcaRpGgzvbuEC5lqsnMPi+WuY/DRyL9akCKlZ9Vfgd
 rDCnI7hggM3qDTW1Xs/bMDOINMrQzkQ=
X-Google-Smtp-Source: ABdhPJycd5oauROKEXEdg3TZIiSgcjVF0KdFpJblcmvsUNHwmS5BdDL9WHfFJ1sJfI1j2O5UEcwINg==
X-Received: by 2002:a17:90a:30ea:: with SMTP id
 h97mr8632084pjb.32.1595401074918; 
 Tue, 21 Jul 2020 23:57:54 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:54 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/16] powerpc/powernv/sriov: Move M64 BAR allocation into
 a helper
Date: Wed, 22 Jul 2020 16:57:12 +1000
Message-Id: <20200722065715.1432738-13-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I want to refactor the loop this code is currently inside of. Hoist it on
out.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no change
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 31 ++++++++++++++--------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index b60d8a054a61..f9aa5773dc6d 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -413,6 +413,23 @@ static int64_t pnv_ioda_map_m64_single(struct pnv_phb *phb,
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
@@ -440,17 +457,9 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
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

