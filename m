Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D0866EE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:42:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hKHrkWd1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjwdJ0yh7z3vdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hKHrkWd1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjwYc1nTzz3d4D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:39:16 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6e445b4f80bso1610600a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708940353; x=1709545153; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFmFHP+QtAW/gWzWjKPE8XCHxHNjIB3oHgOxryrYW4g=;
        b=hKHrkWd1rkK6sWcqxaCMZu6Wj/iJHDWoBDvpND6eum75lkfiWcxT/xYB8y4EfQOmgh
         zW0y4VORk6T1gWIxdgeijIcWFu4VEayB2eek/vf2Rvn2oFqdEzK/3P+b83VKTC0qREVz
         aW3DP5HPaAiKprXkgWcYSR6tOMKY/RR9HwFlbHFITrdqE7WZ1x6whO5+36jqIFD49F6+
         N/BiL9gL2OxJCGzZOVh2C0UBk2D4NaOWm44ylKdzxuqfi7CM9dlTV4sssZ85En9SIb1d
         TPv+7frhlKf6gubuiipdOaxKza7Yk1II8Hp+0Nn1dFCHFR7dZcwwbjDelMuvuoi1izp9
         d7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940353; x=1709545153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFmFHP+QtAW/gWzWjKPE8XCHxHNjIB3oHgOxryrYW4g=;
        b=B1I5CqHMeTXiHboHS9S7ZdPmwfH/pa4uh2fLIhpB/5fOlw7lEwRIcxMbKeNwD7JWSX
         QJJDCYD8tRrWOweO2C1ecIIBaFAj+gus4OIwyPKr0sooYa65YEufHxiRhR0V4QAX1Sk5
         On9IJZg5u6JMcVDUuUxlNY9phlTE85qw3yygvGo2UU9e26RYlZZ/NqSkKPuTKtyXCVJP
         zuLhB3Hck+BQaoQc4/Si2gCM5GDspGap30ngFPOigjX2RLpaSubEe8GGSKelwzFP4QVX
         XMA7Cy1usBTJytxx49UIdm+AxJ+GVU4Z+Mak6LyzBIjvPi+ACZyDqB+TCfoa+7OJQm74
         0GvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoOD+b6/XanoApYEAtyHFA4jHV6vwMwVLSPw0WdVaAbGoyck8jWo0WwPj0kJQ0uqNIk9LQOYN2adcg53v1xpomACDmnXcxN+sjSrbeiQ==
X-Gm-Message-State: AOJu0Yw6npuvgQGFhoBeT9q56viPByKQSyHMJTiLORHtutdnApl2x2+5
	Hq9py5Dp/9Pp7h61wsswscX4sVuUdA5c5KCdGbuBlAShR8h13gLs
X-Google-Smtp-Source: AGHT+IEK7riyiXe4XBkSjXiTYaRk18fYrorXjR0yQSzy+Aw89puQe4obWJbTPsgNr5FUiDSgZ2fE9Q==
X-Received: by 2002:a05:6358:3386:b0:17b:b573:a437 with SMTP id i6-20020a056358338600b0017bb573a437mr73248rwd.8.1708940353115;
        Mon, 26 Feb 2024 01:39:13 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id pa3-20020a17090b264300b0029929ec25fesm6036782pjb.27.2024.02.26.01.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:39:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 4/7] powerpc: add asm/time.h header with delay and get_clock_us/ms
Date: Mon, 26 Feb 2024 19:38:29 +1000
Message-ID: <20240226093832.1468383-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226093832.1468383-1-npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This matches s390x clock and delay APIs, so common test code can start
using time facilities.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h | 21 ---------------------
 lib/powerpc/asm/time.h      | 30 ++++++++++++++++++++++++++++++
 lib/powerpc/processor.c     | 11 +++++++++++
 lib/powerpc/smp.c           |  1 +
 lib/ppc64/asm/time.h        |  1 +
 powerpc/spapr_vpa.c         |  1 +
 powerpc/sprs.c              |  1 +
 powerpc/tm.c                |  1 +
 8 files changed, 46 insertions(+), 21 deletions(-)
 create mode 100644 lib/powerpc/asm/time.h
 create mode 100644 lib/ppc64/asm/time.h

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 4ad6612b3..fe1052939 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -43,25 +43,4 @@ static inline void mtmsr(uint64_t msr)
 	asm volatile ("mtmsrd %[msr]" :: [msr] "r" (msr) : "memory");
 }
 
