Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9083103C53
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 14:42:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J3mJ6DcSzDqYt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 00:42:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="XjvVHPkG"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J3dk5htTzDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 00:37:14 +1100 (AEDT)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 563F422527;
 Wed, 20 Nov 2019 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574257031;
 bh=89jwJ4YgSifTwu+8Hwfz7I1uOD0mYccjN2Q9h/yjSlQ=;
 h=From:To:Cc:Subject:Date:From;
 b=XjvVHPkGi/BNuVPzwsbdOGxTyC9QGzdo3iQ/KXCGo6FAI5RK8b7r/Wa0xlGTtTPE+
 0TRDynFVqCR88V6gexS70y/cngObVOKQRry9Jr4JwERGXQiqE+NrQb7Pl9Jqlq7GeV
 af1udVCs5Q/lbYt3VRHg5CcxgZ+Wd+BfXwTASC2E=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:37:08 +0800
Message-Id: <20191120133708.12011-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/powerpc/Kconfig.debug             | 18 +++++++++---------
 arch/powerpc/platforms/Kconfig.cputype |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index c59920920ddc..4e1d39847462 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -122,8 +122,8 @@ config XMON_DEFAULT_RO_MODE
 	depends on XMON
 	default y
 	help
-          Operate xmon in read-only mode. The cmdline options 'xmon=rw' and
-          'xmon=ro' override this default.
+	  Operate xmon in read-only mode. The cmdline options 'xmon=rw' and
+	  'xmon=ro' override this default.
 
 config DEBUGGER
 	bool
@@ -222,7 +222,7 @@ config PPC_EARLY_DEBUG_44x
 	help
 	  Select this to enable early debugging for IBM 44x chips via the
 	  inbuilt serial port.  If you enable this, ensure you set
-          PPC_EARLY_DEBUG_44x_PHYSLOW below to suit your target board.
+	  PPC_EARLY_DEBUG_44x_PHYSLOW below to suit your target board.
 
 config PPC_EARLY_DEBUG_40x
 	bool "Early serial debugging for IBM/AMCC 40x CPUs"
@@ -325,7 +325,7 @@ config PPC_EARLY_DEBUG_44x_PHYSLOW
 	default "0x40000200"
 	help
 	  You probably want 0x40000200 for ebony boards and
-          0x40000300 for taishan
+	  0x40000300 for taishan
 
 config PPC_EARLY_DEBUG_44x_PHYSHIGH
 	hex "EPRN of early debug UART physical address"
@@ -359,9 +359,9 @@ config FAIL_IOMMU
 	  If you are unsure, say N.
 
 config PPC_PTDUMP
-        bool "Export kernel pagetable layout to userspace via debugfs"
-        depends on DEBUG_KERNEL && DEBUG_FS
-        help
+	bool "Export kernel pagetable layout to userspace via debugfs"
+	depends on DEBUG_KERNEL && DEBUG_FS
+	help
 	  This option exports the state of the kernel pagetables to a
 	  debugfs file. This is only useful for kernel developers who are
 	  working in architecture specific areas of the kernel - probably
@@ -390,8 +390,8 @@ config PPC_DEBUG_WX
 
 config PPC_FAST_ENDIAN_SWITCH
 	bool "Deprecated fast endian-switch syscall"
-        depends on DEBUG_KERNEL && PPC_BOOK3S_64
-        help
+	depends on DEBUG_KERNEL && PPC_BOOK3S_64
+	help
 	  If you're unsure what this is, say N.
 
 config KASAN_SHADOW_OFFSET
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 303752f97c19..d3dee3f5113b 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -421,7 +421,7 @@ config PPC_PERF_CTRS
        def_bool y
        depends on PERF_EVENTS && PPC_HAVE_PMU_SUPPORT
        help
-         This enables the powerpc-specific perf_event back-end.
+	 This enables the powerpc-specific perf_event back-end.
 
 config FORCE_SMP
 	# Allow platforms to force SMP=y by selecting this
-- 
2.17.1

