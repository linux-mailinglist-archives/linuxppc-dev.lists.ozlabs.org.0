Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A713285778
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 06:10:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5gqg0GvPzDqHx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 15:10:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p7oWVRxi; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5gnv3sqnzDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 15:09:19 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id r10so542011pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Oct 2020 21:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DIr2Oa/tzn3Ye4WxKrbVL8jvi6QGs85bcsP8JXOXpb0=;
 b=p7oWVRxibHhlX8kC+FeY6TFVj18uuRR0egPJc16bmUPy8A6rYQZJdghZTs+BGevZM7
 O+bhAyvLrwszsngugrPgkoGAAQX+A0IYzlEDz3bUwU3mnx8Y5sDooI7/yZxBjIqtw/Rg
 Z3Wey/LBGdXnlDU7ORJ2n8cxUNUu7MPvWo5y88YY6dDCLMyo/nsodpHPTbi6JHsf0I76
 y/7rpRIyryxB0laz6Fy0/K7sPP5dtjpstE//fJBIEEoEZIH3Pgo5YMoWufZLJh05vXd3
 KjZYMChi/EnaR+uBd+2QldSLtJdbqS/eI2PqYtQcTRKW/NiUtVLppYIdlBrT4JWalDEl
 dB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DIr2Oa/tzn3Ye4WxKrbVL8jvi6QGs85bcsP8JXOXpb0=;
 b=sccYh9i6ReQen/WrdxsiMbbEUKDebBYD7RfIEiccep98ND+fQYhYxNlRgC2yNP+lev
 zU2YUMWAmLeO3tjadTiAwkK21YZEpZEcwF4ltFAVRh1IFN6Cid8+TKTdE9Ch9I135oZP
 pSb0kGAGy+voP0qHTKCjwwyuuHc+vz0SwbYXJlu+DyGzUMdoIINVi79h6ZMZmqVMgq/a
 X5BveOUondAgfG+9JFL6zqT5eo5bWJLbcahA2bDQdTobCwexSSbQjnBHCE94Hka99LRw
 mBdM6o3uqzVQsUB5o7SEsE0IF5AvKURYsw5kAwYJFfGAfb8bpfhwKqsfBeGShweAhpgR
 jA1A==
X-Gm-Message-State: AOAM530BSu+E9/xug3QYCDhkPEpLrPw1wrWLbaqOHv9XbhdAz4MQmQHp
 wIKQn8qQ8sZLx9sNx5GLaojP5irvYaLQKQ==
X-Google-Smtp-Source: ABdhPJwvb3jdiCGVdsEaxiHBj8SY21KoioJv2DZ2vdfXrVPFzHbGQL9my3urn2m5P2fK/OlGZkH4Lw==
X-Received: by 2002:a05:6a00:2283:b029:142:2501:35e0 with SMTP id
 f3-20020a056a002283b0290142250135e0mr1299595pfe.64.1602043755703; 
 Tue, 06 Oct 2020 21:09:15 -0700 (PDT)
Received: from localhost.ibm.com (14-200-206-90.tpgi.com.au. [14.200.206.90])
 by smtp.gmail.com with ESMTPSA id
 x3sm829552pgg.54.2020.10.06.21.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 21:09:15 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/eeh: Delete eeh_pe->config_addr
Date: Wed,  7 Oct 2020 15:09:02 +1100
Message-Id: <20201007040903.819081-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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

The eeh_pe->config_addr field was supposed to be removed in
commit 35d64734b643 ("powerpc/eeh: Clean up PE addressing") which made it
largely unused. Finish the job.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
mpe: the Fixes SHA is from ppc/next, fold it into that if you want.
---
 arch/powerpc/include/asm/eeh.h | 1 -
 arch/powerpc/kernel/eeh.c      | 2 +-
 arch/powerpc/kernel/eeh_pe.c   | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index dd6a4ac6c713..b1a5bba2e0b9 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -73,7 +73,6 @@ struct pci_dn;
 struct eeh_pe {
 	int type;			/* PE type: PHB/Bus/Device	*/
 	int state;			/* PE EEH dependent mode	*/
-	int config_addr;		/* Traditional PCI address	*/
 	int addr;			/* PE configuration address	*/
 	struct pci_controller *phb;	/* Associated PHB		*/
 	struct pci_bus *bus;		/* Top PCI bus for bus PE	*/
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 87de8b798b2d..0e160dffcb86 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -466,7 +466,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 		return 0;
 	}
 
-	if (!pe->addr && !pe->config_addr) {
+	if (!pe->addr) {
 		eeh_stats.no_cfg_addr++;
 		return 0;
 	}
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 61b7d4019051..845e024321d4 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -354,8 +354,8 @@ int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent)
 		pr_err("%s: out of memory!\n", __func__);
 		return -ENOMEM;
 	}
-	pe->addr	= edev->pe_config_addr;
-	pe->config_addr	= edev->bdfn;
+
+	pe->addr = edev->pe_config_addr;
 
 	/*
 	 * Put the new EEH PE into hierarchy tree. If the parent
-- 
2.26.2

