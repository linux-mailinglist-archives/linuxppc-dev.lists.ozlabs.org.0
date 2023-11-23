Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AE7F67C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 20:47:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QzAYerPW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tc2AGDWM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbpYW5d6yz3vc0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 06:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QzAYerPW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tc2AGDWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbpXd3zYWz3dHc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 06:46:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700768813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/x0+ehpuka6vaGTVf1NB1DVm2JcgVurz702wP4rKKMc=;
	b=QzAYerPW43t4fJjMBNKce+5LQxjAqzuk5ueqIdOhAnNnhC37tjfZjdP5YI5bjAxSdRg0nn
	1pbvgegWHRYD5pX2KHBM1xMr5KiUqQIZlC9DnlrLgcUtpw9xs5wUYKtzHxN+kTxlVzB/Qo
	lstFvop9BphL2UlWiyvbMm14kPuz2kI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700768814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/x0+ehpuka6vaGTVf1NB1DVm2JcgVurz702wP4rKKMc=;
	b=Tc2AGDWMKvPzJMyQw4JU2sopOn29x3YT0S9OVRlys2gzkm3ftcKB2n91LOcRgg9BLALVJD
	Nep5pycojlQC8ET54ahBjiVDL/+mjpucmsPTpOCHklNHPIUgFM+tL/GzRKmZ+WRgQsSRbt
	4Du+PluVY2dloVjs/qaM3bpeb7cmom8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-Hb7DC5WmOGmZk6eg1whtJQ-1; Thu, 23 Nov 2023 14:46:52 -0500
X-MC-Unique: Hb7DC5WmOGmZk6eg1whtJQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67a0921b293so1854766d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 11:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700768811; x=1701373611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/x0+ehpuka6vaGTVf1NB1DVm2JcgVurz702wP4rKKMc=;
        b=nA10IQSW99LbLWmtjxIkVRRYmvhxjGbF/DMoYkFvbxJYxCv5dcsWbLWhyTRrsn2ypJ
         SoEZ6YGGoEaOWmZrhEZ96RtI81LtjqcIZvMl11k4Fx+mWe8x5ON3tC3lt3bFeCWxxqYc
         pL0VuUNCR2nJT5GFcIhHHrZEdgZgiMx8W7fpj7X7kFCQuFoclpt4juBGoelD3j2cAa3J
         pw7zRLWWlsnAetECK9v0n/F8YFeavabxWL0r7JWANUaf/AdgbwRfUWUWs0oPJB6bgPzq
         vy6/mLnHjdn8OaBT7lhSRMNpNOfUHIQgPN6+4qV/osuIRWx4t7xNIqeq9PBRGW2v7PzM
         e3/Q==
X-Gm-Message-State: AOJu0YxFNriFrZpOWFT4sNmCN+RAPKpQx1hU//8KJ9hePpP+NYERprj8
	4tGcYKHp01FUXBd98spH2+FrKByBtqaMQRrrrUWz111Ky/6ZBNp+ItHAQZUz3zFmnMCFQwKCNwe
	ApznhfkyuaTwrRCyC6PIf3viXRQ==
X-Received: by 2002:a05:6214:5845:b0:679:d92e:3915 with SMTP id ml5-20020a056214584500b00679d92e3915mr481396qvb.6.1700768811694;
        Thu, 23 Nov 2023 11:46:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzBI31IcH5oeMakKOYAtr+L45e77XcNn9sZZWA3VceZj7679x6/xkQISZE37o50DvBfsjvDg==
X-Received: by 2002:a05:6214:5845:b0:679:d92e:3915 with SMTP id ml5-20020a056214584500b00679d92e3915mr481383qvb.6.1700768811422;
        Thu, 23 Nov 2023 11:46:51 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o21-20020a05620a131500b0076cda7eab11sm663606qkj.133.2023.11.23.11.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 11:46:50 -0800 (PST)
Date: Thu, 23 Nov 2023 14:46:46 -0500
From: Peter Xu <peterx@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZV-sJsdFfXiCkylv@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
 <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n>
 <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
MIME-Version: 1.0
In-Reply-To: <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 23, 2023 at 07:11:19PM +0000, Ryan Roberts wrote:
> Hi,
> 
> I'm not sure I've 100% understood the crossover between this series and my work
> to support arm64's contpte mappings generally for anonymous and file-backed memory.

No worry, there's no confliction.  If you worked on that it's only be
something nice on top.  Also, I'm curious if you have performance numbers,
because I'm going to do some test for hugetlb cont_ptes (which is only the
current plan), and if you got those it'll be a great baseline for me,
because it should be similar in you case even though the goal is slightly
different.

> 
> My approach is to transparently use contpte mappings when core-mm request pte
> mappings that meet the requirements; and its all based around intercepting the
> normal (non-hugetlb) helpers (e.g. set_ptes(), ptep_get() and friends). There is
> no semantic change to the core-mm. See [1]. It relies on 1) the page cache using
> large folios and 2) my "small-sized THP" series which starts using arbitrary
> sized large folios for anonymous memory [2].
> 
> If I've understood this conversation correctly there is an object called hugepd,
> which today is only supported by powerpc, but which could allow the core-mm to
> control the mapping granularity? I can see some value in exposing that control
> to core-mm in the (very) long term.

For me it's needed immediately, because hugetlb_follow_page_mask() will be
gone after the last patch.

> 
> [1] https://lore.kernel.org/all/20231115163018.1303287-1-ryan.roberts@arm.com/
> [2] https://lore.kernel.org/linux-mm/20231115132734.931023-1-ryan.roberts@arm.com/

AFAICT you haven't yet worked on gup then, after I glimpsed the above
series.

It's a matter of whether one follow_page_mask() call can fetch more than
one page* for a cont_pte entry on aarch64 for a large non-hugetlb folio
(and if this series lands, it'll be the same to hugetlb or non-hugetlb).
Now the current code can only fetch one page I think.

Thanks,

-- 
Peter Xu

