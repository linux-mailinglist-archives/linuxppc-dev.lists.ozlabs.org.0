Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982B2867097
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:22:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eybTFdjW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxW52vPwz3w1v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:22:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eybTFdjW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxK244z0z3fNd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:26 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e48eef8be5so1842004b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942405; x=1709547205; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTzHwVrlhJ44ljTP4egNfnM7a2uSQKeiI4yRLVlcvdA=;
        b=eybTFdjWYZbsBJAB+wxgcpyOHZNzVUYSSoKhg6nVMfzh9mUCIb4KjNHt9b/j9mRfVP
         CPf38Pdvdtfib368zXpL9Iftxy+1wBnc1lV/Mpa9OsmaKkZs4mOse7KDgSLqTNpQH/xQ
         vz6T/niKGZGCRIv1uPnHyz0OJtUgmu7dpoWmeuT8JL2SYABDtJXjLXBwrGwEmqHhtrI1
         fYE9PzF++bM5uepD/e5on4jwZHqhInjzNgBGwZyo+CGDohSLRDqQMLawkYT90gkL5Okx
         i4vWVBugVRuNKbNXKuppbItcJ36UDlWzXsSiZ1j6C9hZ/+na6dsIwFweJ9ZDhIdTPT0d
         k8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942405; x=1709547205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTzHwVrlhJ44ljTP4egNfnM7a2uSQKeiI4yRLVlcvdA=;
        b=AGecVCHmqJGGLK+UFlpjzhNNtGCEROXN1ReRPvzq5ZALSCta7PVujlVydF/v6GvF9n
         ME4Ptq0XxsXDUT1pVIGLaf8Z/WRoZiBDoParJcmBiudcU53ERPOAA/3XC3Pus1T709Gk
         U0iU2a2jGOiRxd/82FKsxONxuXI/ZhSft11XqNaMLoZV6uMrkF7nBqmi9ebaEe6rD0dG
         q7d+GN2d4i8Xez/et0d6JXIGy+0BW9JuC0X7E/jiz4i+ciiZ0Xr7PVf5gaBXWjOFtKZA
         QBUBrul0GBr/8vebTlw1YVdaeAncI8uiKIUdIUcezqUZwWnBN548TpWEqhlCnFMowN/r
         c43g==
X-Forwarded-Encrypted: i=1; AJvYcCWcof6ZNvUV36WeOGOWgxWaCSP3xh0mV+UTpnQT1Ku+XGQ3Fim+9xXptDz5RSicYlHW6Pv7iR5CQ85mmblQE4VA8YKtb0uKVogM/1Q7xA==
X-Gm-Message-State: AOJu0Yx+VSrskk5nJUv7YKk+fWK9XpAkLp+1fv+zskIl5ONzMVrGTQO6
	O2aBPE1+gWm53979PF0cCXw4kREIZutLmbF8BNGHGF11wCLVe7xd
X-Google-Smtp-Source: AGHT+IHoxB0TT29CakpeaPt9N9d/U7ozjzGJCW6J9X08YRZJcOR/GfOl6GcVNLtrGGGJNpj3R1sE0g==
X-Received: by 2002:aa7:8c06:0:b0:6e5:3dea:dde9 with SMTP id c6-20020aa78c06000000b006e53deadde9mr208073pfd.1.1708942403334;
        Mon, 26 Feb 2024 02:13:23 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 12/32] powerpc: Fix emulator illegal instruction test for powernv
Date: Mon, 26 Feb 2024 20:11:58 +1000
Message-ID: <20240226101218.1472843-13-npiggin@gmail.com>
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

Illegal instructions cause 0xe40 (HEAI) interrupts rather
than program interrupts.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |  1 +
 lib/powerpc/setup.c         | 13 +++++++++++++
 powerpc/emulator.c          | 21 ++++++++++++++++++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

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
index 39dd59645..c9b17f742 100644
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
@@ -362,7 +376,12 @@ int main(int argc, char **argv)
 {
 	int i;
 
-	handle_exception(0x700, program_check_handler, (void *)&is_invalid);
+	if (cpu_has_heai) {
+		handle_exception(0xe40, heai_handler, (void *)&is_invalid);
+		handle_exception(0x700, program_check_handler, (void *)&is_invalid);
+	} else {
+		handle_exception(0x700, program_check_handler, (void *)&is_invalid);
+	}
 	handle_exception(0x600, alignment_handler, (void *)&alignment);
 
 	for (i = 1; i < argc; i++) {
-- 
2.42.0

