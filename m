Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B202F1974AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 08:46:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rNKM2pYGzDqXX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 17:46:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--courbet.bounces.google.com
 (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com;
 envelope-from=3fjwbxgckdd8dpvscfuhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--courbet.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=d8hUdfNw; dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rNG6024YzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 17:43:35 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id n16so14081221pgl.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 23:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
 bh=xapqDhPFeX4c/sEZFBXwtVQVL9ia2nDPE/e7jpQzTQA=;
 b=d8hUdfNwN+8iAFJdBnwUiTZeEYcdMVOCOWJfgJWR7/vu/vixLec11deCzX+uCdblaJ
 vKTaEhiX0gbcQtU4EApIuDXMtuTCWFoDKk4CgV8V935/DxbKWIDs72JckC3qfblOJpgk
 G9weGGi1TLjXnb+sCyklu/HBRr22EUaVJtVA40MdyL4HyOlURlp86JTaxm5hNpkh/Ucp
 HprDqPmzfRmnX01nh+JznDUcsbJGNU+qhqlQlILFD+CnXbBVSFh4f8+tvKF4yDKkNhJV
 AqXyZPKRB5yIndXdCOloQ2x0tlgm5EJ08HcBtcME/64wFkfUFajpMjx7jSKtQTt64fW9
 P6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=xapqDhPFeX4c/sEZFBXwtVQVL9ia2nDPE/e7jpQzTQA=;
 b=i+iF2F2YgGyn076wTLtVLfGzPlV31RSJ17ojt9PNaKxoq82FzzgmfmmH0ldgpu7zYo
 B2yJ6pa3kavYeB4x+2DoDcyNlptbVVl4/MVkYukG1B5Y/k/KW99EsCjqoeWkUwrzb+/w
 5C36HN5aTe4XEC+l90S9iBEMpvHEoQyqbt1yW52QUGAMELuR8YtbappsqNUb27BZvozI
 uhYFo12M2VHtbCuG85FE/s+che8tzDB/aSje3D6Llowzay5QYgTRFBxQbUGnWmVPrt3D
 eIIb/mdpNZJe2Grgg3xkk6iLnxg8dy8c1ZCGhNkx9S0v53bYQonSWYIfDjDnwpHi7PUp
 l0Bg==
X-Gm-Message-State: ANhLgQ2qbwjsjQhN8xywbaG1mg2nAryMSyfQiuxdqV+ts+0MqymEp5hS
 mtCdPkFYIVWbbO3y/MHfeyf+EtmNmdUZ
X-Google-Smtp-Source: ADFU+vt/FJekYfgoafMZ/9Mp0r3DKbDy5dLBs00R2iJNcH8rD82TihvKhdtepI0FKoL9nXRN2ERfhcyim+8b
X-Received: by 2002:a17:90a:65c8:: with SMTP id
 i8mr14048414pjs.156.1585550612534; 
 Sun, 29 Mar 2020 23:43:32 -0700 (PDT)
Date: Mon, 30 Mar 2020 08:43:19 +0200
In-Reply-To: <20200327100801.161671-1-courbet@google.com>
Message-Id: <20200330064323.76162-1-courbet@google.com>
Mime-Version: 1.0
References: <20200327100801.161671-1-courbet@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v2] powerpc: Make setjmp/longjmp signature standard
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
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Clement Courbet <courbet@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

---

v2:
Use and array type as suggested by Segher Boessenkool
Cc: stable@vger.kernel.org # v4.14+
Fixes: c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")
---
 arch/powerpc/include/asm/setjmp.h | 6 ++++--
 arch/powerpc/kexec/Makefile       | 3 ---
 arch/powerpc/xmon/Makefile        | 3 ---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
index e9f81bb3f83b..f798e80e4106 100644
--- a/arch/powerpc/include/asm/setjmp.h
+++ b/arch/powerpc/include/asm/setjmp.h
@@ -7,7 +7,9 @@
 
 #define JMP_BUF_LEN    23
 
-extern long setjmp(long *) __attribute__((returns_twice));
-extern void longjmp(long *, long) __attribute__((noreturn));
+typedef long jmp_buf[JMP_BUF_LEN];
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
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index c3842dbeb1b7..6f9cccea54f3 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for xmon
 
-# Avoid clang warnings around longjmp/setjmp declarations
-subdir-ccflags-y := -ffreestanding
-
 GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
-- 
2.26.0.rc2.310.g2932bb562d-goog

