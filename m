Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7332EE07
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:11:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWRK49zNz3fQ3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:11:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DgmaHg12;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DgmaHg12; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWLR6cNWz3dNv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:27 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id y67so2378605pfb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97vKqpXzP/s6j2Q2X9DDNv6PS4Ig8ESJY15d7Gu3sgg=;
 b=DgmaHg12XvVXsQa3Ty/c8OBT8FRMP6qD+6/ttD4My3RCZ7iPmr77XEGPMEJEEO4qEl
 sQkipv385RES9mE1bhyjZql0a7tes4bjhKBRxjna4tgrP+pwzxcuF0vikCPpXtLmaW92
 K1NcQ8XPS+xoGDoMd4zgfu+UpOa9vkEKD8UqFW1d0/4CRQRhSX6Q69JSXSROjMWthUoN
 lbqYiiHe2YQnybtwcf4FOYpffo1xvDj1iufzGx7gJ7T1SWaeBqQH8yKFuGWxCxrDxTfS
 cz2DejDeZwh12O4EYxUfs2904o+Qm4Cw+kfjBZzw2R6X9B8SzyIU0zXvMahHRTCL/C1R
 urTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97vKqpXzP/s6j2Q2X9DDNv6PS4Ig8ESJY15d7Gu3sgg=;
 b=GD/PQ+BHyWLmd4CHARqqH8nd6MkzZwAHbbrxyHeZ7sOzRn/LZMevDLJ33HFqDA4pzo
 M05q6Nt9XObcDNnNyFP1xBDZ+KTr1qFtKbyyRi2gcbWeb67UH6xi7KAsBKu47zh3qcH4
 t997dFsZTzdYZctld2YiDESQzeYNdRYs9mix3HGd0Jwk2w1pHcuK5OIhOvc0yIgocx5D
 BWVm1gsZwuAtkKftIpA5VyAY3ut+ealjDbFNljVnXmWVaoB3W4Okhgj4Vu3gJMO54X/9
 lsIBvas1w4LT3GA3kL2mqLcRmpCoPAtgku2FHQNg/2YjSFKbiOY1W9D0mplNU/7zQ/Gf
 cM+g==
X-Gm-Message-State: AOAM533wsjo6FirlTtJ9vg1IxpcJkeOOUod6ecTlycA7EG5+OYU/3oV0
 th6BOj4JZlYN88onGw86oU8=
X-Google-Smtp-Source: ABdhPJzNDeydZpTk6fW6ICChZLmpKRyyF3ATVReo+I6OF7xxLv3moPgsFeWWX8zL5qfHhaC0q+D8iQ==
X-Received: by 2002:a63:1725:: with SMTP id x37mr9125283pgl.48.1614956846174; 
 Fri, 05 Mar 2021 07:07:26 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 11/41] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Sat,  6 Mar 2021 01:06:08 +1000
Message-Id: <20210305150638.2675513-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
index d956dd9ed61f..292435bd80f0 100644
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

