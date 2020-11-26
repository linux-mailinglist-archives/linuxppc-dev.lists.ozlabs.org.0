Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B99452C53E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:25:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChcR11YPyzDrMW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 23:25:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=b/jro0EA; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chc7r6tRgzDrCp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 23:12:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=x9yV4MsXYN4evctZVqtcAzH/k7fEYwzyTJA1mVQojdk=; b=b/jro0EAjRk9MVIUYG9HS+fW/3
 hQeipYAoaciICIAXFSNoYpO8L00XWfDKB3ZewmWxlbskGKaId+H1j2tegtmICsyq5ZtWQRvf/t0z3
 8o3IhsZmflSd+ew+6aO3V8Fp/MW9nhqtz1931ruCjacJjznuxw0AIY3gQom/yH20bZ60oIf/g0qeG
 cf/tfPV5eR03FvXWAVxAq4hrL2urC9LwM89RDGnWP9guOOTcPfNh6EuU1yyrM1rcCidRqTWO22yjg
 wDXdNqjxI2TqnVuZDk++W1rFZdWwNlBCj0toDHq8mLhsa2vGU42auBG0qUqKyte2RQLqvT6oldcNn
 QVIe2Kig==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiG7b-0000OH-S8; Thu, 26 Nov 2020 12:11:36 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E3D0530767C;
 Thu, 26 Nov 2020 13:11:34 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 087362D167BEA; Thu, 26 Nov 2020 13:11:34 +0100 (CET)
Message-ID: <20201126121121.364451610@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 26 Nov 2020 13:01:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com, mingo@kernel.org, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 eranian@google.com
Subject: [PATCH v2 6/6] powerpc/8xx: Implement pXX_leaf_size() support
References: <20201126120114.071913521@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, ak@linux.intel.com, catalin.marinas@arm.com,
 peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, willy@infradead.org,
 linux-kernel@vger.kernel.org, dave.hansen@intel.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, sparclinux@vger.kernel.org, will@kernel.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:

> I can help with powerpc 8xx. It is a 32 bits powerpc. The PGD has 1024
> entries, that means each entry maps 4M.
>
> Page sizes are 4k, 16k, 512k and 8M.
>
> For the 8M pages we use hugepd with a single entry. The two related PGD
> entries point to the same hugepd.
>
> For the other sizes, they are in standard page tables. 16k pages appear
> 4 times in the page table. 512k entries appear 128 times in the page
> table.
>
> When the PGD entry has _PMD_PAGE_8M bits, the PMD entry points to a
> hugepd with holds the single 8M entry.
>
> In the PTE, we have two bits: _PAGE_SPS and _PAGE_HUGE
>
> _PAGE_HUGE means it is a 512k page
> _PAGE_SPS means it is not a 4k page
>
> The kernel can by build either with 4k pages as standard page size, or
> 16k pages. It doesn't change the page table layout though.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -135,6 +135,29 @@ static inline pte_t pte_mkhuge(pte_t pte
 }
 
 #define pte_mkhuge pte_mkhuge
+
+static inline unsigned long pgd_leaf_size(pgd_t pgd)
+{
+	if (pgd_val(pgd) & _PMD_PAGE_8M)
+		return SZ_8M;
+	return SZ_4M;
+}
+
+#define pgd_leaf_size pgd_leaf_size
+
+static inline unsigned long pte_leaf_size(pte_t pte)
+{
+	pte_basic_t val = pte_val(pte);
+
+	if (val & _PAGE_HUGE)
+		return SZ_512K;
+	if (val & _PAGE_SPS)
+		return SZ_16K;
+	return SZ_4K;
+}
+
+#define pte_leaf_size pte_leaf_size
+
 #endif
 
 #endif /* __KERNEL__ */


