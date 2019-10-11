Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B1D35BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 02:27:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q81973tdzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 11:27:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="bRMOq0IW";
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7Xm5rkLzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:06:32 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id f21so3579450plj.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+3bCi815qDNxWXNrKwLag9umK9x4HOIYX8e5T++c31U=;
 b=bRMOq0IWtWeHkkuzrRxpAOjG+rR4hWqjBGGYrfiCb+g0Wo93lleOSNL5PlbwrMlX2m
 UcAArEZAR28PhZpJ9ZQ2+Jx+5/XMFJo+6I1v47AsbgjpXxkd6kYBN+6tNzEwHNlN3EwO
 GygHfZgrHj6MFQQb22vJtjl9/O27IaD4iLe3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+3bCi815qDNxWXNrKwLag9umK9x4HOIYX8e5T++c31U=;
 b=VQElfio/E/KXdZGS7ROay14Okw21L8TM9vjdI+euv4u7+sWAdifwdavF5yyZAFQ9Ag
 dNA/EYKvax2TYF4z2P5DKIha65f3b1EJMjWkky3gQvcQCmppW16MSjCbYbUj3lvENv44
 LhGumUmOeVSMsxJJz4NpODl6bUIX05uDLxHylbqKj5IDiX/RStystVp91YZYX/bWAJoY
 QlLhZymPJmF6Uy71+zm78ReiqHJLD5wP6VAXmFKAUdZqWPq4zcYa2AzxfTXFGQIPol6y
 R9Y5vngUKvoh9iRTE++ZJ4h8aGecZ+il3+wj/vTKVSeEzHubhbcBv2yJO4uON1wkQEkp
 qstg==
X-Gm-Message-State: APjAAAUEXlthLnIItegSr7B58ib0wmHh/uzY8Ws1mcAst3frshmOrscw
 sHGh6H5N5OHUMpCCtL3e6H5IQQ==
X-Google-Smtp-Source: APXvYqy0SXetX4NVbIikmpWxxdgAixqZ0JQVCss4X5LB0rtMMzElGLP4iAy5+ASzEE3vf1MUkTjFzA==
X-Received: by 2002:a17:902:8218:: with SMTP id
 x24mr11712571pln.139.1570752390532; 
 Thu, 10 Oct 2019 17:06:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i8sm7454975pgl.18.2019.10.10.17.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:06:24 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 09/29] vmlinux.lds.h: Move Program Header restoration into
 NOTES macro
Date: Thu, 10 Oct 2019 17:05:49 -0700
Message-Id: <20191011000609.29728-10-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
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
 Michal Simek <monstr@monstr.eu>, x86@kernel.org, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for moving NOTES into RO_DATA, make the Program Header
assignment restoration be part of the NOTES macro itself.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S   |  5 +----
 arch/ia64/kernel/vmlinux.lds.S    |  4 +---
 arch/mips/kernel/vmlinux.lds.S    |  3 +--
 arch/powerpc/kernel/vmlinux.lds.S |  4 +---
 arch/s390/kernel/vmlinux.lds.S    |  4 +---
 arch/x86/kernel/vmlinux.lds.S     |  3 +--
 include/asm-generic/vmlinux.lds.h | 13 +++++++++++--
 7 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 363a60ba7c31..cdfdc91ce64c 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -34,10 +34,7 @@ SECTIONS
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	NOTES :text :note
-	.dummy : {
-		*(.dummy)
-	} :text
+	NOTES
 
 	RODATA
 	EXCEPTION_TABLE(16)
diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 7cf4958b732d..bfc937ec168c 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -70,9 +70,7 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	NOTES :text :note       /* put .notes in text and mark in PT_NOTE  */
-	code_continues : {
-	} :text                /* switch back to regular program...  */
+	NOTES
 
 	EXCEPTION_TABLE(16)
 
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 1c95612eb800..6a22f531d815 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -81,8 +81,7 @@ SECTIONS
 		__stop___dbe_table = .;
 	}
 
-	NOTES NOTES_HEADERS
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 	_sdata = .;			/* Start of data section */
 	RODATA
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 7e26e20c8324..4f19d814d592 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -164,9 +164,7 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES :text :note
-	/* Restore program header away from PT_NOTE. */
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 /*
  * Init sections discarded at runtime
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 646d939346df..f88eedeb915a 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -52,9 +52,7 @@ SECTIONS
 		_etext = .;		/* End of text section */
 	} :text = 0x0700
 
-	NOTES :text :note
-
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 	RO_DATA_SECTION(PAGE_SIZE)
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2e18bf5c1aed..8be25b09c2b7 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -148,8 +148,7 @@ SECTIONS
 		_etext = .;
 	} :text = 0x9090
 
-	NOTES :text :note
-	.dummy : { *(.dummy) } :text
+	NOTES
 
 	EXCEPTION_TABLE(16)
 
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index f5dd45ce73f1..97d4299f14dc 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -56,10 +56,18 @@
 
 /*
  * Only some architectures want to have the .notes segment visible in
- * a separate PT_NOTE ELF Program Header.
+ * a separate PT_NOTE ELF Program Header. When this happens, it needs
+ * to be visible in both the kernel text's PT_LOAD and the PT_NOTE
+ * Program Headers. In this case, though, the PT_LOAD needs to be made
+ * the default again so that all the following sections don't also end
+ * up in the PT_NOTE Program Header.
  */
 #ifdef EMITS_PT_NOTE
 #define NOTES_HEADERS		:text :note
+#define NOTES_HEADERS_RESTORE	__restore_ph : { *(.__restore_ph) } :text
+#else
+#define NOTES_HEADERS
+#define NOTES_HEADERS_RESTORE
 #endif
 
 /* Align . to a 8 byte boundary equals to maximum function alignment. */
@@ -798,7 +806,8 @@
 		__start_notes = .;					\
 		KEEP(*(.note.*))					\
 		__stop_notes = .;					\
-	}
+	} NOTES_HEADERS							\
+	NOTES_HEADERS_RESTORE
 
 #define INIT_SETUP(initsetup_align)					\
 		. = ALIGN(initsetup_align);				\
-- 
2.17.1

