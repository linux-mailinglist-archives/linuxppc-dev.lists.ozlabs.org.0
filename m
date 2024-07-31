Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 403709428A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 10:03:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JLg++IN8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYl391LlJz3dSZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 18:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JLg++IN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYkww33RQz3d9G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 17:58:08 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7a103ac7be3so3296878a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 00:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722412685; x=1723017485; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohBW4WWXljfsS+w6lK1TGfOL2L5ph++1vfcBaUGToUM=;
        b=JLg++IN8GFQD6Dj4cGLuPU7F5Ul4b3zLU/EbbK3g3ezaWMf2FT9PQbbn/g01CkrmR6
         CaWvlHSCVhxtUsrbgs7hhG2utTfG+sHeAtP0wIKH2226h4jaEONxi03XJh7cwR5C+4u/
         pwy/uZQBNyIWYcM5SAdYnwQycY1RJRSIw88HQDYTGXTfnN0M2JmZj+BL00F9O9EIaus4
         GbNpuvrBfaPMw1/ilnm1lhsvAbAq1LWyFcDajlwY8P5PQEHUKxdgaN7NHt8bm9EXV31b
         bUAyiKmLOCcxEfeXRY5noSNd5H9QmCYK1a2EqBNtUtntHp69S4OXkH7rKtzUd8/MS0iM
         4sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412685; x=1723017485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohBW4WWXljfsS+w6lK1TGfOL2L5ph++1vfcBaUGToUM=;
        b=DspiaV+JSoPW0tJO6fEkF6QshIPHzBLSAj/l73LoiQ48og+nqthK1moYe2XrAduhKz
         /Az4idnNz52uAR+fCe/GFC9mrv62lY/k1p4W/0+YcSP23c1VRlgPjhCL908tBoLjEzTb
         MowaJf+jWNMgF2lStoKny2vFNuZcwow25x6IfcEBDEbjYrvALzTi/5rHkoy19G5XdVsO
         jbIXq53EAwVEfsCcTFC5K3GloJYX8NwPG8WunIV5t9Xnpz+ns1dwTK7ZFv0LJu3yddTS
         l1FWbuFzXkWhjB8cqHiKzhFKWZjB3sYEoPuqrJB1ejXQ7JYtem03k6WOWqWy3D8JvcP8
         5dzA==
X-Gm-Message-State: AOJu0Yz7H/NekPbnajSm/QxYOcpap0nLzjo0t+E0zh2o+w2N9NYumTT/
	Vm8Ee/a+XFeThljBVPuFwjsMbCpQVQEkkcX/k20CO2T3OfcCibMGkS0Y/A==
X-Google-Smtp-Source: AGHT+IFB3hPBsysOmUsQsmP0ufXzP62nw33VuDXJmxWMYGx+DaG2r9KImMZcQNojLZt4Ylq3/lNHSw==
X-Received: by 2002:a05:6a21:6da0:b0:1c2:8ece:97ae with SMTP id adf61e73a8af0-1c4a13afd52mr11270732637.34.1722412685200;
        Wed, 31 Jul 2024 00:58:05 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.83.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e16fbsm9788372b3a.19.2024.07.31.00.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:58:04 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC v1 09/10] book3s64/radix: Refactoring common kfence related functions
Date: Wed, 31 Jul 2024 13:26:13 +0530
Message-ID: <292790d676ed9e31507a0ba4b11800cbc6670e44.1722408881.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722408881.git.ritesh.list@gmail.com>
References: <cover.1722408881.git.ritesh.list@gmail.com>
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
Cc: Donet Tom <donettom@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
 arch/powerpc/include/asm/kfence.h        |  2 ++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 12 ------------
 arch/powerpc/mm/init-common.c            | 12 ++++++++++++
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index fab124ada1c7..5975688d8de1 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -15,6 +15,8 @@
 #define ARCH_FUNC_PREFIX "."
 #endif
 
+extern bool kfence_early_init;
+
 #ifdef CONFIG_KFENCE
 extern bool kfence_disabled;
 
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
index 21131b96d209..259821a4db62 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -33,6 +33,18 @@ bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 #ifdef CONFIG_KFENCE
 bool __ro_after_init kfence_disabled;
+bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
+static int __init parse_kfence_early_init(char *arg)
+{
+	int val;
+
+	if (get_option(&arg, &val))
+		kfence_early_init = !!val;
+	return 0;
+}
+early_param("kfence.sample_interval", parse_kfence_early_init);
+#else
+bool __ro_after_init kfence_early_init;
 #endif
 
 static int __init parse_nosmep(char *p)
-- 
2.45.2

