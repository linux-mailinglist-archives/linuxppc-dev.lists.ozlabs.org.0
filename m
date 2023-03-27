Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4286CA4F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXqz6C80z3fZJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kfETIGrf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kfETIGrf;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXcL1xt1z3chp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:46:10 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id j13so7563947pjd.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGvXnBWeVAPA+YvFBPv6t4bCGTRX/pABDiDPF8FC0Js=;
        b=kfETIGrfuV3d8Y6aAjlRXgB5WE+WnHhIBTddC0oEYBOPPINJSKcxtfUTmXtRscVBlL
         DMCROekv7FHcwy/fmFy92iXxKJoVDPxaF8WGwOKzbGfkWE9p6rVt4O4XOysnJQDb5Hy1
         khTPtqi8J2Jw0+WrdYEk2qS/dDGLmocSGuIR/rc3t9/befrOupovz4V2WmBpFbR9PImN
         y1d5s2Q8vJEDLOnXrNdf12YHcWvAsZyxmuEjjRIzh9Oh0x4KKz/KOqMUlIfc1gPjrlLY
         ZHSjJ94x04U5SsRqmmdJEhtvdhQMEXQpU5J0d8xNwTRiLufgcWTgR5HefAqJAiajJRgW
         5L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGvXnBWeVAPA+YvFBPv6t4bCGTRX/pABDiDPF8FC0Js=;
        b=cXf+F5h/3iSJt7+jj0kO/7c4ZMOQW2ss3bKxspN99SDH7+N0VXN5/zZpVvytyKyZlU
         YooNw+2valksEW/2Bx6Y+J21BQ0WSlw5HZmhMuj0x0oJQeWAeZBJOMCFi7J5Ojd95Y2g
         enCsOesmdcjVPFBLNzT0jIVE+6fJpUoN8MmJqNt9DqIT6JrGC1NIcUbzvxI19DRaumCI
         Fb4S0LH9Um+mrU+dIWATAjUIslHOBlaAgLcJyFUJAye8h6oS1yREco7yoPhLwfDWIQW1
         oZpbKzm9ygZiG1Euf0dLa3edq42vZeyFT+oC7Q5mlFtTaKTYSHPkbGNv25118lB4dYAw
         DXhQ==
X-Gm-Message-State: AAQBX9f7a/ayUVVxcQX4R4QoCmJMN8Uqjn/lyqjzafBm3x82tPh8qP3I
	xfdQIL+TetuVYdr0RXsBVBs=
X-Google-Smtp-Source: AKy350ZYLBwh3J8d7Z6a4Xlkx6jIFEg7PR4hxhwenxcI6D3NmC2DmteNwcYn4LDpPrV1ffAMlYuecQ==
X-Received: by 2002:a17:902:ebcf:b0:19f:7977:c9d6 with SMTP id p15-20020a170902ebcf00b0019f7977c9d6mr9997127plg.28.1679921168042;
        Mon, 27 Mar 2023 05:46:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:46:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 11/13] powerpc: Discover runtime load address dynamically
Date: Mon, 27 Mar 2023 22:45:18 +1000
Message-Id: <20230327124520.2707537-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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
index 1bd0437..0592e03 100644
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
@@ -185,9 +193,10 @@ call_handler:
 	std	r0,_CCR(r1)
 
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

