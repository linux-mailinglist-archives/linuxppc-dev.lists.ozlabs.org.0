Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FF835C89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 09:26:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JbcaLPtm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JbcaLPtm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJNbd1C2bz3cP7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 19:26:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JbcaLPtm;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JbcaLPtm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJNZl6jFzz3bhr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 19:25:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705911929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDmft0G/LbU/vGcrH0ViFbqfb55/2jbpdSGlzfSsB1Q=;
	b=JbcaLPtma0c7RVKRwityo3dPbpZWFBGgmAiz1DtCVY5myz1E1LhOy51QqYnpfxKjQUWaar
	/ResMHj5/R7QIF79q0ecu/Ge00SSgc3M1pwT2i/d8RoXkheO6wt5aKysYDjnrAMiKTx+CO
	ML1VHyGbSRLlnz1MfArOMgidIRFQ9Vw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705911929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDmft0G/LbU/vGcrH0ViFbqfb55/2jbpdSGlzfSsB1Q=;
	b=JbcaLPtma0c7RVKRwityo3dPbpZWFBGgmAiz1DtCVY5myz1E1LhOy51QqYnpfxKjQUWaar
	/ResMHj5/R7QIF79q0ecu/Ge00SSgc3M1pwT2i/d8RoXkheO6wt5aKysYDjnrAMiKTx+CO
	ML1VHyGbSRLlnz1MfArOMgidIRFQ9Vw=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-PzdxzIOtPGqQGuk8VDoi7g-1; Mon, 22 Jan 2024 03:25:26 -0500
X-MC-Unique: PzdxzIOtPGqQGuk8VDoi7g-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ddeec294fdso742564a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 00:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705911925; x=1706516725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDmft0G/LbU/vGcrH0ViFbqfb55/2jbpdSGlzfSsB1Q=;
        b=g8K8QPs7HEUmCGb+SqD0zUe0RauJKudy7/NiS9zTda8tjjlNfHxznAvjVth4UPTe4p
         ImTbk59A0MYIDUm1koxu4Lc7AuAvpKuxBw6NCsqKHvT/Dif6ccPS8kCfW6Z5NTZvp9pa
         3jck7LwC3kak25JJ9Lo89g/gJGzW3Jyr0L9XTccs2UKwDZaJdNXcVpvK7gp0tOvq5kO4
         57mYNZi68oAFiVR2vWi8JA78R5DzL9nUFPpShcl9+HIqnfaYRnl8imZFv9xcbum3HV2z
         jTJPmvz1XVU/qkNVJid4YQ1W2avAjgKjvb2X1z7unM8W8kK1VnbGvwqIqZ8NpIRARL/B
         /e8w==
X-Gm-Message-State: AOJu0YyrESWbsuAPIpWu6w0ppBXqk4j3rrvOJGuMncbEdWI8252Pt9jm
	95TSIjYgFW2qR50R8q7VbPZFkle18py/tfvZ45teUJw9y9G/lJDoJ9htVIp88IeSyEVryUix3kg
	B/mPOapaAGohwS0rLVhta0wXlnWWn/vEVItUMsHMpbT97VNfgPmfWk7jPmI9xSfA=
X-Received: by 2002:a05:6358:591d:b0:176:5ca9:7213 with SMTP id g29-20020a056358591d00b001765ca97213mr953022rwf.0.1705911925340;
        Mon, 22 Jan 2024 00:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSePoGNoX92PzQmVfT4AXX54k/+l1fGFhIaFtWONOwMEeDpGYerPythOMH74Vw9shCsROV9A==
X-Received: by 2002:a05:6358:591d:b0:176:5ca9:7213 with SMTP id g29-20020a056358591d00b001765ca97213mr952991rwf.0.1705911925009;
        Mon, 22 Jan 2024 00:25:25 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id h8-20020a654808000000b005ca0ae17983sm6839110pgs.8.2024.01.22.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:25:24 -0800 (PST)
Date: Mon, 22 Jan 2024 16:25:12 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 01/13] mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
Message-ID: <Za4maErLKnRnM0sB@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-2-peterx@redhat.com>
 <20240115173737.GO734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115173737.GO734935@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 15, 2024 at 01:37:37PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 03, 2024 at 05:14:11PM +0800, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > Introduce a config option that will be selected as long as huge leaves are
> > involved in pgtable (thp or hugetlbfs).  It would be useful to mark any
> > code with this new config that can process either hugetlb or thp pages in
> > any level that is higher than pte level.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  mm/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> So you mean anything that supports page table entires > PAGE_SIZE ?

Yes.

> 
> Makes sense to me, though maybe add a comment in the kconfig?

Sure I'll add some.

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks for your reviews and also positive comments in previous versions,
Jason.  I appreciate that.

I'm just pretty occupied with other tasks recently so I don't yet have time
to revisit this series, along with other comments yet.  I'll do so and
reply to the comments / discussions together afterwards.

-- 
Peter Xu

