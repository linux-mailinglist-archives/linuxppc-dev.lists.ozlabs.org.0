Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE518C6AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 05:58:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kBNx1GqTzDrdd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 15:58:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48kBJx3npBzDrRV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 15:54:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9C29101E;
 Thu, 19 Mar 2020 21:54:37 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41CAD3F52E;
 Thu, 19 Mar 2020 21:54:35 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH 1/2] powerpc/mm: Drop platform defined pmd_mknotpresent()
Date: Fri, 20 Mar 2020 10:24:16 +0530
Message-Id: <1584680057-13753-2-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Platform needs to define pmd_mknotpresent() for generic pmdp_invalidate()
only when __HAVE_ARCH_PMDP_INVALIDATE is not subscribed. Otherwise platform
specific pmd_mknotpresent() is not required. Hence just drop it.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 201a69e6a355..5d4bc19c2a3c 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1168,10 +1168,6 @@ static inline int pmd_large(pmd_t pmd)
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
 }
 
-static inline pmd_t pmd_mknotpresent(pmd_t pmd)
-{
-	return __pmd(pmd_val(pmd) & ~_PAGE_PRESENT);
-}
 /*
  * For radix we should always find H_PAGE_HASHPTE zero. Hence
  * the below will work for radix too
-- 
2.20.1

