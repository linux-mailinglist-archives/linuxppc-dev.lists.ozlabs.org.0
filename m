Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 060DAD362C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 02:39:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q8GC4LZlzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 11:38:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Cke1k+Wo";
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7Xs4HMSzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:06:37 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id x10so4692311pgi.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MEsYo+M8tYJs19WnuB4vdd58NV32mqrr8UAWRisKZTU=;
 b=Cke1k+WoV3d4y7UYLwGR6Cccr6ntETV7w4A+pAdyCIZxanwHXq4EPnvgyBzqAj40+x
 LiPrWoEPAyegIEPYdAPySyJ4W/aeyE2yAl3to28d7+EqgEkXRjB2PlBmPUXFz9yU7bX0
 btdMvXUw872LvztOLh6mK1NAcmtdiy6tXBqrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MEsYo+M8tYJs19WnuB4vdd58NV32mqrr8UAWRisKZTU=;
 b=Vs832SqnlAm8YMWSTZjDAHjfJhKG0NSa+9UFXYtLhrXc1l5qko5rfqLBMj7vKjmwT8
 4zvLBocBsLq1ka9jHFDG6VEpWVK2kKixXjMZ0YLgdtOkM/6XDkMHJ4y4ajnPCc6TIwGF
 syXtioD1Dq8yOYnnPsqFhffERhXvb6PdJDIyV+RSFTx8AKCOq0+6IspL56dWnegPB2FD
 U3KiqrESXy9x7Gb1YsJY6qUIG0mKk4YSAQmeXbmyK/jnoVP5lN9Rh0IeuJ9mk9btpXLU
 hCceoBfRDtr6W4bvpJ14bdmLbVcQdue+a9g32rTt8LvYVPMQdc6emyAIn390T6SZL/D8
 CjEA==
X-Gm-Message-State: APjAAAX7lLJB80aADGtTmZkZZtXDHjc2lM52G8Fel9lCj2nDN9UKaec2
 NN2y7YcMUxUHpHCmbpRQPc42Tw==
X-Google-Smtp-Source: APXvYqzt84R7YNxqDtZOc2Oqf/NMK/JV4QC0qvTQklX1v+jaEWwrU8bF8lAwLpkYEhqywmtQWhwmNQ==
X-Received: by 2002:aa7:8691:: with SMTP id d17mr13279534pfo.218.1570752395513; 
 Thu, 10 Oct 2019 17:06:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y28sm7193083pfq.48.2019.10.10.17.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:06:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 15/29] x86: Actually use _etext for end of text segment
Date: Thu, 10 Oct 2019 17:05:55 -0700
Message-Id: <20191011000609.29728-16-keescook@chromium.org>
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

Various calculations are using the end of the exception table (which
does not need to be executable) as the end of the text segment. Instead,
in preparation for moving the exception table into RO_DATA, move _etext
after the exception table and update the calculations.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/include/asm/sections.h | 1 -
 arch/x86/kernel/vmlinux.lds.S   | 7 +++----
 arch/x86/mm/init_64.c           | 6 +++---
 arch/x86/mm/pti.c               | 2 +-
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
index 71b32f2570ab..036c360910c5 100644
--- a/arch/x86/include/asm/sections.h
+++ b/arch/x86/include/asm/sections.h
@@ -6,7 +6,6 @@
 #include <asm/extable.h>
 
 extern char __brk_base[], __brk_limit[];
-extern struct exception_table_entry __stop___ex_table[];
 extern char __end_rodata_aligned[];
 
 #if defined(CONFIG_X86_64)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 41362e90142d..a1a758e25b2b 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -143,15 +143,14 @@ SECTIONS
 		*(.text.__x86.indirect_thunk)
 		__indirect_thunk_end = .;
 #endif
-
-		/* End of text section */
-		_etext = .;
 	} :text = 0x9090
 
 	EXCEPTION_TABLE(16)
 
-	/* .text should occupy whole number of pages */
+	/* End of text section, which should occupy whole number of pages */
+	_etext = .;
 	. = ALIGN(PAGE_SIZE);
+
 	X86_ALIGN_RODATA_BEGIN
 	RO_DATA(PAGE_SIZE)
 	X86_ALIGN_RODATA_END
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a6b5c653727b..26299e9ce6da 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1263,7 +1263,7 @@ int kernel_set_to_readonly;
 void set_kernel_text_rw(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
-	unsigned long end = PFN_ALIGN(__stop___ex_table);
+	unsigned long end = PFN_ALIGN(_etext);
 
 	if (!kernel_set_to_readonly)
 		return;
@@ -1282,7 +1282,7 @@ void set_kernel_text_rw(void)
 void set_kernel_text_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
-	unsigned long end = PFN_ALIGN(__stop___ex_table);
+	unsigned long end = PFN_ALIGN(_etext);
 
 	if (!kernel_set_to_readonly)
 		return;
@@ -1301,7 +1301,7 @@ void mark_rodata_ro(void)
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
 	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&__stop___ex_table);
+	unsigned long text_end = PFN_ALIGN(&_etext);
 	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
 	unsigned long all_end;
 
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 7f2140414440..44a9f068eee0 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -574,7 +574,7 @@ static void pti_clone_kernel_text(void)
 	 */
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long end_clone  = (unsigned long)__end_rodata_aligned;
-	unsigned long end_global = PFN_ALIGN((unsigned long)__stop___ex_table);
+	unsigned long end_global = PFN_ALIGN((unsigned long)_etext);
 
 	if (!pti_kernel_image_global_ok())
 		return;
-- 
2.17.1

