Return-Path: <linuxppc-dev+bounces-1553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D249983DA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 09:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCWNY44pBz2yVv;
	Tue, 24 Sep 2024 17:15:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::bd"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727162141;
	cv=none; b=CsnjE109EN5dxkN5OHTBoB/FS2gLqbb4LpKUDg4id8PXfFRpcuP0vfwwGbmi89nrbZ2EnEQlUEcdobkFybE9j0W3xeGD8V3lCGZ+81OsFJzXhRBiN9LLlflsd1rIEpaHnCkNhG0v3d6trjHlvkxhD16iqU/+OUvGWyCyUi9sYIorjm7fLYNitq7nLm+Qc5pCMRRNAhgoPd6mqkNWrP4KxYo8BcxshQAqtl2C0D5ZRkX1GOFZkisD6Z07RomhoNhFszHUJqB3/NggyDR16WqpiGrlLhBru4IilG+ZG+1nrgNBIhKCoEaCbt6z8rsByv+dW3E40XovFKfXqIlmm/PbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727162141; c=relaxed/relaxed;
	bh=Zp82X1gEUMsH0cTyMFodXGf6d6eN6K2y3H6Zo3CY6V4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=TCnZ0xs3ss1BvA0QZMbGS8s0ustBIcXr+InEvH2FA6/27IOoTzsTu+AR+ghXfJnBEh2pTlScrqCRidrCROcrtWPFaR9AkwUqKyEVXmGN1Ygl42IKN4X3jW6xmG/wzOebLmD/Y0dxrXlVG9o31obEoDyR5lPdq8YWaTJAkVUIuh64AXeL7mm/xA1HpJMWf7Jj0JIIacZurI1u0QzNX6gdfcldSQS/FCLkY9EgFErX4/yPplDwwxXD2TgUAA5wRuH6Ucq9iLca04qIBq004iav+q7t4oeO9GqkV8PSMVyunIFH8XdHL45cJqJJdf0lD+y1kFN+bUgK1+hIfdMn9nucGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GvYaS4II; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::bd; helo=out-189.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GvYaS4II;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bd; helo=out-189.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [IPv6:2001:41d0:203:375::bd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCWNW6w4nz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 17:15:39 +1000 (AEST)
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727162106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zp82X1gEUMsH0cTyMFodXGf6d6eN6K2y3H6Zo3CY6V4=;
	b=GvYaS4II90o9GYK0iIC3QYuCKDMNOPlhACCwBTXmCWQBvZjlyKPBPGlCFb0RWXghLLfHZW
	IhHdZAjaAOJhJfaIc+yWwY5pxLcX1yMPuxnDbZQ5WHYWUhOj2e9vlBrFcoz7xCj+XQZOdE
	O9XuikCg+BwKGuiqghMOTI64McSTg2E=
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 07/13] mm: khugepaged: collapse_pte_mapped_thp() use pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <07d975c50fe09c246e087303b39998430b1a66bd.1727148662.git.zhengqi.arch@bytedance.com>
Cc: david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Date: Tue, 24 Sep 2024 15:14:25 +0800
Message-Id: <79699B24-0D99-4051-91F3-5695D32D62AC@linux.dev>
References: <07d975c50fe09c246e087303b39998430b1a66bd.1727148662.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> =EF=BB=BFIn collapse_pte_mapped_thp(), we may modify the pte and pmd entry=
 after
> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
> this time, the pte_same() check is not performed after the PTL held. So we=

> should get pgt_pmd and do pmd_same() check after the ptl held.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> mm/khugepaged.c | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 6498721d4783a..8ab79c13d077f 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, un=
signed long addr,
>    if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>        pml =3D pmd_lock(mm, pmd);
>=20
> -    start_pte =3D pte_offset_map_nolock(mm, pmd, haddr, &ptl);
> +    start_pte =3D pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl=
);
>    if (!start_pte)        /* mmap_lock + page lock should prevent this */
>        goto abort;
>    if (!pml)
> @@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, un=
signed long addr,
>    else if (ptl !=3D pml)
>        spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>=20
> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
> +        goto abort;
> +
>    /* step 2: clear page table and adjust rmap */
>    for (i =3D 0, addr =3D haddr, pte =3D start_pte;
>         i < HPAGE_PMD_NR; i++, addr +=3D PAGE_SIZE, pte++) {
> @@ -1645,7 +1648,6 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, un=
signed long addr,
>        nr_ptes++;
>    }
>=20
> -    pte_unmap(start_pte);
>    if (!pml)
>        spin_unlock(ptl);
>=20
> @@ -1658,13 +1660,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, u=
nsigned long addr,
>    /* step 4: remove empty page table */
>    if (!pml) {
>        pml =3D pmd_lock(mm, pmd);
> -        if (ptl !=3D pml)
> +        if (ptl !=3D pml) {
>            spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
> +            if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
> +                spin_unlock(pml);
> +                goto abort;

Drop the reference of folio and the mm counter twice at the label of abort a=
nd the step 3.

> +            }
> +        }
>    }
>    pgt_pmd =3D pmdp_collapse_flush(vma, haddr, pmd);
>    pmdp_get_lockless_sync();
>    if (ptl !=3D pml)
>        spin_unlock(ptl);
> +    pte_unmap(start_pte);
>    spin_unlock(pml);

Why not?

pte_unmap_unlock(start_pte, ptl);
if (pml !=3D ptl)
        spin_unlock(pml);

>=20
>    mmu_notifier_invalidate_range_end(&range);
> --
> 2.20.1

