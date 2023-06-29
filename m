Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4020742672
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 14:30:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UPfSiLPg;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=L3PyCj5j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHps5tJRz3bv6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 22:30:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UPfSiLPg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=L3PyCj5j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHjG0nSPz30K1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 22:25:38 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 50F121FD67;
	Thu, 29 Jun 2023 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8/hObzYgPS0TDvHlNkxQWLSeXSJyMjTeBMLqYqFK4w=;
	b=UPfSiLPg0fPgXj6DVWbIwAx8SsBG5GL3OD/7mLd65j8fwmU+DvPt3QzSfJKiRMSESoepX9
	eM5NP2Jl7avazGdPsovrA89jdGZnFXHxxT3O/UdtnP6AQBQmMmB0fb0hdUmBE/YVBR8zBv
	CQYBtniEcZ5wJ20vfbvuSi9ax+7JLg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8/hObzYgPS0TDvHlNkxQWLSeXSJyMjTeBMLqYqFK4w=;
	b=L3PyCj5jKQ5vE7MYne4nWCsAiDM0bCWXnp9ECQ/thRxLRW/+klbPAr42RqiLHE8RIsU2gZ
	akbya49XJu79VVCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0F3313905;
	Thu, 29 Jun 2023 12:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uIppJvB2nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:20:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 09/12] drivers: Add dependencies on CONFIG_ARCH_HAS_SCREEN_INFO
Date: Thu, 29 Jun 2023 13:45:48 +0200
Message-ID: <20230629121952.10559-10-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, Dexuan Cui <decui@microsoft.com>, Javier Martinez Canillas <javierm@redhat.com>, linux-csky@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, loongarch@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kerne
 l.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Various files within drivers/ depend on the declaration of the
screen_info variable. Add this information to Kconfig.

In the case of the dummy console, the dependency exists only
on ARM. Ignore it on !ARM platforms.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/firmware/Kconfig      | 1 +
 drivers/firmware/efi/Kconfig  | 1 +
 drivers/gpu/drm/Kconfig       | 1 +
 drivers/hv/Kconfig            | 1 +
 drivers/video/console/Kconfig | 2 ++
 drivers/video/fbdev/Kconfig   | 4 ++++
 6 files changed, 10 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 0432737bbb8b4..65bbf7422f1db 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -228,6 +228,7 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 
 config SYSFB
 	bool
+	depends on ARCH_HAS_SCREEN_INFO
 	select BOOT_VESA_SUPPORT
 
 config SYSFB_SIMPLEFB
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 043ca31c114eb..963d305421e50 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -225,6 +225,7 @@ config EFI_DISABLE_PCI_DMA
 config EFI_EARLYCON
 	def_bool y
 	depends on SERIAL_EARLYCON && !ARM && !IA64
+	depends on ARCH_HAS_SCREEN_INFO
 	select FONT_SUPPORT
 	select ARCH_USE_MEMREMAP_PROT
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f4253..63dfc3391d2ff 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -366,6 +366,7 @@ source "drivers/gpu/drm/sprd/Kconfig"
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
+	depends on ARCH_HAS_SCREEN_INFO
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	help
diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 00242107d62e0..3730c9b42a9bd 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -6,6 +6,7 @@ config HYPERV
 	tristate "Microsoft Hyper-V client drivers"
 	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
 		|| (ACPI && ARM64 && !CPU_BIG_ENDIAN)
+	depends on ARCH_HAS_SCREEN_INFO
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
 	select OF_EARLY_FLATTREE if OF
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index a2a88d42edf0c..b39e2ae039783 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -10,6 +10,7 @@ config VGA_CONSOLE
 	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
 		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
 		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
+	depends on ARCH_HAS_SCREEN_INFO
 	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
 	default y
 	help
@@ -48,6 +49,7 @@ config SGI_NEWPORT_CONSOLE
 
 config DUMMY_CONSOLE
 	bool
+	depends on ARCH_HAS_SCREEN_INFO || !ARM
 	default y
 
 config DUMMY_CONSOLE_COLUMNS
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index cecf15418632d..e11d85e802bc7 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -655,6 +655,7 @@ config FB_UVESA
 config FB_VESA
 	bool "VESA VGA graphics support"
 	depends on (FB = y) && X86
+	depends on ARCH_HAS_SCREEN_INFO
 	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -669,6 +670,7 @@ config FB_VESA
 config FB_EFI
 	bool "EFI-based Framebuffer Support"
 	depends on (FB = y) && !IA64 && EFI
+	depends on ARCH_HAS_SCREEN_INFO
 	select APERTURE_HELPERS
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select FB_CFB_FILLRECT
@@ -1089,6 +1091,7 @@ config FB_CARILLO_RANCH
 config FB_INTEL
 	tristate "Intel 830M/845G/852GM/855GM/865G/915G/945G/945GM/965G/965GM support"
 	depends on FB && PCI && X86 && AGP_INTEL && EXPERT
+	depends on ARCH_HAS_SCREEN_INFO
 	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -2185,6 +2188,7 @@ config FB_BROADSHEET
 config FB_HYPERV
 	tristate "Microsoft Hyper-V Synthetic Video support"
 	depends on FB && HYPERV
+	depends on ARCH_HAS_SCREEN_INFO
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.41.0

