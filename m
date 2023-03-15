Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595E6BC0D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 00:23:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcRKh0WZPz3cgv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 10:23:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lc1O2mqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lc1O2mqX;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcRGl6t6xz3bh9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 10:21:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678922480; x=1710458480;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=nw/5j1jSpLgBUUzdvXc7MsautacAZY58cIXNBbOwElk=;
  b=Lc1O2mqXXdmdcMKpiITLhPmk1aHHqP3UxrsMilSiOSZLT6jBj5LKRzYh
   HCcQ2+bdLRoXbJgcA2Vub4c+jDpVrbaa0V0awGP6s0M8QK04Jt30qSZ/S
   yGWwhRXhZeii8d+7jvUmYbYXZdN3ZykTLXFsSjUtry3BbKN4O7IOUCv+F
   CBJuR5CetqlxWdFH4QP9lLgcTvUx2s8Z50r332j0514HdmKbDWNBSuvw/
   Ya5ErTNsUwSwn8ULl4yWy7QODpXkZRqoHN2rYlmfwlI3zyWJV9YRhXhO8
   xep1Ki5VQ7vi+gBPdpJz+jfIVQVnvOZuOkb+8aXGULQaTk15wMSIXs5NW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365527065"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="365527065"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="672915100"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="672915100"
Received: from iweiny-desk3.amr.corp.intel.com (HELO localhost) ([10.212.196.133])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:02 -0700
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 15 Mar 2023 16:20:55 -0700
Subject: [PATCH 2/3] powerpc: Remove memcpy_page_flushcache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221230-kmap-x86-v1-2-15f1ecccab50@intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678922459; l=1774;
 i=ira.weiny@intel.com; s=20221222; h=from:subject:message-id;
 bh=nw/5j1jSpLgBUUzdvXc7MsautacAZY58cIXNBbOwElk=;
 b=I19fBOZllVPuww2XPYb6Yj7SCTP0c5VvdEc1+udYFhYFeIDcPWfYUR9BHff5pGr5NQfrq/2HP
 Ku062ohYTaOB3XapC/cKDnTRLhJb/UBQCJE0wd6lYwaIKHy2W6KvNCQ
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

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Dan Williams" <dan.j.williams@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/powerpc/include/asm/uaccess.h | 2 --
 arch/powerpc/lib/pmem.c            | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 3ddc65c63a49..52378e641d38 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -361,8 +361,6 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
 
 extern long __copy_from_user_flushcache(void *dst, const void __user *src,
 		unsigned size);
-extern void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
-			   size_t len);
 
 static __must_check inline bool user_access_begin(const void __user *ptr, size_t len)
 {
diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index eb2919ddf9b9..4e724c4c01ad 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -85,10 +85,3 @@ void memcpy_flushcache(void *dest, const void *src, size_t size)
 	clean_pmem_range(start, start + size);
 }
 EXPORT_SYMBOL(memcpy_flushcache);
-
-void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
-	size_t len)
-{
-	memcpy_flushcache(to, page_to_virt(page) + offset, len);
-}
-EXPORT_SYMBOL(memcpy_page_flushcache);

-- 
2.39.2

