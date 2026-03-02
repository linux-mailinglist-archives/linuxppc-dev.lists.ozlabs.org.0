Return-Path: <linuxppc-dev+bounces-17551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ha9HUb/pWljIwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 22:21:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6B1E27F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 22:21:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPsL90yXbz2xSF;
	Tue, 03 Mar 2026 08:21:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772486465;
	cv=none; b=SdnC8jqC68xT0ZXrqJ34EH0P2jxxPjliGYq+eORyDJVvlNvPDCiCCApSfmfQdKQBzRoQl7fdqx2ycpBXiRuveZgNgMubtIGf8xbOi96YyaKzhKD78K6EQ6V0572ARVZl04w9Gmc2RUPe1XZXn2PsFkfQwt87OUKIKCkqyIxDYjQ3snRR+ntnUaVyBbL33ljV5ZKwIjQ2ruRbK16BrFn4fshMqDNMpMOKvKl08p4iKRkzi+V7pJb/S8Sj/V+OQb27m2treo58/jsHyQtXU1Pw3NCxgi0EeOv5VjK7oZyoVhZNc+7wjlniT6G3iU7ugkZMOQFtIu4uSMVDiwDpz+fcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772486465; c=relaxed/relaxed;
	bh=6kFsAiWjV29y4/mqvpo63lZBzBcmEx6G8LioYTWyjt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRnfv6hJ0gjAhVZRdfDVk4xxNf17DDpiU5QbB9FYmphxL8490/HiczU3+WrAFajMI7xLeJA1asfm8AWcPlpcmrGjJdYNjGl81mqJZ7MLWeDGY/k6jhX8WLYEw1kwASILcnJeMSCQUIrahLbCp8AwxylyzVtbpH0lGluMz8wdz3rY5MosBNlkuj0oiJPBhvsvmW+o0q3SG89q6GT21sJOPvd+8yC+MSaPqym0qBEJRzGbiwGUrec3c4wfoo+Cr2IhJ8aZ8oWXFe7mdXnCaWGa8Kdhm7dpcufk8HVvziNXl/F5qUuBW0DaxBf3YWBqzL5VhJ1bPVwOcBbNuMS20/0Wzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h6YsIDTb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ng6hdH/e; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h6YsIDTb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ng6hdH/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPsL654Rfz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 08:21:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772486455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kFsAiWjV29y4/mqvpo63lZBzBcmEx6G8LioYTWyjt8=;
	b=h6YsIDTb6H1r7K7oCSDfj6Ivj5tdMgnB6Il7nxXard4qcf7EKWPPsMwlbNEWBprjqK75uV
	bswtcCCpkoNaVA98XT2eqI1jK9MpjAiqZ5lJqNS5iTD0lhR0UIBAmC4OIt4UE9BPAyjB0Y
	g0ruEMup7jghKvu8+E0YbOlr+3UMiWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772486456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kFsAiWjV29y4/mqvpo63lZBzBcmEx6G8LioYTWyjt8=;
	b=Ng6hdH/e8PQoVAal7KDEMjY0B1QDoj+Jcw2faIQolzR8I09+xqR0Up1ImOFb8CUeNHzER0
	b1wbDjgEE7U8+my/sXo9nWEByRDWweclTEYNMSSyLEEncNrO7BVgd6ag1Tin+y5jhHzCHX
	RQ+G8NzwGfZQ98V5BN7Eaj5wB2mhN34=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-xO0Ci5S0Ph-jb9QYMk-KmA-1; Mon, 02 Mar 2026 16:20:54 -0500
X-MC-Unique: xO0Ci5S0Ph-jb9QYMk-KmA-1
X-Mimecast-MFC-AGG-ID: xO0Ci5S0Ph-jb9QYMk-KmA_1772486454
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7986dd1b9e1so93653317b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 13:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772486454; x=1773091254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6kFsAiWjV29y4/mqvpo63lZBzBcmEx6G8LioYTWyjt8=;
        b=QzuOkw4P1PTwYzULy7YiWE7Lv1vfFcr01MSXjyThp5WHU2XuAIpK7uOQ+mU6HGNKLO
         g8q4z+y9hwFdO7OFYx90ppHTKmbzy0bQEqnF2qJqkda15KEFB9WgR6m/3jacv1lBgcdx
         n1fT6p3BgD9VQMcHY9XZiN/cayaZJiPF9webIfOlX6phqCFU/BBFUA6dbchBpRN6hL4d
         +muWDr6/c8WE7Z/oR/AsbWKPqB+PkLoWol2s8tsm+laRv3O9fhPHYOYgjJBMvvEelAif
         b1dORT4jzZxTpF1GxY3x+l8brR8OFZWfNArcNczuy8JFu3KtKPUBqrQeDZCGLeYbzK0l
         ibjw==
