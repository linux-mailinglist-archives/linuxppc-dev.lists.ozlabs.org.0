Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096C263CD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 07:54:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7Q15RJWzDqZW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R6CoqO3i; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Cn12FTzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:45:56 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id v196so4119540pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvmSZm2nrBOf1qBTVk3t5DDPFfNqHoAcR6KPUrlAhkU=;
 b=R6CoqO3itSaS9KE0f3tXg7XJdSc7U8NaSo9apChlvfvVXMjJdoghEu1PE63pvoAPQj
 FIexLMZT6eHgJ1Gc+t/v7oVnxpHG71PMYVPrR1wldbiQE+UKsi9n+S6N0EJg8JATx7u9
 7H/OSHNkv1CmI7mnjhrqJQrJz5PHsZ2FYreImvjuAtecmOevu79kDSq/zCQRbn035bSW
 XJqbhMQR8HD5YrbVIL79uiTG+TCXGBdw3bxsw6tCLWoZRfK4GC+xpbjmLz4F8++6xx/b
 8AM+Pgb8pPruykqGVXEI4IDZI1ZxPc2AuX4cXqtc6QpIfPNLw9CezuRiyjiY0GZfORhX
 MI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvmSZm2nrBOf1qBTVk3t5DDPFfNqHoAcR6KPUrlAhkU=;
 b=Db1wm+qdJA/0PDSuiZE582YNifoCeqAERglJXIPX4Ex2MEsDuZ0Pu9FzEPHPliqm27
 VRDrKgcRoWAZJ7Nd65KInwf4AYcmYQ6p70dND7IQdTIBtjct3w1vBhehZBo4mFWcveQy
 f2VNDb/JSM07q1us43ZDXP7bXkkIzEWhaWJV0odutGeZb/Nqyi23zI1PiPAGzR+U7SMh
 XgEWmv6ygt3V/PzMx12Cojt/wHCDmX2ZBlOucTJdUl2Nwcrs/jU8Gz87muMUWoCfNReS
 dG3LbtIXbEhzlw+myQ2zEpYZiAQf9akIp4Y98zHOhmlJtsW8OcQ08rX0vWJGEaxw53Tb
 hMKg==
X-Gm-Message-State: AOAM531ULDHisXRBHYRPFmL4kdGhxeo1cytvE88ceM6tAAGtc3bFRi26
 G/HksfNr+j9INLnh5CEPMi08dD+nXz8H5g==
X-Google-Smtp-Source: ABdhPJxr6cAubhjcYwyvhpRQgzpuEhsS90cxzlX6wQJ5DlF939/h3RxQA7Fk1N753bH/At59lhJhiA==
X-Received: by 2002:aa7:8812:0:b029:13c:1611:6537 with SMTP id
 c18-20020aa788120000b029013c16116537mr3864977pfo.9.1599716753940; 
 Wed, 09 Sep 2020 22:45:53 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:53 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/9] powerpc/eeh: Delete eeh_ops->init
Date: Thu, 10 Sep 2020 15:45:27 +1000
Message-Id: <20200910054532.2043724-5-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910054532.2043724-1-oohall@gmail.com>
References: <20200910054532.2043724-1-oohall@gmail.com>
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

No longer used since the platforms perform their EEH initialisation before
calling eeh_init().

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h | 1 -
 arch/powerpc/kernel/eeh.c      | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 765bcf63edea..85030c05e67e 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -216,7 +216,6 @@ enum {
 
 struct eeh_ops {
 	char *name;
-	int (*init)(void);
 	struct eeh_dev *(*probe)(struct pci_dev *pdev);
 	int (*set_option)(struct eeh_pe *pe, int option);
 	int (*get_state)(struct eeh_pe *pe, int *delay);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 28a0ea5d9faa..98faf139e676 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -965,14 +965,6 @@ int eeh_init(struct eeh_ops *ops)
 		return ret;
 	}
 
-	if (eeh_ops->init)
-		ret = eeh_ops->init();
-	if (ret) {
-		pr_warn("%s: platform EEH init failed (%d)\n",
-			__func__, ret);
-		return ret;
-	}
-
 	/* Initialize PHB PEs */
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
 		eeh_phb_pe_create(hose);
-- 
2.26.2

