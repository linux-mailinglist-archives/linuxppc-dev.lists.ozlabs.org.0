Return-Path: <linuxppc-dev+bounces-397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BAC95BEBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 21:17:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqXyD6Gpkz2ydN;
	Fri, 23 Aug 2024 05:17:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724354228;
	cv=none; b=UvEI7x/6bgGLi0YcYIqMnTqKRdShS9WyjmATGQOtEjaMy9TMDY2DRNjy94bStKXBvp2C67nDFVrz+P1adodKhZa3dC/IiqlVcVM0CWe6cbeivB1c0AZPFY0cRs3Fj+x3zKMqDJNXKQSKfvLjjMAVh7P2++VvzFbA3qAYmqg3vhbyMtV3g8Xg8QfZRJpmYFdk3aHUm5Qlfwg+Cm23dzaSe78/dsXXr+HjtdHJp1pXkxqiFo3ckJNUv6NQR19hLrQVgo5FbRieWc+Dwx4FMiCAZXTbEV6q31HqD9eQ6yhadSOnUKEIDNHWwoUIfMvZig1Gwl15h4+mHt5vwHEARmC5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724354228; c=relaxed/relaxed;
	bh=8YIGGOCAzyFLMegU+7vlNDExeBWij0GRi4vYqrn2fMA=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-Originator:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding; b=N21ZC2N0bF0ddrIlQ6Fso80xCSCSXXfq1zxKA3dTg+VAsOqYMH+JdCxZeoXjhfbkAFxi6jTEFPNQex2y+e136A+JwA9x9V8bCfJ5HfdimNMvLF8oyTzyeCnnqTmyx2Omnep3p82VuXvNKmeRgt4qNxdzn1k95lauBJJ15pF4Z6ybGsKZaqzwMeETnEyCtzIEogE/I0dWELZaxUeSG06BHw4EO7MCilzAEUnkVjVNzwnX3YxEgrt2cDAgGUC4rx9r9Wjr6phQm0ImjIyXU7H8lapmHHPPveecgnu0a+jJi5dmXxVknvdEentnvILEIT7KcJB8uJqrPB2UHp1oNwyarw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bsE7Juvx; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NKTUqdVB; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bsE7Juvx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NKTUqdVB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqXyD2Z2qz2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 05:17:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724354221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YIGGOCAzyFLMegU+7vlNDExeBWij0GRi4vYqrn2fMA=;
	b=bsE7Juvxqdfr7b385vESNRNAv5wUuV2nAXdUwxP/BZZYnpQqLicGAzH/1H/NKiGqcTbKdk
	uAK+Q8PjiHlT4/4UXgTArrKv/dgcIixQINGkSLEk+85lR/kd6lpZX6Epy2ydh97orvqyXA
	Z5CSHk/HkOEZUiBvVeStdB9iNdrOux4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724354222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YIGGOCAzyFLMegU+7vlNDExeBWij0GRi4vYqrn2fMA=;
	b=NKTUqdVBEy94QjgK50nKhbIuC61tcxe0wn6IJVsEfsShE0QopBQZyUxbb4bJJKE0B/w5Tg
	JWaRmd4SyqB5wjzwpAc5VHO1i/TTpdtXuH2LkbfVtCgHErUnAavLUesBQzKaESLwGjlb1x
	6yxsZDW/Xk6C8KjvgtZ6bLZlrj8CYKA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-9XQxqXotPFG3uGrwyB93yA-1; Thu, 22 Aug 2024 15:17:00 -0400
X-MC-Unique: 9XQxqXotPFG3uGrwyB93yA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6bf9514fdc4so11187986d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 12:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724354219; x=1724959019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YIGGOCAzyFLMegU+7vlNDExeBWij0GRi4vYqrn2fMA=;
        b=jyRY78JHjcFTQK/hMTcP6n1NFnTF5SEkv8+UGgnrFHXejqZGLy3LbtDWn0Vm40TMFK
         shOaSC44mS/S8eygI0+XgheSp/nlLJHs1C5/EzPaPgbmREa2zkY1n3rDZoqE2sTJUXgI
         wENzqdghyQDoi6WAHfZtPepYDYkUcrMePj7ce5c5DzDJIyOEnLvT7atgISZYSxu/7opS
         Df8ypo9VEyIgOWsJqvUkHJQe4W9RkckOP/S1qUJd2TiirSeDblhKLHKwdo1IoiglOBaP
         5BbLw+bwtkCLARTuqKHMVs+JQL1PFDtIQHorowJWLKr5TKgz8nhjWLyoFXuzZiz43OpB
         ccfw==
