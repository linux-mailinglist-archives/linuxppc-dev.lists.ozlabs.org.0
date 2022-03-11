Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 190F84D5710
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 02:01:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF70j0X39z3bTq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 12:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=myjLC7Qc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=myjLC7Qc; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF6y70Hp9z2y6K
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 11:58:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960335; x=1678496335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wzyA39JwdZxDDT/IXqrk8/yZKwNXu3aWKvXpfEakV14=;
 b=myjLC7Qccht0V//IVp3/bSaPHy9+OW+SAE/fSb94QUiI1gym9NyetN+0
 KTcwEtLEpyra5seMA64ZDCyTMjRimFuiRXEdQIAJef7fRgeTRgIimDrVs
 2RBCPen2I3J1aT2RD0a1nXwUY9XpqKnIYb1YuZ6ovG1E7JgKbwphayPJ7
 AJe//r4sVOPbtSPzpZgZyZx3h2mfjSXjzj2loGtKunc17AYNO7nPd2DHQ
 b3Nsnyic8c51kIzrjfvqLZ1dnhygciq6ZxzvDFiKKMy9fCLw3DTHyA4h1
 4eMyOxF01SKLYNRiGwi7pVZyxSD7ET/isQbE8TEmrtiEHAqvDF7zq1wIg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="341883873"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="341883873"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="538750565"
Received: from gdavids1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.65.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:47 -0800
From: ira.weiny@intel.com
To: Dave Hansen <dave.hansen@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH 3/5] powerpc/pkeys: Properly type pkey in init_{i}amr()
Date: Thu, 10 Mar 2022 16:57:40 -0800
Message-Id: <20220311005742.1060992-4-ira.weiny@intel.com>
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

Negative values passed to pkeyshift() will cause an overflow of the amr
and imar values.  Pkey should not be negative in this call path and u8
is large enough for the 32 pkeys available on powerpc.

Change pkey to u8 in init_amr() and init_iamr().

To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 753e62ba67af..d6456f8846de 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -310,7 +310,7 @@ void pkey_mm_init(struct mm_struct *mm)
 	mm->context.execute_only_pkey = execute_only_key;
 }
 
-static inline void init_amr(int pkey, u8 init_bits)
+static inline void init_amr(u8 pkey, u8 init_bits)
 {
 	u64 new_amr_bits = (((u64)init_bits & 0x3UL) << pkeyshift(pkey));
 	u64 old_amr = current_thread_amr() & ~((u64)(0x3ul) << pkeyshift(pkey));
@@ -318,7 +318,7 @@ static inline void init_amr(int pkey, u8 init_bits)
 	current->thread.regs->amr = old_amr | new_amr_bits;
 }
 
-static inline void init_iamr(int pkey, u8 init_bits)
+static inline void init_iamr(u8 pkey, u8 init_bits)
 {
 	u64 new_iamr_bits = (((u64)init_bits & 0x1UL) << pkeyshift(pkey));
 	u64 old_iamr = current_thread_iamr() & ~((u64)(0x1ul) << pkeyshift(pkey));
-- 
2.35.1

