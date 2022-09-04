Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3C5AC429
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 13:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ML91n712Nz3bmL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 21:50:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Uw7YffOg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ML91D5hRmz2xJL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Sep 2022 21:49:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Uw7YffOg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ML91C2gWQz4xD3;
	Sun,  4 Sep 2022 21:49:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662292176;
	bh=bKqRG6bbjWf4+zXv++X3GOUqHw+5BEUesl1XOH03L+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Uw7YffOgZPnmgBp6TK63LEy7ghgapx/1/o+S2lrTttIriH8Uf6Aw+fA0CvnhCfJob
	 QR5u4nvxWn4iof9YBgdEMN6abL3KvBiuubuLIpoqLE4PWNBwj7YCF3LL6NGY5wK+YF
	 2/eEjU3GK4QyMwwYACESiGHFBBPg2ZYnDq8y3pTSwi6HXQUOoxRiirooaSCPbAhcGt
	 rBKeM1INkwFt3rs1V9zpJLnJzZJAEJ/B4/tmHUlJ0scCd1B/0szive/CEac8iTLdal
	 VdAGUPRkl+tNL1Bzryy54iXUXYEvcZVziJGYwmtCJR7FeXamkFuhYZYYFRB/FHnNnf
	 j0Jy4shd5wK1Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, David Hildenbrand
 <david@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
In-Reply-To: <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com>
 <Yw5AOZ/Kc5f3UP+s@monkey> <Yw6Bpsow+gUMlHCU@monkey>
 <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey>
 <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
 <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
Date: Sun, 04 Sep 2022 21:49:34 +1000
Message-ID: <87ilm3tl4h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> +Resending with valid powerpc list address
>
> Le 02/09/2022 =C3=A0 20:52, David Hildenbrand a =C3=A9crit=C2=A0:
>>>>> Adding Christophe on Cc:
>>>>>
>>>>> Christophe do you know if is_hugepd is true for all hugetlb entries, =
not
>>>>> just hugepd?
>
> is_hugepd() is true if and only if the directory entry points to a huge=20
> page directory and not to the normal lower level directory.
>
> As far as I understand if the directory entry is not pointing to any=20
> lower directory but is a huge page entry, pXd_leaf() is true.

Yes.

Though historically it's pXd_huge() which is used to test that, which is
gated by CONFIG_HUGETLB_PAGE.

The leaf versions are newer and test whether the entry is a PTE
regardless of whether CONFIG_HUGETLB_PAGE is enabled. Which is needed
for PTDUMP if the kernel mapping uses huge pages independently of
CONFIG_HUGETLB_PAGE, which is true on at least powerpc.

>>>>>
>>>>> On systems without hugepd entries, I guess ptdump skips all hugetlb e=
ntries.
>>>>> Sigh!
>
> As far as I can see, ptdump_pXd_entry() handles the pXd_leaf() case.
>
>>>>
>>>> IIUC, the idea of ptdump_walk_pgd() is to dump page tables even outside
>>>> VMAs (for debugging purposes?).
>>>>
>>>> I cannot convince myself that that's a good idea when only holding the
>>>> mmap lock in read mode, because we can just see page tables getting
>>>> freed concurrently e.g., during concurrent munmap() ... while holding
>>>> the mmap lock in read we may only walk inside VMA boundaries.
>>>>
>>>> That then raises the questions if we're only calling this on special M=
Ms
>>>> (e.g., init_mm) whereby we cannot really see concurrent munmap() and
>>>> where we shouldn't have hugetlb mappings or hugepd entries.
>
> At least on powerpc, PTDUMP handles only init_mm.
>
> Hugepage are used at least on powerpc 8xx for linear memory mapping, see
>
> commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel=20
> via huge pages")
> commit cf209951fa7f ("powerpc/8xx: Map linear memory with huge pages")
>
> hugepds may also be used in the future to use huge pages for vmap and=20
> vmalloc, see commit a6a8f7c4aa7e ("powerpc/8xx: add support for huge=20
> pages on VMAP and VMALLOC")
>
> As far as I know, ppc64 also use huge pages for VMAP and VMALLOC, see
>
> commit d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")
> commit 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")

64-bit also uses huge pages for the kernel linear mapping (aka. direct
mapping), and on newer systems (>=3D Power9) those also appear in the
kernel page tables.

cheers
