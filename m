Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456F30D0A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:10:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkB922FvzDwn7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P9X0tKzP; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVMSg63ddzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 22:06:27 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id cl8so767030pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 03:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMXxcBBy/xQXQTcochNJF8nT4LcHlfjkVSMPRZcRaCo=;
 b=P9X0tKzPVh3X8icAkA+hrs7C0DhgEL50Q07jTDYcmvewtx+OuFtIlQkHhp+Af4lqCo
 Z0/AtcMXsrVmsDoPDxUmtW9HeLGSfabpLVwOv/gjYwFHjM5Z5NB6nNyzBymirEmQsdVT
 Ra4urJDJ00vmsU2WWPnBiLbSUqnDt1Qj6Ii+V9/jKOaavs2rMuyXCLJT43EbLiXpY5Az
 CkPMSrv5YsS8k+Bfce7KxucoIq6pP9X3hRLRet9R4bD+IbPEmrh7nfpEUg7TpuhU3TAz
 8qsbQgqp5nnldr8ua8LJ4if+RjNtzRVcT1GRbzdvo9uSkqYpOT8mZXZ3Pc43Kc9jwQv6
 ElFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMXxcBBy/xQXQTcochNJF8nT4LcHlfjkVSMPRZcRaCo=;
 b=Q3Ex3+KBiBfT44pnhNdehwk4h9H5MXD23wn/qKsnJz2qfRCjwtpSr2Dn91J2EZKCVc
 XE/WjNO4KusCfwe6bPqT0HYCdL2ahidC7mpKgglZVVViCCCChOZgWIZvs8+qWI43UVt4
 6votlwd3PKHQUSxa7EIZjmKt60wqa8gVcH4SkNZ8G+Ivw5MR+h3ewc7X2hI75cEcHo6d
 8rhsMeVwf2JRPscHCA8+yb5Pz378tw4F1uH6qkxGupP7gVzC2OAxiaZwOmr7AFjJgX3Z
 bidRdtf1A2O3qIuIsxWh2mqAbRWDJWAbG/yVzTfxKUpN9IuM7KDWL61hJEClYe5SS0zG
 Vl2g==
X-Gm-Message-State: AOAM531PDmLaAbQjJa/YS+FuowdS10aRnanvi+ofA2DtbR+X/ndvRdHe
 oKBCYthYrAbHiAer9N3PBV0=
X-Google-Smtp-Source: ABdhPJw/k7SH87TT2sZ2Wk1zP4IJUTV/dg8VBxSGnAUMlbRhuSf540ulyZxyUqtyvfARihfiitoXyA==
X-Received: by 2002:a17:902:d510:b029:de:72a4:ebf1 with SMTP id
 b16-20020a170902d510b02900de72a4ebf1mr22189608plg.11.1612263985005; 
 Tue, 02 Feb 2021 03:06:25 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-242-11-44.static.tpgi.com.au.
 [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id g19sm3188979pfk.113.2021.02.02.03.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 03:06:24 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 10/14] mm/vmalloc: provide fallback arch huge vmap support
 functions
Date: Tue,  2 Feb 2021 21:05:11 +1000
Message-Id: <20210202110515.3575274-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202110515.3575274-1-npiggin@gmail.com>
References: <20210202110515.3575274-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an architecture doesn't support a particular page table level as
a huge vmap page size then allow it to skip defining the support
query function.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arm64/include/asm/vmalloc.h   |  7 +++----
 arch/powerpc/include/asm/vmalloc.h |  7 +++----
 arch/x86/include/asm/vmalloc.h     | 13 +++++--------
 include/linux/vmalloc.h            | 24 ++++++++++++++++++++----
 4 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index fc9a12d6cc1a..7a22aeea9bb5 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -4,11 +4,8 @@
 #include <asm/page.h>
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-static inline bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
 
+#define arch_vmap_pud_supported arch_vmap_pud_supported
 static inline bool arch_vmap_pud_supported(pgprot_t prot)
 {
 	/*
@@ -19,11 +16,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
 	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
 }
 
+#define arch_vmap_pmd_supported arch_vmap_pmd_supported
 static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 {
 	/* See arch_vmap_pud_supported() */
 	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
 }
+
 #endif
 
 #endif /* _ASM_ARM64_VMALLOC_H */
diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/asm/vmalloc.h
index 3f0c153befb0..4c69ece52a31 100644
--- a/arch/powerpc/include/asm/vmalloc.h
+++ b/arch/powerpc/include/asm/vmalloc.h
@@ -5,21 +5,20 @@
 #include <asm/page.h>
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-static inline bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
 
+#define arch_vmap_pud_supported arch_vmap_pud_supported
 static inline bool arch_vmap_pud_supported(pgprot_t prot)
 {
 	/* HPT does not cope with large pages in the vmalloc area */
 	return radix_enabled();
 }
 
+#define arch_vmap_pmd_supported arch_vmap_pmd_supported
 static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 {
 	return radix_enabled();
 }
+
 #endif
 
 #endif /* _ASM_POWERPC_VMALLOC_H */
diff --git a/arch/x86/include/asm/vmalloc.h b/arch/x86/include/asm/vmalloc.h
index e714b00fc0ca..49ce331f3ac6 100644
--- a/arch/x86/include/asm/vmalloc.h
+++ b/arch/x86/include/asm/vmalloc.h
@@ -6,24 +6,21 @@
 #include <asm/pgtable_areas.h>
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-static inline bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
 
+#ifdef CONFIG_X86_64
+#define arch_vmap_pud_supported arch_vmap_pud_supported
 static inline bool arch_vmap_pud_supported(pgprot_t prot)
 {
-#ifdef CONFIG_X86_64
 	return boot_cpu_has(X86_FEATURE_GBPAGES);
-#else
-	return false;
-#endif
 }
+#endif
 
+#define arch_vmap_pmd_supported arch_vmap_pmd_supported
 static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 {
 	return boot_cpu_has(X86_FEATURE_PSE);
 }
+
 #endif
 
 #endif /* _ASM_X86_VMALLOC_H */
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 00bd62bd701e..9f7b8b00101b 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -83,10 +83,26 @@ struct vmap_area {
 	};
 };
 
-#ifndef CONFIG_HAVE_ARCH_HUGE_VMAP
-static inline bool arch_vmap_p4d_supported(pgprot_t prot) { return false; }
-static inline bool arch_vmap_pud_supported(pgprot_t prot) { return false; }
-static inline bool arch_vmap_pmd_supported(pgprot_t prot) { return false; }
+/* archs that select HAVE_ARCH_HUGE_VMAP should override one or more of these */
+#ifndef arch_vmap_p4d_supported
+static inline bool arch_vmap_p4d_supported(pgprot_t prot)
+{
+	return false;
+}
+#endif
+
+#ifndef arch_vmap_pud_supported
+static inline bool arch_vmap_pud_supported(pgprot_t prot)
+{
+	return false;
+}
+#endif
+
+#ifndef arch_vmap_pmd_supported
+static inline bool arch_vmap_pmd_supported(pgprot_t prot)
+{
+	return false;
+}
 #endif
 
 /*
-- 
2.23.0

