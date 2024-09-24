Return-Path: <linuxppc-dev+bounces-1560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A79840B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 10:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCYGP3mbzz2yZS;
	Tue, 24 Sep 2024 18:40:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727167229;
	cv=none; b=ACMTYCl644Qd4O8za3skEsngBRq0GtRA9RJ72wc4YTWB+3uVsScGMTbhVeJv7EwHpplssOq4XZPqeDlmGc91ZIfANCO20t3J3Af1DcGlVuHpBOji0+BH+fKRA5Bl7izkp7cqHv0Sdx/sDPkUlN/55/8M6xUR5tbhsRogSRtiHS5cCc7V1RFSbllAScSYRF3l6Qrz2DOHiyoyoR1lZnV17ETJv45ZSbuduQBWCXjbB9VaW64fpVxGfvfUPwsNR6C+Q8h17KFLckoy8DrlxA09vwO1pkQN6ueC1ebdlvjj1WSFMEEgpAMVConCrUR8CRXPjHP6qs+u3jjNGypDTMJVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727167229; c=relaxed/relaxed;
	bh=4km3vsfny3o5BuNaxdFJ/U7V0O7MH61EKUY+GsV/2wA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=X2GT07Ae5lrJx5PG10Lj5vEPA7JDDIKgfeVfaL8BJedu1imyTw7nuMZeiolbCI1qxOTjvypPesHI4HNAraHEQcHyr4uMrUtCxmiKJIgjFnvS2DZDN7BtK0blR9/GfHfHktc+bNTu1vjle7U507pdrGIBN97eeBGpzpLFMextjqSwMN1qWclIlp8ka039CqelD9fazHllgu9huv3DyWct5OyjX4yyGgUV6ND0ADy0cXYrZ8d2xdnbKtXGvqFU6qHYsj5RosarS1EIKGg/H9x2JMh2Hw5DMJJT2pWKP5oDpkYPgwQsVxK0GnpbyDs4vuzZTI63obPAolrEyf7r/MIWQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qYRwuhju; dkim-atps=neutral; spf=pass (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qYRwuhju;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCYGM0TSSz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 18:40:24 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727167205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4km3vsfny3o5BuNaxdFJ/U7V0O7MH61EKUY+GsV/2wA=;
	b=qYRwuhjuDKlxnM/KJKgBrqSmqcTgbcxQ7HXl3g2JNtkOjZYV17+wRZDFCKQXqHc68L9c7v
	y8TrvQ77VqadFjPeqaHB9sWncvhGTmgHdZ5K8QdMTP+GIHeYhhbn1TR4K/B9KqlqdwXKd2
	kbxVbvr+6D6xF8pktefXkU8cq0pwu1Y=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v4 10/13] mm: page_vma_mapped_walk: map_pte() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <cccc53fc-29c2-43c0-83d4-d330bade70c7@bytedance.com>
Date: Tue, 24 Sep 2024 16:39:13 +0800
Cc: david@redhat.com,
 hughd@google.com,
 willy@infradead.org,
 vbabka@kernel.org,
 akpm@linux-foundation.org,
 rppt@kernel.org,
 vishal.moola@gmail.com,
 peterx@redhat.com,
 ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CBAEE27-9C4E-4902-B6BB-B6029FD42E8D@linux.dev>
References: <ecffb7d71363fa79048c0a929780215e0fa93491.1727148662.git.zhengqi.arch@bytedance.com>
 <E2AAD3DA-4C73-4785-939C-13164FA8543D@linux.dev>
 <cccc53fc-29c2-43c0-83d4-d330bade70c7@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 16:33, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
