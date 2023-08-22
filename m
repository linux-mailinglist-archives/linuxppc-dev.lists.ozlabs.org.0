Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 015E97849F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 21:08:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lMsfT5hx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVf5X02nlz3c4r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 05:08:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lMsfT5hx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVf4d74FFz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 05:08:00 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so22605e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 12:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692731273; x=1693336073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRiBUzL8spKRB1tclE82+u46hrJ1Ih197R4YOzksonI=;
        b=lMsfT5hx0tLwk2rlaqeI5mSDZwJSP9BkWsHVQo71FW7LKCx8tvIRUuniCr8vZv1pTR
         vHXATpyKDAkjxKMb1fyNJgYHuXcgcu9oOrQKPMNm0gcohAfiJDoljNpdWErX6OXwP7ej
         G7rBd82bGdsJXmkhDSUA3nzA0wFkZdDtJzDwG2zKxBoKE4/A0ZNv+HXMbPQZ123shwex
         vbVcb4kpmwEZjv5e1tWPjpsTmGx+uws9r7k9zU20nwgQ+E8c6cH7kT7S1aNh6M5PYMlW
         r0ofN2tuS06QEliLcqsX/YwzKyqMfhqNwpGphR1Pyffwu6qvQ73IRtR+h+DudVZkggBA
         r3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692731273; x=1693336073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRiBUzL8spKRB1tclE82+u46hrJ1Ih197R4YOzksonI=;
        b=ZNaVReyiTM4JpSthYbc8ieCMfntOn74xBnuH0mzuOeek+6bxFwrKRYvSJMNYlfWZ++
         oEc+vOx3Nq4NagtlfIA0LT1+LT3caK5EMZyfh6yB1qc6uq12phvXpxpUgNEppuvMnMk4
         8ygRIqqwH9voSqUbCQY0y8HmzfRP3zJcpt5T8qPruQEJ6tvCagtNFpgdgRaLAxW3z/+F
         fcbuO8jTnvQNTm9ADF5N5mxEQZmRvu+sls/VwvaN58uwPluSGLEykl4z2ZN9+6+7S/6i
         vz94RQ7GJrYU9D812BVarDMs/9iCqcz0X03t8r9qzj5F9stNWFGiZmYzgI54su6vVqYd
         Sb3w==
X-Gm-Message-State: AOJu0YyfT6Mjw1KTCy+2ry3eyAOJgZ/AP7lkxkPQpXF2Lh/6J8qTR5UC
	y+hJu6gDyarTzc5MvHW3ua6O64T/EBi5EgnEDgtvfg==
X-Google-Smtp-Source: AGHT+IGfBnrr77bQYEkOr6KDUL9/HGHICAg72c/uYHb0YNbCMBrO15aEsh2D/Hbolo0yCEKJUgZU8+XffH3Fzjw2Mp0=
X-Received: by 2002:a7b:c4d9:0:b0:3f4:fb7:48d4 with SMTP id
 g25-20020a7bc4d9000000b003f40fb748d4mr129596wmk.3.1692731272816; Tue, 22 Aug
 2023 12:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
 <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com>
 <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com> <CAG48ez0S-RjAapaDiJ+oZXpn1vs9niWx54iqzusUScS-BYu0hw@mail.gmail.com>
 <82d294-c9b0-d7b4-71c9-cfed3925c47b@google.com>
In-Reply-To: <82d294-c9b0-d7b4-71c9-cfed3925c47b@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 22 Aug 2023 21:07:15 +0200
Message-ID: <CAG48ez0dwYCxMv+e9-Y9XcQjZsXNqjdzhu31k84KoowD9rL+RQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
To: Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.
 hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 8:54=E2=80=AFPM Hugh Dickins <hughd@google.com> wro=
te:
> But rather than reworking it, please let's just go with v1 for now.

Sounds good to me.
