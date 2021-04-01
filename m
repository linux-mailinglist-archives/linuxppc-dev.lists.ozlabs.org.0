Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5533515E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:10:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB67F15YMz3fFh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:10:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kiujaPta;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kiujaPta; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB60S3h9Lz3c90
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:24 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso1165721pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zOAiamWMgrw1baxcdY0dJUnntq33efqmQWLjD5VB7U8=;
 b=kiujaPtad+vbuFz+4WCu8NH6R9+hfpqBlKdQcrt5E6okV6KDpl5zswH/wgWWW+I0rK
 iheXOMibKHJHj+WClY0StMVFFcJaYhspvyMZuDO22hdoVcafptI4L2WpveoL/lsAwmpB
 a30MhoGQnT39OWC/XuaCBvbcZEqSjRt1W5/kz/kWZrt0TnFw+EzFjPmXtUemMUXylmjR
 LSN34VnrKPZ5ziWHLMhM7JPHHmKM6maF8epojPMYvFJMu28E1328p4L+mOrs8AdwqmnJ
 pYNeafUpSkTR8vYUkfrj5bQrh0hZTZ6TkmPVSPKoqbT9YG8HAZzoiDcO/2YIxKAdxrDv
 s14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOAiamWMgrw1baxcdY0dJUnntq33efqmQWLjD5VB7U8=;
 b=tQsWqnFnWUNQfz2ZGF74aHuCoXIL9B3r1+1c5L0EiVeEgQHVzzheyJpAK16sv8Iivj
 FkGTQc4r4rKoJzPees9+afSWtRmrcT0uD4yTJ2Yel0/y51Lj7MXMm28u+Lq0t18uWc6O
 YQWuiYmBAnigl2v3+X7W5MyZvRAjOWoesBPzBX7lvMar/b0XhQFeheKcvsAl2UL4Bvkz
 tdvTUBwwRog9p3IEXItyLF9m7dmTGH6sNWPr0RK6M1AOCWK7g3OzGmM3xAyNAasNEb1w
 BCxsriWASqyiNR1+ar4IByRclnD80sb31BMtkVw9++0FvVRIPS+2a7oIMclt3zftrGPG
 IPvw==
X-Gm-Message-State: AOAM530cVrlBJS2cf1iYajggGCXKSuuVI4rJlVd81IJ7mG1foC9oCfFY
 Qfg9G2uQ3ByDucNPh+r0jcU=
X-Google-Smtp-Source: ABdhPJzg0JwHkpM7ONiumdAw8sjYpPghiZlF7UrseW2F1hrxg3nHi3cwqrcnxdxmXLk+2c5PverHvA==
X-Received: by 2002:a17:90a:b311:: with SMTP id
 d17mr9448344pjr.228.1617289462955; 
 Thu, 01 Apr 2021 08:04:22 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 14/48] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Fri,  2 Apr 2021 01:02:51 +1000
Message-Id: <20210401150325.442125-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a separate hcall entry point. This can be used to deal with the
different calling convention.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++---
 arch/powerpc/kvm/book3s_64_entry.S   | 6 +++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 16fbfde960e7..98bf73df0f57 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1989,16 +1989,16 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ori	r12,r12,0xc00
 #ifdef CONFIG_RELOCATABLE
 	/*
-	 * Requires __LOAD_FAR_HANDLER beause kvmppc_interrupt lives
+	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
 	 * outside the head section.
 	 */
-	__LOAD_FAR_HANDLER(r10, kvmppc_interrupt)
+	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
 	mtctr   r10
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	bctr
 #else
 	ld	r10,PACA_EXGEN+EX_R10(r13)
-	b       kvmppc_interrupt
+	b       kvmppc_hcall
 #endif
 #endif
 
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index a99c5d9891c0..5b177c6d495b 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -8,9 +8,13 @@
 #include <asm/reg.h>
 
 /*
- * This is branched to from interrupt handlers in exception-64s.S which set
+ * These are branched to from interrupt handlers in exception-64s.S which set
  * IKVM_REAL or IKVM_VIRT, if HSTATE_IN_GUEST was found to be non-zero.
  */
+.global	kvmppc_hcall
+.balign IFETCH_ALIGN_BYTES
+kvmppc_hcall:
+
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
 kvmppc_interrupt:
-- 
2.23.0

