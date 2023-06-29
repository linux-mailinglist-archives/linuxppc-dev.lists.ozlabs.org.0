Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7765D742682
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 14:34:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MIAi+nRQ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QtEMlYzX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHvz2jdFz3cR8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 22:34:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MIAi+nRQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QtEMlYzX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHpv5dnkz3bv8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 22:30:31 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 066AF2185F;
	Thu, 29 Jun 2023 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6CE4eotLwXsvlZXrH5NtI0502wDnDOGFZbV7I5gngY=;
	b=MIAi+nRQrg/Ge6eax6lpus2Fe5io5yBV8iHETNEefQw9v5hsTuNhmZJeebMxmsLFAlwBhS
	pO7TNt9tms53aJbJTmVVmamYMonFDjXBqZpUrgsRP2HhwvENuHP3spbLJKhMZmxBxuB6E2
	Ljm6zTP+iYW/JJQTawD+nJfjriRukK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041198;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6CE4eotLwXsvlZXrH5NtI0502wDnDOGFZbV7I5gngY=;
	b=QtEMlYzXXo8wdFbyP1FH2jzz5MUkEcUCgrio6JnFPAKU6t0ZeGdkmpfMQ0v7TpGMoOM8im
	x7p7/cuMdcwjb5DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C07713905;
	Thu, 29 Jun 2023 12:19:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cIJ/Fe12nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:19:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 05/12] arch: Remove trailing whitespaces
Date: Thu, 29 Jun 2023 13:45:44 +0200
Message-ID: <20230629121952.10559-6-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/ia64/Kconfig | 4 ++--
 arch/sh/Kconfig   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 21fa63ce5ffc0..e79f15e32a451 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -260,7 +260,7 @@ config PERMIT_BSP_REMOVE
 	default n
 	help
 	Say Y here if your platform SAL will support removal of BSP with HOTPLUG_CPU
-	support. 
+	support.
 
 config FORCE_CPEI_RETARGET
 	bool "Force assumption that CPEI can be re-targeted"
@@ -335,7 +335,7 @@ config IA64_PALINFO
 config IA64_MC_ERR_INJECT
 	tristate "MC error injection support"
 	help
-	  Adds support for MC error injection. If enabled, the kernel 
+	  Adds support for MC error injection. If enabled, the kernel
 	  will provide a sysfs interface for user applications to
 	  call MC error injection PAL procedures to inject various errors.
 	  This is a useful tool for MCA testing.
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 9652d367fc377..04b9550cf0070 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -234,7 +234,7 @@ config CPU_SUBTYPE_SH7201
 	select CPU_SH2A
 	select CPU_HAS_FPU
 	select SYS_SUPPORTS_SH_MTU2
- 
+
 config CPU_SUBTYPE_SH7203
 	bool "Support SH7203 processor"
 	select CPU_SH2A
@@ -496,7 +496,7 @@ config CPU_SUBTYPE_SH7366
 endchoice
 
 source "arch/sh/mm/Kconfig"
- 
+
 source "arch/sh/Kconfig.cpu"
 
 source "arch/sh/boards/Kconfig"
@@ -647,7 +647,7 @@ config GUSA
 	  This is the default implementation for both UP and non-ll/sc
 	  CPUs, and is used by the libc, amongst others.
 
-	  For additional information, design information can be found 
+	  For additional information, design information can be found
 	  in <http://lc.linux.or.jp/lc2002/papers/niibe0919p.pdf>.
 
 	  This should only be disabled for special cases where alternate
-- 
2.41.0

