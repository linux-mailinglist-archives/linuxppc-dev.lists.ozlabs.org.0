Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F40556BC0D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 00:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcRLg6G3Bz3f5m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 10:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KTQc3Cgw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KTQc3Cgw;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcRGm4Z3Hz3bh9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 10:21:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678922480; x=1710458480;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oUNGwFKGfCNeFmEzlWbIjgeX9cjyVruIm7Nzwqf6dqc=;
  b=KTQc3Cgw7zcz+nHGQp3GtgtbGoN5YUFPvWfPzRDEDWC8fLlulfgsxM8d
   RRwv30F/vDuABBV53Va3+KNfk4SjNy0droZL4QyXcKqGUo5sXQ0nb613Q
   xkhtS51etOw4OWkokKBSX8EFbYhJCyhEHJoch38Ict4QlnnyxfCOCzuyt
   UdizCt6ADePdtRI1MjroOI4pXLAad5oiJoxPoA7f3oYk4C2kqtyiUH4Tb
   GwVrsa7Fv+/AzQOtWBGO34tR9L4MZRJl2z8yl/lFIvzznCuwFCdVVPUDy
   00E6OWd9+G2482GTsX8TX8pP+tTldDWj2aHWyp6et6LSa0CwpUwQCt7bT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365527083"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="365527083"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="672915107"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="672915107"
Received: from iweiny-desk3.amr.corp.intel.com (HELO localhost) ([10.212.196.133])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:03 -0700
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 15 Mar 2023 16:20:56 -0700
Subject: [PATCH 3/3] arm: uaccess: Remove memcpy_page_flushcache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221230-kmap-x86-v1-3-15f1ecccab50@intel.com>
References: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
In-Reply-To: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678922459; l=1951;
 i=ira.weiny@intel.com; s=20221222; h=from:subject:message-id;
 bh=oUNGwFKGfCNeFmEzlWbIjgeX9cjyVruIm7Nzwqf6dqc=;
 b=029LLrpbd7VMZrAQfKYKO6kviK6io7TXxDI1OO3rXTtKEVFcqP25qXdcWxYdxjw/HbQDbRkgI
 tKmFt4wL/zHCVE+R+u24nRdfFvw80JCiCHp6v+2+M42Wcom5uYjWOyD
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=brwqReAJklzu/xZ9FpSsMPSQ/qkSalbg6scP3w809Ec=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 21b56c847753 ("iov_iter: get rid of separate bvec and xarray
callbacks") removed the calls to memcpy_page_flushcache().

Remove the unnecessary memcpy_page_flushcache() call.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Dan Williams" <dan.j.williams@intel.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arm64/include/asm/uaccess.h    | 2 --
 arch/arm64/lib/uaccess_flushcache.c | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 5c7b2f9d5913..4bf2c0975a82 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -449,8 +449,6 @@ extern long strncpy_from_user(char *dest, const char __user *src, long count);
 extern __must_check long strnlen_user(const char __user *str, long n);
 
 #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
-struct page;
-void memcpy_page_flushcache(char *to, struct page *page, size_t offset, size_t len);
 extern unsigned long __must_check __copy_user_flushcache(void *to, const void __user *from, unsigned long n);
 
 static inline int __copy_from_user_flushcache(void *dst, const void __user *src, unsigned size)
diff --git a/arch/arm64/lib/uaccess_flushcache.c b/arch/arm64/lib/uaccess_flushcache.c
index baee22961bdb..7510d1a23124 100644
--- a/arch/arm64/lib/uaccess_flushcache.c
+++ b/arch/arm64/lib/uaccess_flushcache.c
@@ -19,12 +19,6 @@ void memcpy_flushcache(void *dst, const void *src, size_t cnt)
 }
 EXPORT_SYMBOL_GPL(memcpy_flushcache);
 
-void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
-			    size_t len)
-{
-	memcpy_flushcache(to, page_address(page) + offset, len);
-}
-
 unsigned long __copy_user_flushcache(void *to, const void __user *from,
 				     unsigned long n)
 {

-- 
2.39.2

