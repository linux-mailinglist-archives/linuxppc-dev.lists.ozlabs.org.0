Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C98336C0B20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:12:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg5Wz55J8z3fTg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bj4wqpwM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bj4wqpwM;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5M42psJz3cKm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:04:16 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id bc12so10846601plb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679295854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqlkjyUKQxB6TQQy7KpPSlK+JSEQcfav06u1BzOX0U4=;
        b=bj4wqpwM66zXaJ3R+fyYbsI/SDBm+rnA5NQLtMlofd9eDchM1O6W90Nx9LEUvjjvrm
         KPgPf0hUjK0p1BN30u74IdWka/9xfalFHYkkhZF7Wh1KOs2MnK8QdYYpSgxCRPM9x//r
         EjFXj7LoihB74B/Do7aQF672wbipH6yvkRGqgRTKwPtvGSWkYZ8QMrjzVTyDsoXpf4II
         SFAVa9F258pctg4AJZa9/nehLLaotlA4GzzL/2IIGFj3YTYtAzFflKt5KfoiXzJ3WQ4Y
         +K+5+4yedhppz9pXFdLG9QHmp1x217LMSem4QkrU6pblnVevvgUcbms+wUNn/hjh72O7
         n7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqlkjyUKQxB6TQQy7KpPSlK+JSEQcfav06u1BzOX0U4=;
        b=05ixFYOgozCpP9bOkz8t1ro+CMfcsbxb/e7nDa6ancyJ7tpc2ViUIi9pyGkva+XR71
         0of6MMM5e1W7GVIXYsM11N9DYdjmGyvK5IjCAeRRg2/xBROR29+3KgLeg9fllsUxl4sF
         hl8410ANCWT2e8EIuPVmQELpFuLNDLmwzb8QwCCDT6/0YR2DBgRg4Xh4RsclY8H7X6nL
         9xAOISs5TjhuSuLvHfiti1ekzKrD5vJDIr03gRKDthYeWCmhABvZ6LNCvstnSsfYgJvf
         u0u43BMHEhRyXUY8SlUwg4pc0UAew4Sya426bp4IdzmLvdCl1yzaAmcid6SpRDj5Ww6P
         AqSg==
X-Gm-Message-State: AO0yUKWTCWSx6suaqs9k0QOIcIDkI6IzDKd1ZtAnkGSstBnT2baZnDJ/
	wcKa8HjSp97NjOqo5vhhy9Qas/NG/FI=
X-Google-Smtp-Source: AK7set/KKpYGH+TEF/9H97G0b4oPND3h1P209ewvOlM7bgEWSOGOwHH5ImeRdqIV6hpMQeiLygwhUg==
X-Received: by 2002:a05:6a20:66a1:b0:d9:5bb0:5714 with SMTP id o33-20020a056a2066a100b000d95bb05714mr3472692pzh.13.1679295854177;
        Mon, 20 Mar 2023 00:04:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a632b11000000b0050f7f783ff0sm1039414pgr.76.2023.03.20.00.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:04:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v2 08/10] powerpc: Discover runtime load address dynamically
Date: Mon, 20 Mar 2023 17:03:37 +1000
Message-Id: <20230320070339.915172-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320070339.915172-1-npiggin@gmail.com>
References: <20230320070339.915172-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next change will load the kernels at different addresses depending
on test options, so this needs to be reverted back to dynamic
discovery.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/cstart64.S | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 34e3934..069d991 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -33,9 +33,14 @@ start:
 	 * We were loaded at QEMU's kernel load address, but we're not
 	 * allowed to link there due to how QEMU deals with linker VMAs,
 	 * so we just linked at zero. This means the first thing to do is
-	 * to find our stack and toc, and then do a relocate.
+	 * to find our stack and toc, and then do a relocate. powernv and
+	 * pseries load addreses are not the same, so find the address
+	 * dynamically:
 	 */
-	LOAD_REG_IMMEDIATE(r31, SPAPR_KERNEL_LOAD_ADDR)
+	bl	0f
+0:	mflr	r31
+	subi	r31, r31, 0b - start	/* QEMU's kernel load address */
+
 	ld	r1, (p_stack - start)(r31)
 	ld	r2, (p_toc - start)(r31)
 	add	r1, r1, r31
@@ -114,8 +119,11 @@ p_toc:		.llong  tocptr
 p_dyn:		.llong  dynamic_start
 
 .text
+start_text:
 .align 3
+p_toc_text:	.llong	tocptr
 
+.align 3
 .globl hcall
 hcall:
 	sc	1
@@ -193,9 +201,10 @@ call_handler:
 	std	r0, _MSR(r1)
 
 	/* restore TOC pointer */
-
-	LOAD_REG_IMMEDIATE(r31, SPAPR_KERNEL_LOAD_ADDR)
-	ld	r2, (p_toc - start)(r31)
+	bl	0f
+0:	mflr	r31
+	subi	r31, r31, 0b - start_text
+	ld	r2, (p_toc_text - start_text)(r31)
 
 	/* FIXME: build stack frame */
 
-- 
2.37.2