>=20
>=20
> On 2024/9/24 16:25, Muchun Song wrote:
>>> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>>>=20
>>> =EF=BB=BFIn the caller of map_pte(), we may modify the pvmw->pte =
after acquiring
>>> the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
>>> this time, the pte_same() check is not performed after the pvmw->ptl =
held,
>>> so we should get pmdval and do pmd_same() check to ensure the =
stability of
>>> pvmw->pmd.
>>>=20
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>> mm/page_vma_mapped.c | 25 ++++++++++++++++++++-----
>>> 1 file changed, 20 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>> index ae5cc42aa2087..6410f29b37c1b 100644
>>> --- a/mm/page_vma_mapped.c
>>> +++ b/mm/page_vma_mapped.c
>>> @@ -13,9 +13,11 @@ static inline bool not_found(struct =
page_vma_mapped_walk *pvmw)
>>>    return false;
>>> }
>>>=20
>>> -static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t =
**ptlp)
>>> +static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t =
*pmdvalp,
>>> +            spinlock_t **ptlp)
>>> {
>>>    pte_t ptent;
>>> +    pmd_t pmdval;
>> Why declare a new variable? Can=E2=80=99t we use *pmdvalp instead?
>=20
> It's just a coding habit, both are fine for me.

Agree. But sometime it could make code look a little simpler.

>=20
>>>=20
>>>    if (pvmw->flags & PVMW_SYNC) {
>>>        /* Use the stricter lookup */
>>> @@ -25,6 +27,7 @@ static bool map_pte(struct page_vma_mapped_walk =
*pvmw, spinlock_t **ptlp)
>>>        return !!pvmw->pte;
>>>    }
>>>=20
>>> +again:
>>>    /*
>>>     * It is important to return the ptl corresponding to pte,
>>>     * in case *pvmw->pmd changes underneath us; so we need to
>>> @@ -32,10 +35,11 @@ static bool map_pte(struct page_vma_mapped_walk =
*pvmw, spinlock_t **ptlp)
>>>     * proceeds to loop over next ptes, and finds a match later.
>>>     * Though, in most cases, page lock already protects this.
>>>     */
>>> -    pvmw->pte =3D pte_offset_map_nolock(pvmw->vma->vm_mm, =
pvmw->pmd,
>>> -                      pvmw->address, ptlp);
>>> +    pvmw->pte =3D pte_offset_map_rw_nolock(pvmw->vma->vm_mm, =
pvmw->pmd,
>>> +                         pvmw->address, &pmdval, ptlp);
>>>    if (!pvmw->pte)
>>>        return false;
>>> +    *pmdvalp =3D pmdval;

For instance, here, it is unnecessary if pmdvalp is passed directly to
pte_offset_map_rw_nolock.

>>>=20
>>>    ptent =3D ptep_get(pvmw->pte);
>>>=20
>>> @@ -67,8 +71,13 @@ static bool map_pte(struct page_vma_mapped_walk =
*pvmw, spinlock_t **ptlp)
>>>    } else if (!pte_present(ptent)) {
>>>        return false;
>>>    }
>>> +    spin_lock(*ptlp);
>>> +    if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) =
{
>>> +        pte_unmap_unlock(pvmw->pte, *ptlp);
>>> +        goto again;
>>> +    }
>>>    pvmw->ptl =3D *ptlp;
>>> -    spin_lock(pvmw->ptl);
>>> +
>>>    return true;
>>> }
>>>=20
>>> @@ -278,7 +287,7 @@ bool page_vma_mapped_walk(struct =
page_vma_mapped_walk *pvmw)
>>>            step_forward(pvmw, PMD_SIZE);
>>>            continue;
>>>        }
>>> -        if (!map_pte(pvmw, &ptl)) {
>>> +        if (!map_pte(pvmw, &pmde, &ptl)) {
>>>            if (!pvmw->pte)
>>>                goto restart;
>>>            goto next_pte;
>>> @@ -307,6 +316,12 @@ bool page_vma_mapped_walk(struct =
page_vma_mapped_walk *pvmw)
>>>        if (!pvmw->ptl) {
>>>            pvmw->ptl =3D ptl;
>>>            spin_lock(pvmw->ptl);
>>> +            if (unlikely(!pmd_same(pmde, =
pmdp_get_lockless(pvmw->pmd)))) {
>>> +                pte_unmap_unlock(pvmw->pte, pvmw->ptl);
>>> +                pvmw->ptl =3D NULL;
>>> +                pvmw->pte =3D NULL;
>>> +                goto restart;
>>> +            }
>>>        }
>>>        goto this_pte;
>>>    } while (pvmw->address < end);
>>> --
>>> 2.20.1



