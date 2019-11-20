Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86E1031B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:40:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hn3X6ksgzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:40:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EgKLJK0E"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWL0tjkzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:38 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id ep1so3434527pjb.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RlbfbbTXz8uUVdyqhIAHDB23vG2GFDmElD045mucULw=;
 b=EgKLJK0EV4P95j6tbvkCkeoxD0JcnwLXPt8fRnfO6QWZoed3/sxk1iQEzwxATwIeSI
 pIbtCBEQTzwZ7LVneLyGCFupEY59qyOIvZ+L4+fHf6dMuDGO9nXUmxysBm7O4PS+8gOt
 UEFK2rcCsmxhLKI1aLKpOKFknQSp3rsUP55uYPFLZ9Z/qi6XW3gmnpc/43jj4u0QqnB7
 xFY4OJcnn6wg5GeBoIrOJpolv08VISd5G1sfZJxHG+o6mTCYzRT72dyXUfWH9YZ427PV
 H70puVv7DzwdgPxWKVQ2u9aK6WjJziZFR8NJlT3E8vGbaeoxMlxsgVWUgyfCLQzV9Oa4
 iNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RlbfbbTXz8uUVdyqhIAHDB23vG2GFDmElD045mucULw=;
 b=EVPfLG2d7Y+NpAm8iTmpN7dzT2PjxG2xo8y0NvAlDZ6Hs3lOpZUitmxXAmLlMaQFvh
 fe7LRyZABWmOmdQCg5yQvvdlILUV/bYSgCWjNHe4m/KmdK8uQMBdJw0nfm7qTvtlxmOQ
 v/t6EzCwi/8gCc31FvpF36/p5o9ydsPmEl9eTeC+A/zMhKrmLr1IYBirI+JRpKeVGzlL
 RtHaAeQ4MN/2nITzikXuG79YA9zZrnXhtUBnIozLonuOoPqZeYDmgLPl5N9sXtvCLm1h
 RDndj0LvLMjOBGQHwNb/yx1Nz5JYKil+7wr+4Bc/3s5yYDVm9xIxVj9gthUxTSlElUcN
 SPsg==
X-Gm-Message-State: APjAAAUPYF7GuhIXwa4ntofSa8XI1jNfV0Y8pxbN7S7xMqmyIjPPMn4B
 BLHFQjWgHzeVV1CzJXhah1ibd3wf
X-Google-Smtp-Source: APXvYqxp95Joy1XIt6oIdhdU8yfuTVClPclnX9nAjwhMx9oyvrxKEjsAmvWsm209tVDFd+UKXSYbrg==
X-Received: by 2002:a17:902:a70f:: with SMTP id
 w15mr223626plq.263.1574213435105; 
 Tue, 19 Nov 2019 17:30:35 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:34 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 35/46] powernv/pci: Remove open-coded PE lookup in
 pnv_pci_release_device
Date: Wed, 20 Nov 2019 12:28:48 +1100
Message-Id: <20191120012859.23300-36-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 4f38652c7cd7..8525642b1256 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3562,14 +3562,14 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 static void pnv_pci_release_device(struct pci_dev *pdev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
+	struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
 	struct pci_dn *pdn = pci_get_pdn(pdev);
-	struct pnv_ioda_pe *pe;
 
 	/* The VF PE state is torn down when sriov_disable() is called */
 	if (pdev->is_virtfn)
 		return;
 
-	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
+	if (WARN_ON(!pe))
 		return;
 
 	/*
@@ -3588,7 +3588,6 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
 	 * be increased on adding devices. It leads to unbalanced PE's device
 	 * count and eventually make normal PCI hotplug path broken.
 	 */
-	pe = &phb->ioda.pe_array[pdn->pe_number];
 	pdn->pe_number = IODA_INVALID_PE;
 
 	WARN_ON(--pe->device_count < 0);
-- 
2.21.0

