Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9F6525AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 18:39:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nc3jl03HNz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 04:39:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f378FLiC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FoCIps0T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f378FLiC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FoCIps0T;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nc3hm2N30z2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 04:38:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671557920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEfc8sJnHm7K9aruHy33BZirM4UCmBd1CuSTlZNxnWo=;
	b=f378FLiCTEU48S5bhGhS0vPelNpWAsXVKBiOL2+Jok6qlwUrLKBwmC/e2wJhw/BIznkufV
	GjiCC5iCGaVAyOlZ8UD0nPkdLvY9pFmHnUPb16gQ/1VQUXjsmOZv29m0tWZwyh6+GbKJny
	78bwLCFoqyG+rNkcp9/GgJwX+ktk3GE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671557921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEfc8sJnHm7K9aruHy33BZirM4UCmBd1CuSTlZNxnWo=;
	b=FoCIps0Tl99wRuavn5OKmSrczoo4mXw0PJcZHvklZWbVRdxcu2undnP4cHjBAG7meF+vxN
	SFFyja40hi9+zS3ACrIb3MUaxJ9XjxBDWQyI1AqCLMRLXZamR6+r0xGMDL2iudj/peeSBc
	cAo0vJCztbX9i21q9VsWBtVj/W3I/KM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-Ty8kgWUsNb-HPR6uVc_BRg-1; Tue, 20 Dec 2022 12:38:39 -0500
X-MC-Unique: Ty8kgWUsNb-HPR6uVc_BRg-1
Received: by mail-qt1-f198.google.com with SMTP id e18-20020ac84912000000b003a96d6f436fso5839282qtq.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 09:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEfc8sJnHm7K9aruHy33BZirM4UCmBd1CuSTlZNxnWo=;
        b=AsTkSM6YJZPcHiz6Ym2PN3t0EmS6QbYCDnv2TY7+YrXMyLJ19HgzxBZL0liSsemDJc
         bgn/oFqHlNwGSpbfxyyDwygGFHnQd29o96q2O7wh4t6jBQd7bSV7tUb4xyx5hC4t7bNV
         +OIeTkBgutGMb1mf8kXssGlluqMmzKFuFFrCGLsbhPwpoGg9t+zi9WlGCh0bNISz9JZe
         O0QWQZpqQVnpKfeEzaDyLQ36/irZNkp9xU90Fy9RWlr1sm8RlE+uZ+bifviwAnt0H60S
         eX8o+DOf/HVEve7ezJmhBOVMblwRus2cFmEgocnlcNDHfiLN74lvJxa+Owiqk2UFqhO+
         Sspw==
X-Gm-Message-State: AFqh2kp4pQ4spZpv3SQNCfHpG9WJYqKQPt5qyta/d2YvSNsLE8s76zgt
	3QLaxvNmfAHnrWhtS11GSG4du83dzufWLqiCxDU3VdoUPHH4RnFPfKrWvUkw9lwMNqWcUxIoXav
	F81pZfiarg0dJEX6RApAIqT2gUg==
X-Received: by 2002:ac8:7404:0:b0:3a9:8610:f9af with SMTP id p4-20020ac87404000000b003a98610f9afmr4892464qtq.14.1671557918844;
        Tue, 20 Dec 2022 09:38:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtg5R2YbTU53YK6jcMnW9vCQk+xxP9JBp96j27cdKzorbZMYmsqPt75wVleU8oFZr+Onr1Sjg==
X-Received: by 2002:ac8:7404:0:b0:3a9:8610:f9af with SMTP id p4-20020ac87404000000b003a98610f9afmr4892421qtq.14.1671557918568;
        Tue, 20 Dec 2022 09:38:38 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca. [70.31.26.132])
        by smtp.gmail.com with ESMTPSA id r17-20020a05620a299100b006fb8239db65sm9360534qkp.43.2022.12.20.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 09:38:37 -0800 (PST)
Date: Tue, 20 Dec 2022 12:38:36 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
Message-ID: <Y6HzHFdXB02Roa7q@x1n>
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
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
Cc: Christian Brauner <brauner@kernel.org>, linux-s390@vger.kernel.org, Nadav Amit <nadav.amit@gmail.com>, Michal Hocko <mhocko@suse.com>, Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>, netdev@vger.kernel.org, Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 16, 2022 at 11:20:12AM -0800, Mike Kravetz wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas as calls
> should be vma specific.
> 
> Instead of fixing zap_page_range, change all callers to use the new
> routine zap_vma_page_range.  zap_vma_page_range is just a wrapper around
> zap_page_range_single passing in NULL zap details.  The name is also
> more in line with other exported routines that operate within a vma.
> We can then remove zap_page_range.
> 
> Also, change madvise_dontneed_single_vma to use this new routine.
> 
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Peter Xu <peterx@redhat.com>

Thanks!

-- 
Peter Xu

