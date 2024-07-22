Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C499391DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 17:32:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8iFXR5F;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T+Dn4v7S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSPRR2Dlvz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 01:32:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8iFXR5F;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T+Dn4v7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSPQl50crz2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 01:31:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721662313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jy2hKoepXG/rD4fs1gDu/NkLXDQ0MSD+ICWqPzfOpkw=;
	b=e8iFXR5FjMpRqjzWoXmGV4rVxrRhwQLPbExuo+6FB8bJBWWWOEcpYU1zIpdPcpXaZtM6E6
	W3LxbECIGSLpocxBe7XynleoT7Mv17Q7iwGsbKE3M175bPCgJ64BQs/EhhTRdkZVy8WIKr
	txoJwVW24+lWXCJmGu2IZ+bVK8HHwzA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721662314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jy2hKoepXG/rD4fs1gDu/NkLXDQ0MSD+ICWqPzfOpkw=;
	b=T+Dn4v7SbpLL5u5mlQYCPeYPbGJe8NS62iw+6OztSmSdEUjhqoj4UWRkSqxKhqRY59UgnO
	FhvXHgOTx3GLu5qfjys7a0b+36wM77ZHq7BkUQ1DAETUfJk7+BXOVZ9PJdwOIMgtt0jdKU
	joxacJgBNjCcwlWNOd7SFOt6X3unF58=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-g2fU_lULN-q9LleF1XugwQ-1; Mon, 22 Jul 2024 11:31:52 -0400
X-MC-Unique: g2fU_lULN-q9LleF1XugwQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6658c3d7757so10193057b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 08:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721662312; x=1722267112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy2hKoepXG/rD4fs1gDu/NkLXDQ0MSD+ICWqPzfOpkw=;
        b=pBRolRVAaHnRyRSvbq0GQNNp3g0ZZcg2GdFMo56j0UqTsi/OutRWMhpI/faWu1qzsE
         i5O1GPL2eKyPSNyTxLWEXX/AJeGqZs/yLlwjoLBgNAdfzq3KVAgav4MBBdzbBzmOqh5g
         YHhEV3itqMazngZwQeo0Cv2oFvBoPoOkbzXPHo3HOeJXnMr5KudyyxA8hqUJeNmLV55A
         ty6X0j9Vlvi5yTSxRFfXH/Vs6gwZS+62GyE0TXYlZ+Mt6RvlHbcAbcWT0wnWkGPtOFuJ
         e03GInR/3eSmoBMRYyur0k4KqDhrtNU/P7MKFpcv85gt8docBzgklfSf+yOZf09/By5d
         ag4g==
X-Forwarded-Encrypted: i=1; AJvYcCWoPxm+18vf2gQFi6G+5zYEAaPECiNhyoNzA9pTS4RGSReXLh5AvagyFonF6Wx1YPHIJF/Pk9Y4In4I9BRMUYfrDuaHCG/Y9rA8hIP43g==
X-Gm-Message-State: AOJu0YyDekAQ2roJI/2O+8DwMhqX7CXpNJnj/njUmJwTjxINCqsAllBz
	y8A62I6/xFi9wMB17cjRc+ZF0cNwWVk5hag7KozgpgFqLRZf8Jvpp+jq0I13GiBfoaoEL09RNEj
	jiLrTn1DsqJqa+G5GYUcV3gXThhrpUFZHBVB5cNX3bjERKoQ2xq+8iFnveCL/OJ4=
X-Received: by 2002:a05:690c:12:b0:62f:7951:fe4d with SMTP id 00721157ae682-66a6645377bmr38047647b3.4.1721662311620;
        Mon, 22 Jul 2024 08:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjAYBMqsJOtNPwFqnMhMAJ/HDPRITSVBivrOVSPNdHxvmNPnz6ZnQiqjkhPkHbmoLpOWtDQA==
