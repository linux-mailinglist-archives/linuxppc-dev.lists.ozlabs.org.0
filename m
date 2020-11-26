Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A98152C5257
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:49:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChZJL67smzDqsD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:49:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChZGH3GG7zDqlp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:47:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tFBEb0BLu3uXogjw3SOLqhrulKz6jh3zxahm8XIOiP8=; b=X3cXyvr1KiNTPPNYsE55p34qzs
 01WR57/NTCJJBTLnooSCiqxRLfe1NoFr12FKiB6sIEBBSutg9ejvt0PVkeecAF+mpv6dTf8ALS0Gm
 xhqbpCHFBeyIrf+sFcr5qLhcRmKH4/FE0Pt3zYF5jFf46D9MsXl8GMUOivcOmSz7vK+xfdAkyV351
 jzDDCgoug6jn/+HFsM1y/JKSSLVp9DlLQ8ZRbbpJ9c6bp/kBfbJCLFmcooHmQW9b98d3DJDJ2/FR0
 xeXgp6zkPj+bioLqm25WdK36TJtI5sB9sBZ3lALxjkdNEuHxVS3oL6SFnqB+2FlF9dqVtYpLh7738
 LsYFbjzA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiEnd-0003Eg-Ub; Thu, 26 Nov 2020 10:46:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 38B21306DD8;
 Thu, 26 Nov 2020 11:46:51 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 137AC20162619; Thu, 26 Nov 2020 11:46:51 +0100 (CET)
Date: Thu, 26 Nov 2020 11:46:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 0/5] perf/mm: Fix PERF_SAMPLE_*_PAGE_SIZE
Message-ID: <20201126104651.GG3092@hirez.programming.kicks-ass.net>
References: <20201113111901.743573013@infradead.org>
 <16ad8cab-08e2-27a7-6803-baadc6b8721b@csgroup.eu>
 <2a32b00b-2214-3283-58e0-9cb0ff4bd728@csgroup.eu>
 <20201120122004.GG3021@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120122004.GG3021@hirez.programming.kicks-ass.net>
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
Cc: mark.rutland@arm.com, aneesh.kumar@linux.ibm.com, willy@infradead.org,
 catalin.marinas@arm.com, will@kernel.org, alexander.shishkin@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 acme@kernel.org, davem@davemloft.net, dave.hansen@intel.com,
 ak@linux.intel.com, eranian@google.com, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, jolsa@redhat.com, mingo@kernel.org,
 kirill.shutemov@linux.intel.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 20, 2020 at 01:20:04PM +0100, Peter Zijlstra wrote:

> > > I can help with powerpc 8xx. It is a 32 bits powerpc. The PGD has 1024
> > > entries, that means each entry maps 4M.
> > > 
> > > Page sizes are 4k, 16k, 512k and 8M.
> > > 
> > > For the 8M pages we use hugepd with a single entry. The two related PGD
> > > entries point to the same hugepd.
> > > 
> > > For the other sizes, they are in standard page tables. 16k pages appear
> > > 4 times in the page table. 512k entries appear 128 times in the page
> > > table.
> > > 
> > > When the PGD entry has _PMD_PAGE_8M bits, the PMD entry points to a
> > > hugepd with holds the single 8M entry.
> > > 
> > > In the PTE, we have two bits: _PAGE_SPS and _PAGE_HUGE
> > > 
> > > _PAGE_HUGE means it is a 512k page
> > > _PAGE_SPS means it is not a 4k page
> > > 
> > > The kernel can by build either with 4k pages as standard page size, or
> > > 16k pages. It doesn't change the page table layout though.
> > > 
> > > Hope this is clear. Now I don't really know to wire that up to your series.

Does the below accurately reflect things?

Let me go find a suitable cross-compiler ..

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 1581204467e1..fcc48d590d88 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -135,6 +135,29 @@ static inline pte_t pte_mkhuge(pte_t pte)
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
