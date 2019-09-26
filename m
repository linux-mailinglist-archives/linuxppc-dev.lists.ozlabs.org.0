Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D2BF9BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 21:01:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fPQl2h2PzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 05:01:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="gU8LOxxB";
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fNBc5y73zDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 04:05:28 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id v27so1953324pgk.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kVlu3UytET+u7KQ09fcnqnLvPl+cN9h82jlVZJfZjTo=;
 b=gU8LOxxBAqu4ZMjhqcg6B9uvdO+JQKFvVezAsT+/Z7xLV5dDBIvhPco78+OYSHATWV
 5vKgvlD1/TWtGQnwfCk7wZ0RsQP6sq6fpYz7/tPJNPScWJo/6tHPyc/NVqe/1uVViJiu
 QG4qyMvzq9mF+nTaLfsPuABbMBGU0f1v5ZdH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kVlu3UytET+u7KQ09fcnqnLvPl+cN9h82jlVZJfZjTo=;
 b=MNk/RG7e3UsVhiO1r3/JJDp2R13+W76MagXhifrN2aAu07p2/HsvAlfGQa+CUYakpj
 9kSiBEGTbLYPO6SnJ/SdNKkSt+zd+Uw+CrkplpGM/bgr7UOAQHUxvInO8EON3pRyyPLZ
 nVexe1qhCBNz8zfQ7NAepl7R8jxWyKsFNdcn1GNbviI64D91wHln3fasBPZYIt3Vfqq2
 7HCzwW89nbfcPmiHYmtfWYUbwRvH3f0OPIvCMNO6Jvb2hjb3jivcps8tLSqciszLhm0E
 YleJRGgOuE2F5mB4bcCzMu2Epn5z1WUicl5dhBK7LPL6Jn2mIdX7g/7KWBOD1+PM/eWi
 9q2g==
X-Gm-Message-State: APjAAAUaRqbKpNrfHdirZLihrJkZbIha52C0fh4UE7ve5cWrTAcbOWz6
 SMYcwC2UsBgWMB/zTab2g92Ckw==
X-Google-Smtp-Source: APXvYqzhP1wlAEJn46lkdHp/9E6c8bJo+91ZhySivB8e8kdz5lOe0JajZRG4VPh/2MGrflPoMMhIIQ==
X-Received: by 2002:a17:90a:3483:: with SMTP id
 p3mr4996354pjb.108.1569521123591; 
 Thu, 26 Sep 2019 11:05:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 193sm3956718pfc.59.2019.09.26.11.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:05:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 11/29] vmlinux.lds.h: Replace RODATA with RO_DATA
Date: Thu, 26 Sep 2019 10:55:44 -0700
Message-Id: <20190926175602.33098-12-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's no reason to keep the RODATA macro: just replace the callers
with the expected RO_DATA macro.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S      | 2 +-
 arch/ia64/kernel/vmlinux.lds.S       | 2 +-
 arch/microblaze/kernel/vmlinux.lds.S | 2 +-
 arch/mips/kernel/vmlinux.lds.S       | 2 +-
 arch/um/include/asm/common.lds.S     | 2 +-
 arch/xtensa/kernel/vmlinux.lds.S     | 2 +-
 include/asm-generic/vmlinux.lds.h    | 4 +---
 7 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index bf28043485f6..af411817dd7d 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -34,7 +34,7 @@ SECTIONS
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	RODATA
+	RO_DATA(4096)
 	EXCEPTION_TABLE(16)
 
 	/* Will be freed after init */
diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index ad3578924589..0d86fc8e88d5 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -104,7 +104,7 @@ SECTIONS {
 	code_continues2 : {
 	} :text
 
-	RODATA
+	RO_DATA(4096)
 
 	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
 		__start_opd = .;
diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index d008e50bb212..2299694748ea 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -51,7 +51,7 @@ SECTIONS {
 	}
 
 	. = ALIGN(16);
-	RODATA
+	RO_DATA(4096)
 	EXCEPTION_TABLE(16)
 
 	/*
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 91e566defc16..a5f00ec73ea6 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -82,7 +82,7 @@ SECTIONS
 	}
 
 	_sdata = .;			/* Start of data section */
-	RODATA
+	RO_DATA(4096)
 
 	/* writeable */
 	.data : {	/* Data */
diff --git a/arch/um/include/asm/common.lds.S b/arch/um/include/asm/common.lds.S
index a24b284f5135..eca6c452a41b 100644
--- a/arch/um/include/asm/common.lds.S
+++ b/arch/um/include/asm/common.lds.S
@@ -9,7 +9,7 @@
   _sdata = .;
   PROVIDE (sdata = .);
 
-  RODATA
+  RO_DATA(4096)
 
   .unprotected : { *(.unprotected) }
   . = ALIGN(4096);
diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index a0a843745695..b97e5798b9cf 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -124,7 +124,7 @@ SECTIONS
 
   . = ALIGN(16);
 
-  RODATA
+  RO_DATA(4096)
 
   /*  Relocation table */
 
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3a4c1cb971da..9520dede6c7a 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -513,9 +513,7 @@
 	. = ALIGN((align));						\
 	__end_rodata = .;
 
-/* RODATA & RO_DATA provided for backward compatibility.
- * All archs are supposed to use RO_DATA() */
-#define RODATA          RO_DATA_SECTION(4096)
+/* All archs are supposed to use RO_DATA() */
 #define RO_DATA(align)  RO_DATA_SECTION(align)
 
 /*
-- 
2.17.1

