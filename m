Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2FB103168
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:08:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmMB2DygzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:08:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dRYiB9Jh"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVb2WpjzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:59 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id b10so3951534pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QPT6uJvsbCKgRe4wn8A1ywwVQvc2vXr1R0UPS9i4zOI=;
 b=dRYiB9JhiB9VI9aU9tNvCLcqlsBKMMDLX/bjS+JKqKDtqeVEHECVe8Jwb/Et66xtgg
 qQrxF3qD6ZmVApEOZnN9df4zsXUjQ88tj4NfJ2QTyqbZx1sDkM0hOHvCx7cZ+yYxJJcx
 GSv11G+69TfqBk3sii1x8RmZ/WCIBiUh5VOeqFq4k+igytnQxL7HfAuoYsQW2V0rNYf4
 s4kOdQ1D6FuvdCuIMtWupdnWSDQUVhLNfm4KRAIXrRmv5UIw5VH2O3xS3uSzHVvZEgWi
 OT1p0cPZjKHH6/bGXnn9UUehOAshhVRBHcBqwZM02bs4N+3AC3+Mhe8CZo3cpQQxpYK9
 66OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QPT6uJvsbCKgRe4wn8A1ywwVQvc2vXr1R0UPS9i4zOI=;
 b=XbGxfCUc15FBSRApZ9/BAQO/Mobq/hS3IufOG99BlxEYZlpm+0g/7PYeWAwtoJsWxj
 TbdySV7Yt+qDLNlFZNE8jC747nkOHXidKP2VxY59k047fGRz8PDDaONPRvr9kDzY0hng
 9CaIJMiq473vj7UtJBpLavxcD+7gjNvqScAD/8LgSO0q0OOe7QBxLjV3QOto9CiN3WlK
 +IcWwGkCJm8/ZRHsi5JpS3nyRPRL7wz2Q7p2ZPZqES2Mp6Wx2MosbS7U/JackQ/V48vN
 4icaxmNWqVGjUuSlPRjvevAR0ajJu+tHMSb9vnDRJgV/4VbyZLtf82FLe8qImHLx1yA4
 Z85w==
X-Gm-Message-State: APjAAAXZc2gzCUc6MM7CHw+VVLwPG//+WTajpIEnNKvjINDD3E+jAInW
 kdDe5MU2fm7hAUnMpVylagRioeNB
X-Google-Smtp-Source: APXvYqzoNB62meQqkIO5qYFuPEDAzTmjnkKQ1dgENoBdI8vIm5WHkucOw5s1oKJF+cZDh9Qro/b/qw==
X-Received: by 2002:a62:e914:: with SMTP id j20mr735198pfh.245.1574213397149; 
 Tue, 19 Nov 2019 17:29:57 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:56 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 19/46] powernv/eeh: Use standard PCI capability lookup
 functions
Date: Wed, 20 Nov 2019 12:28:32 +1100
Message-Id: <20191120012859.23300-20-oohall@gmail.com>
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

We have a pci_dev so we can use the functions provided by the PCI core for
looking up capabilities. This should be safe since these are only called
when initialising the eeh_dev when the device is first probed and not in
the EEH recovery path where config accesses are blocked.

This might cause a problem if an EEH event occured while probing the device,
but I'm pretty sure that's going to be broken anyway.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 67 ++------------------
 1 file changed, 4 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index a974822c5097..b79aca8368c6 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -358,65 +358,6 @@ static int pnv_eeh_write_config(struct eeh_dev *edev,
 	return pnv_pci_cfg_write(pdn, where, size, val);
 }
 
-static int pnv_eeh_find_cap(struct eeh_dev *edev, int cap)
-{
-	int pos = PCI_CAPABILITY_LIST;
-	int cnt = 48;   /* Maximal number of capabilities */
-	u32 status, id;
-
-	/* Check if the device supports capabilities */
-	pnv_eeh_read_config(edev, PCI_STATUS, 2, &status);
-	if (!(status & PCI_STATUS_CAP_LIST))
-		return 0;
-
-	while (cnt--) {
-		pnv_eeh_read_config(edev, pos, 1, &pos);
-		if (pos < 0x40)
-			break;
-
-		pos &= ~3;
-		pnv_eeh_read_config(edev, pos + PCI_CAP_LIST_ID, 1, &id);
-		if (id == 0xff)
-			break;
-
-		/* Found */
-		if (id == cap)
-			return pos;
-
-		/* Next one */
-		pos += PCI_CAP_LIST_NEXT;
-	}
-
-	return 0;
-}
-
-static int pnv_eeh_find_ecap(struct eeh_dev *edev, int cap)
-{
-	u32 header;
-	int pos = 256, ttl = (4096 - 256) / 8;
-
-	if (!edev || !edev->pcie_cap)
-		return 0;
-	if (pnv_eeh_read_config(edev, pos, 4, &header) != PCIBIOS_SUCCESSFUL)
-		return 0;
-	else if (!header)
-		return 0;
-
-	while (ttl-- > 0) {
-		if (PCI_EXT_CAP_ID(header) == cap && pos)
-			return pos;
-
-		pos = PCI_EXT_CAP_NEXT(header);
-		if (pos < 256)
-			break;
-
-		if (pnv_eeh_read_config(edev, pos, 4, &header) != PCIBIOS_SUCCESSFUL)
-			break;
-	}
-
-	return 0;
-}
-
 /**
  * pnv_eeh_probe - Do probe on PCI device
  * @pdev: pci_dev to probe
@@ -458,10 +399,10 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 
 	/* Initialize eeh device */
 	edev->class_code = pdn->class_code;
-	edev->pcix_cap = pnv_eeh_find_cap(edev, PCI_CAP_ID_PCIX);
-	edev->pcie_cap = pnv_eeh_find_cap(edev, PCI_CAP_ID_EXP);
-	edev->af_cap   = pnv_eeh_find_cap(edev, PCI_CAP_ID_AF);
-	edev->aer_cap  = pnv_eeh_find_ecap(edev, PCI_EXT_CAP_ID_ERR);
+	edev->pcix_cap = pci_find_capability(pdev, PCI_CAP_ID_PCIX);
+	edev->pcie_cap = pci_find_capability(pdev, PCI_CAP_ID_EXP);
+	edev->af_cap   = pci_find_capability(pdev, PCI_CAP_ID_AF);
+	edev->aer_cap  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ERR);
 	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
-- 
2.21.0

