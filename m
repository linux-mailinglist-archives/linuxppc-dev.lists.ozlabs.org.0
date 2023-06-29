Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016E742659
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 14:27:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d/ONtzMH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f3OsHAg+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHl26lhGz3bVv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 22:27:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d/ONtzMH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f3OsHAg+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHj83h5zz30hD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 22:25:32 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C0E72186B;
	Thu, 29 Jun 2023 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQ3EDeCSnwNHCvqI9o+8mLXg+vNxeu9dqjNgbn6vW64=;
	b=d/ONtzMHBHfhPFGJZXFbwxLHKekEj3Ck140ZBA9jozx6NZ9IQncD0ogM4FlYnbVbwD45G1
	SJ8ei5BmHWMBBnBkm9jXuvlD6yHYAuy3e3PYj4Jw61gdgEKEw5UzbK+mo0r3LVmeUysWir
	EVI14bZZuCFygATwSv7zxT0YU4yItG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQ3EDeCSnwNHCvqI9o+8mLXg+vNxeu9dqjNgbn6vW64=;
	b=f3OsHAg+MvgJYkBzRW/rb3tMUgPoqd73LlNMm0j7gkGvTcrmNDsm3dmRC0NYT1egdnRYUJ
	PNHfPSmv46ciy1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61E3213A43;
	Thu, 29 Jun 2023 12:19:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wFf0Fu92nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:19:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 07/12] arch/x86: Declare edid_info in <asm/screen_info.h>
Date: Thu, 29 Jun 2023 13:45:46 +0200
Message-ID: <20230629121952.10559-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, Juerg Haefliger <juerg.haefliger@canonical.com>, Thoma
 s Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The global variable edid_info contains the firmware's EDID information
as an extension to the regular screen_info on x86. Therefore move it to
<asm/screen_info.h>.

Add the Kconfig token ARCH_HAS_EDID_INFO to guard against access on
architectures that don't provide edid_info. Select it on x86.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/Kconfig                      | 6 ++++++
 arch/x86/Kconfig                  | 1 +
 drivers/video/Kconfig             | 3 ---
 include/asm-generic/screen_info.h | 6 ++++++
 include/video/edid.h              | 3 ---
 5 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2f58293fd7bcb..ee9866e4df2b0 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1466,6 +1466,12 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
 	  address translations. Page table walkers that clear the accessed bit
 	  may use this capability to reduce their search space.
 
+config ARCH_HAS_EDID_INFO
+	bool
+	help
+	  Selected by architectures that provide a global instance of
+	  edid_info.
+
 config ARCH_HAS_SCREEN_INFO
 	bool
 	help
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index d7c2bf4ee403d..ee81855116be7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -76,6 +76,7 @@ config X86
 	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_EARLY_DEBUG		if KGDB
+	select ARCH_HAS_EDID_INFO
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index d4a72bea56be0..8b2b9ac37c3df 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -21,9 +21,6 @@ config STI_CORE
 config VIDEO_CMDLINE
 	bool
 
-config ARCH_HAS_SCREEN_INFO
-	bool
-
 config VIDEO_NOMODESET
 	bool
 	default n
diff --git a/include/asm-generic/screen_info.h b/include/asm-generic/screen_info.h
index 6fd0e50fabfcd..5efc99c296b40 100644
--- a/include/asm-generic/screen_info.h
+++ b/include/asm-generic/screen_info.h
@@ -5,6 +5,12 @@
 
 #include <uapi/linux/screen_info.h>
 
+#include <video/edid.h>
+
+#if defined(CONFIG_ARCH_HAS_EDID_INFO)
+extern struct edid_info edid_info;
+#endif
+
 #if defined(CONFIG_ARCH_HAS_SCREEN_INFO)
 extern struct screen_info screen_info;
 #endif
diff --git a/include/video/edid.h b/include/video/edid.h
index f614371e9116a..52aabb7060321 100644
--- a/include/video/edid.h
+++ b/include/video/edid.h
@@ -4,7 +4,4 @@
 
 #include <uapi/video/edid.h>
 
-#ifdef CONFIG_X86
-extern struct edid_info edid_info;
-#endif
 #endif /* __linux_video_edid_h__ */
-- 
2.41.0