X-Received: by 2002:a05:690c:12:b0:62f:7951:fe4d with SMTP id 00721157ae682-66a6645377bmr38047287b3.4.1721662311092;
        Mon, 22 Jul 2024 08:31:51 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198fba6efsm372071285a.41.2024.07.22.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 08:31:50 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:31:48 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
Message-ID: <Zp57ZLk2IQoHOI7u@x1n>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com>
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
Cc: linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2024 at 03:29:43PM +0200, David Hildenbrand wrote:
> On 18.07.24 00:02, Peter Xu wrote:
> > This is an RFC series, so not yet for merging.  Please don't be scared by
> > the code changes: most of them are code movements only.
> > 
> > This series is based on the dax mprotect fix series here (while that one is
> > based on mm-unstable):
> > 
> >    [PATCH v3 0/8] mm/mprotect: Fix dax puds
> >    https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com
> > 
> > Overview
> > ========
> > 
> > This series doesn't provide any feature change.  The only goal of this
> > series is to start decoupling two ideas: "THP" and "huge mapping".  We
> > already started with having PGTABLE_HAS_HUGE_LEAVES config option, and this
> > one extends that idea into the code.
> > 
> > The issue is that we have so many functions that only compile with
> > CONFIG_THP=on, even though they're about huge mappings, and huge mapping is
> > a pretty common concept, which can apply to many things besides THPs
> > nowadays.  The major THP file is mm/huge_memory.c as of now.
> > 
> > The first example of such huge mapping users will be hugetlb.  We lived
> > until now with no problem simply because Linux almost duplicated all the
> > logics there in the "THP" files into hugetlb APIs.  If we want to get rid
> > of hugetlb specific APIs and paths, this _might_ be the first thing we want
> > to do, because we want to be able to e.g., zapping a hugetlb pmd entry even
> > if !CONFIG_THP.
> > 
> > Then consider other things like dax / pfnmaps.  Dax can depend on THP, then
> > it'll naturally be able to use pmd/pud helpers, that's okay.  However is it
> > a must?  Do we also want to have every new pmd/pud mappings in the future
> > to depend on THP (like PFNMAP)?  My answer is no, but I'm open to opinions.
> > 
> > If anyone agrees with me that "huge mapping" (aka, PMD/PUD mappings that
> > are larger than PAGE_SIZE) is a more generic concept than THP, then I think
> > at some point we need to move the generic code out of THP code into a
> > common code base.
> > 
> > This is what this series does as a start.
> 
> Hi Peter!
> 
> From a quick glimpse, patch #1-#4 do make sense independent of patch #5.
> 
> I am not so sure about all of the code movement in patch #5. If large folios
> are the future, then likely huge_memory.c should simply be the home for all
> that logic.
> 
> Maybe the goal should better be to compile huge_memory.c not only for THP,
> but also for other use cases that require that logic, and fence off all THP
> specific stuff using #ifdef?
> 
> Not sure, though. But a lot of this code movements/churn might be avoidable.

I'm fine using ifdefs in the current fine, but IMHO it's a matter of
whether we want to keep huge_memory.c growing into even larger file, and
keep all large folio logics only in that file.  Currently it's ~4000 LOCs.

Nornally I don't see this as much of a "code churn" category, because it
doesn't changes the code itself but only move things.  I personally also
prefer without code churns, but only in the case where there'll be tiny
little functional changes here and there without real benefit.

It's pretty unavoidable to me when one file grows too large and we'll need
to split, and in this case git doesn't have a good way to track such
movement..

Irrelevant of this, just to mention I think there's still one option that I
at least can make the huge pfnmap depends on THP again which shouldn't be a
huge deal (I don't have any use case that needs huge pfnmap but disable
THP, anyway..), so this series isn't an immediate concern to me for that
route.  But for a hugetlb rework this might be something we need to do,
because we simplly can't make CONFIG_HUGETLB rely on CONFIG_THP..

Thanks,

-- 
Peter Xu

