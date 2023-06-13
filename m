Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6872D8D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:55:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=BqVuE2zc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgGTW6l8kz30hK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 14:55:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=BqVuE2zc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgGPn1hgJz308d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 14:52:28 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-652d76be8c2so5554131b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 21:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686631945; x=1689223945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml5iN5Ih7KXFZC0zWLHinqiJnzjfl3TSr9a9rQx6USE=;
        b=BqVuE2zcNC1LHORO+pD/uojpQoZYciwKyqnxsfR2lBAUmy5eQex7PNBSZGEcxjWLzN
         IQJPYw4xgX4Ksjx2Hj7Wl9InESRKfpS05PGAIB9pOQmgRmx6LW64XRV+VvbiyjJzvpYH
         twWXMLlFcPJI6nQ6Ga51Ag7ElRpsMlftIReIYSpZzWkEqDRaYJloeWsWJ3xguGlp6INE
         wKVAIQo+1Kes5Am0MlUHi6ziDnYKYcIAeKfkZHkmaFInTbRwcxkUGi9m/GlIpB92G5Xv
         R/JfRCb44GduLgXLEpE/cNzKantPc4akV94KM+/icVEfwsHuRNTNxz9+5vi4d2sLSjXi
         bcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686631945; x=1689223945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ml5iN5Ih7KXFZC0zWLHinqiJnzjfl3TSr9a9rQx6USE=;
        b=SH9dSV36Kg1tZnFoG5uHAc+noLyQRO7DfxetnN0Gf3mHeLEMFIhZ1YDcQZEttGIYSY
         s2cDVmZzhqIuMzbr9fYwud/PHCqe5OR7eBskTyXp0n5fUXt3K17ymGH6+FkRB4sWuq23
         PqTputscChb5mk/5Zi8tGhS1T0RBQ+8nYuPQQNlPA0JAnHJWpOc6WFeFInADZ8DscGC4
         nOUB7dGDNAuhwXTBcTXk6D579wc61j+1JOmwdiJkhN3NgzhalHChwXCmIvSZGl+U2a9D
         k8mUI2EjCx8D6zyPH3TY3S5e8kawZkf6d1EAxXEQozI6VJaZW8xoC7GLDPL1wLUUmJ/m
         6kPg==
X-Gm-Message-State: AC+VfDz3x5yGno0/pOpFxYuLqtieX825X5IEKnecU2FUQrCjfeLu3UgE
	yj9JrV2ZQGD4xOGhwv/nea0fBogvffw=
X-Google-Smtp-Source: ACHHUZ7irSfqfAlvaRsbzMJ/zRjupEzcrAgX1Hh+R8h5sVPmyDRhkpKCz6UkVzUZzKcirBrHX6uzKg==
X-Received: by 2002:a05:6a00:190d:b0:665:c51d:ad0f with SMTP id y13-20020a056a00190d00b00665c51dad0fmr1858880pfi.24.1686631945448;
        Mon, 12 Jun 2023 21:52:25 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id p10-20020a62ab0a000000b00625d84a0194sm7700916pff.107.2023.06.12.21.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:52:24 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/3] powernv/pci: Remove last IODA1 defines
Date: Tue, 13 Jun 2023 14:22:02 +0930
Message-Id: <20230613045202.294451-4-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613045202.294451-1-joel@jms.id.au>
References: <20230613045202.294451-1-joel@jms.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 5 +++--
 arch/powerpc/platforms/powernv/pci.h      | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c2af5a55a434..cb637827bc58 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -45,7 +45,8 @@
 #include "pci.h"
 #include "../../../../drivers/pci/pci.h"
 
-static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_OCAPI" };
+/* This array is indexed with enum pnv_phb_type */
+static const char * const pnv_phb_names[] = { "IODA2", "NPU_OCAPI" };
 
 static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
 static void pnv_pci_configure_bus(struct pci_bus *bus);
@@ -359,7 +360,7 @@ static void __init pnv_ioda_parse_m64_window(struct pnv_phb *phb)
 	const __be32 *r;
 	u64 pci_addr;
 
-	if (phb->type != PNV_PHB_IODA1 && phb->type != PNV_PHB_IODA2) {
+	if (phb->type != PNV_PHB_IODA2) {
 		pr_info("  Not support M64 window\n");
 		return;
 	}
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 3353db882e35..957f2b47a3c0 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -10,7 +10,6 @@
 struct pci_dn;
 
 enum pnv_phb_type {
-	PNV_PHB_IODA1,
 	PNV_PHB_IODA2,
 	PNV_PHB_NPU_OCAPI,
 };
-- 
2.39.2

