Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EC393F90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:09:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzQr4Y5Jz3c9h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:09:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CjACEkTm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CjACEkTm; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzP60VB3z308C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:09 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id b7so1362738plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqaydJ3jpxClMBPlT2JOHwW8d3UiSbtXfV80KYjNSlU=;
 b=CjACEkTmluJsfh+1wfIRUo/mACPvNwrua8PAExfuQmggq1CeLfAGIsS1kW2eSfdQFj
 uT93e3Bx/D9fEI2KB8z6oySz+lFLEq8wlIzN0/cdjg41qiJWEBTGz+yGEb77DF7tK1c1
 RKgf/92l3FLpWZ6TrYJAau8bJWPCp5rbjXfg0Ug3ktH8VfdTKoJ5aHinvImyCwkrTAzN
 MN8BHDJ9v88p7YwPLtomznSwet+FsCBEwuv8UktdVUqnrfjPEcUonZPBCOYAYRfiRIvz
 iGe35E1ZsHVJ6P7IQRaMRchR6DjyvWJJwqr0jqi6gftZrdv1WpitxWc2C3WHRy+Gvdtu
 TXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqaydJ3jpxClMBPlT2JOHwW8d3UiSbtXfV80KYjNSlU=;
 b=T8XMFjR7fN2tHWvn9nuDbzqz1/HZFUVQTfLIiizRJMd+seDYcqu6AhlMehpdIPkEh4
 jaZ9LqRUipCqPX29ej+spwrtqyemCbwTQOC0XuVsjBIe8yoSncLfIyv6584EGqrrawlx
 PlMgJEtWu0b0onghzLrCKYSRrXbR670yBdllHVQwy6IyfdQ4I3W5CBPX9+xzrv5tvrDB
 MaSqnluFQhKgFY/sHiQH4xZxvEf2I9jypJW+PmCtvQZN4uyeijmylOZrFt1U0myHIHLZ
 gjLlQ6wIwgy+JNtC08E2LoxRnKSuOsw5/2q80k8kMtgFL8pmfIzSCr0e/IQRjfQT2kuA
 z4wA==
X-Gm-Message-State: AOAM530037T1vPnSmbhqXfRk9yXHgmooiUIVmchiyVH8Olqdr8OFiQR2
 ef4NE+7Q3JU0TxvhJcOrlP0=
X-Google-Smtp-Source: ABdhPJxyBBYYMSIuNw9JDjeXUxDGin1pu7KuNUaov/hGk3ENOzYCkWSjk4xl9BeaBcPn/fGFUS7i6w==
X-Received: by 2002:a17:90a:c217:: with SMTP id
 e23mr3297219pjt.43.1622192887123; 
 Fri, 28 May 2021 02:08:07 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 03/32] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Fri, 28 May 2021 19:07:23 +1000
Message-Id: <20210528090752.3542186-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
index 192b927b429e..4819bf60324c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1966,16 +1966,16 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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

