Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90D867060
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:16:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mN8UAG/4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxP06PGcz3cRN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mN8UAG/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJR58cxz3d2d
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:12:55 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2812782a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942374; x=1709547174; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+TH0Gx+wER6wZOG+8C91ttQiZ2bbMEFLkmm4FPE5oM=;
        b=mN8UAG/4Z64jvX3WaQsZyjMDmMeNoERxC8nwsO02VhBBTbh1XygDsdhdIvLa52RB9p
         OKgA4uhIMAmJElZSkf3VxgiXjHyAdII+mb57O1VZAhL3BPNZ8aDZTzv7Ka2O8gJ/u3HD
         ZEWbYoD4ztqTU+umfNEHjGkxtKocgbzyzfhVIfU+e48SSIU5cZUrf1snLtExqXlxi3jq
         as+G9YpA9UOy/cspkF/x1Em6HShPnhy3ZWYxJowcO7MYBu2wnfL0v11pXyc9N/QfjvW/
         F2n8WQNCmGz5nG5FFIkDK5uwiC2IDDFkiJP+ayjyZxOqK5wmMvPx02NqwvDT9rkEAuh7
         29QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942374; x=1709547174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+TH0Gx+wER6wZOG+8C91ttQiZ2bbMEFLkmm4FPE5oM=;
        b=bEVLLsB7BCgI5dROHTM4EVZwCKkupCA+VSck0fstdxKE3EuMwOiEztJBZOq7e7BIvk
         phNK2mMpCEcpS2Kf/BP1RpupRPutE+MmjmcEU0rWD1/cFE+f0XVgVjkzwD5FdU/HqEfX
         kNNWh48qAKJaBAG90aSaTjJGglGbpvbFh/6JaCO3xbNkLezFA3ogs4m23uB4d8yVGKND
         jntYD+3ELJGURKWFvOamMcCvNg/NbsbTi06sSiVfmiDFPjQP+YjaoY4AFf+L4ZhZpP0X
         +E76vsn0pKJ+OtDtq1umlyB+2DtVHQfimyAusciMELGr593uC6oYMUfraqJCsrDrejKV
         HKhg==
X-Forwarded-Encrypted: i=1; AJvYcCW5JoaRh8LFA0DYdTChCpYin93PD1xDMiMLGDiWTPseyn9lPGyVr0JAyu0MqNm4X5CDAfi5z5RoOJdZ9GDsn/OcdXRwpairV/suiTpygA==
X-Gm-Message-State: AOJu0YyjfC3pdUDR0Mn66I6pyYUA0/hqIyLNGI6tTW2nFzw3sWeGPBBV
	g9tOG3xNEZV9qouGO7bNKGKHkR/gGpEt9G4ELScAz41yHHn5jSj9
X-Google-Smtp-Source: AGHT+IGgnmShy9Psdns9NLfIW2FKxg/7QLv356Ru6hhwTTmGI2/InSX7WcablTLKCkzUPIq77zvhDQ==
X-Received: by 2002:a05:6a21:2d87:b0:1a0:f614:8480 with SMTP id ty7-20020a056a212d8700b001a0f6148480mr6252719pzb.58.1708942373905;
        Mon, 26 Feb 2024 02:12:53 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:12:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 05/32] powerpc: Cleanup SPR and MSR definitions
Date: Mon, 26 Feb 2024 20:11:51 +1000
Message-ID: <20240226101218.1472843-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move SPR and MSR defines out of ppc_asm.h and processor.h and into a
new include, asm/reg.h.

Add a define for the PVR SPR and various processor versions, and replace
the open coded numbers in the sprs.c test case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/ppc_asm.h   |  8 +-------
 lib/powerpc/asm/processor.h |  7 +------
 lib/powerpc/asm/reg.h       | 30 ++++++++++++++++++++++++++++++
 lib/powerpc/asm/time.h      |  1 +
 lib/ppc64/asm/reg.h         |  1 +
 powerpc/sprs.c              | 21 ++++++++++-----------
 6 files changed, 44 insertions(+), 24 deletions(-)
 create mode 100644 lib/powerpc/asm/reg.h
 create mode 100644 lib/ppc64/asm/reg.h

diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
index 46b4be009..52a42dfbe 100644
--- a/lib/powerpc/asm/ppc_asm.h
+++ b/lib/powerpc/asm/ppc_asm.h
@@ -2,6 +2,7 @@
 #define _ASMPOWERPC_PPC_ASM_H
 
 #include <asm/asm-offsets.h>
+#include <asm/reg.h>
 
 #define SAVE_GPR(n, base)	std	n,GPR0+8*(n)(base)
 #define REST_GPR(n, base)	ld	n,GPR0+8*(n)(base)
@@ -35,11 +36,4 @@
 
 #endif /* __BYTE_ORDER__ */
 
