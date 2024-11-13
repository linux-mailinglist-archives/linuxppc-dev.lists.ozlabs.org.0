Return-Path: <linuxppc-dev+bounces-3148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FE19C7905
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 17:39:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpTXN0Vy1z2yG9;
	Thu, 14 Nov 2024 03:39:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731515988;
	cv=none; b=k5fiTOwk5TGy+fu2TUh6I2f7BZcDJH1a9uUEYL7C49PXWUl9+ghK+jmaLHS+ZgH1XnqYjpM9P2UHucFxX8XDlf6f4AhJnyaN9LwBGN9yRRopVrVzzWZVoFyqzf9/DrwdzUyb2rKCsMT+3veq1eBpadVOhZrw8NS8E9XHmpyinjt1TR3+itNn1CE3tVq9XcG8M3Q0uCGsa7f9D6qPIUW1xnLdcgd6dSdIsqRXmf/YhcoGyXgEuvY5mNtXHXfa+OtCLqaULs376/1Rq+hQaiESZsfolOCkkVKJFzv8RAPQeWjkWrkSqco7QEF/B6ltSyDuECM8w5Qx7lMmD/nHH38Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731515988; c=relaxed/relaxed;
	bh=32X9w96j/6luUoMGo5UFRFt7UJIdq29Ups7kfYJnJ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iX/3jsi+aqtpqBhxb2CjYn7rRlKY5vEUi3czMJOwmDsu2dVeH6e46zpT7lxCgH8MIU2F7qy9ucK72SEUfIZShV2W6GjHcP6QYvY69FLJrHsmKiweI2jyWoUGM/Su3XW4+GrA0Rt2oS/Ki/3ianwEh1ZYYq49WzuGbvVzk9PcgVTGAIZ76Tqf9VbM47F4VDWPVcQYRrMR49cwDS7WftqGEkf96kEa/1mkofzlPkgoCRhPK8AgneeHHJIZxnOFJPv/PSJ7Uza0ERz37XVF5yuPCJU5NjOhHnDKs1UYXlYpoqSZNG27tXW+S6QKbLqdpX+IlPAwlWoSBjxz2v5LZXt5JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4WeUCSG; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4WeUCSG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4WeUCSG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4WeUCSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpTXK5SxPz2xjY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 03:39:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731515978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32X9w96j/6luUoMGo5UFRFt7UJIdq29Ups7kfYJnJ7Q=;
	b=S4WeUCSGvAJmb00Ikb2pNcYnRWftBF1iEINm+NM9xMJHWmdduiOjjwV4lU+1L4Med3M7je
	UlgQFnDMQg3ZtbM4XyWqTBnMXzJk/xL45lF2icBjfWmGmRfDlXrGbeq7qwOt4qHo5tFBob
	7u3SvIAvqVomw+EEUwnFVINLiCflSKo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731515978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32X9w96j/6luUoMGo5UFRFt7UJIdq29Ups7kfYJnJ7Q=;
	b=S4WeUCSGvAJmb00Ikb2pNcYnRWftBF1iEINm+NM9xMJHWmdduiOjjwV4lU+1L4Med3M7je
	UlgQFnDMQg3ZtbM4XyWqTBnMXzJk/xL45lF2icBjfWmGmRfDlXrGbeq7qwOt4qHo5tFBob
	7u3SvIAvqVomw+EEUwnFVINLiCflSKo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-CaOZrUoRNoiWXqlLE9maNg-1; Wed, 13 Nov 2024 11:39:35 -0500
X-MC-Unique: CaOZrUoRNoiWXqlLE9maNg-1
X-Mimecast-MFC-AGG-ID: CaOZrUoRNoiWXqlLE9maNg
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d37778b40eso103762236d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 08:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731515974; x=1732120774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32X9w96j/6luUoMGo5UFRFt7UJIdq29Ups7kfYJnJ7Q=;
        b=d9nMa17kAyBgVTF5YeOZBMXfs7CRwZd2oXnYGU/w9xNF1si5s5rVkCKp3sErKrIk37
         LNUPLDfWuUqUKB1r2z637cIBfVJm/zmfHrwaGJnOgO0PmN6VABQOIXsWoN3PcCRp0QOH
         X8lhLQkZ6No22iob7cv8gx3MRdVIPqDWJt9Mo7v0JXTvszr5lTtbhPZtFj+VZwpLTaV+
         j+5/NIEiZLgw8KmjKomT6BZ/NKJp0ndDdYC1uiiDfPThJVW2Fc8L77qRXhqSuCOJeHG4
         alAktdU94bKYyPsyUf+/3EdcOoUyHcjWvPfVeAXRE9ed8C/4KvK9CiGI14pemJKGqNNG
         jpqw==
