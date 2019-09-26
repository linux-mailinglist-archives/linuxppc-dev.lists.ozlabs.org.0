Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC56BF988
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:46:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fP6H0XwGzDqym
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:46:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="UFt+V8/B";
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0N40NgzDqsN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:36 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x10so1964184pgi.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lMtAqLKIV7iaSMLHYcvPv+kohztZyY/Z+5xJ+D8O728=;
 b=UFt+V8/BMr/oQ/8CSnatqgIyXSDcvs3/19JyozsCgFPsqS0v3M/8jZg1fzL6Qc1wTN
 zcaktCKmkfBZrskzRVnW1lpnKnbT1CTtX0kHIF9idT+XJVt92g3bq0Dpz4OLE6nMC5XH
 NW8BhxFynv4qPmoQ9WfuzroS1lPcxOvqA3Vq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lMtAqLKIV7iaSMLHYcvPv+kohztZyY/Z+5xJ+D8O728=;
 b=nZ5S4vsNvRaq/dpEDbDjnLNmCijlifwiuidZPjVOewFoIS8DdrAwKkgRnBQ0z2yQAu
 jgFWoSsrg03CW7b3O6cemlLUPVDqSKiNbmHiZXcldGJir+iIczNZP0oVICrmkvl9xJg0
 SGC5fh5b6LrzGAxHoTd3JU46rCafRmn65wBsPXdFO1vKydMEPkqwQGZ2aSUtqD4s67AO
 0YYBb7nr1lgmAgrCaxyRAOVYVOINb6cfXT5TyVbAf8Ct06aFzGC2708KdvwVHlRf/fuq
 nje1XHmo9ZfIz77ZcV/O6k0OJx6L2folk9JFYtZ2XqXRyLBFGtFucIU/924YgQO8i7aI
 y56Q==
X-Gm-Message-State: APjAAAVjSmBTdw2/wDI8g4Nm27SKBnjUk0c31g1th1+fwEylN2aYyl08
 IYOEZPla2x5BylRDbfG6cHh1SA==
X-Google-Smtp-Source: APXvYqx+mrEmgBwFBIoSkO5Knd2FiUPuYbkq8tX7W4zsQact6t42C/glSDDrgO3H24UWPs5jK1YgqQ==
X-Received: by 2002:a65:5905:: with SMTP id f5mr4751014pgu.332.1569520594154; 
 Thu, 26 Sep 2019 10:56:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 22sm2887306pfo.131.2019.09.26.10.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 27/29] x86/mm: Report which part of kernel image is freed
Date: Thu, 26 Sep 2019 10:56:00 -0700
Message-Id: <20190926175602.33098-28-keescook@chromium.org>
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

The memory freeing report wasn't very useful for figuring out which
parts of the kernel image were being freed. This adds the details for
clearer reporting.

Before:

[    2.150450] Freeing unused kernel image memory: 1348K
[    2.154574] Write protecting the kernel read-only data: 20480k
[    2.157641] Freeing unused kernel image memory: 2040K
[    2.158827] Freeing unused kernel image memory: 172K

After:

[    2.329678] Freeing unused kernel image (initmem) memory: 1348K
[    2.331953] Write protecting the kernel read-only data: 20480k
[    2.335361] Freeing unused kernel image (text/rodata gap) memory: 2040K
[    2.336927] Freeing unused kernel image (rodata/data gap) memory: 172K

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/include/asm/processor.h | 2 +-
 arch/x86/mm/init.c               | 8 ++++----
 arch/x86/mm/init_64.c            | 6 ++++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 6e0a3b43d027..790f250d39a8 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -958,7 +958,7 @@ static inline uint32_t hypervisor_cpuid_base(const char *sig, uint32_t leaves)
 
 extern unsigned long arch_align_stack(unsigned long sp);
 void free_init_pages(const char *what, unsigned long begin, unsigned long end);
-extern void free_kernel_image_pages(void *begin, void *end);
+extern void free_kernel_image_pages(const char *what, void *begin, void *end);
 
 void default_idle(void);
 #ifdef	CONFIG_XEN
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index fd10d91a6115..e7bb483557c9 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -829,14 +829,13 @@ void free_init_pages(const char *what, unsigned long begin, unsigned long end)
  * used for the kernel image only.  free_init_pages() will do the
  * right thing for either kind of address.
  */
-void free_kernel_image_pages(void *begin, void *end)
+void free_kernel_image_pages(const char *what, void *begin, void *end)
 {
 	unsigned long begin_ul = (unsigned long)begin;
 	unsigned long end_ul = (unsigned long)end;
 	unsigned long len_pages = (end_ul - begin_ul) >> PAGE_SHIFT;
 
-
-	free_init_pages("unused kernel image", begin_ul, end_ul);
+	free_init_pages(what, begin_ul, end_ul);
 
 	/*
 	 * PTI maps some of the kernel into userspace.  For performance,
@@ -865,7 +864,8 @@ void __ref free_initmem(void)
 
 	mem_encrypt_free_decrypted_mem();
 
-	free_kernel_image_pages(&__init_begin, &__init_end);
+	free_kernel_image_pages("unused kernel image (initmem)",
+				&__init_begin, &__init_end);
 }
 
 #ifdef CONFIG_BLK_DEV_INITRD
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index e67ddca8b7a8..dcb9bc961b39 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1334,8 +1334,10 @@ void mark_rodata_ro(void)
 	set_memory_ro(start, (end-start) >> PAGE_SHIFT);
 #endif
 
-	free_kernel_image_pages((void *)text_end, (void *)rodata_start);
-	free_kernel_image_pages((void *)rodata_end, (void *)_sdata);
+	free_kernel_image_pages("unused kernel image (text/rodata gap)",
+				(void *)text_end, (void *)rodata_start);
+	free_kernel_image_pages("unused kernel image (rodata/data gap)",
+				(void *)rodata_end, (void *)_sdata);
 
 	debug_checkwx();
 }
-- 
2.17.1

