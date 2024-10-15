Return-Path: <linuxppc-dev+bounces-2256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2499DBAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGqS3jKKz3c4f;
	Tue, 15 Oct 2024 12:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956084;
	cv=none; b=DjnOPstVzs2m3df8FZAfbejU/LmWCvdK8yAoXXsv5tpkPU+Hv9XTVkpwkmECthSURyE6adIGQTudq5DYfqy2Y2AqLegwAyOjXDP8dYfBrnHajqbx9m7z7r+o/5k0DiZPUqnK0V/jijf8QiE1hIfYm0JaJRfL2nQ3eAC2m1iHChei+inetQJkCmhhOa0JV4m85As+gHiEXhtVzeq1fl+gl9rCLen1dx0ier3hdLZDEmh5bk0h3u6Ut6QjHR6SdLpdAF0QE5u65LTOD/OEiz8ypP6srLUqeyCj9rUcnDEMcAwPBY0BiU/giXRBup8wlG0AbUoYtpKjJ0i3mX4L1IiMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956084; c=relaxed/relaxed;
	bh=vbK+DyWhNFTOskVhv1fyi/tJ2PP4Ej6g6TRuPbyIjZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fY/HhKsuOsrAWFCMaWABwn6YPo5nxQ3cTvQamIA9+pcvkK4fkCBYA8WYwuqEV4NfQY9jkZgU5SxM9v6fDumPvZAf5CzPjyF57txtUVvNdO7Rp/DEx6mD2ymtSI62j/bXgYW2dL2ZbST8nCUTkKcoBflAqXHUZTAFpCNOlba/EOMQd3hgRFWax8XqEWR7n7L7uvHKlGVPJDBibP7/7qmTfgi2KBnMQU4bBKdhYZ8oneDaXcVabL7S8H+ifaFXyoLCipxrQXTPDJ8n44/0gGFFWxOm2mZ9P+xyLe54aG7TlYbk7sJugYsl0rHl/Eurg8X6sh7sSN7i5dH31vIWipZVWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lZxKuBCQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lZxKuBCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGqR58vQz3bps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:43 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso1503248b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956080; x=1729560880; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbK+DyWhNFTOskVhv1fyi/tJ2PP4Ej6g6TRuPbyIjZc=;
        b=lZxKuBCQPTVOt9TS0tsFB7t+dmNrmrGteA2fadntdxYTAp8VhkwsWLaydrqEC7CwUw
         aKSgGXx+lSyzjuulamZNPCaRLcR/O5CYBicrK0LTeLxjcxXRazwmwizFwmtUw59xTY1E
         80YB9FD8qmacNlX0MW8OUe9hG7hiZKvUZ4RkUINopUdR7qZFVNzZMPYxRUynjMnSw1eq
         h62FWkxkcq9gHFTZKOez6WMCkTOFW3/jCbe1DA6UsYbpsn28sXhuNSKx98+LmNo2+Hka
         jpb3rkAPJyko1yJjrYohAUwn33ZiYAV9wiKJMr327ahPmWhNkCa+micq5qwV3uH3tIyK
         VIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956080; x=1729560880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbK+DyWhNFTOskVhv1fyi/tJ2PP4Ej6g6TRuPbyIjZc=;
        b=ihID027sxsSDp8HBo6oDsIycv/XBR+5vWD4GGq9j483ZhsYabnqoRziVb8dKFsSrui
         DMhiN600tGIJshK5ELS4o/7AizRghctu3oV/qQVxd6CvACHrBGMcRFBiXOyCJP260uW+
         iztorVQtzG7sMdigLOyeekSQQVWZl8smHwPR5nXriFT1ki7RF43sOymU+8NWEZ+3VG+H
         vNZ1XDL/inZtE4e5zXp98cQyz9JyGriWPnLJ2beCULyobik3LwYY2G5FX8m+EpamQFRZ
         Z3BWnGZRJA/3YY6kDU7EOzU09P8cSA/U7fOeyPIX3wbQIJCSiib3LiDQI3FhlmgKII6+
         dy2Q==
X-Gm-Message-State: AOJu0YyEBBIAbO2tHXvbXCRIB1oAggIUMPqwLPK+ifOmFZb2bC6co/iR
	4GEuIkmzaHDLzihv+8WRaTkWGqmyYMUMy7nsAP2CS6HFeUMFQPwuV4rE+A==
X-Google-Smtp-Source: AGHT+IHF1r2QtlGKVN6HtXXxcFg+k0gYJd/nSgLWyKs83ZTBLQXCdo//6FQThWun5q5jEjrAv0//bA==
X-Received: by 2002:a05:6a00:189d:b0:71e:768b:700a with SMTP id d2e1a72fcca58-71e768b7107mr1328450b3a.23.1728956080395;
        Mon, 14 Oct 2024 18:34:40 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:39 -0700 (PDT)
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
Subject: [RFC RESEND v2 11/13] book3s64/radix: Refactoring common kfence related functions
Date: Tue, 15 Oct 2024 07:03:34 +0530
Message-ID: <a0ebddc6250441d7750c9f94f7d1fc64db406b20.1728954719.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728954719.git.ritesh.list@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
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
index 5a4a75369043..374542528080 100644
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


