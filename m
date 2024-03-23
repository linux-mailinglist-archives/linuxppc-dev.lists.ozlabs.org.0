Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0988763E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 01:46:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ac/1hIHU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ac/1hIHU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1gWK1pvpz3vkm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 11:46:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ac/1hIHU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ac/1hIHU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1gVX1WRXz3dTm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 11:46:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711154767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1OPeHdcChNLXNL4AZVVP+Dj6erLbPxRFcj0CZKU2hHc=;
	b=ac/1hIHUi10/DvPszFnqX3YgmNqMGOPRLoWiI4hswIwakW5L0Wpf5Q7mrGuajVooPlWn+X
	WOkH9Jrxelp3OpfTGP2HemSb+i01nYlE+7Pqlj3zTJH0o/njaWf0JxMn+865wLImOLA6II
	KcGbg2W8xMXSR5N7NtbriUJfnWuwlUQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711154767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1OPeHdcChNLXNL4AZVVP+Dj6erLbPxRFcj0CZKU2hHc=;
	b=ac/1hIHUi10/DvPszFnqX3YgmNqMGOPRLoWiI4hswIwakW5L0Wpf5Q7mrGuajVooPlWn+X
	WOkH9Jrxelp3OpfTGP2HemSb+i01nYlE+7Pqlj3zTJH0o/njaWf0JxMn+865wLImOLA6II
	KcGbg2W8xMXSR5N7NtbriUJfnWuwlUQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-EtwPa1QsNK-Q4nR5XNIvAA-1; Fri, 22 Mar 2024 20:46:04 -0400
X-MC-Unique: EtwPa1QsNK-Q4nR5XNIvAA-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-430b9ee6bfbso5525981cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711154763; x=1711759563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OPeHdcChNLXNL4AZVVP+Dj6erLbPxRFcj0CZKU2hHc=;
        b=sqrYgEtbIWsYQbf948zSgAcj6Y8dCAOE9hN9epyNcLXjJpOZmlccmmqvqN7aPrz2Wp
         nMD8Q/0spN3B/jrXDtedeNXFcNDDQScVNypiu0e+H/GaWXH0uUbrntfHqw6KQ8AlAcEx
         K3fIXwX9OTJJhwciYOp1MILQ5qOCf0SIgX4EO39g6Ka7O3PVdcHueOiGgr50myJJ7lft
         lztUru8PaOKON7hNAnw3/hv92sKweYGbGF1dZcoZQ+HqjJseQ7xrAKThN9bqSTtZNs4A
         4HvuJG0H/qB5ifVHEjoiPRjFrNi0uXdQpp9IIJdaKuLeTkLt1sed/WT1klISBX6MG8lT
         ldmw==
X-Forwarded-Encrypted: i=1; AJvYcCUbAq7z0DtV4RnIc9VPMOEPpKekOSTOcVtX/g6F7PoFbGDna47nUfdkGbwQx33aqblS7Gm/48Kq6Hq/PEazn9K3P6z9gvozPFhxM4hdbA==
X-Gm-Message-State: AOJu0YymMpzB3MqLJI0HXcLeWgULdf1wvtU0yyNXnFb07lGRGWZtyK2Q
	uaUA5sZNqamo/vCtVcdQNjqIsj5TNZgSdeDeRTptzYGUvCPncUVlbnawoIH1TUL0pzvScg1oOzV
	fEznG/XYRVap1iYN4zvh0K52XJbYH6QpzQNPIM/MJleicMI+gSweX2hUstUxNWj0=
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr1028545qvb.3.1711154762746;
        Fri, 22 Mar 2024 17:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxKOcFDVxpG3qeQleX58Tuq2r0TaBTmm4VWGOLqVds86GEmp/lVpAtwxST9mY/JIaYF94G+w==
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr1028507qvb.3.1711154762082;
        Fri, 22 Mar 2024 17:46:02 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jf8-20020a0562142a4800b006942dcac56asm1567334qvb.103.2024.03.22.17.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 17:46:01 -0700 (PDT)
Date: Fri, 22 Mar 2024 20:45:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <Zf4mR_OxE5Ft4VJg@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
 <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 01:48:18PM -0700, Andrew Morton wrote:
