Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08F1C9E76
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 00:28:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J7Qr04TczDqsw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Xk4W14wM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J2ff5QbzzDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 04:53:30 +1000 (AEST)
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 679342495D;
 Thu,  7 May 2020 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588877609;
 bh=kWpXTKUl5SLDwdL/OuCFJc8i4rRGOi1NqEX5H1qbazs=;
 h=Date:From:To:Cc:Subject:From;
 b=Xk4W14wM9ZxNeT3smEAGC+5SjWJOn6uUrsSZd77MFFQ0JkGXxQboJehLexrDxgU0X
 gF7QVPpjs8O7MYeLs+0nPdA6bUaYAJAd3MAP5MBZOjBoT/oktNB26hpms+EmtHiUMd
 C+fjEmsN04syZ/iEEdRVNXOYHARnQJS7I0taq/Cs=
Date: Thu, 7 May 2020 13:57:55 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/mm: Replace zero-length array with flexible-array
Message-ID: <20200507185755.GA15014@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 08 May 2020 08:20:46 +1000
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 arch/powerpc/mm/hugetlbpage.c                   |    2 +-
 tools/testing/selftests/powerpc/pmu/ebb/trace.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 33b3461d91e8..d06efb946c7d 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -253,7 +253,7 @@ int __init alloc_bootmem_huge_page(struct hstate *h)
 struct hugepd_freelist {
 	struct rcu_head	rcu;
 	unsigned int index;
-	void *ptes[0];
+	void *ptes[];
 };
 
 static DEFINE_PER_CPU(struct hugepd_freelist *, hugepd_freelist_cur);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/trace.h b/tools/testing/selftests/powerpc/pmu/ebb/trace.h
index 7c0fb5d2bdb1..da2a3be5441f 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/trace.h
+++ b/tools/testing/selftests/powerpc/pmu/ebb/trace.h
@@ -18,7 +18,7 @@ struct trace_entry
 {
 	u8 type;
 	u8 length;
-	u8 data[0];
+	u8 data[];
 };
 
 struct trace_buffer
@@ -26,7 +26,7 @@ struct trace_buffer
 	u64  size;
 	bool overflow;
 	void *tail;
-	u8   data[0];
+	u8   data[];
 };
 
 struct trace_buffer *trace_buffer_allocate(u64 size);
-- 
2.26.2