-#define SPR_HSRR0	0x13A
-#define SPR_HSRR1	0x13B
-
-/* Machine State Register definitions: */
-#define MSR_EE_BIT	15			/* External Interrupts Enable */
-#define MSR_SF_BIT	63			/* 64-bit mode */
-
 #endif /* _ASMPOWERPC_PPC_ASM_H */
diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index fe1052939..e415f9235 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -3,18 +3,13 @@
 
 #include <libcflat.h>
 #include <asm/ptrace.h>
+#include <asm/reg.h>
 
 #ifndef __ASSEMBLY__
 void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
 void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
-#define SPR_TB		0x10c
-#define SPR_SPRG0	0x110
-#define SPR_SPRG1	0x111
-#define SPR_SPRG2	0x112
-#define SPR_SPRG3	0x113
-
 static inline uint64_t mfspr(int nr)
 {
 	uint64_t ret;
diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
new file mode 100644
index 000000000..6810c1d82
--- /dev/null
+++ b/lib/powerpc/asm/reg.h
@@ -0,0 +1,30 @@
+#ifndef _ASMPOWERPC_REG_H
+#define _ASMPOWERPC_REG_H
+
+#include <linux/const.h>
+
+#define UL(x) _AC(x, UL)
+
+#define SPR_TB		0x10c
+#define SPR_SPRG0	0x110
+#define SPR_SPRG1	0x111
+#define SPR_SPRG2	0x112
+#define SPR_SPRG3	0x113
+#define SPR_PVR		0x11f
+#define   PVR_VERSION_MASK	UL(0xffff0000)
+#define   PVR_VER_970		UL(0x00390000)
+#define   PVR_VER_970FX		UL(0x003c0000)
+#define   PVR_VER_970MP		UL(0x00440000)
+#define   PVR_VER_POWER8E	UL(0x004b0000)
+#define   PVR_VER_POWER8NVL	UL(0x004c0000)
+#define   PVR_VER_POWER8	UL(0x004d0000)
+#define   PVR_VER_POWER9	UL(0x004e0000)
+#define   PVR_VER_POWER10	UL(0x00800000)
+#define SPR_HSRR0	0x13a
+#define SPR_HSRR1	0x13b
+
+/* Machine State Register definitions: */
+#define MSR_EE_BIT	15			/* External Interrupts Enable */
+#define MSR_SF_BIT	63			/* 64-bit mode */
+
+#endif
diff --git a/lib/powerpc/asm/time.h b/lib/powerpc/asm/time.h
index 72fcb1bd0..a1f072989 100644
--- a/lib/powerpc/asm/time.h
+++ b/lib/powerpc/asm/time.h
@@ -3,6 +3,7 @@
 
 #include <libcflat.h>
 #include <asm/processor.h>
+#include <asm/reg.h>
 
 static inline uint64_t get_tb(void)
 {
diff --git a/lib/ppc64/asm/reg.h b/lib/ppc64/asm/reg.h
new file mode 100644
index 000000000..bc407b555
--- /dev/null
+++ b/lib/ppc64/asm/reg.h
@@ -0,0 +1 @@
+#include "../../powerpc/asm/reg.h"
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 285976488..a19d80a1a 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -23,6 +23,7 @@
 #include <util.h>
 #include <migrate.h>
 #include <alloc.h>
+#include <asm/ppc_asm.h>
 #include <asm/handlers.h>
 #include <asm/hcall.h>
 #include <asm/processor.h>
@@ -120,25 +121,23 @@ static void set_sprs_book3s_31(uint64_t val)
 
 static void set_sprs(uint64_t val)
 {
-	uint32_t pvr = mfspr(287);	/* Processor Version Register */
-
 	set_sprs_common(val);
 
-	switch (pvr >> 16) {
-	case 0x39:			/* PPC970 */
-	case 0x3C:			/* PPC970FX */
-	case 0x44:			/* PPC970MP */
+	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
+	case PVR_VER_970:
+	case PVR_VER_970FX:
+	case PVR_VER_970MP:
 		set_sprs_book3s_201(val);
 		break;
-	case 0x4b:			/* POWER8E */
-	case 0x4c:			/* POWER8NVL */
-	case 0x4d:			/* POWER8 */
+	case PVR_VER_POWER8E:
+	case PVR_VER_POWER8NVL:
+	case PVR_VER_POWER8:
 		set_sprs_book3s_207(val);
 		break;
-	case 0x4e:			/* POWER9 */
+	case PVR_VER_POWER9:
 		set_sprs_book3s_300(val);
 		break;
-	case 0x80:                      /* POWER10 */
+	case PVR_VER_POWER10:
 		set_sprs_book3s_31(val);
 		break;
 	default:
-- 
2.42.0

