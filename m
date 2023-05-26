Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEC171308F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 01:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QShPg13xmz3fHt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 09:45:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lFfC+K1p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3berxzaykdomdzemftlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lFfC+K1p;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QShNd0KyQz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 09:44:47 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5651d8acfe2so30773967b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 16:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144684; x=1687736684;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5mqYLgSgL41U5MVABcpsNGg2VTYVhdnWBmYAGgA32M=;
        b=lFfC+K1prBwz+QWauf5t3Z5nGOG+XH3WsUV6BbAJbu8yEh9dwSmQ7iKcNTjxofo1xQ
         drv4Lmvn48X7bRRKv2GPWasyFIShdI23SCQ+h/TYUmoXc/hOnlnscK719N8Jpf3m7n6U
         mEaD6Epy7t6qJzvv/9f9Jp/JqQmnMe81faOyaQAqHTEXDufnGK7wY+Ey5ZFKaBi7dzJd
         6O8PEoHW6NsTzElKeYmJHsoCaRTvtaP/AkDf6+cRfXVKyOf9lMpoYxPIHrUwcDj+nl2+
         7q+JpYkRKelWoBaQmJuf7/axxLP6kaz1KnqZQAEmA4XWZSzVgynpinko26WGtZXkTjpp
         oXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144684; x=1687736684;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5mqYLgSgL41U5MVABcpsNGg2VTYVhdnWBmYAGgA32M=;
        b=fkmfNh9ZdfZBHOBHAfDEfAciVo01PmvztjsoeBF5iJ2O0A306y0JKfZrjUwY2wpCTx
         7YkcMDDziPnUIuV5P+Fs5PEVwjsKr4mZ5cu/dzWuT5qBQl+oJsqCqFeNa/w7YGgZ+wNP
         Hgm9f5JhBv8ZH+1gzGjt27YRZmRPFPSYRcp57z6Wt5Ijkib/Hki+H5btnmeHBXRl/CPV
         2jX6z1/UDCdJzVNZbulPCO8w6oCQh938SzbOqy+/tOCoF7VjlWscWVIiejuoXT2U8oCy
         Dd+eitLDdv9QhiOKMBfUsudVjiZfcUHvyDmNtwcj0iMiWSJhpY6Jr4uRgPNRoNsQOzvq
         9lPQ==
X-Gm-Message-State: AC+VfDw3tGZ/mYKC0kMaHTuAsbvGjd96XPG6CBmV9UZWHxX/FDrQzevU
	xUMHqLxKTmvYSX0TNZ9bcZc3HJSXEik=
X-Google-Smtp-Source: ACHHUZ5aYhy2MBmaWD1q0FxpVfKGE+Nrskt2Z7iv2nNf760O+qZ11RhzmW2rToUdRrv6PXs76j2V3Kvga7o=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a81:4421:0:b0:565:9f59:664f with SMTP id
 r33-20020a814421000000b005659f59664fmr2006806ywa.6.1685144684605; Fri, 26 May
 2023 16:44:44 -0700 (PDT)
Date: Fri, 26 May 2023 17:44:28 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230526234435.662652-4-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 03/10] kvm/arm64: export stage2_try_set_pte()
 and macros
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-ke
 rnel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

stage2_try_set_pte() and KVM_PTE_LEAF_ATTR_LO_S2_AF are needed to
implement kvm_arch_test_clear_young().

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 53 ++++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 53 ----------------------------
 2 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index dc3c072e862f..ff520598b62c 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -44,6 +44,49 @@ typedef u64 kvm_pte_t;
 
 #define KVM_PHYS_INVALID		(-1ULL)
 
