Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5EC8159AA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:57:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ER3vjzos;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnj90QJ1z3vnh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:57:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ER3vjzos;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPp2Lrjz3cSL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:30 +1100 (AEDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2039cb39b32so146243fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734267; x=1703339067; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/q9+SOTNgxejygyzTqb3f6ILvTs7v7L66VeB6SlNtM=;
        b=ER3vjzosJJwdP4uEFTd43Tt/KVpFN7jFgr4UcdoziOHxf0GsnaUWYad2XL9AiJdqHH
         E4sDlPQNB1KBJACL1CVUB4tpYLMFGhkizLYH6aEb6Gc+meeXxahtRwOwUmbZXzYha7XK
         xKWbrhHN+9l0IZRLIcl9PU3d9CCn0f9OY461pYb+5rIPAm0OF0bjZxVpAb27bCc1hla7
         bNdudNZy+SLcVdWymapsKNdpBvuypj0+fFT45a/K4CKDmvNXScQs/rbgqnMg+K0+lYHi
         +rsZcaowiEuZ8XbDeiURtOS7BdgMU+AIOudxfKPf1s5KcZz92l3GuLEYxfa4Otlaofww
         0t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734267; x=1703339067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/q9+SOTNgxejygyzTqb3f6ILvTs7v7L66VeB6SlNtM=;
        b=JBEHvGLHptWmSJOLR9FTOx3NUQhskAKs0KxDEm3jqrovEKz5/oH01nGdBD/1WgEyWK
         UeGBWPvTHCm/pNO0SohAaLc8WIyIiO0+De36xcBkLYt1jXoIi1whGMe06K9qtdiDl1n5
         4i/HRKVDZ9O6CRNIv6PiTl11s7CWFhxcnOlnm2Sc8UocSMP3ASQfA6222th8ESu3iaEu
         ao7FUdnbx9v+IbTPKNQ4Csl49CEW718rv56475QFUpVCoULmuLB0C9PVwGFpasOvM1uN
         wyNJRZpYB81urpWQaSjZLCrLq1xGRwdBMoUx2NNEjxtwCPoRJpKGVKxNs159DyMri+qn
         ifCA==
X-Gm-Message-State: AOJu0YwluAoQ7FGv5Cgb8s6jY3DNIpmszL2URN88rcuAOKC14q/7p2r5
	23Z5sF4v08DtPbYvJAFl+9iSlHf73GE=
X-Google-Smtp-Source: AGHT+IFO3S6GTU9B8coHknBBHNQlHDEePwVqxJzCwvKeJib5aGrsNWRA85MGzG8yqLEVBKRdInLFkw==
X-Received: by 2002:a05:6870:a452:b0:203:5a17:7d8f with SMTP id n18-20020a056870a45200b002035a177d8fmr4204496oal.100.1702734267474;
        Sat, 16 Dec 2023 05:44:27 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 17/29] powerpc: Discover runtime load address dynamically
Date: Sat, 16 Dec 2023 23:42:44 +1000
Message-ID: <20231216134257.1743345-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next change will load the kernels at different addresses depending
on test options, so this needs to be reverted back to dynamic
discovery.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/cstart64.S | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index b7514100..e18ae9a2 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -33,9 +33,14 @@ start:
 	 * We were loaded at QEMU's kernel load address, but we're not
 	 * allowed to link there due to how QEMU deals with linker VMAs,
 	 * so we just linked at zero. This means the first thing to do is
-	 * to find our stack and toc, and then do a relocate.
+	 * to find our stack and toc, and then do a relocate. powernv and
+	 * pseries load addresses are not the same, so find the address
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
2.42.0

