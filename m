Return-Path: <linuxppc-dev+bounces-729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 554DB963D07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:31:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXyh6HsFz2ysB;
	Thu, 29 Aug 2024 17:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724916684;
	cv=none; b=JulSER6UWrUQGONda1XSeGRsZ6isyG0teEAOYkVp96HAUm48vkwx5NLWPBd+T85oFEP/s6dCeIXEYw2yPUUcvOpO/ZC8HAiixwQ4povh4cMI0sSMc49qWWmNaelS62EDeh6+we0lZiCbMkko0pzjKXCg93oNRG7ypdWiDpTzmQ1kDhHhIuMwOjGl2F+8898TBKW5H88aulp0dUM2EEtk7CrbFKw97CIWEolzhH4MZpdOKlqHyypL42auxomc8ji0gEgzMlaTTxmi9bBOGdA8gVO5Utx07RrxBE9KnVYe+bbtLs6Dv/iFf3EXOtHbPkrMBaw8SBQvREh8k8l+pTA9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724916684; c=relaxed/relaxed;
	bh=mzy7EyrlX+BzOPBD0uMQ8N6l4HwDeloVfYpRJzPTRgE=;
	h=X-Greylist:Content-Type:DKIM-Signature:Mime-Version:Subject:
	 X-Report-Abuse:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:
	 Message-Id:References:To:X-Migadu-Flow; b=Slzt7Uuem184hj607J8+s0xQOP63FvZ00BAw8dD7T1v+DyM6wvujSQOS0nPUHndP8XSAl3kG2lOS7HHjQirV2awLnncZAJlJfb/cfiYgRrsQkt/GSDr30dxoc4qGSCPNFlFWrcPUNdgjG5Zjy8FxmeZpiKI2ywfihtW2ZAZzEhJr/01SSMVln9z3vWDI1iDVz3AYtrNlnSmpLbo/W7BRTDuZ6SnRAFmG2dV1gJZqbk6xrTstaXlku3lu8EZHUW5VHy/xixZqGegCjA4YmaFew9bqRMNtO8kCgqe4OOwxQdHv8ccmPLv7M50AcBo7rJbTZawhifn2mxtnYC5dMPaNsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BckY9+6b; dkim-atps=neutral; spf=pass (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BckY9+6b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 13894 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 17:31:24 AEST
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXyh4Dg2z2ypj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:31:24 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724916664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzy7EyrlX+BzOPBD0uMQ8N6l4HwDeloVfYpRJzPTRgE=;
	b=BckY9+6bvyxbg2ieSc5wtrZHrNS+aAr5eMJ9rmRtFrw5YEvqcz/MKiyV8DGGwUFsh04SAK
	4/4S9HrxdWnaS/9Eo4dclcCjs/j+JbU1OscQ+AaFfC/EKe+gEMbbNqr9PKYcYIiaMcm51E
	2YSQmc3pLSUSL4niBe3OfUYw629o6gs=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2 06/14] mm: handle_pte_fault() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <5acabedfae7ded01b075960b4a91f2e15b4d76b5.1724310149.git.zhengqi.arch@bytedance.com>
Date: Thu, 29 Aug 2024 15:30:26 +0800
Cc: David Hildenbrand <david@redhat.com>,
 Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 vishal.moola@gmail.com,
 peterx@redhat.com,
 ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F8142C5-9579-4F5A-B654-62E1E3183F0E@linux.dev>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <5acabedfae7ded01b075960b4a91f2e15b4d76b5.1724310149.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Aug 22, 2024, at 15:13, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> In handle_pte_fault(), we may modify the vmf->pte after acquiring the
> vmf->ptl, so convert it to using pte_offset_map_rw_nolock(). But since =
we
> will do the pte_same() check, so there is no need to get pmdval to do
> pmd_same() check, just pass a dummy variable to it.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

A nit below.

> ---
> mm/memory.c | 12 ++++++++++--
> 1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/mm/memory.c b/mm/memory.c
> index 93c0c25433d02..7b6071a0e21e2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5499,14 +5499,22 @@ static vm_fault_t handle_pte_fault(struct =
vm_fault *vmf)
> 		vmf->pte =3D NULL;
> 		vmf->flags &=3D ~FAULT_FLAG_ORIG_PTE_VALID;
> 	} else {
> + 		pmd_t dummy_pmdval;
> +
> 	/*
> 	 * A regular pmd is established and it can't morph into a huge
> 	 * pmd by anon khugepaged, since that takes mmap_lock in write
> 	 * mode; but shmem or file collapse to THP could still morph
> 	 * it into a huge pmd: just retry later if so.
> +	 *
> +	 * Use the maywrite version to indicate that vmf->pte will be

Not "will be", should be "may be".

> +	 * modified, but since we will use pte_same() to detect the
> +	 * change of the pte entry, there is no need to get pmdval, so
> +	 * just pass a dummy variable to it.
> 	 */
> - 	vmf->pte =3D pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
> -					 vmf->address, &vmf->ptl);
> +	vmf->pte =3D pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
> +					    vmf->address, &dummy_pmdval,
> +					    &vmf->ptl);
> 	if (unlikely(!vmf->pte))
> 		return 0;
> 	vmf->orig_pte =3D ptep_get_lockless(vmf->pte);
> --=20
> 2.20.1
>=20


