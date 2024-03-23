Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6400887623
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 01:32:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3YFDBz1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3YFDBz1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1gBM3cMlz3vmS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 11:32:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3YFDBz1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3YFDBz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1g8X3S7fz3vmD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 11:30:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711153831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXzFSacRUGOz3guP7FE0TFnIIG/3J2Y+D5Xv5mcIJ4I=;
	b=L3YFDBz15ei4xi9DoU3KhivryQa/8U4gzdBOqvwor21EeR9oAssNEgMe2nz+t4qzcPjPl7
	QteYXNa11sSEbPEw5P4IpfSmck1hJ3gkJF2qosU8RCK8N243KmZovtLP7V5zbzOYV0ctPM
	Qldcb+vzriCqXSb+9XDaUWNXbxI2WZI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711153831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXzFSacRUGOz3guP7FE0TFnIIG/3J2Y+D5Xv5mcIJ4I=;
	b=L3YFDBz15ei4xi9DoU3KhivryQa/8U4gzdBOqvwor21EeR9oAssNEgMe2nz+t4qzcPjPl7
	QteYXNa11sSEbPEw5P4IpfSmck1hJ3gkJF2qosU8RCK8N243KmZovtLP7V5zbzOYV0ctPM
	Qldcb+vzriCqXSb+9XDaUWNXbxI2WZI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-5SXhnOhyMuOpVNQ9L-CDqw-1; Fri, 22 Mar 2024 20:30:29 -0400
X-MC-Unique: 5SXhnOhyMuOpVNQ9L-CDqw-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43137863434so2142761cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711153829; x=1711758629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXzFSacRUGOz3guP7FE0TFnIIG/3J2Y+D5Xv5mcIJ4I=;
        b=jTgljFtcKpK4CPyU9iN4WTEfqChHXsTFUk/DtgAWNNkyIth8YPCIUnPD6k5a3VXoqt
         skNsvQ6mA2mBdWA6cYbCQ1RN+vhkLVYIP4307uaFQsmwbnCjpveUCUJ+L8nnhhWt3inW
         reVUfkG1QVWRIy8Aw23Sb0HJbZl3tP9RT4kqmRH3Ig077Vz0DtWPTyyCLF8BzVUFo1Gi
         KSLQxtpsPlsCRHs5iEM0B7+d0kAbaMiPZrY/GN+PjWV1C4dy4t6dU9KoKdQcpPnNdDPi
         O3p27l0gy0+eujooDVkGCr/CtzeU2oYR6fd8jNsjgtpU73hSZbMPRb/bjWCSMrTILKnU
         NUoA==
X-Forwarded-Encrypted: i=1; AJvYcCWx+qZLdwoBcgeTRad47nIrK5nT+c7MRYlR17P5soquD3bLYC1WZRFk8eIw9OI0uRReNe5FZe1FMutS+IEUbXQMzHHAKPwzOIrD3kg74g==
X-Gm-Message-State: AOJu0YwAzCGK/nfkoEgneLNSvs+dYqDMxxrmz2emRyeEIp3MTjJey0Aw
	1Wv1H4N2UNekugNt/lD851gALci4f8Z8YcyptJi5TGVFTAQNTMCnywgR5AreoZrB2zEWprYkUIK
	S/fjqsY3bEBXjlthCP7HN/PtpynmiKIWUj+ec5F3+8dgiXbfJsIg69iUqjP3kuc4=
X-Received: by 2002:a05:622a:1a97:b0:430:c2dc:a5ef with SMTP id s23-20020a05622a1a9700b00430c2dca5efmr1126596qtc.2.1711153828688;
        Fri, 22 Mar 2024 17:30:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Zwwie8lW8e1zjPdHeXjIabqqIya++N3e9UmqxHEMxwmGbP31eJT5HvpFdJCDH7G39Ns7UA==
X-Received: by 2002:a05:622a:1a97:b0:430:c2dc:a5ef with SMTP id s23-20020a05622a1a9700b00430c2dca5efmr1126562qtc.2.1711153828186;
        Fri, 22 Mar 2024 17:30:28 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id fy15-20020a05622a5a0f00b00430911bac01sm315722qtb.74.2024.03.22.17.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 17:30:27 -0700 (PDT)
Date: Fri, 22 Mar 2024 20:30:24 -0400
From: Peter Xu <peterx@redhat.com>
To: SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v3 03/12] mm: Make HPAGE_PXD_* macros even if !THP
Message-ID: <Zf4ioDkuSNJ0f1vR@x1n>
References: <20240321220802.679544-4-peterx@redhat.com>
 <20240322171456.118997-1-sj@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240322171456.118997-1-sj@kernel.org>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 10:14:56AM -0700, SeongJae Park wrote:
