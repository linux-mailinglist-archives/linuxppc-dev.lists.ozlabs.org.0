Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56A87F66C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 05:34:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZTAFK3kI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzJls3Pnnz3d3g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 15:34:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZTAFK3kI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ad; helo=out-173.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 422 seconds by postgrey-1.37 at boromir; Tue, 19 Mar 2024 15:33:53 AEDT
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [IPv6:2001:41d0:203:375::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzJl52js3z3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 15:33:52 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1710822380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgOYrA8AEdh1woTHtD2vW3ca3PCtrZkdcZD77qbWikM=;
	b=ZTAFK3kIV8AKtSNFLFj4r5t0E2RLRk79ahMgFgMUh3jepMgCaS/mVJWw+RNCCrBHBN52gG
	NXM8ti3nDdYB1W5KBlYW6GIieZZXNfTfpKEBYqCv/yKV1dd9Ool2dQxzcp3DvEWHCDX49h
	rpX1jczrZg5j7IQxr3uyYzwVPdmEh3E=
Mime-Version: 1.0
Subject: Re: [PATCH v2 05/14] mm/sparc: Change pXd_huge() behavior to exclude
 swap entries
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240318200404.448346-6-peterx@redhat.com>
Date: Tue, 19 Mar 2024 12:25:39 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <744C19CB-4AE0-472B-ABD8-2064EB04FDA0@linux.dev>
References: <20240318200404.448346-1-peterx@redhat.com>
 <20240318200404.448346-6-peterx@redhat.com>
To: Peter Xu <peterx@redhat.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-arm-kernel@lists.infradead.org, Andreas Larsson <andreas@gaisler.com>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Mar 19, 2024, at 04:03, peterx@redhat.com wrote:
>=20
> From: Peter Xu <peterx@redhat.com>
>=20
> Please refer to the previous patch on the reasoning for x86.  Now =
sparc is
> the only architecture that will allow swap entries to be reported as
> pXd_huge().  After this patch, all architectures should forbid swap =
entries
> in pXd_huge().
>=20
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> arch/sparc/mm/hugetlbpage.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
> index b432500c13a5..d31c2cec35c9 100644
> --- a/arch/sparc/mm/hugetlbpage.c
> +++ b/arch/sparc/mm/hugetlbpage.c
> @@ -409,14 +409,12 @@ pte_t huge_ptep_get_and_clear(struct mm_struct =
*mm, unsigned long addr,
>=20
> int pmd_huge(pmd_t pmd)
> {
> - 	return !pmd_none(pmd) &&
> - 	(pmd_val(pmd) & (_PAGE_VALID|_PAGE_PMD_HUGE)) !=3D _PAGE_VALID;
> + 	return pmd_leaf(pmd);;

There is a redundant semicolon in the end.

Thanks.

> }
>=20
> int pud_huge(pud_t pud)
> {
> - 	return !pud_none(pud) &&
> - 	(pud_val(pud) & (_PAGE_VALID|_PAGE_PUD_HUGE)) !=3D _PAGE_VALID;
> + 	return pud_leaf(pud);
> }
>=20
> static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
> --=20
> 2.44.0
>=20

