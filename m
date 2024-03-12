Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B7B879EAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 23:29:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IAS66i75;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvSxs28mHz3cDw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 09:29:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IAS66i75;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvSx25JYfz30Dg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 09:29:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710282551; x=1741818551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SOxmdONZG+ooJ46ryKwSr/UQJN1BRbIVpZR9p2Kx8ZQ=;
  b=IAS66i753CdMQtAqghirYqfidmYoVsJpc9SVN56noraScVLoXaqxhbqs
   M7jStfFYxSd7ECLQuP5IGHOSNVEe0EorvHOAnRdEBQZ2CISiTw9xo1tyF
   EnQwgT8KWsJBEQ6bE/mQ+Qhh1DkvpyceNOli+JWOASE/7kd9zGIO4bjn8
   ygEr3QcmCC+HmTGYHYyIBodYhwWyE4QnSAMUvZO9FGatcLn/JPKBigf8c
   fXa2hjkp0d7xABogBTIKdGgBibl7RLTcp5VNg8wzcEjb44T5JB09SCtKw
   SF8oQbm4uciaXRXVT9E5CVLrsp8XelyYetljgHllXWJrv4t9BgFr6lwPW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5192008"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5192008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 15:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16356860"
Received: from gargayus-mobl1.amr.corp.intel.com (HELO rpedgeco-desk4.intel.com) ([10.255.231.196])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 15:29:03 -0700
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	bp@alien8.de,
	broonie@kernel.org,
	dave.hansen@linux.intel.com,
	debug@rivosinc.com,
	hpa@zytor.com,
	keescook@chromium.org,
	kirill.shutemov@linux.intel.com,
	luto@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	x86@kernel.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH v3 07/12] powerpc: Use initializer for struct vm_unmapped_area_info
Date: Tue, 12 Mar 2024 15:28:38 -0700
Message-Id: <20240312222843.2505560-8-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
References: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, rick.p.edgecombe@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Future changes will need to add a new member to struct
vm_unmapped_area_info. This would cause trouble for any call site that
doesn't initialize the struct. Currently every caller sets each member
manually, so if new members are added they will be uninitialized and the
core code parsing the struct will see garbage in the new member.

It could be possible to initialize the new member manually to 0 at each
call site. This and a couple other options were discussed, and a working
consensus (see links) was that in general the best way to accomplish this
would be via static initialization with designated member initiators.
Having some struct vm_unmapped_area_info instances not zero initialized
will put those sites at risk of feeding garbage into vm_unmapped_area() if
the convention is to zero initialize the struct and any new member addition
misses a call site that initializes each member manually.

It could be possible to leave the code mostly untouched, and just change
the line:
struct vm_unmapped_area_info info
to:
struct vm_unmapped_area_info info = {};

However, that would leave cleanup for the members that are manually set
to zero, as it would no longer be required.

So to be reduce the chance of bugs via uninitialized members, instead
simply continue the process to initialize the struct this way tree wide.
This will zero any unspecified members. Move the member initializers to the
struct declaration when they are known at that time. Leave the members out
that were manually initialized to zero, as this would be redundant for
designated initializers.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/lkml/202402280912.33AEE7A9CF@keescook/#t
Link: https://lore.kernel.org/lkml/j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs/
---
v3:
 - Fixed spelling errors in log
 - Be consistent about field vs member in log

Hi,

This patch was split and refactored out of a tree-wide change [0] to just
zero-init each struct vm_unmapped_area_info. The overall goal of the
series is to help shadow stack guard gaps. Currently, there is only one
arch with shadow stacks, but two more are in progress. It is compile tested
only.

There was further discussion that this method of initializing the structs
while nice in some ways has a greater risk of introducing bugs in some of
the more complicated callers. Since this version was reviewed my arch
maintainers already, leave it as was already acknowledged.

Thanks,

Rick

[0] https://lore.kernel.org/lkml/20240226190951.3240433-6-rick.p.edgecombe@intel.com/
---
 arch/powerpc/mm/book3s64/slice.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index c0b58afb9a47..6c7ac8c73a6c 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -282,12 +282,12 @@ static unsigned long slice_find_area_bottomup(struct mm_struct *mm,
 {
 	int pshift = max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
 	unsigned long found, next_end;
-	struct vm_unmapped_area_info info;
-
-	info.flags = 0;
-	info.length = len;
-	info.align_mask = PAGE_MASK & ((1ul << pshift) - 1);
-	info.align_offset = 0;
+	struct vm_unmapped_area_info info = {
+		.flags = 0,
+		.length = len,
+		.align_mask = PAGE_MASK & ((1ul << pshift) - 1),
+		.align_offset = 0
+	};
 	/*
 	 * Check till the allow max value for this mmap request
 	 */
@@ -326,13 +326,14 @@ static unsigned long slice_find_area_topdown(struct mm_struct *mm,
 {
 	int pshift = max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
 	unsigned long found, prev;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {
+		.flags = VM_UNMAPPED_AREA_TOPDOWN,
+		.length = len,
+		.align_mask = PAGE_MASK & ((1ul << pshift) - 1),
+		.align_offset = 0
+	};
 	unsigned long min_addr = max(PAGE_SIZE, mmap_min_addr);
 
-	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
-	info.length = len;
-	info.align_mask = PAGE_MASK & ((1ul << pshift) - 1);
-	info.align_offset = 0;
 	/*
 	 * If we are trying to allocate above DEFAULT_MAP_WINDOW
 	 * Add the different to the mmap_base.
-- 
2.34.1