> On Thu, 21 Mar 2024 18:08:02 -0400 peterx@redhat.com wrote:
> 
> > From: Peter Xu <peterx@redhat.com>
> > 
> > Now follow_page() is ready to handle hugetlb pages in whatever form, and
> > over all architectures.  Switch to the generic code path.
> > 
> > Time to retire hugetlb_follow_page_mask(), following the previous
> > retirement of follow_hugetlb_page() in 4849807114b8.
> > 
> > There may be a slight difference of how the loops run when processing slow
> > GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> > loop of __get_user_pages() will resolve one pgtable entry with the patch
> > applied, rather than relying on the size of hugetlb hstate, the latter may
> > cover multiple entries in one loop.
> > 
> > A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> > a tight loop of slow gup after the path switched.  That shouldn't be a
> > problem because slow-gup should not be a hot path for GUP in general: when
> > page is commonly present, fast-gup will already succeed, while when the
> > page is indeed missing and require a follow up page fault, the slow gup
> > degrade will probably buried in the fault paths anyway.  It also explains
> > why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> > accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> > a performance analysis but a side benefit.  If the performance will be a
> > concern, we can consider handle CONT_PTE in follow_page().
> > 
> > Before that is justified to be necessary, keep everything clean and simple.
> > 
> 
> mm/gup.c:33:21: warning: 'follow_hugepd' declared 'static' but never defined [-Wunused-function]
>    33 | static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
>       |                     ^~~~~~~~~~~~~
> 
> --- a/mm/gup.c~mm-gup-handle-hugepd-for-follow_page-fix
> +++ a/mm/gup.c
> @@ -30,10 +30,12 @@ struct follow_page_context {
>  	unsigned int page_mask;
>  };
>  
> +#ifdef CONFIG_HAVE_FAST_GUP
>  static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
>  				  unsigned long addr, unsigned int pdshift,
>  				  unsigned int flags,
>  				  struct follow_page_context *ctx);
> +#endif
>  
>  static inline void sanity_check_pinned_pages(struct page **pages,
>  					     unsigned long npages)
> _
> 
> 
> This looks inelegant.
> 
> That's two build issues so far.  Please be more expansive in the
> Kconfig variations when testing.  Especially when mucking with pgtable
> macros.

Andrew,

Apologies for that, and also for a slightly late response.  Yeah it's time
I'll need my set of things to do serious build tests, and I'll at least
start to cover a few error prone configs/archs in with that.

I was trying to rely on the build bot in many of previous such cases, as
that was quite useful to me to cover many build issues without investing my
own test setups, but I think for some reason it retired and stopped working
for a while.  Maybe I shouldn't have relied on it at all.

For this specific issue, I'm not sure if CONFIG_HAVE_FAST_GUP is proper?
As follow_hugepd() is used in slow gup not fast.  So maybe we can put that
under CONFIG_MMU below that code (and I think we can drop "static" too as I
don't think it's anything useful).  My version of fixup attached at the end
of email, and I verified it on m68k build.

I do plan to post a small fixup series to fix these issues (so far it may
contain 1 formal patch to touch up vmstat_item_print_in_thp, and 2 fixups
where I'll mark the subject with "fixup!" properly).  Either you can pick
up below or you can wait for my small patchset, should be there either
today or tomorrow.

Thanks,

===8<===
diff --git a/mm/gup.c b/mm/gup.c
index 4cd349390477..a2ed8203495a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -30,11 +30,6 @@ struct follow_page_context {
        unsigned int page_mask;
 };
 
-static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
-                                 unsigned long addr, unsigned int pdshift,
-                                 unsigned int flags,
-                                 struct follow_page_context *ctx);
-
 static inline void sanity_check_pinned_pages(struct page **pages,
                                             unsigned long npages)
 {
@@ -505,6 +500,12 @@ static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
 }
 
 #ifdef CONFIG_MMU
+
+struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+                          unsigned long addr, unsigned int pdshift,
+                          unsigned int flags,
+                          struct follow_page_context *ctx);
+
 static struct page *no_page_table(struct vm_area_struct *vma,
                                  unsigned int flags, unsigned long address)
 {
===8<===

-- 
Peter Xu

