Return-Path: <linuxppc-dev+bounces-2390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA0E9A44B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWvm4Tt2z3brv;
	Sat, 19 Oct 2024 04:31:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272676;
	cv=none; b=K+wnVmVtPc+CtwtaocWuStfV5lqebq3yITecVrxa/MNqxcos5dXQ00rjJ/UxskjtjwT7IDaEI8xSLZZRiSMgFyejgmZQC+BsMvXD85jLj4P9GU8N7mV4ripcvSVcW8h0iMBg293y+5SC+Xhq3lEEswOEb6o96p7l7M2Qdqte764hOdrZgvfnZGnoiIJQfx36Fu89M4Bw6zYLActnP2rqHtL+ky9yynQai+nNXhh6XH+KCR16FEvJmQDNtusvSuZGI2dBTyDTtKFG0cOJE248H8EU/fbqjx+BLap9mjvmbxIXb0bzr0N1P3haDT8NmI/GJ8EbyfCZOvxez8FGYAZkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272676; c=relaxed/relaxed;
	bh=maqsHecWoRrqy0atrv0EioRwOZB99TyG0W2HP4lfnAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Roe72A0SSDDtrXr31huO3SdZzQReixRMBhVU4RTcmGwnJBcNDx0lwlVV102bJUfo5E98GiPf8TNtWxcof3S/nrCMBnAM2KtxHfOb3GGW2UAjQQ+Rg4XBimyMog5vLJGo0KPaA+GsjUR8A4PGrO82crEOXjpZLxZBe2403Qn795DPcmRWp5FLo0baDj+R0+Sz27rjf/HLoW1CASyL4HoJuVI5xxNc9BiGwzpZpmihlFxif9CBnWuJU3rtZxgCUKSpsfXRAx+wbuISYU3yCJT3mooUvs33DL+bMKHqAbw4+N/cUWzbbdDvJ3GyIzGTurZPq01tTntpUIKa/jw/EIVqtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V1hd6B9+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V1hd6B9+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWvl4nx7z3btj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:31:15 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso2024672a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272672; x=1729877472; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maqsHecWoRrqy0atrv0EioRwOZB99TyG0W2HP4lfnAU=;
        b=V1hd6B9+Ko9qos9wBZtVsfqpBn5QFkbzPBlzwE6PlGxU4CbudksD2W3IzBuVE1QYVV
         BhxXa0qxhaAIuEplgcgobjCs/jeiGeUDAOWYin+cXbbmDVwZ85SbZxTsAH3xE5BPAMxU
         4WgdoGpbqmh/ujiMlh0roxykiH7Lv0A41KbsU2gA6lxRco2mW9OUITrmPO5uqeN47jfI
         niuZuSZgDvJT69Ri1LYR0teQ9ebx+7KG1+Xa/dKhqraW7dLTsoiF72yng/D+v/ePb5Ny
         yKWkq3Ssa4A5pNfo0lpGBDNc34b9o3NtYjUTqn4DOoc9iUzr5Y3BY80XNzu+pCi4exfo
         Qabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272672; x=1729877472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maqsHecWoRrqy0atrv0EioRwOZB99TyG0W2HP4lfnAU=;
        b=P3DgvdeOs2dLcaXrmwM+DKlKtvTjz64IquoUTFGOGjmEGAq09b5ISvhg6dB3IamWxv
         f2p99JKUKf1M/PD7kioVu8ohKUU4rjSusj1D8FyEZn3phwgyZuK4ou9P8sOc9wxUCOLn
         PfnFri5b5G1bBbcLNsCKtYAiIDzFkR6+gX1FmPRtea4L8z/9fD1h8FL76KM7WcGVI3gL
         C/27pT6gCVg9P7QXSmVzBie8goXbwC36U390gIhIguSTDL3VVx7+a7rumMxM8NGK21zT
         ka7XwVXx2FKeAbXUlhxRy9o8/E5LRc3d5dyg5MiT7I62x5EwHP6S0ydm86XcayIewQo7
         rAdw==
X-Gm-Message-State: AOJu0Yza3XEnBUTI/idMHsFgcW0UGh3HMtdDlEXl225wOOJrQMj7s3OQ
	aWFA3MhugVv7cgU2nk5dax1oZjgfec2xl54A6XfxBCTuawl+Sc8yvtxgmrYJ
X-Google-Smtp-Source: AGHT+IGCcfcvV3hhkWCRVZ4L4+07qgofxPBOFcgBhHnT233XbATfjI7cFHkLMcuk8gJsatcgaCUiZQ==
X-Received: by 2002:a05:6a20:43a0:b0:1d9:a90:8879 with SMTP id adf61e73a8af0-1d92c502994mr4770966637.21.1729272672394;
        Fri, 18 Oct 2024 10:31:12 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:31:11 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 10/12] book3s64/radix: Refactoring common kfence related functions
Date: Fri, 18 Oct 2024 22:59:51 +0530
Message-ID: <f4a787224fbe5bb787158ace579780c0257f6602.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Both radix and hash on book3s requires to detect if kfence
early init is enabled or not. Hash needs to disable kfence
if early init is not enabled because with kfence the linear map is
mapped using PAGE_SIZE rather than 16M mapping.
We don't support multiple page sizes for slb entry used for kernel
linear map in book3s64.

This patch refactors out the common functions required to detect kfence
early init is enabled or not.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/kfence.h        |  8 ++++++--
 arch/powerpc/mm/book3s64/pgtable.c       | 13 +++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 12 ------------
 arch/powerpc/mm/init-common.c            |  1 +
 4 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index fab124ada1c7..1f7cab58ab2c 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -15,7 +15,7 @@
 #define ARCH_FUNC_PREFIX "."
 #endif
 
-#ifdef CONFIG_KFENCE
+extern bool kfence_early_init;
 extern bool kfence_disabled;
 
 static inline void disable_kfence(void)
@@ -27,7 +27,11 @@ static inline bool arch_kfence_init_pool(void)
 {
 	return !kfence_disabled;
 }
-#endif
+
+static inline bool kfence_early_init_enabled(void)
+{
+	return IS_ENABLED(CONFIG_KFENCE) && kfence_early_init;
+}
 
 #ifdef CONFIG_PPC64
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index f4d8d3c40e5c..1563a8c28feb 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -37,6 +37,19 @@ EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
 EXPORT_SYMBOL(__pmd_frag_size_shift);
 
+#ifdef CONFIG_KFENCE
+extern bool kfence_early_init;
+static int __init parse_kfence_early_init(char *arg)
+{
+	int val;
+
+	if (get_option(&arg, &val))
+		kfence_early_init = !!val;
+	return 0;
+}
+early_param("kfence.sample_interval", parse_kfence_early_init);
+#endif
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
  * This is called when relaxing access to a hugepage. It's also called in the page
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b0d927009af8..311e2112d782 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -363,18 +363,6 @@ static int __meminit create_physical_mapping(unsigned long start,
 }
 
 #ifdef CONFIG_KFENCE
-static bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
-
-static int __init parse_kfence_early_init(char *arg)
-{
-	int val;
-
-	if (get_option(&arg, &val))
-		kfence_early_init = !!val;
-	return 0;
-}
-early_param("kfence.sample_interval", parse_kfence_early_init);
-
 static inline phys_addr_t alloc_kfence_pool(void)
 {
 	phys_addr_t kfence_pool;
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 2978fcbe307e..745097554bea 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -33,6 +33,7 @@ bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 #ifdef CONFIG_KFENCE
 bool __ro_after_init kfence_disabled;
+bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
 #endif
 
 static int __init parse_nosmep(char *p)
-- 
2.46.0


