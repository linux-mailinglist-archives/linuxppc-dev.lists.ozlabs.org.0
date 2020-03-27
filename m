Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2E1954DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 11:10:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pd032BlLzDr0k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:10:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--courbet.bounces.google.com
 (client-ip=2a00:1450:4864:20::449; helo=mail-wr1-x449.google.com;
 envelope-from=3qnb9xgckddszlroybqdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--courbet.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FJmHc86j; dkim-atps=neutral
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com
 [IPv6:2a00:1450:4864:20::449])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pcyG41SMzDq72
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 21:08:47 +1100 (AEDT)
Received: by mail-wr1-x449.google.com with SMTP id u18so4273651wrn.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:cc;
 bh=a9Dk/kbnbTaFBBTCzZO5pdMTQ5WVDyWCyCYn/tuqlvo=;
 b=FJmHc86jTWilHccHv/Qtxijls7tX6vwQd9QVFRcr4ULmjCslDhbAUbT/QGLyMiPMYm
 tP+9f4g4yGrvQziUFuqcgvIvvPGmPltssF3bc/u+v48G3ILPSh5Bhc5oxTlslJVaKdM0
 G/SkaNPT7mu6fQfidkpNkePPd1cE4RVebXj+4HE3Qt/B86Y1zGVKngXmZb+J4hpr1E6o
 /eP74Th/f9RC9r3NyHNJ708a7Je0jhvMkcY/xLS8hKJGeWuB+h0qUGbentWjZLRMAoXa
 Noapslt5eHx21oA4wFLj/DOS4EppFcYhlhx0CROLwFPc99KXzpLLyq/LJmuSGGZKkipk
 Us7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
 bh=a9Dk/kbnbTaFBBTCzZO5pdMTQ5WVDyWCyCYn/tuqlvo=;
 b=Rq08wN/w9zrTTn+EM/PupiSpZB2TMtMQz6Onw3MjQcXB3LDXNmHNQl0QXZStjXozSu
 z0Z53p+lyMQ0NdMJ2dXspuzAGElv/AjDO4YI5Y+8hzr6u5LQmQh66QzfwfOmJLi9+2uf
 VFBU7JWefZBlvWhtiOECYbbQo8MZhifBq4kiK+6SoHz1QYbAsubCrAg5A+w9c1Dq4Mhv
 qDNudjHILTPsWuTBkE33m1DxOP6cAhUSlFMoOoNHJJB/2C4Q5UE+xQjaOA20pi0l2UOS
 Zuba/9Z9H310XCFupNUHxw7R1yOKtLZPAX3LI3MfDQOebnoSdyjNWMd7iZYYa3KB0yOK
 OYsA==
X-Gm-Message-State: ANhLgQ1DIe6OkNePFQb290SHawFVBFswyYHOOx3w6s2tIgxHHkK/3l/W
 XcCsF9oOxMr2fPynoZHkxhlahdU53qrT
X-Google-Smtp-Source: ADFU+vtojvBkE1GLoPL2bhvgPGCs6QCLPLJwQAyX+NrE9rnGyOJoaHaAy73LIj85K4haau67QXrr6O028hc9
X-Received: by 2002:adf:9e08:: with SMTP id u8mr3411115wre.155.1585303720723; 
 Fri, 27 Mar 2020 03:08:40 -0700 (PDT)
Date: Fri, 27 Mar 2020 11:07:56 +0100
Message-Id: <20200327100801.161671-1-courbet@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v1] powerpc: Make setjmp/longjump signature standard
From: Clement Courbet <courbet@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Clement Courbet <courbet@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Declaring setjmp()/longjmp() as taking longs makes the signature
non-standard, and makes clang complain. In the past, this has been
worked around by adding -ffreestanding to the compile flags.

The implementation looks like it only ever propagates the value
(in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
with integer parameters.

This allows removing -ffreestanding from the compilation flags.

Context:
https://lore.kernel.org/patchwork/patch/1214060
https://lore.kernel.org/patchwork/patch/1216174

Signed-off-by: Clement Courbet <courbet@google.com>
---
 arch/powerpc/include/asm/setjmp.h | 6 ++++--
 arch/powerpc/kexec/Makefile       | 3 ---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
index e9f81bb3f83b..84bb0d140d59 100644
--- a/arch/powerpc/include/asm/setjmp.h
+++ b/arch/powerpc/include/asm/setjmp.h
@@ -7,7 +7,9 @@
 
 #define JMP_BUF_LEN    23
 
-extern long setjmp(long *) __attribute__((returns_twice));
-extern void longjmp(long *, long) __attribute__((noreturn));
+typedef long *jmp_buf;
+
+extern int setjmp(jmp_buf env) __attribute__((returns_twice));
+extern void longjmp(jmp_buf env, int val) __attribute__((noreturn));
 
 #endif /* _ASM_POWERPC_SETJMP_H */
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 378f6108a414..86380c69f5ce 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -3,9 +3,6 @@
 # Makefile for the linux kernel.
 #
 
-# Avoid clang warnings around longjmp/setjmp declarations
-CFLAGS_crash.o += -ffreestanding
-
 obj-y				+= core.o crash.o core_$(BITS).o
 
 obj-$(CONFIG_PPC32)		+= relocate_32.o
-- 
2.25.1.696.g5e7596f4ac-goog

