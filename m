Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC335BB66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 09:52:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJgvW4pFYz3cFh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 17:52:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iBn5ujPu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iBn5ujPu; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJgsh3szvz304V
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 17:51:20 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id e2so1609523plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mg2dHjlwZoN3pi8JCtfCf425RB7yPpz2gT1HyGLlh2I=;
 b=iBn5ujPuI5kNsZwQnALbNC28LHRZt22xXtKjg1GvD18y94uMZfVBHeK1rBUtMmK474
 Jse75tNDJlsYUoygPavVNIAJM/DkRLUoDHgfvoQ4viVzKIizKnHcwwcH6WyIjg10kVTp
 a71naeb+4L+BBygsA7QcYySUYM2lLW96/uEOpkmnVSfzIGFavgMSIIirdQfc85Td3/R1
 scf5G1fqEISvTNX0gEgY0dis8KELNG3Gb+Hr69ro7DDuKCrG3235ca8LzXimj8Bgtmyw
 nBehmi7AN9GP+gETfhCoT5ufeUes00Mb+RGvy5tEq8rOq9IpGyV9VsMP1OAqKZIwZtd7
 4ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mg2dHjlwZoN3pi8JCtfCf425RB7yPpz2gT1HyGLlh2I=;
 b=bZbU4QAGtSiVnwUDa6U83+XDH6MDqkye+oIrL9ufEKn5iZ4jkw7UwUp//pSUuGgwRo
 BohnjGZimuQNVvkcBXkuFo8K3AuWmhPqpHzWk76FKfM5skSpdZyio7s+UC22Lpl2hHTP
 tw+U8dUyaTdQOU65AMfM00Q9REjRDp9myKH4bE9yRrnsZKN5FL7yGgOZbzcXGE0Lk41T
 X6A1UgFnaJJrk3NxOW43cNoEIOpCVMEVMn1Setfp4k7oxjlZnvYa0QDkujg0+NhdJlKN
 6vLUX33w8zSVMp2zxjXCpiA/BAfywBYZPGrIciL4ldvHARz2ovlfv9UlogYDPW1TyGEc
 mcEQ==
X-Gm-Message-State: AOAM530O//A8TPimhgKOM0gqdAXvhhl3Sy0A88P0D2NY0YQEcbTQoYzO
 xUPpL/uEbmthwz54ccEzh40=
X-Google-Smtp-Source: ABdhPJw3swWa4IzDbn5eBRXYfU7wvJRl83L7SBZKaSrNo4Jz/s3JSMirvJrRSM8qRLQRlPzG/r51+A==
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr13025777pjq.187.1618213878181; 
 Mon, 12 Apr 2021 00:51:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-90-211.tpgi.com.au.
 [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id i18sm606180pfq.168.2021.04.12.00.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 00:51:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 3/7] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Mon, 12 Apr 2021 17:50:59 +1000
Message-Id: <20210412075103.1533302-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210412075103.1533302-1-npiggin@gmail.com>
References: <20210412075103.1533302-1-npiggin@gmail.com>
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
index 5842cc3ebbbb..9467fd1038f9 100644
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

