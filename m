Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33D897832
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 20:26:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7wQeRaO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7wQeRaO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8tW62Chsz3vh4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 05:26:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7wQeRaO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7wQeRaO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8tTl5XtWz3vd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 05:25:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712168726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YXsmqoOHzY6mBushOHoxlZz3TK/EfZqT4lQukaq20AM=;
	b=P7wQeRaO8pvv+bsOulr62tjYpf9C/Ld0fZFLGcYNPH5EYnIjilLCjxadWI9eW7sFMOz2Sl
	YOtZmbPJrKk3igLm1q8w23oy+TciBsvtxjKiAoMtSgx1j9gd25lh9l5ZeYbV3Zmx4aZXY2
	s47pBu5TUZPUCNmoQImKpUIaxAbU+eE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712168726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YXsmqoOHzY6mBushOHoxlZz3TK/EfZqT4lQukaq20AM=;
	b=P7wQeRaO8pvv+bsOulr62tjYpf9C/Ld0fZFLGcYNPH5EYnIjilLCjxadWI9eW7sFMOz2Sl
	YOtZmbPJrKk3igLm1q8w23oy+TciBsvtxjKiAoMtSgx1j9gd25lh9l5ZeYbV3Zmx4aZXY2
	s47pBu5TUZPUCNmoQImKpUIaxAbU+eE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-C59wvAjyMQeGtc97pYwjYw-1; Wed, 03 Apr 2024 14:25:24 -0400
X-MC-Unique: C59wvAjyMQeGtc97pYwjYw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6991ad4ea9eso182596d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 11:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168724; x=1712773524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXsmqoOHzY6mBushOHoxlZz3TK/EfZqT4lQukaq20AM=;
        b=svkPD03MvteF9qxW159jNJYC5DUv49ZugMv7eOWrqI9NMndBPP6emPRFgAt1SDVHuS
         Z5CNrUYaPI68ezm6L1Ru7rqKQcBvwlzUn0C5cfnvDBg6t0JEnjdGfSgYfhu2O2Uzf7HH
         SygmXLffiJ9o/yz/zQqywdwOUKKVyL/xvC8KaQIt+41ndGPUV9R9vDcozyQrBg8jwSwv
         R/MDlIfi0/G9epBFtd6Ti4fu7uf21jAbInvPmtQNefb7gPwwYMuW+eD/6TOF15O47zIq
         Qcyp6WjhuATzHhOMP6JEf+CaI/b1NmTnlZjJtZMv8XXxFHR2wTM+7iioB5V1/pgxEr0r
         usnA==
X-Forwarded-Encrypted: i=1; AJvYcCXp/Jl/c4WMQuGoEUFhpGhpSJzZxEMtFk692zLiYpZxM2WdUDeXazsn7hgBsSJxvGnPuJmLwUdzW/EKZ2F7rG5FwWfXPzqmP/7gP6FXCA==
X-Gm-Message-State: AOJu0YyHQe8p9uMFxpgNarmCm+zdjjN+hcv2NoKDPYSnvNM7J1wKE7l7
	cZtkubwPnnf+cziIlF+wPfn0HFnhwoJOeQZtqVoHeJbL5UV7stuBC3RkeFqppuq88gvbO8l4UQD
	y1QCiE7VnRidOMe/8g/dmKAeYeDBstZRa4euHeeex2aLY59RO8jtXvO1EqfJqf+U=
X-Received: by 2002:ad4:5cab:0:b0:699:2242:4ee8 with SMTP id q11-20020ad45cab000000b0069922424ee8mr129096qvh.3.1712168724109;
        Wed, 03 Apr 2024 11:25:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOuNMZozoa6aScFD4XBgyXphotERni3kWeSwgWQ4wF27W29jsLbCwW0feeq4rwhZfTMS4o4A==
X-Received: by 2002:ad4:5cab:0:b0:699:2242:4ee8 with SMTP id q11-20020ad45cab000000b0069922424ee8mr129072qvh.3.1712168723495;
        Wed, 03 Apr 2024 11:25:23 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id s15-20020a0562140caf00b00698fd63d167sm4435500qvs.123.2024.04.03.11.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:25:23 -0700 (PDT)
Date: Wed, 3 Apr 2024 14:25:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <Zg2fEP4eEeLhgDwE@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240403120841.GB1723999@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 09:08:41AM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 02, 2024 at 07:35:45PM -0400, Peter Xu wrote:
> > On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> > > 
> > > > I actually tested this without hitting the issue (even though I didn't
> > > > mention it in the cover letter..).  I re-kicked the build test, it turns
> > > > out my "make alldefconfig" on loongarch will generate a config with both
> > > > HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> > > > THP=y (which I assume was the one above build used).  I didn't further
> > > > check how "make alldefconfig" generated the config; a bit surprising that
> > > > it didn't fetch from there.
> > > 
> > > I suspect it is weird compiler variations.. Maybe something is not
> > > being inlined.
> > > 
> > > > (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> > > >  triggering it elsewhere but failed..)
> > > 
> > > As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> > > called and the optimizer removing it.
> > 
> > Good point, for some reason loongarch defined pud_leaf() without defining
> > pud_pfn(), which does look strange.
> > 
> > #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
> > 
> > But I noticed at least MIPS also does it..  Logically I think one arch
> > should define either none of both.
> 
> Wow, this is definately an arch issue. You can't define pud_leaf() and
> not have a pud_pfn(). It makes no sense at all..
> 
> I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> at least

Yes, that sounds better too to me, however it means we may also risk other
archs that can fail another defconfig build.. and I worry I bring trouble
to multiple such cases.  Fundamentally it's indeed my patch that broke
those builds, so I still sent the change and leave that for arch developers
to decide the best for the archs.

I think if wanted, we can add that BUILD_BUG() back when we're sure no arch
will break with it.  So such changes from arch can still be proposed
alongside of removal of BUILD_BUG() (and I'd guess some other arch will
start to notice such build issue soon if existed.. so it still more or less
has similar effect of a reminder..).

Thanks,

-- 
Peter Xu

