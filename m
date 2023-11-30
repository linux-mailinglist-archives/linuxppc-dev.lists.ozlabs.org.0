Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 354177FFD8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 22:31:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qg85cAae;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qg85cAae;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh8XX4rjFz3d9q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 08:31:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qg85cAae;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qg85cAae;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh8Wd5JBWz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 08:31:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701379865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRU7CkycS7SUcJkoz0E93L3cEZtHoI2nxjtl0XDIHtI=;
	b=Qg85cAaeyqxhaA1nNeIrecSjxnoEWoTkK1JrHkecfum5IZ7KgecpjJBlP5zsRoBm/zmsSS
	p3cQ/M4pqyY7UUL0Pj06WckjfgRSjNcOvbNq8sHUsYPKnAwPee7rukwMoYW6aWrvQ/LEfc
	4wRzZlrvo06vY+QAc3/VwrC3y7aUi3o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701379865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRU7CkycS7SUcJkoz0E93L3cEZtHoI2nxjtl0XDIHtI=;
	b=Qg85cAaeyqxhaA1nNeIrecSjxnoEWoTkK1JrHkecfum5IZ7KgecpjJBlP5zsRoBm/zmsSS
	p3cQ/M4pqyY7UUL0Pj06WckjfgRSjNcOvbNq8sHUsYPKnAwPee7rukwMoYW6aWrvQ/LEfc
	4wRzZlrvo06vY+QAc3/VwrC3y7aUi3o=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-f22FaAGcNr2J4LTfL9NWQQ-1; Thu, 30 Nov 2023 16:31:03 -0500
X-MC-Unique: f22FaAGcNr2J4LTfL9NWQQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1fa8e147acdso453526fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701379862; x=1701984662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRU7CkycS7SUcJkoz0E93L3cEZtHoI2nxjtl0XDIHtI=;
        b=b7Evya/fpcIp11xBu31kYJJpVZ4kayv38WhxDGQkFsYvVTb+lBJVjE9mlfDgL6nT1U
         N8lNIuLqhYmrlBTVZUieN95oN3uqCIP3BHdo8w6qqQHZHvqJZcn8RFdW7dedR9vz6sVg
         +WA2dl7eRtK6IiUrPiy5ox0VEYmtO5aXxAXBhWMktrhauCYK8akn1BS8ZZcmYLBSn5Zy
         A6zPi5jUpZIa3kO5qUNhZKWMhWcKk5WbFjSQl5eUwV4CsCR/UTzLOi4vWOuwpPCptu53
         5N/rFdc4syZGHlToaVNtednbhv7XiJfwkTreNgyLTqFlYSAwYVbV/8v31H+GiPB0F9z8
         tIQQ==
X-Gm-Message-State: AOJu0YyFJuG+d5aYrInkW53FLfrVkDJ778D06vZxKACSyMfJ3f1w4APp
	2CGYLys7YHzFBpvQknmai4yRzk6eOx3S5ND63XqZZIPn9XqB2ukWGIn/jsp77YfY0+OrY4MGNuo
	ekePNsq8o+QAFAopkAZUUsE9nQQ==
X-Received: by 2002:a05:6871:89f:b0:1fa:25e7:380c with SMTP id r31-20020a056871089f00b001fa25e7380cmr3376642oaq.4.1701379862195;
        Thu, 30 Nov 2023 13:31:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/wrmZb1Pj0VJ3a4ZBfX7FQO3l+DqTcZEmdXOZXRg9ok8MvraDC5X1akCfH4y0bxaGhg1yPw==
X-Received: by 2002:a05:6871:89f:b0:1fa:25e7:380c with SMTP id r31-20020a056871089f00b001fa25e7380cmr3376607oaq.4.1701379861914;
        Thu, 30 Nov 2023 13:31:01 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id b19-20020ac87553000000b00423b8a53641sm842916qtr.29.2023.11.30.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:31:01 -0800 (PST)
Date: Thu, 30 Nov 2023 16:30:58 -0500
From: Peter Xu <peterx@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZWj_EgljG3NwS5r1@x1n>
References: <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
 <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n>
 <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
 <ZV-sJsdFfXiCkylv@x1n>
 <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
 <ZWDKV0XNjplc_vUP@x1n>
MIME-Version: 1.0
In-Reply-To: <ZWDKV0XNjplc_vUP@x1n>
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

On Fri, Nov 24, 2023 at 11:07:51AM -0500, Peter Xu wrote:
> On Fri, Nov 24, 2023 at 09:06:01AM +0000, Ryan Roberts wrote:
> > I don't have any micro-benchmarks for GUP though, if that's your question. Is
> > there an easy-to-use test I can run to get some numbers? I'd be happy to try it out.
> 
> Thanks Ryan.  Then nothing is needed to be tested if gup is not yet touched
> from your side, afaict.  I'll see whether I can provide some rough numbers
> instead in the next post (I'll probably only be able to test it in a VM,
> though, but hopefully that should still reflect mostly the truth).

An update: I finished a round of 64K cont_pte test, in the slow gup micro
benchmark I see ~15% perf degrade with this patchset applied on a VM on top
of Apple M1.

Frankly that's even less than I expected, considering not only how slow gup
THP used to be, but also on the fact that that's a tight loop over slow
gup, which in normal cases shouldn't happen: "present" ptes normally goes
to fast-gup, while !present goes into a fault following it.  I assume
that's why nobody cared slow gup for THP before.  I think adding cont_pte
support shouldn't be very hard, but that will include making cont_pte idea
global just for arm64 and riscv Svnapot.

The current plan is I'll add that performance number into my commit message
only, as I don't ever expect any real workload will regress with it.  Maybe
a global cont_pte api will be needed at some point, but perhaps not yet
feel strongly for this use case.

Please feel free to raise any concerns otherwise.

Thanks,

-- 
Peter Xu

