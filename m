Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E622E94B238
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 23:34:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PstDa8uM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PstDa8uM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfNk75p50z3dKm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 07:34:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PstDa8uM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PstDa8uM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfNjS5DMzz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 07:34:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723066456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8A4Mtfk/rFhpacRxxv8Vl2NMxtodppFf5jwJTCX6+c=;
	b=PstDa8uMomEVBp3opLu0E5KFkaoVyeI61MjzxVwz9UwtqdhfXuELLEmu/2FsLL0ZX5AEfX
	CHL+PYdVhM/6GYzXelVtL2tZVXHuiQH5GuVetwjdi389SCMItTFlpeA/Me8Ky9F3hygFw8
	JlBIIxBrakrmWjmLOJxx5KlfThvmbJY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723066456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8A4Mtfk/rFhpacRxxv8Vl2NMxtodppFf5jwJTCX6+c=;
	b=PstDa8uMomEVBp3opLu0E5KFkaoVyeI61MjzxVwz9UwtqdhfXuELLEmu/2FsLL0ZX5AEfX
	CHL+PYdVhM/6GYzXelVtL2tZVXHuiQH5GuVetwjdi389SCMItTFlpeA/Me8Ky9F3hygFw8
	JlBIIxBrakrmWjmLOJxx5KlfThvmbJY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-efRdNjHCMoW4etLUGThNtg-1; Wed, 07 Aug 2024 17:34:14 -0400
X-MC-Unique: efRdNjHCMoW4etLUGThNtg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44fe28cd027so602571cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 14:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723066454; x=1723671254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8A4Mtfk/rFhpacRxxv8Vl2NMxtodppFf5jwJTCX6+c=;
        b=QK1zTt2yhg+MfxShUjLcH0zaSEKnGOS5y5g/rgOxXGuXUW3IJuiyJ6DY19gfYOUfG3
         VwqzMjGi5JtLTwFd42jIHq/dvSTL1XmmIiL76uBX1Z9CyIy1GkQpbiBsAOPBS0pISmIW
         G0DhH2ObybDEVmTuPlj5VkgMAAR4iMgyzLskJsIH2I1gzqDh8fuI7aa0gpkkTyJYbHPo
         rjompT4dtrwV3z6/0Mtm68mYOWM6LYeX59IMSzCxjFNMV1xCBAHMm4frtnjGZrz8JVEi
         rtL1iDr/L6GXMfdQsy3JsliUBVgfCM4FIFX4vbgLoUGsHfbRxgNFgEpHNE1/E7SGPf9R
         J8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVIUCJLEg4xdXkOXUbWodxGkLW7Hv+I+FQxFq2sSY2kGsft7uSLo/RVqi/jKLD8Kvnug2hX+7nycXZiUVs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzzx7D2QKqm1YJTKtKKl5NcSGtmISZx7PDVv3NQziLiGwtiTOOr
	qVYdUHSdfmoeZH57GdV1CXFfHYxiBCCK3ZepBVkpNTUqDS/kExbklyg+1yA48DBPa3R+ZZzh67O
	YJkToH98ZtZMA0KhMA31UxJY0KlQ4ZHJ3kdF1TIpUujjMGnIpEGZiqqkKC5w6AQM=
X-Received: by 2002:ac8:578c:0:b0:44f:c953:290d with SMTP id d75a77b69052e-451d41f93b4mr23041cf.2.1723066454096;
        Wed, 07 Aug 2024 14:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0CdcvmJB1BOi53T58FRUCwR8qSSqwKPnnvElG8RvK5pkhn8YV6iabdWDMHLRrifpAyIPmjA==
X-Received: by 2002:ac8:578c:0:b0:44f:c953:290d with SMTP id d75a77b69052e-451d41f93b4mr22631cf.2.1723066453583;
        Wed, 07 Aug 2024 14:34:13 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c87db12asm7735661cf.73.2024.08.07.14.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 14:34:13 -0700 (PDT)
Date: Wed, 7 Aug 2024 17:34:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/7] mm/mprotect: Fix dax puds
Message-ID: <ZrPoUgISLqlF-iEQ@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807141703.d641001ee14177ccf80a31d8@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20240807141703.d641001ee14177ccf80a31d8@linux-foundation.org>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2024 at 02:17:03PM -0700, Andrew Morton wrote:
> On Wed,  7 Aug 2024 15:48:04 -0400 Peter Xu <peterx@redhat.com> wrote:
> 
> > 
> > Dax supports pud pages for a while, but mprotect on puds was missing since
> > the start.  This series tries to fix that by providing pud handling in
> > mprotect().  The goal is to add more types of pud mappings like hugetlb or
> > pfnmaps.  This series paves way for it by fixing known pud entries.
> > 
> > Considering nobody reported this until when I looked at those other types
> > of pud mappings, I am thinking maybe it doesn't need to be a fix for stable
> > and this may not need to be backported.  I would guess whoever cares about
> > mprotect() won't care 1G dax puds yet, vice versa.  I hope fixing that in
> > new kernels would be fine, but I'm open to suggestions.
> 
> Yes, I'm not sure this is a "fix" at all.  We're implementing something
> which previously wasn't there.  Perhaps the entire series should be
> called "mm: implement mprotect() for DAX PUDs"?

The problem is mprotect() will skip the dax 1G PUD while it shouldn't;
meanwhile it'll dump some bad PUD in dmesg.  Both of them look like (corner
case) bugs to me.. where:

  - skipping the 1G pud means mprotect() will succeed even if the pud won't
    be updated with the correct permission specified. Logically that can
    cause e.g. in mprotect(RO) then write the page can cause data corrupt,
    as the pud page will still be writable.

  - the bad pud will generate a pr_err() into dmesg, with no limit so far I
    can see.  So I think it means an userspace can DoS the kernel log if it
    wants.. simply by creating the PUD and keep mprotect-ing it

But yeah this series fixes this "bug" by implementing that part..

Thanks,

-- 
Peter Xu