X-Forwarded-Encrypted: i=1; AJvYcCUb8xFftkYwKzuFB/72qaPSpNO0c/dbRbV+vtiiwVK8gi7CCrAr31lO5YWJJqGFhBEMUh1G+ZuD08T+2gs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyktD7q5SVwxwkMZdwTUPZQB5ViUPq2ceKElibzvxlOSa9cOHjj
	GncNP3vxz+fCPVhJcIsn2/7ElRe/N//UByPQP3UYYp2llev6GhFLc2QOOQFSqoK/8DhAD9Ek0Zt
	/GLLnnP8j67c1OGdcouPEzxR395p36esSqvXmCB6S7ky6YModJu9wkPdxrEOxtNxf3vTz5gudH8
	VO38Wm2ieqhP5Az9QTpTO3SECeSVkpUXW/yS2+LHBt5w==
X-Gm-Gg: ATEYQzzkGZVDj7jiIjKjq88fanQLPZxxO1SxhPbYpeHA9Cmad9sXBSgsfd4GCOA1NWy
	UJjoM0r3q8XG3fXXxUxtSPUA6NRWkmGVPuSzQierlj5sV0DcUTj7PJgUDYKe/8Sf9nBXFuFn5g3
	rYgPqExa2r7XcmfIqm0xZR/Bb8dkdokMA83LVJhrMbGgv/fvYh+M6DAgDiGfwyIXEVGOYJASCI8
	Kzg
X-Received: by 2002:a53:a04d:0:b0:64a:ee9d:8b7c with SMTP id 956f58d0204a3-64cc2225811mr7952724d50.42.1772486453726;
        Mon, 02 Mar 2026 13:20:53 -0800 (PST)
X-Received: by 2002:a53:a04d:0:b0:64a:ee9d:8b7c with SMTP id
 956f58d0204a3-64cc2225811mr7952704d50.42.1772486453337; Mon, 02 Mar 2026
 13:20:53 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20260226113233.3987674-1-usama.arif@linux.dev> <20260226113233.3987674-13-usama.arif@linux.dev>
In-Reply-To: <20260226113233.3987674-13-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Mon, 2 Mar 2026 14:20:27 -0700
X-Gm-Features: AaiRm50qkaj59sngcutouq41dPDnCRD-fKXemv-mcnstHZb0L6rgl_hR_ovxMIM
Message-ID: <CAA1CXcDyqPPwf_-W7B+PFQtL8HdoJGCEqVsVxq7DhOUB=L4PQA@mail.gmail.com>
Subject: Re: [RFC v2 12/21] mm: thp: handle split failure in device migration
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, lorenzo.stoakes@oracle.com, 
	willy@infradead.org, linux-mm@kvack.org, fvdl@google.com, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, 
	dev.jain@arm.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, linux-s390@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1JJhCFrxpTgVxwWbny-qVl1q6bKbcgUenLrZ4MvEy7s_1772486454
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3FF6B1E27F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17551-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 4:34=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> Device memory migration has two call sites that split huge PMDs:
>
> migrate_vma_split_unmapped_folio():
>   Called from migrate_vma_pages() when migrating a PMD-mapped THP to a
>   destination that doesn't support compound pages.  It splits the PMD
>   then splits the folio via folio_split_unmapped().
>
>   If the PMD split fails, folio_split_unmapped() would operate on an
>   unsplit folio with inconsistent page table state.  Propagate -ENOMEM
>   to skip this page's migration. This is safe as folio_split_unmapped
>   failure would be propagated in a similar way.
>
> migrate_vma_insert_page():
>   Called from migrate_vma_pages() when inserting a page into a VMA
>   during migration back from device memory.  If a huge zero PMD exists
>   at the target address, it must be split before PTE insertion.
>
>   If the split fails, the subsequent pte_alloc() and set_pte_at() would
>   operate on a PMD slot still occupied by the huge zero entry.  Use
>   goto abort, consistent with other allocation failures in this function.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/migrate_device.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 78c7acf024615..bc53e06fd9735 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -909,7 +909,13 @@ static int migrate_vma_split_unmapped_folio(struct m=
igrate_vma *migrate,
>         int ret =3D 0;
>
>         folio_get(folio);

Should we be concerned about this folio_get? Are we incrementing a
reference that was already held if we back out of the split?

-- Nico

> -       split_huge_pmd_address(migrate->vma, addr, true);
> +       /*
> +        * If PMD split fails, folio_split_unmapped would operate on an
> +        * unsplit folio with inconsistent page table state.
> +        */
> +       ret =3D split_huge_pmd_address(migrate->vma, addr, true);
> +       if (ret)
> +               return ret;
>         ret =3D folio_split_unmapped(folio, 0);
>         if (ret)
>                 return ret;
> @@ -1005,7 +1011,13 @@ static void migrate_vma_insert_page(struct migrate=
_vma *migrate,
>                 if (pmd_trans_huge(*pmdp)) {
>                         if (!is_huge_zero_pmd(*pmdp))
>                                 goto abort;
> -                       split_huge_pmd(vma, pmdp, addr);
> +                       /*
> +                        * If split fails, the huge zero PMD remains and
> +                        * pte_alloc/PTE insertion that follows would be
> +                        * incorrect.
> +                        */
> +                       if (split_huge_pmd(vma, pmdp, addr))
> +                               goto abort;
>                 } else if (pmd_leaf(*pmdp))
>                         goto abort;
>         }
> --
> 2.47.3
>


