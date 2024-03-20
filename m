Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497B881708
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 19:03:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eMNZ2qoD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0Gfb2hpYz3vcb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 05:03:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eMNZ2qoD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0Gdq0KFLz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 05:02:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 473CF6105C;
	Wed, 20 Mar 2024 18:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3104AC433C7;
	Wed, 20 Mar 2024 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710957754;
	bh=umPOZa/jmcrCOuLgb4lIp085lQH3xXqnpU9motcuApg=;
	h=From:To:Cc:Subject:Date:From;
	b=eMNZ2qoDP61ykdvnIIcV4ZHzzHnTNZ4qdh23XzSN0Ei9JCExg30FCnJUHwsQURvVM
	 uuaIpZefH0Zukdoqi+z/aYwI89XYzaF23LHY+rgV8+L9wmiIzkEUZ+ljGPa6LLCKXr
	 Ari8Xx7qP+x2sfDiltFHw0GuUFlYF3ZqGtgaEBU9B71rJefgAzZk5VD7zx0kIu0r7U
	 Bvfia0i+YGPl7SMCuCS7qiY9CWuibLcmzFpjYi+MG/9hFP++p7v7+i7W+khKzmg0Xa
	 1T/LLC2MaqCUTSVuG1de4+Iy94uwqhYU78VYOF9vJXNdIlQMDxMDRwQ1jJEsDMST9r
	 SfSuVDFOcJz4g==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH] vdso: use CONFIG_PAGE_SHIFT in vdso/datapage.h
Date: Wed, 20 Mar 2024 19:02:15 +0100
Message-Id: <20240320180228.136371-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Both the vdso rework and the CONFIG_PAGE_SHIFT changes were merged during
the v6.9 merge window, so it is now possible to use CONFIG_PAGE_SHIFT
instead of including asm/page.h in the vdso.

This avoids the workaround for arm64 and addresses a build warning
for powerpc64:

In file included from <built-in>:4:
In file included from /home/arnd/arm-soc/arm-soc/lib/vdso/gettimeofday.c:5:
In file included from ../include/vdso/datapage.h:25:
arch/powerpc/include/asm/page.h:230:9: error: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
  230 |         return __pa(kaddr) >> PAGE_SHIFT;
      |                ^~~~~~~~~~~
arch/powerpc/include/asm/page.h:217:37: note: expanded from macro '__pa'
  217 |         VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);              \
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'VIRTUAL_WARN_ON'
  202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x))
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
   88 |         int __ret_warn_on = !!(x);                              \
      |                                ^

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
See-also: 8b3843ae3634 ("vdso/datapage: Quick fix - use asm/page-def.h for ARM64")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 3 +--
 include/vdso/datapage.h                      | 8 +-------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index f0a4cf01e85c..78302f6c2580 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -4,7 +4,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <asm/page.h>
 #include <asm/vdso/timebase.h>
 #include <asm/barrier.h>
 #include <asm/unistd.h>
@@ -95,7 +94,7 @@ const struct vdso_data *__arch_get_vdso_data(void);
 static __always_inline
 const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
 {
-	return (void *)vd + PAGE_SIZE;
+	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
 }
 #endif
 
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 5d5c0b8efff2..c71ddb6d4691 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -19,12 +19,6 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
-#ifdef CONFIG_ARM64
-#include <asm/page-def.h>
-#else
-#include <asm/page.h>
-#endif
-
 #ifdef CONFIG_ARCH_HAS_VDSO_DATA
 #include <asm/vdso/data.h>
 #else
@@ -132,7 +126,7 @@ extern struct vdso_data _timens_data[CS_BASES] __attribute__((visibility("hidden
  */
 union vdso_data_store {
 	struct vdso_data	data[CS_BASES];
-	u8			page[PAGE_SIZE];
+	u8			page[1U << CONFIG_PAGE_SHIFT];
 };
 
 /*
-- 
2.39.2

