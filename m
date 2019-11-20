Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92D1031D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:59:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnV363RfzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YIJVGIzt"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWp0bydzDqC6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:31:02 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id b10so3952870pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaidDmEu9Tzprqu5tXP1Zr7LwpY+Irv7mTKxwkM+qbo=;
 b=YIJVGIztPuSpA6R7HNeTQQtxF6JU4VcczqbjK3kC6xqJLwEnlv5pKAgtUnpSL81xMq
 4bzI/9Uj20vL8UfBUBO9Q3x7+JamM7cqKk9+/wUtQjwZDJG0gKuVpmUXeI8wG+TZTjpr
 igbiZ+DHrL2tHMB/BZ/uHORZwdsI1WYpa43nI3MLqmqfySFLjn7jeJ9WYCNVVBqI1smm
 fwjQkG8uCdkdhg6+VO4bAREU+PC9+qM+d+0M5fuUCxKM4OUeVkt01DSYEUV4Bx9igmku
 KdH9coKbmEYDI/rsrwJMBXrV+wUjSJ8F+nIebaWjWf4UDFVcv25wW5vQjm0NYXcNKEwP
 BDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UaidDmEu9Tzprqu5tXP1Zr7LwpY+Irv7mTKxwkM+qbo=;
 b=sazqmfhKhMqxJWxt7dCOhBEOOc1soIFmwguu/e50U5xJzepG4JE+gELPJGW+bDdzAf
 8Fk+dGFDrgvn31lqLCFm9m/SzgTD0jT4LzM/+hjf7ChMh3xFD8AZH4GZQf/fhie4IRw6
 lJJJH7X6/+SRqsxL3CdzuAo0JMEEHUFHuC5cw3MKAWbnQIvuCoSmPhlObBPxBxyZblG5
 B+xNoeYaHQwVwLQIk30JkQD0WlkEqYziL/jcXjUQmn93DkZTNie8yQoy+c1ZDMzI9k1Z
 008RopaUXudyrG3YhmGWEeK1zaUpfM/fpB4DNwk0M53BfOJxTzJ8ltqO4vMQGvd7Q/pu
 1+ug==
X-Gm-Message-State: APjAAAUJZA9abMn2yPByH2g6vcPDqnKyxvfKeG/g/pABxF5eDFW0BmPd
 bNrbxjF6qw5SSRCKbTMChJwDWacN
X-Google-Smtp-Source: APXvYqzvpdDUtx6EZ4E3WAVBP39HK4OhWw+XWDckDwt7bRbPJ5xBTAU+AydJSjZ9P9TKN01xrW57Mw==
X-Received: by 2002:aa7:80d2:: with SMTP id a18mr762511pfn.29.1574213458367;
 Tue, 19 Nov 2019 17:30:58 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:58 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 45/46] powernv/pci: Remove requirement for a pdn in config
 accessors
Date: Wed, 20 Nov 2019 12:28:58 +1100
Message-Id: <20191120012859.23300-46-oohall@gmail.com>
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

:toot:

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 0eeea8652426..6383dcfec606 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -750,17 +750,12 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 			       unsigned int devfn,
 			       int where, int size, u32 *val)
 {
-	struct pci_dn *pdn;
 	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	u16 bdfn = bus->number << 8 | devfn;
 	struct eeh_dev *edev;
 	int ret;
 
 	*val = 0xFFFFFFFF;
-	pdn = pci_get_pdn_by_devfn(bus, devfn);
-	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
 	edev = pnv_eeh_find_edev(phb, bdfn);
 	if (!pnv_eeh_pre_cfg_check(edev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
@@ -781,16 +776,11 @@ static int pnv_pci_write_config(struct pci_bus *bus,
 				unsigned int devfn,
 				int where, int size, u32 val)
 {
-	struct pci_dn *pdn;
 	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	u16 bdfn = bus->number << 8 | devfn;
 	struct eeh_dev *edev;
 	int ret;
 
-	pdn = pci_get_pdn_by_devfn(bus, devfn);
-	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
 	edev = pnv_eeh_find_edev(phb, bdfn);
 	if (!pnv_eeh_pre_cfg_check(edev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-- 
2.21.0

