Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194D43454AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:09:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4CvT0QyRz3dvH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:09:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aqI9464Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aqI9464Z; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cn04Ntdz3bcl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:04 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so9382433pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXjI3MKqqUglifKQA8zc/gRtp5duBK6cOq58P6laAog=;
 b=aqI9464Zme0kXr32WJLOb/zEoPdK0nhlxWwYPwq5vecB6gvYmg5kC60lOU+QlwKh/y
 lIkT5staUjWjq7tRyw79OJhblZpJ8CX8AhIniFpQJhaP6XY6IGWMFR0IRPbUZM/inNqS
 tnw+GJ2WUdMgzTH4Jj0yoOZtNdWhIrqwBISSfUmIl+9fYRG23x0e+qi+WviphHSEA5ww
 KRNWUKQSJ8LqZ3v0XnKpZw1YELs4z3latiu9U+nLhhJGbm8g3PCVMmRUMGZfz4I/ZTUG
 N4cvHn7EWxhdqr0cUiYiwL2ntagfevV+4bParERp/QRVsjU47ipIijhKnhA1pEMR1uoQ
 7OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXjI3MKqqUglifKQA8zc/gRtp5duBK6cOq58P6laAog=;
 b=qmtIF7KTJzg1VNiBC8F6EbevGee327Zfy2fee1uxupgWJtnMMNKRDifHwvRUte7Xat
 u5Xr5TXA4PL9GZ2inMDWNTVRk3g8MoRM0r1etgHrQwxBMVjSFMw8tLnlB4QtiKbqCZDO
 qB1IzjGdQ9y4UGTBqX9TsZGhljEdKnhBsXhkQea+8E7AHPY91UvwAs4pj6bcnvK7sYUD
 e5/BpxbR7Lewd5ajsYX5g6R44YYsJdzB1tYCFhPEcLaEkiBy7JFSGR9Cnu7YcPWF3wJN
 VSWf04Sc6syUEUekD4ZgwNGIU5Zc/Mhegv4QPWqWtcpJV1Ago+sPAfE4lkSKPQE8xe8v
 Qadw==
X-Gm-Message-State: AOAM533ADqx3j0hWttL3hOEOHqtGZLujwIU3rtdClLAKmKfN8zEt/+jX
 aizitOsYDeoZusP5piFt/4o=
X-Google-Smtp-Source: ABdhPJwb0n15uBxD82UyhDnIaLCRikVNz8wtZ22PFAMXF6fmq/QflfbK2LQWKBTeWtEK0bSh3SDALg==
X-Received: by 2002:a17:90a:1642:: with SMTP id
 x2mr1879263pje.88.1616461441940; 
 Mon, 22 Mar 2021 18:04:01 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 14/46] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Tue, 23 Mar 2021 11:02:33 +1000
Message-Id: <20210323010305.1045293-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
index a5412e24cc05..8cf5e24a81eb 100644
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

