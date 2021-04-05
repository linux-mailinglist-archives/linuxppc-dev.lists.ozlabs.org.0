Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14CE353AC4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCfv3py7z3cHN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:26:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=e73LpyIJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e73LpyIJ; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCXR6mD3z3bwC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:55 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id i6so7189810pgs.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ed2GXWlaCaSp80Tc/mRVZswGXqjaQmSEJ2I3FJJrKHY=;
 b=e73LpyIJznudnCnZPgrkOx35aNoogsvfvId8gLSOXX8i9H0929f2Y321Dr7ONmL4p3
 XFmd+Oteke/GyqaIXgHEo+dEPB1rpdcETZxXKemfK+yp30Jxq/gYTswMsy3kZTMX8zJ7
 p6HyxTMyFjFWg39qIFjAuAEn6fZvz2fxXNhglAzE0O5Tpw6kRXxCMfRYhBXbIaP9Luj3
 RBXq83fK9deVMfF71PF3nup3vRJ8E5A7fIwV6PnpuWLMNaol07REV8M+PW4/2u3XzZ0/
 fCMcba3Ux9wgC+DDVs8+OgSCVmWlHKjxn0hJth7RSTmsiv53WnEkGsMlxkD16u9yIQDN
 ntlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ed2GXWlaCaSp80Tc/mRVZswGXqjaQmSEJ2I3FJJrKHY=;
 b=rKNyt1CqDqiFc8NUSRr2INFvTzWQVpq7qZt9JQvvQXQtx+0g/Lrmsrs/p9cw8OTwSw
 AFTkS3HhTS3wh5PljbdXI70tcV6UUKhwq0yojEmZaSK7lJuxQB9xumqEMWdZulV8DLmz
 0qkAhHAgDazLLpq3gdMsU31s5NUa27eN5TuHBG6IsYieY5nuVzdc9mglOgmSXxK/x2fi
 wphV9JkDU5rkVsp5hBcmurXzppHCi1m2JxxB2leRPQaOVk5/oOAYWybXqBfcwOI6bUJs
 gnH4W835iX4eSt1Ig19+qhMwj1poby+Z9RrM7NGZ2vOQyGPBYO0UcgPyRWNkyPCzi2N8
 TBjQ==
X-Gm-Message-State: AOAM530bKbONZFeYJeS0apoE7HADz/nGf28abKi9KKhsWYPM6VOShDl/
 rS7k6HzaaEPgDN5WRSv6tMs=
X-Google-Smtp-Source: ABdhPJxXoU7kKdyUv7+TwJCZznBqV0rzxxPEglGyclVPCRi9MLLoA/a3wHM3mZvQuwuDW+M77gnT+Q==
X-Received: by 2002:a63:c145:: with SMTP id p5mr14876597pgi.451.1617585653647; 
 Sun, 04 Apr 2021 18:20:53 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 14/48] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Mon,  5 Apr 2021 11:19:14 +1000
Message-Id: <20210405011948.675354-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
index bf927e7a06af..c21fa64059ef 100644
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

