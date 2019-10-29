Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D81E92F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 23:18:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472mFJ0KPyzF32n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 09:18:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="SwWBWcGn";
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kyg4lwDzF377
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:20:43 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id u9so3702pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CyoXOdP2RSQBzcYa2ar7sJXCOKRhNFJ5bhxtCWldzm0=;
 b=SwWBWcGnfRTErjye2RFJl7Aib5ngymVfhFI6SrLYhwbsvQk+AnQ9NuQ0+LRVqvGhgr
 zw5WrFykWhH4hCt8QM/JyvhkKumTwsec+ev1e+K6Fcbb1EtKhpHRegK8vb6OM957Q9ZO
 UG1x/M3i2lCnML1VAM/x8BtKr539SsfdQUXrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CyoXOdP2RSQBzcYa2ar7sJXCOKRhNFJ5bhxtCWldzm0=;
 b=hpwMj4ngAbv4aItpKrkJ/XZx19Ir+skCJRtq254FrqI9oG3UZAcddU9PdimHzJj0ig
 lRR+IPko5d9LGWTvzSd9R2cF4CJ0OHLbJwtIy6BwcpZFKFUiyvtpiWeNIwCiIiBlRwaC
 C7w9Hblsn71N6R7B1nwrLvEw08lwxfMYA2Pqqo9CJFuJeIIvE/eLBN+AelqkxaDJ7XoP
 5lbw4Tg3qFJ5lPq25+eNPIU8O+7Iekv1Oqg2dfJIIeymy0HXsC6M9v9uPDuQ8o3i1rae
 auXXbzd8Olcwf4TlKaoU4r1/U1jDJA9Gun70Q4dpammv96DMWJhNKprVLTawqu/7y87v
 3aKg==
X-Gm-Message-State: APjAAAV/L2NALPf9WGxz56Ks9xpcHLK3VudbEHe/QOCFdPL8P5MKiinQ
 PxgImzhTP52//3Y+j5TOfccOjQ==
X-Google-Smtp-Source: APXvYqwBFdMf1cjARJwLnvFrBgEj47UdUQleXizVAEOutN03LaOfJJkqIZHBJa1HNFPv6Xbz9E2F0A==
X-Received: by 2002:a63:cf4a:: with SMTP id b10mr28208584pgj.86.1572384040153; 
 Tue, 29 Oct 2019 14:20:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 65sm52280pfv.50.2019.10.29.14.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:20:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 27/29] x86/mm: Report which part of kernel image is freed
Date: Tue, 29 Oct 2019 14:13:49 -0700
Message-Id: <20191029211351.13243-28-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
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
 Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Andy Lutomirski <luto@kernel.org>,
 linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The memory freeing report wasn't very useful for figuring out which
parts of the kernel image were being freed. Add the details for clearer
reporting in dmesg.

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

