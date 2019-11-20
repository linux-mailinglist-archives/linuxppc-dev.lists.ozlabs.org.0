Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FC310315D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:04:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmFz1xFmzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:04:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tDdvjxzc"; 
 dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVW5yzJzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:55 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id o14so3431616pjr.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mDbfog7r7ylxTWncPajqxU4T68LE6nHC7dK4SxHoIPQ=;
 b=tDdvjxzcgs6Yfh8KffdpeILbR7yNnn8EZ3WDtu7Xb5HvZTiAYtEu/IDlhnAj5Rfj0T
 8rTRTIolazdIzf2GYd6drGt2FK/L5FlLoaolPgy8iRyUQQVZ4kbl2NaG+lMzIkxCJ5fA
 fD776ODC0IAdVsvnaC8HXAWmmXK17N15hZcya5/qN0XaciMER4VSfWZHyXinAPnA0w8+
 U36Epqqs60RC/98d//OxCFhKCEDq2jNYWQksBW2iUjv2JLXFDdczVNPo761cG/zLGjTT
 d5EKapQmtTtQREbfS9prUV2i9pTXfKHa/jhUQgDBelT42upHKCT4uUivpgrYNq5nOKgF
 P2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mDbfog7r7ylxTWncPajqxU4T68LE6nHC7dK4SxHoIPQ=;
 b=udbVZT8tmi++kEuhMuBSX23JY4bJStvDBIzv6n6RjS55CNh/i0LFChlVp7v9nap8il
 43ULBPItve6bH1MRxNH6yKiq+6VvRRncI0CK3SAaJW4gNJMq15WmQMyJMCdJ9lQjDoSG
 niSEHCiRF0o5qz1Di8dlWAq54AFsv2ZTpLebpuhJLSiMFCrFdeDD8CSuL3xd5ADeXBqW
 CURSyBl3D+0YuaG6gx/No0tCpohK5H86mn3TckLVoVkouvijgplQvZEnfQf2bBUuj1kJ
 0J5EfDOH7x7ybWtOb0OP7jdlP0LAZ7AErMu38jW86RHb3HHuQXCwPszSXgwif32Urvat
 W8nA==
X-Gm-Message-State: APjAAAVCY1svBbvixnRptbCm8aZntgFoVE1PJwNPe7dicVEJOGCs0eZK
 5LosBFY5EfRnn+RoUWvtSbuj7mXV
X-Google-Smtp-Source: APXvYqz9m4lYHlOES6g0UFuZda5Qg1o5bVXhT5SLPxuusRyDhdJvX5YFdNnNEI2K+wG8T6JiAXf8sQ==
X-Received: by 2002:a17:90a:974b:: with SMTP id
 i11mr658862pjw.47.1574213392414; 
 Tue, 19 Nov 2019 17:29:52 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:52 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 17/46] powernv/eeh: add pnv_eeh_find_edev()
Date: Wed, 20 Nov 2019 12:28:30 +1100
Message-Id: <20191120012859.23300-18-oohall@gmail.com>
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

To get away from using pci_dn we need a way to find the edev for a given
bdfn. The easiest way to do this is to find the ioda_pe for that BDFN in
the PHB's reverse mapping table and scan the device list of the
corresponding eeh_pe.

Is this slow? Yeah probably. Is it slower than the existing "traverse the
pdn tree" method? Probably not.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 31 ++++++++++++++++++++
 arch/powerpc/platforms/powernv/pci.h         |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index f58fe6bda46e..a974822c5097 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -278,6 +278,37 @@ int pnv_eeh_post_init(void)
 	return ret;
 }
 
+struct eeh_dev *pnv_eeh_find_edev(struct pnv_phb *phb, u16 bdfn)
+{
+	struct pnv_ioda_pe *ioda_pe;
+	struct eeh_dev *tmp, *edev;
+	struct eeh_pe *pe;
+
+	/* EEH not enabled ? */
+	if (!(phb->flags & PNV_PHB_FLAG_EEH))
+		return NULL;
+
+	/* Fish the EEH PE from the IODA PE */
+	ioda_pe = __pnv_ioda_get_pe(phb, bdfn);
+	if (!ioda_pe)
+		return NULL;
+
+	/*
+	 * FIXME: Doing a tree-traversal followed by a list traversal
+	 * on every config access is dumb. Not much dumber than the pci_dn
+	 * tree traversal we did before, but still quite dumb.
+	 */
+	pe = eeh_pe_get(phb->hose, ioda_pe->pe_number, 0);
+	if (!pe)
+		return NULL;
+
+	eeh_pe_for_each_dev(pe, edev, tmp)
+		if (edev->bdfn == bdfn)
+			return edev;
+
+	return NULL;
+}
+
 static inline bool pnv_eeh_cfg_blocked(struct eeh_dev *edev)
 {
 	if (!edev || !edev->pe)
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 3c33a0c91a69..a343f3c8e65c 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -196,6 +196,8 @@ extern void pnv_set_msi_irq_chip(struct pnv_phb *phb, unsigned int virq);
 extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
 		__u64 window_size, __u32 levels);
 extern int pnv_eeh_post_init(void);
+struct eeh_dev;
+struct eeh_dev *pnv_eeh_find_edev(struct pnv_phb *phb, u16 bdfn);
 
 __printf(3, 4)
 extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
-- 
2.21.0

