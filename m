Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A21F34C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:22:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1m80dyLzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:22:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UDhG4zfg; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0JZ6dXGzDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:17:02 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o6so9871881pgh.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 23:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVmVfRv4SeF9KjNUms3Y/5XoNk5MENEiNrLyURzVlKg=;
 b=UDhG4zfgtG4nYn82dlLgu2ZwvkqewC9fdX235597oKOB2ywrkJobhpmLZU3GIiH72K
 4sV4zf8WrGzCGq/W+tWQDMsNTnDZAQBCPXVQ0xaalGwEWG4FFUNawn20A3FZtueg/TYt
 4/QM9vDTxQ6w5vOwFIPGD9GUl0X0nR45W0AqbpNh61cQAvEg9/5UPh+aDDxRixIBv64+
 Tx9UmZ7Dv/9ASZV3lK/tmkk30dWJyCL/eHQnw00n2fue/LM4BwVI39xHjIArhfX+FElr
 WRnnzkgFROFqGwW2lMXomaKQXrech2Tdog7yraS/cDHnPdbfli+aJDhqeHmUt6hcsqm/
 dUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVmVfRv4SeF9KjNUms3Y/5XoNk5MENEiNrLyURzVlKg=;
 b=ttw1wG9S5GS0bcRAO0s8vVL16wAA4NE70XSM+QdeVuG3zomI7y/at2vSMJ1+2rcXk2
 uBDy1l+Umifeg3HUJcrYVbCLBhtfzjhIxI6669c8xAmg9gHoM9eVWN0KbHamemqxpsPj
 xLDkvaRgOYe+tG3vlLbmDtC/FT3/Kedv7W0POAI3lOFvFX6UvOFrsYQTAYR727J/gX4d
 JuXdxYs+E/kB1wUGuQK13YfA9f3nN/rpcE0Kym6gRx4XCjm2E29AW1CQ54ps1WwXBskZ
 0IXqP4EJEAiYK+LdkA0EJK7r5ge5pG2FJFwi7gmt280kImazlfHW5PuKqK9UZPr9bbY4
 I0Yg==
X-Gm-Message-State: AOAM532/mNsV28u/wFUxpZYkcz+vG2+YZ9lfqgksI6hRcl7fJDYFFMwT
 GVL3nVpqqAXV53Wv4lyJvuXVnMt33jQ=
X-Google-Smtp-Source: ABdhPJzdTkbeR3wtAO6Q/iw8L/xGoRDXSCOjYQR0ZdXh+oy/99FQB8NaYCHMzNNyoHt5AojsGvdD/g==
X-Received: by 2002:a63:6b04:: with SMTP id g4mr22863096pgc.111.1591683419577; 
 Mon, 08 Jun 2020 23:16:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id k12sm7567981pgm.11.2020.06.08.23.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 23:16:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 7/7] powerpc/64s: advertise hardware link stack flush
Date: Tue,  9 Jun 2020 16:16:31 +1000
Message-Id: <20200609061631.844390-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200609061631.844390-1-npiggin@gmail.com>
References: <20200609061631.844390-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For testing only at the moment, firmware does not define these bits.
---
 arch/powerpc/include/asm/hvcall.h         | 1 +
 arch/powerpc/include/uapi/asm/kvm.h       | 1 +
 arch/powerpc/kvm/powerpc.c                | 9 +++++++--
 arch/powerpc/platforms/powernv/setup.c    | 3 +++
 arch/powerpc/platforms/pseries/setup.c    | 3 +++
 tools/arch/powerpc/include/uapi/asm/kvm.h | 1 +
 6 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e90c073e437e..a92a07c89b6f 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -373,6 +373,7 @@
 #define H_CPU_CHAR_THREAD_RECONFIG_CTRL	(1ull << 57) // IBM bit 6
 #define H_CPU_CHAR_COUNT_CACHE_DISABLED	(1ull << 56) // IBM bit 7
 #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST	(1ull << 54) // IBM bit 9
