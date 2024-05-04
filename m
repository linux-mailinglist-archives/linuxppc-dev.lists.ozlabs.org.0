Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D18BBB6A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:37:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jkWOuQcK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnHK63c7z3fx1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jkWOuQcK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn6h0KlNz30Vx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:31 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f44881ad9eso418564b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825770; x=1715430570; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnIgLQ4CEo3lVw3vLtU4xy1hTDqKssgefGwIrsqFLjM=;
        b=jkWOuQcKPjEmksCXFe9h8VhGjyXc4LrjxxeJPrfqzE9Q2i5i0H77mxn8NesJ47bbkw
         gTlH4Md+MrHBbYzCGsYSQDdusTvg30436Ale/sE4qA+dpxzFP/5mfSwlC7GsAMrFGZbl
         VmFR4xxatQvT86Ba2r9XKEC178Vz92PvLyfN0bdfAMumGL2fXvx1IqM5AR0RipSCNX8y
         vbN5kOR8zEctJddE52SFUpkfWbeHZfDIzoF5h3puOxQQUEpcZWpAa1Y4+WVXSqisvxV3
         8MZ4zjY/F49dI0c1ZjnDkZWPjZFmW4mO+S0p6T4S+/TcBny037wn+xMpO056BUs1Slug
         8k4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825770; x=1715430570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnIgLQ4CEo3lVw3vLtU4xy1hTDqKssgefGwIrsqFLjM=;
        b=YJIqCF+Mx+Q+2ePPj7Y0G1FxxvT99BkkZW4o9rReyYFyFn+3HRlbP+PUno2dttVZwW
         k6rE7mtDY+Yic7Bm5tgoutgE3A5Z8pg7p6r65kpGPge33kBVVmgY6c6vZA3mqqVYQRZe
         0bD+e+1jMF/vJwO+F3zf+Z3JRzvvl6H7Y9BbVp6MWAQFBWuzEDPOJa1GiP7XfTkICbK0
         P0u5Mw9cFm9hnVBTnQ2boKJqgR/YeTACXDXYOHkcJNZRsgwq8LhnVQluzumKsCCoqdbK
         6ut5L7QIyKyRMjGAFUivtlrOGHFUuffGreatn+dtNTpZ6x9PT5LIjdqPpUZjh7Exl3tu
         Nbyg==
X-Forwarded-Encrypted: i=1; AJvYcCXddbjXkPknOX+kKKHvu9b9HlI35AS4yrbMMCe3tyNm76kEUQx0I/0Wkg81rrBhfj94dRbP0c45AIXyc2p7/utU+DMKGNH8LJqFPTS7eQ==
X-Gm-Message-State: AOJu0YxcJPGAVVJUNeFa5sGJv0aRVtR+jWhSZGTP4xSUCnHUNEgUqWQM
	sXtj/YD+FIuJRf53PjmmxzFbmTGpGp19GRLFDafcFJuhtExW+8bO
X-Google-Smtp-Source: AGHT+IHHrgaDs7cGEwfT9gLtgcGbdkXTEI61OdN8dRApxZSbjCEp8wy5hJY3mc5TL2hAOJ/4+IokuA==
X-Received: by 2002:a05:6a00:3c81:b0:6ed:5f64:2ff4 with SMTP id lm1-20020a056a003c8100b006ed5f642ff4mr5933260pfb.14.1714825769608;
        Sat, 04 May 2024 05:29:29 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 10/31] powerpc: Fix emulator illegal instruction test for powernv
Date: Sat,  4 May 2024 22:28:16 +1000
Message-ID: <20240504122841.1177683-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
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

