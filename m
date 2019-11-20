Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 670511031A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:38:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hn1G5wzvzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:38:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XU2WI2Su"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWL3PCDzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:38 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id q17so12461457pgt.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9j4v8X64gGeA3xvelDLtKrVe6xtOiY4KBvhieJb6o0=;
 b=XU2WI2SuGGv6LYdgUe7v3MZiF2o2dQOoWcxkxbL4gqyVHMhehV9K1K2YtMJTc6tbKW
 /m30wKcjlI87SoW0IhI6jE4YjOeYy70lRwCMoaf11tWUbhCpSpgQvL49jpIpYRDpe+LU
 5xd78J6EPsF1XkwhMK5i1jj8QNDjxyO87zZEy1idFSSx+sYHLea9yQf4xQcCDezTKyCI
 Xann+4vXcvN4QO3nllQgUCboKsS4SKDIATmJxUZGFwLHUtKCXqS77R814gjhj+vaS6pH
 QDogdEjBx/n/4HQVFgDQITtHSE51sVyQIdHdiTsLCFvXv9/BAn1OG7TFIwDzclfVVQwR
 hhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9j4v8X64gGeA3xvelDLtKrVe6xtOiY4KBvhieJb6o0=;
 b=BPloTG1Ic9U7lSJgYHbMVtQ5wbqg4zIbM6VUK0HgQ0WD3mUYJa0CRNQUX8QORWHdXa
 1cX0LabkmCK+k6Oz93EZAhKkJTijfB82r2UUFTopURZP4ekjrq5C/ikq5rI7AJjq95bz
 E4HhNNYOubTB6McrqaL7LQmu7J4vZDO1WYFW0hKqS3pXRw8GPNhd35sgPX5QQnIt44Tb
 esJKFzdEa67Rp5jG/gyfp5pgOW+1pcdRV05A3dSMdzsoX0pX7qdHZG1CAqIivDFgltrQ
 X/JtXfR/DCvMwqlr7IcSqGbKlYfMhmVRjRXWxCXQKFOmDK574eGYGRTD/FyMHmhGxguW
 vDng==
X-Gm-Message-State: APjAAAUZibGWa9lYEVG1C2WQ/tRsqx56aO3iAl/EAFyNbyec1k1JtB3Z
 tkyH6vbYMgEq5RVRd9VFxaOWyFN2
X-Google-Smtp-Source: APXvYqxz+/yi9YE7D/csgyHOmHaNaalzVqNMkJcD8MrqLpeBik2SuX3uPkjDMgorKlL2XNieAX/zMg==
X-Received: by 2002:a62:20e:: with SMTP id 14mr728150pfc.153.1574213432875;
 Tue, 19 Nov 2019 17:30:32 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:32 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 34/46] powernv/pci: Remove open-coded PE lookup in
 pnv_pci_enable_device_hook()
Date: Wed, 20 Nov 2019 12:28:47 +1100
Message-Id: <20191120012859.23300-35-oohall@gmail.com>
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
 arch/powerpc/platforms/powernv/pci-ioda.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 7e88de18ead6..4f38652c7cd7 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3382,7 +3382,6 @@ static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
 static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
-	struct pci_dn *pdn;
 
 	/* The function is probably called while the PEs have
 	 * not be created yet. For example, resource reassignment
@@ -3392,11 +3391,7 @@ static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 	if (!phb->initialized)
 		return true;
 
-	pdn = pci_get_pdn(dev);
-	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
-		return false;
-
-	return true;
+	return !!pnv_ioda_get_pe(dev);
 }
 
 static long pnv_pci_ioda1_unset_window(struct iommu_table_group *table_group,
-- 
2.21.0