X-Forwarded-Encrypted: i=1; AJvYcCWdwM958oUFr29gpEV2lFbntKXt8le20bDnOqvzyR/kHdg/No+DGxt8YjHLIExqoPmgCbYUYkNS2WGATK0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMPDYPR5O70hUM1dCP3kzfuQGIjSCXj5JIeKXtpsDJYOMcvj6P
	TWOdUjHmnI1MZZXB529lmGhKkWzCvUmkM4uZ9uGgaHAEWI9+nd1uNjxdXFcPbyZ1r+IMHclrhCF
	28d2q2L9xROa1w+3Efe6nd09e2JE+DKOV9oRn9cScFh1FByqPj4iz9VuOu2h5scg=
X-Received: by 2002:a05:6214:5d0b:b0:6bf:77d2:bd1b with SMTP id 6a1803df08f44-6c155d50b2cmr98300336d6.1.1724354219440;
        Thu, 22 Aug 2024 12:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFYSGXCSjeDYuhWfImPH5iwMXkcbcR5SnsnH9Y1R2sqbG+oUFa29LZaEVT2+yBaXWcgJ2DTA==
X-Received: by 2002:a05:6214:5d0b:b0:6bf:77d2:bd1b with SMTP id 6a1803df08f44-6c155d50b2cmr98299806d6.1.1724354219032;
        Thu, 22 Aug 2024 12:16:59 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162db0986sm10643056d6.97.2024.08.22.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 12:16:58 -0700 (PDT)
Date: Thu, 22 Aug 2024 15:16:55 -0400
From: Peter Xu <peterx@redhat.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, "x86@kernel.org" <x86@kernel.org>,
	Alistair Popple <apopple@nvidia.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Message-ID: <ZseOp7M9AmZtW4jw@x1n>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <20240717220219.3743374-3-peterx@redhat.com>
 <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 22, 2024 at 05:22:03PM +0000, LEROY Christophe wrote:
> 
> 
> Le 18/07/2024 à 00:02, Peter Xu a écrit :
> > Introduce two more sub-options for PGTABLE_HAS_HUGE_LEAVES:
> > 
> >    - PGTABLE_HAS_PMD_LEAVES: set when there can be PMD mappings
> >    - PGTABLE_HAS_PUD_LEAVES: set when there can be PUD mappings
> > 
> > It will help to identify whether the current build may only want PMD
> > helpers but not PUD ones, as these sub-options will also check against the
> > arch support over HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD].
> > 
> > Note that having them depend on HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD] is
> > still some intermediate step.  The best way is to have an option say
> > "whether arch XXX supports PMD/PUD mappings" and so on.  However let's
> > leave that for later as that's the easy part.  So far, we use these options
> > to stably detect per-arch huge mapping support.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   include/linux/huge_mm.h | 10 +++++++---
> >   mm/Kconfig              |  6 ++++++
> >   2 files changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 711632df7edf..37482c8445d1 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -96,14 +96,18 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
> >   #define thp_vma_allowable_order(vma, vm_flags, tva_flags, order) \
> >   	(!!thp_vma_allowable_orders(vma, vm_flags, tva_flags, BIT(order)))
> >   
> > -#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> > -#define HPAGE_PMD_SHIFT PMD_SHIFT
> > +#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
> >   #define HPAGE_PUD_SHIFT PUD_SHIFT
> >   #else
> > -#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
> >   #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
> >   #endif
> >   
> > +#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
> > +#define HPAGE_PMD_SHIFT PMD_SHIFT
> > +#else
> > +#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
> > +#endif
> > +
> >   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> >   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> >   #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 60796402850e..2dbdc088dee8 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -860,6 +860,12 @@ endif # TRANSPARENT_HUGEPAGE
> >   config PGTABLE_HAS_HUGE_LEAVES
> >   	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
> >   
> > +config PGTABLE_HAS_PMD_LEAVES
> > +	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE && PGTABLE_HAS_HUGE_LEAVES
> > +
> > +config PGTABLE_HAS_PUD_LEAVES
> > +	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD && PGTABLE_HAS_HUGE_LEAVES
> > +
> 
> What if an architecture has hugepages at PMD and/or PUD level and 
> doesn't support THP ?

What's the arch to be discussed here?

The whole purpose of this series so far is trying to make some pmd/pud
helpers that only defined with CONFIG_THP=on to be available even if not.
It means this series alone (or any future plan) shouldn't affect any arch
that has CONFIG_THP=off always.

But logically I think we should need some config option just to say "this
arch supports pmd mappings" indeed, even if CONFIG_THP=off.  When that's
there, we should perhaps add that option into this equation so
PGTABLE_HAS_*_LEAVES will also be selected in that case.

-- 
Peter Xu


