Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2453A229215
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:25:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRp92PpPzDqrm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:25:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m4F7Q7gk; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9z18B5zDqwD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:59 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mn17so663119pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9r/vtCCqtBUQj5l3GLs9PfeYlwV8MTvzAhemK5hlBeU=;
 b=m4F7Q7gkHy0ArlfG4gPyZ1gFklL8uLxXPxeycaoxGyAP2gpJd4HErAsWbHjLiFGG1V
 rUAgEltQJtAeFj6WkhFCMoq+JgQkXutzca9Ioj60IDx+7nVODQOcMAoJi6jSJSkFMW/f
 slALgAOl5SB7l4oxF7dRASID+3MU8/lblj3b1pBRWYdI1aYUrjJkz4JoSGKslYqsLYoq
 KFgIEpmkav1pEyired8Uc4fO71tuzCmVIsWSQ3if0ZLd6sW7FRmr8zK0zkj+jPh+2UFM
 Mvj0U5TCq1j7WwBvox3WnM+yjlx+SXOBbkWS5R55KZr+HMPFuMmizxgRAnWLJV0oqYDP
 lzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9r/vtCCqtBUQj5l3GLs9PfeYlwV8MTvzAhemK5hlBeU=;
 b=N8JyPplwmV8jSsDtGzcjje6l9hSRCj3AgVn70aFrLDHRvGxxFu5VGuzn4y+GPiXbZd
 6FUvr7VRVOMgzLaoMMCvBpqg2YJdWEBA2FBWrcIDE+bdxEnD1IsIwLVpbbHiML46ESyI
 b9EkT7QK3OHxD6QNw8IwXgpxStHiBH6aV6vPogEmw0NROIMZvj3sIwX2BoMr03xTVnhe
 GrjGQY8oYQFYA3Fdlqzxae/wTiAAGgIKu608mIMqjwY2bscRLmrgDy4XdNs8l02IhVVk
 RhBKSVmVmpm62pzK5SB8AAOv1A8IwdhjhZVxebr2sry33NCPBKPlpYwrb+PwQ7a3+Oee
 7LHw==
X-Gm-Message-State: AOAM5323oRl4dA9wZGKv+FszOXJwl4+p7x/tvKzuDk9DJsukTBYJuP2o
 xz46WcX4rJ8tOPuTPGleSTZMKbaEtz8=
X-Google-Smtp-Source: ABdhPJx6OXPcO9L1h0k9Ir+wi3b3rsfarNPLdYvcnc9N7+J27yI0GE4LQxi8J4hF0ebaJTIjUG6DFA==
X-Received: by 2002:a17:90a:800b:: with SMTP id
 b11mr8619379pjn.105.1595401077103; 
 Tue, 21 Jul 2020 23:57:57 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:56 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/16] powerpc/powernv/sriov: Refactor M64 BAR setup
Date: Wed, 22 Jul 2020 16:57:13 +1000
Message-Id: <20200722065715.1432738-14-oohall@gmail.com>
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

Split up the logic so that we have one branch that handles setting up a
segmented window and another that handles setting up single PE windows for
each VF.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no changes
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 57 ++++++++++------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index f9aa5773dc6d..ce8ad6851d73 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -438,52 +438,49 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	struct resource       *res;
 	int                    i, j;
 	int64_t                rc;
-	int                    total_vfs;
 	resource_size_t        size, start;
-	int                    m64_bars;
+	int                    base_pe_num;
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
 	iov = pnv_iov_get(pdev);
-	total_vfs = pci_sriov_get_totalvfs(pdev);
-
-	if (iov->m64_single_mode)
-		m64_bars = num_vfs;
-	else
-		m64_bars = 1;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
 		res = &pdev->resource[i + PCI_IOV_RESOURCES];
 		if (!res->flags || !res->parent)
 			continue;
 
-		for (j = 0; j < m64_bars; j++) {
+		/* don't need single mode? map everything in one go! */
+		if (!iov->m64_single_mode) {
 			win = pnv_pci_alloc_m64_bar(phb, iov);
 			if (win < 0)
 				goto m64_failed;
 
-			if (iov->m64_single_mode) {
-				int pe_num = iov->vf_pe_arr[j].pe_number;
-
-				size = pci_iov_resource_size(pdev,
-							PCI_IOV_RESOURCES + i);
-				start = res->start + size * j;
-				rc = pnv_ioda_map_m64_single(phb, win,
-							     pe_num,
-							     start,
-							     size);
-			} else {
-				size = resource_size(res);
-				start = res->start;
-
-				rc = pnv_ioda_map_m64_segmented(phb, win, start,
-								size);
-			}
+			size = resource_size(res);
+			start = res->start;
 
-			if (rc != OPAL_SUCCESS) {
-				dev_err(&pdev->dev, "Failed to map M64 window #%d: %lld\n",
-					win, rc);
+			rc = pnv_ioda_map_m64_segmented(phb, win, start, size);
+			if (rc)
+				goto m64_failed;
+
+			continue;
+		}
+
+		/* otherwise map each VF with single PE BARs */
+		size = pci_iov_resource_size(pdev, PCI_IOV_RESOURCES + i);
+		base_pe_num = iov->vf_pe_arr[0].pe_number;
+
+		for (j = 0; j < num_vfs; j++) {
+			win = pnv_pci_alloc_m64_bar(phb, iov);
+			if (win < 0)
+				goto m64_failed;
+
+			start = res->start + size * j;
+			rc = pnv_ioda_map_m64_single(phb, win,
+						     base_pe_num + j,
+						     start,
+						     size);
+			if (rc)
 				goto m64_failed;
-			}
 		}
 	}
 	return 0;
-- 
2.26.2