X-Forwarded-Encrypted: i=1; AJvYcCVe5c8yl6MbPRHsndoR7p2aOlGcqFDe3S1utW9hqX9zzurdGQQvobvJ5XeGkuqCnXpgQ0oa7I5t9s8WTwI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxS85zC5O5XjSOl/xontslPWtoRh5ezVI8IjDLV4ndBoY+Gxl1q
	CUEosZbrjNeroCVTPESXCKgNSqTNrYlG9bG36oWm/yXbs6hm9bTBmbkng36pbGHqX4I+Dnmk/Qs
	BTQPhdSUu6h5JC904l8f9zRSb+CRiONCdeJ0DP4apiQbA5a3O8WrePNaA47xSWYw=
X-Received: by 2002:a05:6214:3987:b0:6ce:34d5:8882 with SMTP id 6a1803df08f44-6d39e19e2a1mr283778436d6.39.1731515974478;
        Wed, 13 Nov 2024 08:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDKo6Iqu9xjWDgAQhCuGtni17bdPjeCzIpnbYgct2pKE70TzMw5IDOMnCe9a1WfloQWLLrHw==
X-Received: by 2002:a05:6214:3987:b0:6ce:34d5:8882 with SMTP id 6a1803df08f44-6d39e19e2a1mr283777986d6.39.1731515974173;
        Wed, 13 Nov 2024 08:39:34 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961dfad2sm86443686d6.1.2024.11.13.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 08:39:33 -0800 (PST)
Date: Wed, 13 Nov 2024 11:39:30 -0500
From: Peter Xu <peterx@redhat.com>
To: Jann Horn <jannh@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>, Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 0/7] mm/mprotect: Fix dax puds
Message-ID: <ZzTWQqr-zFQz0HHY@x1n>
References: <20240812181225.1360970-1-peterx@redhat.com>
 <CAG48ez0NNph0Zp2aZ+c1T+U940CvwxcQ+jyEhp3KYZLSWPSrNw@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <CAG48ez0NNph0Zp2aZ+c1T+U940CvwxcQ+jyEhp3KYZLSWPSrNw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x2C5UTb2qsj7IvueprTfru46teWUGCKuNRTDSIBKaJo_1731515974
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 11, 2024 at 10:20:59PM +0100, Jann Horn wrote:
> On Mon, Aug 12, 2024 at 8:12 PM Peter Xu <peterx@redhat.com> wrote:
> > Dax supports pud pages for a while, but mprotect on puds was missing since
> > the start.  This series tries to fix that by providing pud handling in
> > mprotect().  The goal is to add more types of pud mappings like hugetlb or
> > pfnmaps.  This series paves way for it by fixing known pud entries.
> 
> Do people actually use hardware where they can use PUD THP mappings
> for DAX? I thought that was just some esoteric feature that isn't
> actually usable on almost any system.
> Was I wrong about that?

I did run it with a qemu emulated nvdimm device.  Though in reality I've no
idea on how many people are using it..

> 
> I think another example that probably doesn't play entirely nice with
> PUD THP mappings is mremap()'s move_page_tables(). If
> dax_get_unmapped_area() allows creating a VMA at an unaligned start
> address (which I think it does?), move_page_tables() can probably end
> up copying from an aligned address mapped with a huge PUD entry to an
> unaligned address that needs to be mapped at the PTE level, and I
> think that will probably cause it to call into get_old_pmd() while a
> huge PUD entry is still present, which will probably get us a
> pud_bad() error or such?

I think you're probably right, that we have other places that may not work
well with pud mappings.

I also wonder whether dax_get_unmapped_area() needs to properly handle
MAP_FIXED, even for PMD mappings.

It looks like it always fallbacks to the default mm_get_unmapped_area()
with FIXED, which have no idea on dax->alignment so it'll always allow
it.. The issue is I'm not sure dax pmd can be split at all, while I think
split-able is needed when mremap from a pmd-aligned address to a
!pmd-aligned address.

Thanks,

-- 
Peter Xu