+#define KVM_PTE_TYPE			BIT(1)
+#define KVM_PTE_TYPE_BLOCK		0
+#define KVM_PTE_TYPE_PAGE		1
+#define KVM_PTE_TYPE_TABLE		1
+
+#define KVM_PTE_LEAF_ATTR_LO		GENMASK(11, 2)
+
+#define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX	GENMASK(4, 2)
+#define KVM_PTE_LEAF_ATTR_LO_S1_AP	GENMASK(7, 6)
+#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RO	3
+#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RW	1
+#define KVM_PTE_LEAF_ATTR_LO_S1_SH	GENMASK(9, 8)
+#define KVM_PTE_LEAF_ATTR_LO_S1_SH_IS	3
+#define KVM_PTE_LEAF_ATTR_LO_S1_AF	BIT(10)
+
+#define KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR	GENMASK(5, 2)
+#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R	BIT(6)
+#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W	BIT(7)
+#define KVM_PTE_LEAF_ATTR_LO_S2_SH	GENMASK(9, 8)
+#define KVM_PTE_LEAF_ATTR_LO_S2_SH_IS	3
+#define KVM_PTE_LEAF_ATTR_LO_S2_AF	BIT(10)
+
+#define KVM_PTE_LEAF_ATTR_HI		GENMASK(63, 51)
+
+#define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
+
+#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
+
+#define KVM_PTE_LEAF_ATTR_HI_S2_XN	BIT(54)
+
+#define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
+					 KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | \
+					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
+
+#define KVM_INVALID_PTE_OWNER_MASK	GENMASK(9, 2)
+#define KVM_MAX_OWNER_ID		1
+
+/*
+ * Used to indicate a pte for which a 'break-before-make' sequence is in
+ * progress.
+ */
+#define KVM_INVALID_PTE_LOCKED		BIT(10)
+
 static inline bool kvm_pte_valid(kvm_pte_t pte)
 {
 	return pte & KVM_PTE_VALID;
@@ -224,6 +267,16 @@ static inline bool kvm_pgtable_walk_shared(const struct kvm_pgtable_visit_ctx *c
 	return ctx->flags & KVM_PGTABLE_WALK_SHARED;
 }
 
+static inline bool stage2_try_set_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t new)
+{
+	if (!kvm_pgtable_walk_shared(ctx)) {
+		WRITE_ONCE(*ctx->ptep, new);
+		return true;
+	}
+
+	return cmpxchg(ctx->ptep, ctx->old, new) == ctx->old;
+}
+
 /**
  * struct kvm_pgtable_walker - Hook into a page-table walk.
  * @cb:		Callback function to invoke during the walk.
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 5282cb9ca4cf..24678ccba76a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -12,49 +12,6 @@
 #include <asm/stage2_pgtable.h>
 
 
-#define KVM_PTE_TYPE			BIT(1)
-#define KVM_PTE_TYPE_BLOCK		0
-#define KVM_PTE_TYPE_PAGE		1
-#define KVM_PTE_TYPE_TABLE		1
-
-#define KVM_PTE_LEAF_ATTR_LO		GENMASK(11, 2)
-
-#define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX	GENMASK(4, 2)
-#define KVM_PTE_LEAF_ATTR_LO_S1_AP	GENMASK(7, 6)
-#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RO	3
-#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RW	1
-#define KVM_PTE_LEAF_ATTR_LO_S1_SH	GENMASK(9, 8)
-#define KVM_PTE_LEAF_ATTR_LO_S1_SH_IS	3
-#define KVM_PTE_LEAF_ATTR_LO_S1_AF	BIT(10)
-
-#define KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR	GENMASK(5, 2)
-#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R	BIT(6)
-#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W	BIT(7)
-#define KVM_PTE_LEAF_ATTR_LO_S2_SH	GENMASK(9, 8)
-#define KVM_PTE_LEAF_ATTR_LO_S2_SH_IS	3
-#define KVM_PTE_LEAF_ATTR_LO_S2_AF	BIT(10)
-
-#define KVM_PTE_LEAF_ATTR_HI		GENMASK(63, 51)
-
-#define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
-
-#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
-
-#define KVM_PTE_LEAF_ATTR_HI_S2_XN	BIT(54)
-
-#define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
-					 KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | \
-					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
-
-#define KVM_INVALID_PTE_OWNER_MASK	GENMASK(9, 2)
-#define KVM_MAX_OWNER_ID		1
-
-/*
- * Used to indicate a pte for which a 'break-before-make' sequence is in
- * progress.
- */
-#define KVM_INVALID_PTE_LOCKED		BIT(10)
-
 struct kvm_pgtable_walk_data {
 	struct kvm_pgtable_walker	*walker;
 
@@ -702,16 +659,6 @@ static bool stage2_pte_is_locked(kvm_pte_t pte)
 	return !kvm_pte_valid(pte) && (pte & KVM_INVALID_PTE_LOCKED);
 }
 
-static bool stage2_try_set_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t new)
-{
-	if (!kvm_pgtable_walk_shared(ctx)) {
-		WRITE_ONCE(*ctx->ptep, new);
-		return true;
-	}
-
-	return cmpxchg(ctx->ptep, ctx->old, new) == ctx->old;
-}
-
 /**
  * stage2_try_break_pte() - Invalidates a pte according to the
  *			    'break-before-make' requirements of the
-- 
2.41.0.rc0.172.g3f132b7071-goog

