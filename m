Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92C2B9E4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 00:29:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcbVs5QdjzDqy9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=FTAkJF3U; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb8v5h3HzDqsx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 10:14:07 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id q34so5612513pgb.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 15:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C546F2PpvvSgESbIpjrWt6dZdBvsKpfLDqCzpmDjK6g=;
 b=FTAkJF3U+x6XrgvXuLZ1vZ3hgyn+wZOS4lkpyPRBt7JNuTbiex1Q1MLDd3nXAFAfCb
 gYkxRJupt/tfBaPAO9EtQ0ihuU1ELzSJynjjs5V2UwikZRYUniU/W5GE/fbw9M3U7ZYk
 vK5DSivohwp+cxKtR90ezI3rS5eIHD2Glt/DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C546F2PpvvSgESbIpjrWt6dZdBvsKpfLDqCzpmDjK6g=;
 b=GokGYRIOI4Xt02aYj0pXjTtdVRXausBk1cLvEvZRsX/vu9b4PGAyOcYM2TJmFuRlln
 Y0QcfiAnmWXScZG8vnhksQPjw0lIGHXkjuprv32KxyBib4pKZYx9dd062l7OPM9FNJk4
 SXlN7winqOdl5Ri+8H65Lo7d8vlYYL5HBv/7d+bqIXPFwKwZrf+OqXCmUbveYBZBH1A2
 2fcUUcJpNeF5rEQ1zKgDhxgpYDSBZCUhz4jXm+y/anlQppOVxeDKLPWkNxIQENuhN2VX
 TV2+kh1Sx/MHhL8pVBtg2xng6yqexmoh/85BkofilKyMXoo2hMqvebW9RlRze9dzMPvq
 +g6Q==
X-Gm-Message-State: AOAM531bT05ili/aKs43emuZrCrj6QeBHqQWXZ9pyU1pvclJJkkzrtO8
 iXCH9YBSUjvhRUnoAovupp297uhOx4D0lA==
X-Google-Smtp-Source: ABdhPJy5fQ0Iu/AL3ZOz/rLNEmmeHLEh7Vx+CjrF/Wvj1IMF17u5amic54Oq1WqE41bkfbLBrip5YQ==
X-Received: by 2002:a17:90b:a14:: with SMTP id
 gg20mr6911461pjb.46.1605827645458; 
 Thu, 19 Nov 2020 15:14:05 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-4d44-522c-3789-8f33.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4d44:522c:3789:8f33])
 by smtp.gmail.com with ESMTPSA id o89sm902408pjo.47.2020.11.19.15.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 15:14:04 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/7] powerpc/64s: rename pnv|pseries_setup_rfi_flush to
 _setup_security_mitigations
Date: Fri, 20 Nov 2020 10:13:33 +1100
Message-Id: <20201119231333.361771-8-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119231333.361771-1-dja@axtens.net>
References: <20201119231333.361771-1-dja@axtens.net>
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
Cc: dja@axtens.net, cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pseries|pnv_setup_rfi_flush already does the count cache flush setup, and
we just added entry and uaccess flushes. So the name is not very accurate
any more. In both platforms we then also immediately setup the STF flush.

Rename them to _setup_security_mitigations and fold the STF flush in.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/platforms/powernv/setup.c    | 7 ++++---
 arch/powerpc/platforms/pseries/mobility.c | 4 ++--
 arch/powerpc/platforms/pseries/pseries.h  | 2 +-
 arch/powerpc/platforms/pseries/setup.c    | 7 ++++---
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 087ec92acfc4..46115231a3b2 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -98,7 +98,7 @@ static void init_fw_feat_flags(struct device_node *np)
 		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
 }
 
-static void pnv_setup_rfi_flush(void)
+static void pnv_setup_security_mitigations(void)
 {
 	struct device_node *np, *fw_features;
 	enum l1d_flush_type type;
@@ -145,6 +145,8 @@ static void pnv_setup_rfi_flush(void)
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
 		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_UACCESS);
 	setup_uaccess_flush(enable);
+
+	setup_stf_barrier();
 }
 
 static void __init pnv_check_guarded_cores(void)
@@ -173,8 +175,7 @@ static void __init pnv_setup_arch(void)
 {
 	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
 
-	pnv_setup_rfi_flush();
-	setup_stf_barrier();
+	pnv_setup_security_mitigations();
 
 	/* Initialize SMP */
 	pnv_smp_init();
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index d6f4162478a5..2f73cb5bf12d 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -349,8 +349,8 @@ void post_mobility_fixup(void)
 
 	cpus_read_unlock();
 
-	/* Possibly switch to a new RFI flush type */
-	pseries_setup_rfi_flush();
+	/* Possibly switch to a new L1 flush type */
+	pseries_setup_security_mitigations();
 
 	/* Reinitialise system information for hv-24x7 */
 	read_24x7_sys_info();
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 13fa370a87e4..593840847cd3 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -111,7 +111,7 @@ static inline unsigned long cmo_get_page_size(void)
 
 int dlpar_workqueue_init(void);
 
-void pseries_setup_rfi_flush(void);
+void pseries_setup_security_mitigations(void);
 void pseries_lpar_read_hblkrm_characteristics(void);
 
 #endif /* _PSERIES_PSERIES_H */
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 3617cdb079f6..090c13f6c881 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -542,7 +542,7 @@ static void init_cpu_char_feature_flags(struct h_cpu_char_result *result)
 		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
 }
 
-void pseries_setup_rfi_flush(void)
+void pseries_setup_security_mitigations(void)
 {
 	struct h_cpu_char_result result;
 	enum l1d_flush_type types;
@@ -587,6 +587,8 @@ void pseries_setup_rfi_flush(void)
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
 		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_UACCESS);
 	setup_uaccess_flush(enable);
+
+	setup_stf_barrier();
 }
 
 #ifdef CONFIG_PCI_IOV
@@ -776,8 +778,7 @@ static void __init pSeries_setup_arch(void)
 
 	fwnmi_init();
 
-	pseries_setup_rfi_flush();
-	setup_stf_barrier();
+	pseries_setup_security_mitigations();
 	pseries_lpar_read_hblkrm_characteristics();
 
 	/* By default, only probe PCI (can be overridden by rtas_pci) */
-- 
2.25.1

