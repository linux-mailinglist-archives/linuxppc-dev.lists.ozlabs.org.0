Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D16BC0CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 00:23:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcRJg57zHz3f3n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 10:22:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSBX/E4J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSBX/E4J;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcRGl0w0mz3bh9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 10:21:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678922479; x=1710458479;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=hTHmFfjOsB4OVepCRKtPKTfrpQQ+NPJymzD64IX4dgI=;
  b=SSBX/E4JSNcbKnQDVyYoXlpBgTkwvjOGDBcavzw0PhY1IJSTilSuwRaY
   v6pBsbi8X/hAU0sRIy5I9JkqrRJqkyfS+TKzkLR85GWdabEmqjyUGpqS8
   OUwVGnYmLRx3J14C4xdKUMn2rp+A0CmkM6E4PMoIZ+OjABlqu7le9H5i8
   tLJkeAwfJ3K8QDEQpBKxLMmrexldXqmoRfSsZzhr2vP81SLH7K5sufIRU
   HMAekGGw8cAsPcp6GC37vPCm+It8BwcPyVLdyERpu+2YA0xdBh9CC9qki
   aZ7GC0AwGYzMwCHoaT1be7gNIvwBhcZ11ClvWG5Jed6en0aqqIAQyE9gx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365527051"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="365527051"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="672915091"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="672915091"
Received: from iweiny-desk3.amr.corp.intel.com (HELO localhost) ([10.212.196.133])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:01 -0700
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 15 Mar 2023 16:20:54 -0700
Subject: [PATCH 1/3] x86, uaccess: Remove memcpy_page_flushcache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221230-kmap-x86-v1-1-15f1ecccab50@intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678922459; l=1867;
 i=ira.weiny@intel.com; s=20221222; h=from:subject:message-id;
 bh=hTHmFfjOsB4OVepCRKtPKTfrpQQ+NPJymzD64IX4dgI=;
 b=R22Wk9eXfxke9PcTFFNPFdA1VAjkKHUHCkHh1AmhPOofA7NfgRUw0cVsSIqTFK5KdEdll3UM1
 g6ReFh5l0vcC3FUcAcbPNkHsO4AUXpCGvxlsHRQDHtFWxKTP8cIfI60
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

kmap_atomic() is deprecated and used in memcpy_page_flushcache().

Remove the unnecessary memcpy_page_flushcache() call.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Dan Williams" <dan.j.williams@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/x86/include/asm/uaccess_64.h | 2 --
 arch/x86/lib/usercopy_64.c        | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index d13d71af5cf6..c6b1dcded364 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -62,8 +62,6 @@ extern long __copy_user_nocache(void *dst, const void __user *src,
 				unsigned size, int zerorest);
 
 extern long __copy_user_flushcache(void *dst, const void __user *src, unsigned size);
-extern void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
-			   size_t len);
 
 static inline int
 __copy_from_user_inatomic_nocache(void *dst, const void __user *src,
diff --git a/arch/x86/lib/usercopy_64.c b/arch/x86/lib/usercopy_64.c
index 6c1f8ac5e721..f515542f017f 100644
--- a/arch/x86/lib/usercopy_64.c
+++ b/arch/x86/lib/usercopy_64.c
@@ -136,13 +136,4 @@ void __memcpy_flushcache(void *_dst, const void *_src, size_t size)
 	}
 }
 EXPORT_SYMBOL_GPL(__memcpy_flushcache);
-
-void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
-		size_t len)
-{
-	char *from = kmap_atomic(page);
-
-	memcpy_flushcache(to, from + offset, len);
-	kunmap_atomic(from);
-}
 #endif

-- 
2.39.2

