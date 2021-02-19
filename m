Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761D31F530
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:39:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhhkQ4Nsrz3dGF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:39:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R2hUk36P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R2hUk36P; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhhg02sKJz3cK0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:36:12 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id b21so3038921pgk.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 22:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8+XAwDLitHtpqcBz+UUYGvTU1Jz8hxN7d0VpM28oVU=;
 b=R2hUk36PrZk+m5BANR8/YzGsIlBdWeLlYg5XcMruyqBTrf+vAScarBWzJe6quESSuH
 6swDVacpXEwdogAuxy9L4IFlGnYI17va0J6vBb00M1KyeE0Q3Ogh+xpUMaFE1clLBfaV
 BG97j79aiw5HQKx3TizhtmMp+Wemm0rG8fCL7QK/t3BRVnW5VvnKte0kkb7zSoe9bBXC
 r7zm17JJYZIBu/Vq6drxHp6mNz5bz/GI1BCw+ByVCBMmkzrfiDPDyEN0EEtUHjfF5jQE
 s85N+zy8Or+1pyaWJKWyjn/H235N1OrOjYTtdch8gL52C039o0W2bSZIE5w5Xjm/3j1E
 1QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8+XAwDLitHtpqcBz+UUYGvTU1Jz8hxN7d0VpM28oVU=;
 b=n4XDkk3WJS7Bqc81zQ3of8oBz2ZudAeSu3WQHQikKYcTB1KzdqNBZzpAncgmStwSq6
 dGYag6akQnvJkbiRNhVRdaXLDbrHRGaKxQ2ugT6SQ/e7Jaiey28XxdzyA/eEmgyJIr3e
 7kb4FJf76zsggDehkqRY4CFeFxRvwP5ErEav7dgZ0cZAzKkq1J9CJQI+Byxf1Rv8nykA
 R+TXj2fY+aUSRwfDjc7a4Hawj48Ydxrio9dOqUYwmq7xfXL9kqEF1ZUvoKP+3vwnk3Go
 Gaov1iLFbHOlc1xrCXYEmIO2Y+2enLr8tdaObCSBC6j4ursVWkKkR8X7+VDwyA17S+l/
 ApDA==
X-Gm-Message-State: AOAM532/5/CtGQa5eqUQlzS2+0igooK7LtGav4qJleU0BMYbVfkTxI04
 OPC+mNgM54iAX+/KDoKLei0=
X-Google-Smtp-Source: ABdhPJwRpbNptHrj1QsJwW4+zC4Ap7NkG+9wYHmeCiZXxziC9W0JbnZRZ9DnUkrClDmZ7PLHwIaxwQ==
X-Received: by 2002:a65:654e:: with SMTP id a14mr7402331pgw.265.1613716570533; 
 Thu, 18 Feb 2021 22:36:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id v16sm7813099pfu.76.2021.02.18.22.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:36:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 07/13] KVM: PPC: Book3S 64: add hcall interrupt handler
Date: Fri, 19 Feb 2021 16:35:36 +1000
Message-Id: <20210219063542.1425130-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219063542.1425130-1-npiggin@gmail.com>
References: <20210219063542.1425130-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a separate hcall entry point. This can be used to deal with the
different calling convention.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++--
 arch/powerpc/kvm/book3s_64_entry.S   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 96f22c582213..a61a45704925 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2023,13 +2023,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * Requires __LOAD_FAR_HANDLER beause kvmppc_interrupt lives
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
index 820d103e5f50..53addbbe7b1a 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -7,9 +7,13 @@
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

