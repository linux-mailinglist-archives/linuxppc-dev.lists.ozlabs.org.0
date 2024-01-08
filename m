Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B26826890
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 08:28:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gc0TMble;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fruNds8A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7lzG5crHz3cRK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 18:28:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gc0TMble;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fruNds8A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T7lyQ1D9Bz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jan 2024 18:27:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704698856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=++HIVa+fUHc7mVxMPbgRezSHjTqa6qZR6U7zKUbz7Hc=;
	b=Gc0TMble/0NWHq5T6//n05hnJQ27EyD34l0vqCls4lMQyeCb8zQ5Y8g8s2CvahneRuuJfL
	Jc/6YAqUvgUopJTCwlCIFEorWqZfwubruSL3Dry+hl9qW0rT9pHMwrAUFR4qZsnS5DMo7Z
	tivIAJT3VLcy/dhEN27ETu2xMCU2hrE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704698857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=++HIVa+fUHc7mVxMPbgRezSHjTqa6qZR6U7zKUbz7Hc=;
	b=fruNds8A3ANLlfkMSXqcrMw+qTGBVIirmX1Ilom8gUz+hUuxtS/REwHX0ESBC2Eogn/B8O
	xaxOI6uAN451Yo8pHtc2hXvWY+zQ2v+uHWj5N//jEG38vC+C3yPHgKKRrsQsKy31qCJawZ
	BRSVfdXE0D7tUCrtFiMp08R/RBnV0ug=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-C9KymUPMNVCHrQkv95p8eg-1; Mon, 08 Jan 2024 02:27:30 -0500
X-MC-Unique: C9KymUPMNVCHrQkv95p8eg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28cfa4a37c2so746186a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Jan 2024 23:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704698849; x=1705303649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++HIVa+fUHc7mVxMPbgRezSHjTqa6qZR6U7zKUbz7Hc=;
        b=lfaQRQpDcb69q2rSoMd/aYkRNVscXvRjZUGkRq3fTZpV1sr4f5SsT/QMtfprg6YHtf
         mFFqb2WT4+IXoF+dORjjfD1G1XlZdrerSk3/DKiU+YSt2gKOp7+XRQVryWBG+xis1SmU
         URHlsaB2/HoPCpJ7bFZOqA0bCbkUKAr6IXSZiCGAPp+Bkh926OVGd4XZS+KcQSuGu8Gl
         vd5C6HvFEw4SPDyOyxW5yaLid+1lifNAMnM6bthlpPXSruBdJiCCJmll67IilQ2/DyPK
         ZdvwFd/+t2Yn8OBVhNkvbNubH2ZU2PZI9DeXa0S8Bzrgs7kiTMzcq9wyKMFLUm4VEjQa
         s9JA==
X-Gm-Message-State: AOJu0YzdNGVhqpWHjluIDfPeDD+cwROSCQkI7zWmKCiOSw3PfKIY8EqG
	kYbjGEQ9VaUekxuhrh3HraURO5jA1OwEtiZyefqBVUixyB5K4/MoLdTNM3dv4JUyyauGjABXa4I
	OU4rheOS9AXi75ATIrnL7HT8kErs7nVN7yQ==
X-Received: by 2002:a05:6a20:3cab:b0:199:c866:1d46 with SMTP id b43-20020a056a203cab00b00199c8661d46mr931055pzj.6.1704698848992;
        Sun, 07 Jan 2024 23:27:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCAavyxZcZwU5CLY8vR5nixlH4bDIz/ZGJUz9tbspcbUqeK+w5R+Hs85r/f/cHobBdBUdCsQ==
X-Received: by 2002:a05:6a20:3cab:b0:199:c866:1d46 with SMTP id b43-20020a056a203cab00b00199c8661d46mr931031pzj.6.1704698848614;
        Sun, 07 Jan 2024 23:27:28 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090a8d8500b0028c2de909e4sm5617976pjo.50.2024.01.07.23.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 23:27:28 -0800 (PST)
Date: Mon, 8 Jan 2024 15:27:17 +0800
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 00/13] mm/gup: Unify hugetlb, part 2
Message-ID: <ZZuj1Q3k9hX0IlK3@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <591c59d6-dedb-4399-8a6f-c574fd2ad9cc@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <591c59d6-dedb-4399-8a6f-c574fd2ad9cc@csgroup.eu>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rp
 pt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Christophe,

On Wed, Jan 03, 2024 at 11:14:54AM +0000, Christophe Leroy wrote:
> > Test Done
> > =========
> > 
> > This v1 went through the normal GUP smoke tests over different memory
> > types on archs (using VM instances): x86_64, aarch64, ppc64le.  For
> > aarch64, tested over 64KB cont_pte huge pages.  For ppc64le, tested over
> > 16MB hugepd entries (Power8 hash MMU on 4K base page size).
> > 
> 
> Can you tell how you test ?
> 
> I'm willing to test this series on powerpc 8xx (PPC32).

My apologies, for some reason I totally overlooked this email..

I only tested using run_vmtests.sh, with:

  $ bash ./run_vmtests.sh -t gup_test -a

It should cover pretty much lots of tests of GUP using gup_test program.  I
think the ones that matters here is "-H" over either "-U/-b".

For ppc8xx, even though kernel mapping uses hugepd, I don't expect anything
should change before/after this series, because the code that I touched
(slow gup only) only affects user pages, so it shouldn't change anything
over kernel mappings.  Said so, please feel free to smoke over whatever
type of kernel hugepd mappings, and I'd trust you're the expert on how to
trigger those paths.

Since I got your attention, when working on this series I talked to David
Gibson and just got to know that hugepd is actually a pure software idea.
IIUC it means there's no PPC hardware that really understands the hugepd
format at all, but only a "this is a huge page" hint for Linux.

Considering that it _seems_ to play a similar role of cont_pXX here: do you
think hugepd can have any chance to be implemented similarly like cont_pXX,
or somehow share the code?

For example, if hugepd is recognized only by Linux kernel itself, maybe
there can be some special pgtable hint that can be attached to the cont_*
entries, showing whether it's a "real cont_*" entry or a "hugepd" entry?
IIUC it can be quite flexible because if hugepd only works for hash MMU so
no hardware will even walk that radix table.  But I can overlook important
things here.

It'll be definitely great if hugepd can be merged into some existing forms
like a generic pgtable (IMHO cont_* is such case: it's the same as no
cont_* entries for softwares, while hardware can accelerate with TLB hits
on larger ranges).  But I can be asking a very silly question here too, as
I can overlook very important things.

Thanks,

-- 
Peter Xu

