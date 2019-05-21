Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4784C247F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 08:18:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457QZK0PfrzDqNH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 16:18:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.77; helo=conuserg-10.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="qRhjmuYx"; 
 dkim-atps=neutral
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457QY037JMzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 16:17:40 +1000 (AEST)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x4L6H3Aj032461;
 Tue, 21 May 2019 15:17:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x4L6H3Aj032461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558419423;
 bh=XrIYM7aPLD1wF9IwpTW/Z8OCfZUnOmtJFdrupyPx8Jg=;
 h=From:To:Cc:Subject:Date:From;
 b=qRhjmuYxD1rELM9hqEW562/6ESLP8dewpyu3CRkbpHWF/HyEsjx4CGe5Z9rn8qLQ+
 gboSm5Et1KAj3cRJMaRBFPSH4UA7AkbxWqvj495Ob5JkS8H/a9sJA494+KEZvTfxoh
 3INjo03cOlwI6gYC0amArPqePIVHH8CDPPZEYRd8Gt/aS+niGNLLi2HBOly8hnGu9L
 XquUKHIO435JOzS08erKhaVC/V3+jc5FuO/Tf6AB8rEd15ACMZuObKOyldeDbk4Fas
 TyuVWDZrd55cnf86Y+vvNrnQ7cM0OsEo9jy9RD4igjtuKvrN/FgYG+TOTMjMz50Hdz
 /zHMLg0X9EnQA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/mm: mark more tlb functions as __always_inline
Date: Tue, 21 May 2019 15:16:59 +0900
Message-Id: <20190521061659.6073-1-yamada.masahiro@socionext.com>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_OPTIMIZE_INLINING enabled, Laura Abbott reported error
with gcc 9.1.1:

  arch/powerpc/mm/book3s64/radix_tlb.c: In function '_tlbiel_pid':
  arch/powerpc/mm/book3s64/radix_tlb.c:104:2: warning: asm operand 3 probably doesn't match constraints
    104 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
        |  ^~~
  arch/powerpc/mm/book3s64/radix_tlb.c:104:2: error: impossible constraint in 'asm'

Fixing _tlbiel_pid() is enough to address the warning above, but I
inlined more functions to fix all potential issues.

To meet the 'i' (immediate) constraint for the asm operands, functions
propagating propagated 'ric' must be always inlined.

Fixes: 9012d011660e ("compiler: allow all arches to enable CONFIG_OPTIMIZE_INLINING")
Reported-by: Laura Abbott <labbott@redhat.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/powerpc/mm/book3s64/hash_native.c |  8 +++--
 arch/powerpc/mm/book3s64/radix_tlb.c   | 44 +++++++++++++++-----------
 2 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index aaa28fd918fe..bc2c35c0d2b1 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -60,9 +60,11 @@ static inline void tlbiel_hash_set_isa206(unsigned int set, unsigned int is)
  * tlbiel instruction for hash, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
  */
-static inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
-					unsigned int pid,
-					unsigned int ric, unsigned int prs)
+static __always_inline void tlbiel_hash_set_isa300(unsigned int set,
+						   unsigned int is,
+						   unsigned int pid,
+						   unsigned int ric,
+						   unsigned int prs)
 {
 	unsigned long rb;
 	unsigned long rs;
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 4d841369399f..91c4242c1be3 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -29,9 +29,11 @@
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
  */
-static inline void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
-					unsigned int pid,
-					unsigned int ric, unsigned int prs)
+static __always_inline void tlbiel_radix_set_isa300(unsigned int set,
+						    unsigned int is,
+						    unsigned int pid,
+						    unsigned int ric,
+						    unsigned int prs)
 {
 	unsigned long rb;
 	unsigned long rs;
@@ -150,8 +152,8 @@ static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
 	trace_tlbie(lpid, 0, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
-				unsigned long ric)
+static __always_inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
+						unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -167,8 +169,8 @@ static inline void __tlbiel_lpid_guest(unsigned long lpid, int set,
 }
 
 
-static inline void __tlbiel_va(unsigned long va, unsigned long pid,
-			       unsigned long ap, unsigned long ric)
+static __always_inline void __tlbiel_va(unsigned long va, unsigned long pid,
+					unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -183,8 +185,8 @@ static inline void __tlbiel_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 1, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_va(unsigned long va, unsigned long pid,
-			      unsigned long ap, unsigned long ric)
+static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
+				       unsigned long ap, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -199,8 +201,10 @@ static inline void __tlbie_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
-			      unsigned long ap, unsigned long ric)
+static __always_inline void __tlbie_lpid_va(unsigned long va,
+					    unsigned long lpid,
+					    unsigned long ap,
+					    unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -239,7 +243,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
 /*
  * We use 128 set in radix mode and 256 set in hpt mode.
  */
-static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
+static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 {
 	int set;
 
@@ -341,7 +345,8 @@ static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
+static __always_inline void _tlbiel_lpid_guest(unsigned long lpid,
+					       unsigned long ric)
 {
 	int set;
 
@@ -381,8 +386,8 @@ static inline void __tlbiel_va_range(unsigned long start, unsigned long end,
 		__tlbiel_va(addr, pid, ap, RIC_FLUSH_TLB);
 }
 
-static inline void _tlbiel_va(unsigned long va, unsigned long pid,
-			      unsigned long psize, unsigned long ric)
+static __always_inline void _tlbiel_va(unsigned long va, unsigned long pid,
+				       unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
@@ -413,8 +418,8 @@ static inline void __tlbie_va_range(unsigned long start, unsigned long end,
 		__tlbie_va(addr, pid, ap, RIC_FLUSH_TLB);
 }
 
-static inline void _tlbie_va(unsigned long va, unsigned long pid,
-			      unsigned long psize, unsigned long ric)
+static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
+				      unsigned long psize, unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
@@ -424,8 +429,9 @@ static inline void _tlbie_va(unsigned long va, unsigned long pid,
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
-static inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
-			      unsigned long psize, unsigned long ric)
+static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
+					   unsigned long psize,
+					   unsigned long ric)
 {
 	unsigned long ap = mmu_get_ap(psize);
 
-- 
2.17.1

