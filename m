Return-Path: <linuxppc-dev+bounces-6819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CADA5780A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 04:46:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8pxR1N4Lz3cVf;
	Sat,  8 Mar 2025 14:46:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741405611;
	cv=none; b=Brv8BBaO3jLi7dNqslJ5tArxHf+I4cI6pWUcm/g9KBjxgvCp//nOj8CyQD2fJDMz3xCYOXLDzy2P/CDwD3EmBbcvty41Y0ldy4eMvXk7Up78NzoKjOj4Ceq8uQ6DrfDO42uXOPoVxGJorDlq4upZRH3TF6tPV5oIgQIC5FAhtbMLW+P5k3mpBekgSPd9qFqY00Srl57eeeilPbQ0hdbN/AmMiBGHiMgD/hPb7ajIhKo7YwgurH7WXygZMYAptEbtkJ0F38/qNPgLQ9Ab/5goWpVQbkdLLwf9eLw8d4qkiCge3cLlFR0XiI4dJlbil5wpOAf+F+VTcQFrqd2V3qOQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741405611; c=relaxed/relaxed;
	bh=l+R5uedmu6hTWGNSkw9RDukjj025+N+Pb13Tn45y/KQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Chno9+zD5pdssJzQux6HHg3M59b7HHN/oztfVtNBRUD7n2FUCLfkywNSYxnAwaWWjDZlcFzsm2X4usw+sixXs9yf9Tvg88K2ASnpkzeHy1Hx5ZTL7n7a6qZDdZnMe6cU9WpXIVfbYLK7QuGT3biGMPSmKcDdMXPri5VgcBaA/fUxtz/TQ3tfG+whRCR1ufyq33u4j6ntM5PB8xPXK1Xy73slpTe5k3lj5NDoUR668ENXkYhJ/wpO8HEiH+ABt1+RdhfGdJJ6egM+dc+PVP+/NHjoe9n38xSicsju43n5O5EMCgCKUlDw1p10QxD5n40EpGRvRebDDX5J91wtLSM3/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GcuEODOQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GcuEODOQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8pxP4W7Wz3c7M
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 14:46:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11401A45895;
	Sat,  8 Mar 2025 03:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7834CC4CEE4;
	Sat,  8 Mar 2025 03:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741405607;
	bh=OCYNvETcEnHO+GI4lGqCy+nWyMXMfT4zUH07QqE/k8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GcuEODOQDa0OhM5v/avNyU7o4G8sBsqX8M3u5DpSYxtewX3zEtKu0k/bADpo1nltI
	 6r9IomJ4a2ES2AMyvP9upGGoqE6JdMDawiH90K6ZUNw8XjiwNPCHKURA48fBmIgayZ
	 D6CpjmXbOOztX0Hd4H9omeuhtkPiKYeTsq8jCAWKoU+24vpBLt8vSBBcKtRk7qUvLu
	 7ihjE6rj2jd8fXeBCmvlGigfrSXzQX0gc6/eszImMc6+ipIA6XyJRx1PpC5InzQxlF
	 hz+tAZwd7znZFSETWU1rZ6y75yc2CDCS6bBTbF4f90hPgXp2ZEhDR3fA1sE1D4vSPG
	 fztcYMSuJ4NoQ==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH] book3s64/radix : Align section vmemmap start address to
 PAGE_SIZE
In-Reply-To: <20250226043426.224494-1-donettom@linux.ibm.com>
References: <20250226043426.224494-1-donettom@linux.ibm.com>
Date: Sat, 08 Mar 2025 09:16:41 +0530
Message-ID: <yq5ajz90rxpa.fsf@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Donet Tom <donettom@linux.ibm.com> writes:

> A vmemmap altmap is a device-provided region used to provide
> backing storage for struct pages. For each namespace, the altmap
> should belong to that same namespace. If the namespaces are
> created unaligned, there is a chance that the section vmemmap
> start address could also be unaligned. If the section vmemmap
> start address is unaligned, the altmap page allocated from the
> current namespace might be used by the previous namespace also.
> During the free operation, since the altmap is shared between two
> namespaces, the previous namespace may detect that the page does
> not belong to its altmap and incorrectly assume that the page is a
> normal page. It then attempts to free the normal page, which leads
> to a kernel crash.
>
> In this patch, we are aligning the section vmemmap start address
> to PAGE_SIZE. After alignment, the start address will not be
> part of the current namespace, and a normal page will be allocated
> for the vmemmap mapping of the current section. For the remaining
> sections, altmaps will be allocated. During the free operation,
> the normal page will be correctly freed.
>
> Without this patch
> ==================
> NS1 start               NS2 start
>  _________________________________________________________
> |         NS1               |            NS2              |
>  ---------------------------------------------------------
> | Altmap| Altmap | .....|Altmap| Altmap | ...........
> |  NS1  |  NS1   |      | NS2  |  NS2   |
>
> In the above scenario, NS1 and NS2 are two namespaces. The vmemmap
> for NS1 comes from Altmap NS1, which belongs to NS1, and the
> vmemmap for NS2 comes from Altmap NS2, which belongs to NS2.
>
> The vmemmap start for NS2 is not aligned, so Altmap NS2 is shared
> by both NS1 and NS2. During the free operation in NS1, Altmap NS2
> is not part of NS1's altmap, causing it to attempt to free an
> invalid page.
>
> With this patch
> ===============
> NS1 start               NS2 start
>  _________________________________________________________
> |         NS1               |            NS2              |
>  ---------------------------------------------------------
> | Altmap| Altmap | .....| Normal | Altmap | Altmap |.......
> |  NS1  |  NS1   |      |  Page  |  NS2   |  NS2   |
>
> If the vmemmap start for NS2 is not aligned then we are allocating
> a normal page. NS1 and NS2 vmemmap will be freed correctly.
>
> Fixes: 368a0590d954("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
> Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 311e2112d782..b22d5f6147d2 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1120,6 +1120,8 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>  	pmd_t *pmd;
>  	pte_t *pte;
>
       /*
        * Make sure we align the start vmemmap addr so that we calculate
       the correct start_pfn in altmap boundary check to decided whether
       we should use altmap or RAM based backing memory allocation. Also
       the address need to be aligned for set_pte operation.

       If the start addr is already PMD_SIZE aligned we will try to use
       a pmd mapping. We don't want to be too aggressive here beacause
       that will cause more allocations in RAM. So only if the namespace
       vmemmap start addr is PMD_SIZE aligned we will use PMD mapping.

       */

May be with some comments as above?

> +	start = ALIGN_DOWN(start, PAGE_SIZE);
> +
>  	for (addr = start; addr < end; addr = next) {
>  		next = pmd_addr_end(addr, end);
>  
> -- 
> 2.43.5

