Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B677F6559
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 18:23:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a1SuHQnG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a1SuHQnG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SblLl5yRrz3dTV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 04:23:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a1SuHQnG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a1SuHQnG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SblKq1W99z3dLl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 04:22:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700760138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KcpnTT0f+98xbE3/g5MCgDaaep2Eqio0fEdLtHv5RPs=;
	b=a1SuHQnG1Yp6Yw82wBf2Vcf+lqo6hsBKF/YlE9PJIJxQC1cslvgo6y5cG04tuZKn+74Y1J
	fSnrtwu2wlpCImNiYdhln4gzG7eYQSXwDAbEuUpTXVsz4xDVX4XWnqclWI8C9vsfqeAH6/
	lXJIRKosToZpwJaHY9v8495SZZkwqrs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700760138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KcpnTT0f+98xbE3/g5MCgDaaep2Eqio0fEdLtHv5RPs=;
	b=a1SuHQnG1Yp6Yw82wBf2Vcf+lqo6hsBKF/YlE9PJIJxQC1cslvgo6y5cG04tuZKn+74Y1J
	fSnrtwu2wlpCImNiYdhln4gzG7eYQSXwDAbEuUpTXVsz4xDVX4XWnqclWI8C9vsfqeAH6/
	lXJIRKosToZpwJaHY9v8495SZZkwqrs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-32G_sSZlMW-xS_-nEtu5qg-1; Thu, 23 Nov 2023 12:22:14 -0500
X-MC-Unique: 32G_sSZlMW-xS_-nEtu5qg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-420c7034fddso2534501cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 09:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700760134; x=1701364934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcpnTT0f+98xbE3/g5MCgDaaep2Eqio0fEdLtHv5RPs=;
        b=XS/zg0kvebr0//9kmPMzsDpR2PqckTsR2TYb5tqUi+n61G+s4aDyXQUSvnTaHL/k6V
         KF7yZr1kAN/iQvin5WNipwgs10G0JgCfQLdUmsnUGmsjsaFgPWdNn82RhBvNdCobRFym
         4nvuRLeTtDjRN0RS+f37M0SNsAbQM0iGPR+KcOoxCqVbttrcwTCydwGsvferr+XKQOWm
         Wa0zkrU8dA30F7QlnxYCUh+FKPNFek7UXCrb39CUsOhTqCORXd5Z6+OnX+RqpegR4pl0
         TS6jvQ1Hp8IMpqrxI+U8b8RMWKyqY7MQE1AfPlP503eqcVrvmsXFO8v0BNihFrqvIJiC
         6lbA==
X-Gm-Message-State: AOJu0YyCyY1NzzB7lKOy+jwGjwTt+FthXRZQYjP+1wyXZ14PjR2SiIbh
	cygR9J+UpADG8C/Al0KG6yw/8JnOhOFkjRKUjwdkP9Bx+fezyTYYVI3gcnw6KLQMyEq5CvWqf3w
	oWcGXQomf2ukbFV++yUxsBKs5ZA==
X-Received: by 2002:a05:6214:16cb:b0:66d:1178:8729 with SMTP id d11-20020a05621416cb00b0066d11788729mr210895qvz.0.1700760134481;
        Thu, 23 Nov 2023 09:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoctQeyyuLZxBsUdrKfoqF1pEVxywUQFLPrXNM10XRHBt/gv7otbSLqMQmESr9lBHxoHkzbA==
X-Received: by 2002:a05:6214:16cb:b0:66d:1178:8729 with SMTP id d11-20020a05621416cb00b0066d11788729mr210872qvz.0.1700760134200;
        Thu, 23 Nov 2023 09:22:14 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id x5-20020a0ce785000000b0067a0b48a4f9sm451474qvn.66.2023.11.23.09.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:22:13 -0800 (PST)
Date: Thu, 23 Nov 2023 12:22:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZV-KQ0e0y9BTsHGv@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
 <ZV90JcnQ1RGud/0R@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZV90JcnQ1RGud/0R@casper.infradead.org>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Ryan Roberts <ryan.roberts@arm.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 23, 2023 at 03:47:49PM +0000, Matthew Wilcox wrote:
> It looks like ARM (in the person of Ryan) are going to add support for
> something equivalent to hugepd.

If it's about arm's cont_pte, then it looks ideal because this series
didn't yet touch cont_pte, assuming it'll just work.  From that aspect, his
work may help mine, and no immediately collapsing either.

There can be a slight performance difference which I need to measure for
arm's cont_pte already for hugetlb, but I didn't worry much on that;
quotting my commit message in the last patch:

    There may be a slight difference of how the loops run when processing
    GUP over a large hugetlb range on either ARM64 (e.g. CONT_PMD) or RISCV
    (mostly its Svnapot extension on 64K huge pages): each loop of
    __get_user_pages() will resolve one pgtable entry with the patch
    applied, rather than relying on the size of hugetlb hstate, the latter
    may cover multiple entries in one loop.
    
    However, the performance difference should hopefully not be a major
    concern, considering that GUP just yet got 57edfcfd3419 ("mm/gup:
    accelerate thp gup even for "pages != NULL""), and that's not part of a
    performance analysis but a side dish.  If the performance will be a
    concern, we can consider handle CONT_PTE in follow_page(), for example.

So IMHO it can be slightly different comparing to e.g. page fault, because
each fault is still pretty slow as a whole if one fault for each small pte
(of a large folio / cont_pte), while the loop in GUP is still relatively
tight and short, comparing to a fault.  I'd boldly guess more low hanging
fruits out there for large folio outside GUP areas.

In all cases, it'll be interesting to know if Ryan has worked on cont_pte
support for gup on large folios, and whether there's any performance number
to share.  It's definitely good news to me because it means Ryan's work can
also then benefit hugetlb if this series will be merged, I just don't know
how much difference there will be.

Thanks,

-- 
Peter Xu

