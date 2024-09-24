Return-Path: <linuxppc-dev+bounces-1558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FFD984070
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 10:26:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCXxy5GFFz2yZ1;
	Tue, 24 Sep 2024 18:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727166374;
	cv=none; b=B6ZHuoN4i3gXijqEzWrvEcFXOY7u2jfCuoR+l0cJ8Fwmj4omEENpckjUGP+MpC6N5NN0Wi7c2KNA36vCYvKQcmdr4hp3WxYYxmOWpAEPYqIRN0DuAuHjM/Yo53TINAYXKYdSVtUliHPZb89N0JtLl3ykCV0g8Wu2+NnsjU7m9yRAXaLQ+DpfR6qpmCCmHiOjGd2DRzJ3kM1YzItxipNyVDjoRFWLlvsjRmz/NPm7MAGjaAfbpplgGvkvopT2h3una5dF+ymWXFvn7xnNvffhg5l9WwjjN2QJ3IQ+H/Ec5JhgUN1pImZmhtiLLk956t1YaBfbOZNd/3tEemvahfqpog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727166374; c=relaxed/relaxed;
	bh=1y5CwMb2yKa3w/NIt/ri0sQu3/1xDcimH4xSI7fLtgQ=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=OA4cKqcx9Ugj42ufxCR46IhQvJV9jWeiqQvbY2JmbzMiBhy7BY+ChDsEzkoGEePx46MD9dtc6/6sD/kpvcYAtqmz9UEbLgmm/u9nIf87LVMFwE+BzAXNNp67T6utLuWsjX1w+CYGRnt1EFFzyzoHr25DZc3HGlNzWDyaobf+mrdL9E8F4ECJjxcHW1oQgdOCBzTi5zungAvzWtZkCcO2JHZbjrdVy4R25wsf4PVAjVRqMHTEaDJqgruR13jif9fwYyqMycnaReaAnnG13QdzZG/QROo+RcTW4WJjZhb9ZXbyLpugXsdBKOWKfGsmjEtrT/HP3zMzSepkc9KEIeEmLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tjp0P3kf; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tjp0P3kf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [IPv6:2001:41d0:203:375::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCXxx02q2z2yY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 18:26:10 +1000 (AEST)
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727166344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1y5CwMb2yKa3w/NIt/ri0sQu3/1xDcimH4xSI7fLtgQ=;
	b=Tjp0P3kfHa/lcIBU5PC1B0bQQCvLGfyq8015xxHclGgdFLLPxO/1pTOinxm0BDuczsBQUv
	m5ZY1EvglHhF0Inymte3gC1+yKjYpSfigpVX8d8pHJhpC3jeMXjhqqORPMtLQ/ZViMl3ti
	cU3EvV03qYBYxqNC+aDS+qZDaTycsVA=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 10/13] mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 16:25:06 +0800
Message-Id: <E2AAD3DA-4C73-4785-939C-13164FA8543D@linux.dev>
References: <ecffb7d71363fa79048c0a929780215e0fa93491.1727148662.git.zhengqi.arch@bytedance.com>
Cc: david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <ecffb7d71363fa79048c0a929780215e0fa93491.1727148662.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>=20
> =EF=BB=BFIn the caller of map_pte(), we may modify the pvmw->pte after acq=
uiring
> the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
> this time, the pte_same() check is not performed after the pvmw->ptl held,=

> so we should get pmdval and do pmd_same() check to ensure the stability of=

> pvmw->pmd.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> mm/page_vma_mapped.c | 25 ++++++++++++++++++++-----
> 1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index ae5cc42aa2087..6410f29b37c1b 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -13,9 +13,11 @@ static inline bool not_found(struct page_vma_mapped_wal=
k *pvmw)
>    return false;
> }
>=20
> -static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)=

> +static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
> +            spinlock_t **ptlp)
> {
>    pte_t ptent;
> +    pmd_t pmdval;

Why declare a new variable? Can=E2=80=99t we use *pmdvalp instead?

>=20
>    if (pvmw->flags & PVMW_SYNC) {
>        /* Use the stricter lookup */
> @@ -25,6 +27,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, s=
pinlock_t **ptlp)
>        return !!pvmw->pte;
>    }
>=20
> +again:
>    /*
>     * It is important to return the ptl corresponding to pte,
>     * in case *pvmw->pmd changes underneath us; so we need to
> @@ -32,10 +35,11 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw,=
 spinlock_t **ptlp)
>     * proceeds to loop over next ptes, and finds a match later.
>     * Though, in most cases, page lock already protects this.
>     */
> -    pvmw->pte =3D pte_offset_map_nolock(pvmw->vma->vm_mm, pvmw->pmd,
> -                      pvmw->address, ptlp);
> +    pvmw->pte =3D pte_offset_map_rw_nolock(pvmw->vma->vm_mm, pvmw->pmd,
> +                         pvmw->address, &pmdval, ptlp);
>    if (!pvmw->pte)
>        return false;
> +    *pmdvalp =3D pmdval;
>=20
>    ptent =3D ptep_get(pvmw->pte);
>=20
> @@ -67,8 +71,13 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, s=
pinlock_t **ptlp)
>    } else if (!pte_present(ptent)) {
>        return false;
>    }
> +    spin_lock(*ptlp);
> +    if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) {
> +        pte_unmap_unlock(pvmw->pte, *ptlp);
> +        goto again;
> +    }
>    pvmw->ptl =3D *ptlp;
> -    spin_lock(pvmw->ptl);
> +
>    return true;
> }
>=20
> @@ -278,7 +287,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *=
pvmw)
>            step_forward(pvmw, PMD_SIZE);
>            continue;
>        }
> -        if (!map_pte(pvmw, &ptl)) {
> +        if (!map_pte(pvmw, &pmde, &ptl)) {
>            if (!pvmw->pte)
>                goto restart;
>            goto next_pte;
> @@ -307,6 +316,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk=
 *pvmw)
>        if (!pvmw->ptl) {
>            pvmw->ptl =3D ptl;
>            spin_lock(pvmw->ptl);
> +            if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {=

> +                pte_unmap_unlock(pvmw->pte, pvmw->ptl);
> +                pvmw->ptl =3D NULL;
> +                pvmw->pte =3D NULL;
> +                goto restart;
> +            }
>        }
>        goto this_pte;
>    } while (pvmw->address < end);
> --
> 2.20.1
>=20