+#define H_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST	(1ull << 53) // IBM bit 10
 
 #define H_CPU_BEHAV_FAVOUR_SECURITY	(1ull << 63) // IBM bit 0
 #define H_CPU_BEHAV_L1D_FLUSH_PR	(1ull << 62) // IBM bit 1
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index 264e266a85bf..dd229d5f46ee 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -464,6 +464,7 @@ struct kvm_ppc_cpu_char {
 #define KVM_PPC_CPU_CHAR_MTTRIG_THR_RECONF	(1ULL << 57)
 #define KVM_PPC_CPU_CHAR_COUNT_CACHE_DIS	(1ULL << 56)
 #define KVM_PPC_CPU_CHAR_BCCTR_FLUSH_ASSIST	(1ull << 54)
+#define KVM_PPC_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST	(1ull << 53)
 
 #define KVM_PPC_CPU_BEHAV_FAVOUR_SECURITY	(1ULL << 63)
 #define KVM_PPC_CPU_BEHAV_L1D_FLUSH_PR		(1ULL << 62)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 27ccff612903..fa981ee09dec 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2221,7 +2221,8 @@ static int pseries_get_cpu_char(struct kvm_ppc_cpu_char *cp)
 			KVM_PPC_CPU_CHAR_BR_HINT_HONOURED |
 			KVM_PPC_CPU_CHAR_MTTRIG_THR_RECONF |
 			KVM_PPC_CPU_CHAR_COUNT_CACHE_DIS |
-			KVM_PPC_CPU_CHAR_BCCTR_FLUSH_ASSIST;
+			KVM_PPC_CPU_CHAR_BCCTR_FLUSH_ASSIST |
+			KVM_PPC_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST;
 		cp->behaviour_mask = KVM_PPC_CPU_BEHAV_FAVOUR_SECURITY |
 			KVM_PPC_CPU_BEHAV_L1D_FLUSH_PR |
 			KVM_PPC_CPU_BEHAV_BNDS_CHK_SPEC_BAR |
@@ -2287,13 +2288,17 @@ static int kvmppc_get_cpu_char(struct kvm_ppc_cpu_char *cp)
 		if (have_fw_feat(fw_features, "enabled",
 				 "fw-count-cache-flush-bcctr2,0,0"))
 			cp->character |= KVM_PPC_CPU_CHAR_BCCTR_FLUSH_ASSIST;
+		if (have_fw_feat(fw_features, "enabled",
+				 "fw-link-stack-flush-bcctr2,0,0"))
+			cp->character |= KVM_PPC_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST;
 		cp->character_mask = KVM_PPC_CPU_CHAR_SPEC_BAR_ORI31 |
 			KVM_PPC_CPU_CHAR_BCCTRL_SERIALISED |
 			KVM_PPC_CPU_CHAR_L1D_FLUSH_ORI30 |
 			KVM_PPC_CPU_CHAR_L1D_FLUSH_TRIG2 |
 			KVM_PPC_CPU_CHAR_L1D_THREAD_PRIV |
 			KVM_PPC_CPU_CHAR_COUNT_CACHE_DIS |
-			KVM_PPC_CPU_CHAR_BCCTR_FLUSH_ASSIST;
+			KVM_PPC_CPU_CHAR_BCCTR_FLUSH_ASSIST |
+			KVM_PPC_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST;
 
 		if (have_fw_feat(fw_features, "enabled",
 				 "speculation-policy-favor-security"))
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 3bc188da82ba..1a06d3b4c0a9 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -78,6 +78,9 @@ static void init_fw_feat_flags(struct device_node *np)
 	if (fw_feature_is("enabled", "fw-count-cache-flush-bcctr2,0,0", np))
 		security_ftr_set(SEC_FTR_BCCTR_FLUSH_ASSIST);
 
+	if (fw_feature_is("enabled", "fw-link-stack-flush-bcctr2,0,0", np))
+		security_ftr_set(SEC_FTR_BCCTR_LINK_FLUSH_ASSIST);
+
 	if (fw_feature_is("enabled", "needs-count-cache-flush-on-context-switch", np))
 		security_ftr_set(SEC_FTR_FLUSH_COUNT_CACHE);
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 64d18f4bf093..70c9264f23c5 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -517,6 +517,9 @@ static void init_cpu_char_feature_flags(struct h_cpu_char_result *result)
 	if (result->character & H_CPU_CHAR_BCCTR_FLUSH_ASSIST)
 		security_ftr_set(SEC_FTR_BCCTR_FLUSH_ASSIST);
 
+	if (result->character & H_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST)
+		security_ftr_set(SEC_FTR_BCCTR_LINK_FLUSH_ASSIST);
+
 	if (result->behaviour & H_CPU_BEHAV_FLUSH_COUNT_CACHE)
 		security_ftr_set(SEC_FTR_FLUSH_COUNT_CACHE);
 
diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/powerpc/include/uapi/asm/kvm.h
index 264e266a85bf..dd229d5f46ee 100644
--- a/tools/arch/powerpc/include/uapi/asm/kvm.h
+++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
@@ -464,6 +464,7 @@ struct kvm_ppc_cpu_char {
 #define KVM_PPC_CPU_CHAR_MTTRIG_THR_RECONF	(1ULL << 57)
 #define KVM_PPC_CPU_CHAR_COUNT_CACHE_DIS	(1ULL << 56)
 #define KVM_PPC_CPU_CHAR_BCCTR_FLUSH_ASSIST	(1ull << 54)
+#define KVM_PPC_CPU_CHAR_BCCTR_LINK_FLUSH_ASSIST	(1ull << 53)
 
 #define KVM_PPC_CPU_BEHAV_FAVOUR_SECURITY	(1ULL << 63)
 #define KVM_PPC_CPU_BEHAV_L1D_FLUSH_PR		(1ULL << 62)
-- 
2.23.0

