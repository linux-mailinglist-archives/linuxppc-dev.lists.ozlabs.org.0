Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 907C34D5714
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 02:01:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF71V2zyGz3c2W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 12:01:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ow6x3pIX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ow6x3pIX; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF6yG6dFcz30Fw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 11:59:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960343; x=1678496343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ygcwAbQ0NfIqlDdywkiojUz0KGKAHWj5E1qd9qQFb4=;
 b=Ow6x3pIXJXr796tQYRo71+XtTMbm9/orDCmyo/7an5pCRCMb6+U2Oue3
 zf1sJaBjl/1hBtKH1a2e/md1q2eOzZQkxu5ZPjjOfzt45jkZmzwrRd+8P
 Q506srCVsqSzZfYCLWZJcKpPoVQmuurXN4/ZJPDi1VVKOWtgRwtgYcz+J
 zY5UvgyAchOoHswAXSWHfXTkCei93Mol6nJDCXZ4mWykZkQrIsr6pKyU0
 Y9sEFGRcVnPrdQrR+Smj00LdRcAmeQ4zMC6KICm8JBCVoun79ohC8VIXX
 Llsbvy9W9KNkpFJw5uDD4xvP5hVfUH5HFw7YScVqJB0RpT2TLVVsCOfPX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="316177690"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="316177690"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="554989246"
Received: from gdavids1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.65.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:49 -0800
From: ira.weiny@intel.com
To: Dave Hansen <dave.hansen@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH 5/5] x86/pkeys: Standardize on u8 for pkey type
Date: Thu, 10 Mar 2022 16:57:42 -0800
Message-Id: <20220311005742.1060992-6-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311005742.1060992-1-ira.weiny@intel.com>
References: <20220311005742.1060992-1-ira.weiny@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The number of pkeys supported on x86 and powerpc are much smaller than a
u16 value can hold.  It is desirable to standardize on the type for
pkeys.  powerpc currently supports the most pkeys at 32.  u8 is plenty
large for that.

Standardize on the pkey types by changing u16 to u8.

To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/x86/include/asm/pgtable.h | 4 ++--
 arch/x86/include/asm/pkru.h    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 8a9432fb3802..cb89f1224d8a 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1357,7 +1357,7 @@ static inline pmd_t pmd_swp_clear_uffd_wp(pmd_t pmd)
 }
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
 
-static inline u16 pte_flags_pkey(unsigned long pte_flags)
+static inline u8 pte_flags_pkey(unsigned long pte_flags)
 {
 #ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
 	/* ifdef to avoid doing 59-bit shift on 32-bit values */
@@ -1367,7 +1367,7 @@ static inline u16 pte_flags_pkey(unsigned long pte_flags)
 #endif
 }
 
-static inline bool __pkru_allows_pkey(u16 pkey, bool write)
+static inline bool __pkru_allows_pkey(u8 pkey, bool write)
 {
 	u32 pkru = read_pkru();
 
diff --git a/arch/x86/include/asm/pkru.h b/arch/x86/include/asm/pkru.h
index 74f0a2d34ffd..06d088f06229 100644
--- a/arch/x86/include/asm/pkru.h
+++ b/arch/x86/include/asm/pkru.h
@@ -16,13 +16,13 @@ extern u32 init_pkru_value;
 #define pkru_get_init_value()	0
 #endif
 
-static inline bool __pkru_allows_read(u32 pkru, u16 pkey)
+static inline bool __pkru_allows_read(u32 pkru, u8 pkey)
 {
 	int pkru_pkey_bits = pkey * PKRU_BITS_PER_PKEY;
 	return !(pkru & (PKRU_AD_BIT << pkru_pkey_bits));
 }
 
-static inline bool __pkru_allows_write(u32 pkru, u16 pkey)
+static inline bool __pkru_allows_write(u32 pkru, u8 pkey)
 {
 	int pkru_pkey_bits = pkey * PKRU_BITS_PER_PKEY;
 	/*
-- 
2.35.1

