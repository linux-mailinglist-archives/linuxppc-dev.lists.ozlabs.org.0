Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9A740553
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 22:54:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=AyDbzfEO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrH4y25C6z30XM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 06:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=AyDbzfEO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrH464tNlz30Kf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 06:53:25 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a1d9b64837so2523074b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687899202; x=1690491202;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XFHD0hnOjuhPYILDUOJLbgwpgA6DIsDBsAhcitDEBFU=;
        b=AyDbzfEOwQNJQ3Q6vCBJpIzejWz0XI+CwqIDE8UgstFVF4GBN1zCUvimRHgNDXa99Q
         0A2XitElZYl4vkOr9ytUm0PmYJ5QsEPCI+4zrbGGcbdnAJac6UffXXzvU8rbykoGAN78
         RiYeGRGQi0rsCCIEmUY28CGLOcGd0QWkwDLQhn+j3WVmaQn0hiL1rrTM2ApFwPn3rmOW
         aIKz2rrQIuBq1j3yLWNWP1JGfXvLJejgPPRaYR2Sfe6YM1MfNiNFxfm4n9PGXCTAc+Ec
         tpgYnKyue/RmYU1Emj+1xNmzsPduOW3Zz+V1MnsoHZ24+8K57GccuEEID0ga5vyglJnq
         m0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899202; x=1690491202;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFHD0hnOjuhPYILDUOJLbgwpgA6DIsDBsAhcitDEBFU=;
        b=QQNYmpM/E3NoZoKQJmoeYKClwtFqexpnATAXPvXqsl1EeNm0vH37j2YTdTcR/z7Ywg
         n1d2uVYnt9jUlluXnoQuH7ZXuPf1OtmgHeJ9pudH7gJAFy3Lz5rerjn5M5tjnYHoCQ3L
         8EP7VBo3cdDFxiUn6xEtssA/KACDmspgnVMszOmP8V5vdhDuOwVUre8srVGklKZ7h0Uj
         d9qcbtsHbUxMqKYf5/2YVbydd66zyooC65i3jzogiUabvOZDpGDsXV5mgiCieywrT+uc
         zPvqhCQociFZCVzw/gaj/RDVGBUK+XULHwlgx9t3thQkMvD3oCFI1J2bO5+sl6FEOYGp
         ri6w==
X-Gm-Message-State: AC+VfDxRHglSEx5hKPgaRyFX/XHU3pmYhWAps9aOKunB4BI45GX+trsQ
	85ge6LmPKDKTC9FlcpSIMiygBQ==
X-Google-Smtp-Source: ACHHUZ4cqZstCs1nyAEh2QwWGawSrsE1fPzwiUYItaOw1DYAGKznreSljpXPuAJlmNc2pAtztzw7zA==
X-Received: by 2002:a05:6808:2a47:b0:3a1:df16:2e9e with SMTP id fa7-20020a0568082a4700b003a1df162e9emr6357738oib.12.1687899202175;
        Tue, 27 Jun 2023 13:53:22 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id q131-20020a817589000000b00565eb8af1fesm2009195ywc.132.2023.06.27.13.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 13:53:21 -0700 (PDT)
Date: Tue, 27 Jun 2023 13:53:17 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 05/12] powerpc: add pte_free_defer() for pgtables
 sharing page
In-Reply-To: <ZJsV19f41CrfkFYa@ziepe.ca>
Message-ID: <7b1be7d-9287-cbc6-ef7-55e44625e4e@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <5cd9f442-61da-4c3d-eca-b7f44d22aa5f@google.com> <ZJGRa4zvsXfc43vB@ziepe.ca> <2ad8b6cf-692a-ff89-ecc-586c20c5e07f@google.com> <ZJI7xkXWmjrE1yY3@ziepe.ca> <c8284d0-91cb-b65e-4c95-bfeb627234f@google.com>
 <ZJsV19f41CrfkFYa@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbe
 ll@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David Sc. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Jun 2023, Jason Gunthorpe wrote:
> On Wed, Jun 21, 2023 at 07:36:11PM -0700, Hugh Dickins wrote:
> > [PATCH v3 05/12] powerpc: add pte_free_defer() for pgtables sharing page
...
> Yes, this makes sense to me, very simple..
> 
> I always for get these details but atomic_dec_and_test() is a release?
> So the SetPageActive is guarenteed to be visible in another thread
> that reaches 0?

Yes, that's my understanding - so the TestClearPageActive adds more
to the guarantee than is actually needed.

"release": you speak the modern language, whereas I haven't advanced
from olden-days barriers: atomic_dec_and_test() meets atomic_t.txt's
 - RMW operations that have a return value are fully ordered;
which a quick skim of present-day memory-barriers.txt suggests would
imply both ACQUIRE and RELEASE.  Please correct me if I'm mistaken!

Hugh