> Hi Peter,

Hi, SeongJae,

> 
> On Thu, 21 Mar 2024 18:07:53 -0400 peterx@redhat.com wrote:
> 
> > From: Peter Xu <peterx@redhat.com>
> > 
> > These macros can be helpful when we plan to merge hugetlb code into generic
> > code.  Move them out and define them even if !THP.
> > 
> > We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
> > Reorganize these macros.
> > 
> > Reviewed-by: Christoph Hellwig <hch@infradead.org>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/linux/huge_mm.h | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> > 
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index de0c89105076..3bcdfc7e5d57 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
> >  				  enum transparent_hugepage_flag flag);
> >  extern struct kobj_attribute shmem_enabled_attr;
> >  
> > -#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> > -#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> > -
> >  /*
> >   * Mask of all large folio orders supported for anonymous THP; all orders up to
> >   * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
> > @@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
> >  #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
> >  	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
> >  
> > -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  #define HPAGE_PMD_SHIFT PMD_SHIFT
> >  #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
> >  #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
> > +#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> > +#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> >  
> >  #define HPAGE_PUD_SHIFT PUD_SHIFT
> >  #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
> >  #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
> > +#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
> > +#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
> 
> I just found latest mm-unstable fails one of my build configurations[1] with
> below error.  'git bisect' says this is the first patch set started the
> failure.  I haven't looked in deep, but just reporting first.
> 
>     In file included from .../include/linux/mm.h:1115,
>                      from .../mm/vmstat.c:14:
>     .../mm/vmstat.c: In function 'zoneinfo_show_print':
>     .../include/linux/huge_mm.h:87:25: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
>        87 | #define HPAGE_PMD_SHIFT PMD_SHIFT
>           |                         ^~~~~~~~~
> 
> [1] https://github.com/awslabs/damon-tests/blob/next/corr/tests/build_m68k.sh

Apologies for the issue.  This is caused by !CONFIG_MMU, I think.

I thought this would be fairly easy to fix by putting these macros under
CONFIG_PGTABLE_HAS_HUGE_LEAVES, however when doing this I could have found
some other issue that violates this rule.. mm/vmstat.c has referenced
HPAGE_PMD_NR even if vmstat_item_print_in_thp() wanted to guard it only
with CONFIG_THP.

/home/peterx/git/linux/mm/vmstat.c: In function 'zoneinfo_show_print':
/home/peterx/git/linux/mm/vmstat.c:1689:42: error: 'HPAGE_PMD_NR' undeclared (first use in this function)
 1689 |                                 pages /= HPAGE_PMD_NR;
      |                                          ^~~~~~~~~~~~
/home/peterx/git/linux/mm/vmstat.c:1689:42: note: each undeclared identifier is reported only once for each function it appears in
  CC      drivers/tty/tty_port.o
/home/peterx/git/linux/mm/vmstat.c: In function 'vmstat_start':
/home/peterx/git/linux/mm/vmstat.c:1822:33: error: 'HPAGE_PMD_NR' undeclared (first use in this function)
 1822 |                         v[i] /= HPAGE_PMD_NR;
      |                                 ^~~~~~~~~~~~
make[4]: *** [/home/peterx/git/linux/scripts/Makefile.build:243: mm/vmstat.o] Error 1

static __always_inline bool vmstat_item_print_in_thp(enum node_stat_item item)
{
        if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
                return false;
        ...
}

I think the problem is vmstat_item_print_in_thp() uses IS_ENABLED() however
that won't stop compiler from looking into the "if".. so it'll still try to
find the HPAGE_PMD_NR macro.

It means, I may need to further change vmstat_item_print_in_thp() to make
this work in the clean way.. by properly switching to a #ifdef.

For that I'll need to post a formal patch and add people to review.  I'll
keep you posted.

Side note: thank you for your script, just to mention make.cross has been
moved to kbuild/, and it'll also need kbuild.sh now to work.  So you may
want to fix your test script (and it worked for you because you kept the
old make.cross around), like:

  wget https://raw.githubusercontent.com/intel/lkp-tests/master/kbuild/make.cross -O ./bin/make.cross
  wget https://raw.githubusercontent.com/intel/lkp-tests/master/kbuild/kbuild.sh -O ./bin/kbuild.sh

Thanks,

-- 
Peter Xu

