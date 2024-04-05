Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 903FC89986A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:48:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nVHDB8dP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sbR2gQ7z3vdG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:48:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nVHDB8dP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKk1GNkz3vXl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:58 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c3d2d0e86dso899778b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306215; x=1712911015; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnIgLQ4CEo3lVw3vLtU4xy1hTDqKssgefGwIrsqFLjM=;
        b=nVHDB8dPn3u/jD3HcbRC6EUJ3IXWe23J5ZgBCtp5xfJRldbb1sFnWK+llkdrUVx92w
         xsmvlahekzYPmtaYlmfoZX6rm3FSZ3hUhs3FBj9EEH9zRxPn8/UnHOdxQV7XB0CpazEX
         Nbshpnt/q3aK7JgK+REuc7NxM/7jidi1ZV7e5ES5mOVQ07Vg1olY/ujk2vmUC8taJvJT
         U0kZxelTw6DQkYE1IfvHuof4Y8VKl0pWRMQZGnmMUlsxEYvPUntzqpxFu1fvc1t9OBOo
         qgNWsDMv2UfCIYFSVd+kpofFpWhsz2Mc7s91gElScPTDD+eG9Peg3X2EqukSiRBqU1+R
         nZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306215; x=1712911015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnIgLQ4CEo3lVw3vLtU4xy1hTDqKssgefGwIrsqFLjM=;
        b=fftZdEb2JO2+du0XVdtV8/WxNg4CewKz7jQ4DT4CFHaDxqo7TwiIDRyWwbx3YrgMkf
         diRZl6WcMXnd9yakXhH16efLbWrdHRqEt551BtpWt4vhiQNkbUqZRDH3X8Es+WHwLYkL
         KZVc68LVy0u78TFN03kAI31agnE4gPZBVFqA0PX0v8dB0jtt6r6/WtR2nbxzaqy6cMQR
         eFtgySD2GMesZVBsHBIPQBj7/ZrZKxJRkAyATxkDn7YaYnZKCyvuK+seUbPJkxiIcbeU
         KikguPI65zEx/x5g3PpWUzoOCH4ME5XVhqoYEQLXGZbOkguKOALom30P3dG3BwRxEcri
         BiuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTQX/XMx8x/LkFkw7qtPI11X9YlpVZNasZHnhAxzpHzlNxsLylX36AqXspnVeXJzF2UsQ0Cstw5Ii9dDWPFCG9oJOLGcBbv8vOT0Fx9Q==
X-Gm-Message-State: AOJu0Yx+jbZJbNfAJXWbrxp0xChEdHA8i0Cm74FqRVqZLyjaHXTzZPjd
	E7ThF2vv98ko/0JUFv1M36bGPXFhx/mQ1bs40dxB4bys7ncneGUAu6Zns1/2
X-Google-Smtp-Source: AGHT+IEovlR+M51Tm8GHarGuqcW4Yhtp9UUYnksfxq789AUBMO/CkutE674vcwYSXAbmTWNGvzNFUQ==
X-Received: by 2002:a05:6358:2295:b0:17e:bbdb:acbe with SMTP id t21-20020a056358229500b0017ebbdbacbemr1000459rwb.14.1712306215139;
        Fri, 05 Apr 2024 01:36:55 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 17/35] powerpc: Fix emulator illegal instruction test for powernv
Date: Fri,  5 Apr 2024 18:35:18 +1000
Message-ID: <20240405083539.374995-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Illegal instructions cause 0xe40 (HEAI) interrupts rather
than program interrupts.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |  1 +
 lib/powerpc/setup.c         | 13 +++++++++++++
 powerpc/emulator.c          | 16 ++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 9d8061962..cf1b9d8ff 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -11,6 +11,7 @@ void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
 extern bool cpu_has_hv;
+extern bool cpu_has_heai;
 
 static inline uint64_t mfspr(int nr)
 {
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 89e5157f2..3c81aee9e 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -87,6 +87,7 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
 }
 
 bool cpu_has_hv;
+bool cpu_has_heai;
 
 static void cpu_init(void)
 {
@@ -108,6 +109,18 @@ static void cpu_init(void)
 		hcall(H_SET_MODE, 0, 4, 0, 0);
 #endif
 	}
+
+	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
+	case PVR_VER_POWER10:
+	case PVR_VER_POWER9:
+	case PVR_VER_POWER8E:
+	case PVR_VER_POWER8NVL:
+	case PVR_VER_POWER8:
+		cpu_has_heai = true;
+		break;
+	default:
+		break;
+	}
 }
 
 static void mem_init(phys_addr_t freemem_start)
diff --git a/powerpc/emulator.c b/powerpc/emulator.c
index 39dd59645..af5174944 100644
--- a/powerpc/emulator.c
+++ b/powerpc/emulator.c
@@ -31,6 +31,20 @@ static void program_check_handler(struct pt_regs *regs, void *opaque)
 	regs->nip += 4;
 }
 
+static void heai_handler(struct pt_regs *regs, void *opaque)
+{
+	int *data = opaque;
+
+	if (verbose) {
+		printf("Detected invalid instruction %#018lx: %08x\n",
+		       regs->nip, *(uint32_t*)regs->nip);
+	}
+
+	*data = 8; /* Illegal instruction */
+
+	regs->nip += 4;
+}
+
 static void alignment_handler(struct pt_regs *regs, void *opaque)
 {
 	int *data = opaque;
@@ -363,6 +377,8 @@ int main(int argc, char **argv)
 	int i;
 
 	handle_exception(0x700, program_check_handler, (void *)&is_invalid);
+	if (cpu_has_heai)
+		handle_exception(0xe40, heai_handler, (void *)&is_invalid);
 	handle_exception(0x600, alignment_handler, (void *)&alignment);
 
 	for (i = 1; i < argc; i++) {
-- 
2.43.0