-static inline uint64_t get_tb(void)
-{
-	return mfspr(SPR_TB);
-}
-
-extern void delay(uint64_t cycles);
-extern void udelay(uint64_t us);
-extern void sleep_tb(uint64_t cycles);
-extern void usleep(uint64_t us);
-
-static inline void mdelay(uint64_t ms)
-{
-	while (ms--)
-		udelay(1000);
-}
-
-static inline void msleep(uint64_t ms)
-{
-	usleep(ms * 1000);
-}
-
 #endif /* _ASMPOWERPC_PROCESSOR_H_ */
diff --git a/lib/powerpc/asm/time.h b/lib/powerpc/asm/time.h
new file mode 100644
index 000000000..72fcb1bd0
--- /dev/null
+++ b/lib/powerpc/asm/time.h
@@ -0,0 +1,30 @@
+#ifndef _ASMPOWERPC_TIME_H_
+#define _ASMPOWERPC_TIME_H_
+
+#include <libcflat.h>
+#include <asm/processor.h>
+
+static inline uint64_t get_tb(void)
+{
+	return mfspr(SPR_TB);
+}
+
+extern uint64_t get_clock_us(void);
+extern uint64_t get_clock_ms(void);
+extern void delay(uint64_t cycles);
+extern void udelay(uint64_t us);
+extern void sleep_tb(uint64_t cycles);
+extern void usleep(uint64_t us);
+
+static inline void mdelay(uint64_t ms)
+{
+	while (ms--)
+		udelay(1000);
+}
+
+static inline void msleep(uint64_t ms)
+{
+	usleep(ms * 1000);
+}
+
+#endif /* _ASMPOWERPC_TIME_H_ */
diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index b224fc8eb..ad0d95666 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -7,6 +7,7 @@
 
 #include <libcflat.h>
 #include <asm/processor.h>
+#include <asm/time.h>
 #include <asm/ptrace.h>
 #include <asm/setup.h>
 #include <asm/barrier.h>
@@ -54,6 +55,16 @@ void do_handle_exception(struct pt_regs *regs)
 	abort();
 }
 
+uint64_t get_clock_us(void)
+{
+	return get_tb() * 1000000 / tb_hz;
+}
+
+uint64_t get_clock_ms(void)
+{
+	return get_tb() * 1000 / tb_hz;
+}
+
 void delay(uint64_t cycles)
 {
 	uint64_t start = get_tb();
diff --git a/lib/powerpc/smp.c b/lib/powerpc/smp.c
index afe436179..3e211eba8 100644
--- a/lib/powerpc/smp.c
+++ b/lib/powerpc/smp.c
@@ -7,6 +7,7 @@
  */
 
 #include <devicetree.h>
+#include <asm/time.h>
 #include <asm/setup.h>
 #include <asm/rtas.h>
 #include <asm/smp.h>
diff --git a/lib/ppc64/asm/time.h b/lib/ppc64/asm/time.h
new file mode 100644
index 000000000..326d2887a
--- /dev/null
+++ b/lib/ppc64/asm/time.h
@@ -0,0 +1 @@
+#include "../../powerpc/asm/time.h"
diff --git a/powerpc/spapr_vpa.c b/powerpc/spapr_vpa.c
index 6a3fe5e3f..c2075e157 100644
--- a/powerpc/spapr_vpa.c
+++ b/powerpc/spapr_vpa.c
@@ -10,6 +10,7 @@
 #include <util.h>
 #include <alloc.h>
 #include <asm/processor.h>
+#include <asm/time.h>
 #include <asm/setup.h>
 #include <asm/hcall.h>
 #include <asm/vpa.h>
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 57e487ceb..285976488 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -26,6 +26,7 @@
 #include <asm/handlers.h>
 #include <asm/hcall.h>
 #include <asm/processor.h>
+#include <asm/time.h>
 #include <asm/barrier.h>
 
 uint64_t before[1024], after[1024];
diff --git a/powerpc/tm.c b/powerpc/tm.c
index 7fa916366..6b1ceeb6e 100644
--- a/powerpc/tm.c
+++ b/powerpc/tm.c
@@ -8,6 +8,7 @@
 #include <libcflat.h>
 #include <asm/hcall.h>
 #include <asm/processor.h>
+#include <asm/time.h>
 #include <asm/handlers.h>
 #include <asm/smp.h>
 #include <asm/setup.h>
-- 
2.42.0

