Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7E93CAEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 00:42:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYWnhLea;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYWnhLea;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVQqj3g78z3dBx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 08:42:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYWnhLea;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYWnhLea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVQq12437z3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 08:41:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721947284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u5IjTDKou7RsegoJDQrUdTSsaR0wePSmCha5JTdz6Yk=;
	b=TYWnhLeauTdnLMp6mW/L/tNLNzroBP6rdUDxa2uRYEUSb/uM6whUzLjgZhgRmGxnemtMJ3
	eV5LdY6YtOkghZCgQ0pS9vlavib4IodOraXJPNHAmCwoqf9ZQtUExAJWYrox1IO3U8uXYv
	ABJA2HgjVDGh8zJEKKFlNKra+zI2PTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721947284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u5IjTDKou7RsegoJDQrUdTSsaR0wePSmCha5JTdz6Yk=;
	b=TYWnhLeauTdnLMp6mW/L/tNLNzroBP6rdUDxa2uRYEUSb/uM6whUzLjgZhgRmGxnemtMJ3
	eV5LdY6YtOkghZCgQ0pS9vlavib4IodOraXJPNHAmCwoqf9ZQtUExAJWYrox1IO3U8uXYv
	ABJA2HgjVDGh8zJEKKFlNKra+zI2PTY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-S4UVYFc8P8KjQ0_yMkz4Pg-1; Thu, 25 Jul 2024 18:41:22 -0400
X-MC-Unique: S4UVYFc8P8KjQ0_yMkz4Pg-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7093752a9f5so72157a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 15:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721947282; x=1722552082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5IjTDKou7RsegoJDQrUdTSsaR0wePSmCha5JTdz6Yk=;
        b=plCTzSs6hnaBrXnDwe1uuIPLCT9UaERETEweK/G+FLoKClf2Sh39yKwa4DlMn3mPE3
         QmNwW4lKPafrG2qCCgea2ekuLmTBwbzVa+F8qhx8gDlDRN4MKQPREqR7mPiv/9S2p6dj
         wsZ5d/bMb77pDqoBK8wrkdr8VFWj0j0H5HrSrHMzMIA2i9zq8H9KQkk7itk5IqaGnJO9
         6WuSUgol5s8taHVN7Xeqp3HFg2XvZLJR9ywMswFa6sn2IbIk7Lri2wEOSMKVl81RYxgq
         HTwO3Q4E8JTWxTii1qjRMFOuo66w8f6NE2q5hnHluqeMGvFg7HLgMQxF5LeOsEww7Kbj
         f9pA==
X-Forwarded-Encrypted: i=1; AJvYcCXQgw2SdZew6rpjP/+y0WffU8vN5VRyqziYo9+2AfTJsBakhhyQlWotgFSa3j910WkAiQbmo4xXudY1+A0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvWghJqTOmD0W8GW7XI/F+3YjEeEQkMnIPo3Pu6uIs9ZluUFbx
	HNOVaiIhTUZcWgSA04dZw4jSL3ooFMgMPcJFRIYt09vKQJnc+SgMZveWMUvTd+wvAXGAFJbJUW3
	zEAJ+AH2hk+wmp1XPjGrsFJbEKLHJ+ZhRlPA8gvliVZUBC7ZWUnKDHXRXH0LuSJc=
X-Received: by 2002:a05:6830:1651:b0:703:5c54:ddac with SMTP id 46e09a7af769-7092fa57dc7mr2750324a34.2.1721947281940;
        Thu, 25 Jul 2024 15:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxIL6o6NZPBdYvHx1uIaunP84Pm7SW2ixxgCYcEwJ2VgyEqi0/RBTDXtRm2M6ZYXomWlm6fw==
X-Received: by 2002:a05:6830:1651:b0:703:5c54:ddac with SMTP id 46e09a7af769-7092fa57dc7mr2750314a34.2.1721947281608;
        Thu, 25 Jul 2024 15:41:21 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d739810bsm123991185a.16.2024.07.25.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 15:41:21 -0700 (PDT)
Date: Thu, 25 Jul 2024 18:41:17 -0400
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Subject: Re: [PATCH v3 8/8] mm/mprotect: fix dax pud handlings
Message-ID: <ZqLUjQb2BjedihOx@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-9-peterx@redhat.com>
 <CADrL8HVH8ff+_Szrmn4ZCyAkm9gDc2oY4VVo3r+6RN_ms6pbhw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrL8HVH8ff+_Szrmn4ZCyAkm9gDc2oY4VVo3r+6RN_ms6pbhw@mail.gmail.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 11:29:49AM -0700, James Houghton wrote:
> > -               pages += change_pmd_range(tlb, vma, pud, addr, next, newprot,
> > +
> > +               if (pud_leaf(pud)) {
> > +                       if ((next - addr != PUD_SIZE) ||
> > +                           pgtable_split_needed(vma, cp_flags)) {
> > +                               __split_huge_pud(vma, pudp, addr);
> > +                               goto again;
> 
> IIUC, most of the time, we're just going to end up clearing the PUD in
> this case. __split_huge_pud() will just clear it, then we goto again
> and `continue` to the next pudp. Is that ok?
> 
> (I think it's ok as long as: you never map an anonymous page with a
> PUD,

I think this is true.

> and that uffd-wp is not usable with non-hugetlb PUD mappings of
> user memory (which I think is only DAX?).

Uffd-wp has the async mode that can even work with dax puds.. even though I
don't think anyone should be using it.  Just like I'm more sure that nobody
is using mprotect() too with dax pud, and it further justifies why nobody
cared this much..

What uffd-wp would do in this case is it'll make pgtable_split_needed()
returns true on this PUD, the PUD got wiped out, goto again, then
change_prepare() will populate this pud with a pgtable page.  Then it goes
downwards, install PMD pgtable, then probably start installing pte markers
ultimately if it's a wr-protect operation.

> So it seems ok today...?)

Yes I think it's ok so far, unless you think it's not. :)

> 
> Also, does the comment in pgtable_split_needed() need updating?

/*
 * Return true if we want to split THPs into PTE mappings in change
 * protection procedure, false otherwise.
 */

It looks to me it's ok for now to me? THP can represents PUD in dax, and we
indeed want to break THPs (no matter PUD/PMD) finally into PTE mappings.

> 
> Somewhat related question: change_huge_pmd() is very careful not to
> clear the PMD before writing the new value. Yet change_pmd_range(),
> when it calls into __split_huge_pmd(), will totally clear the PMD and
> then populate the PTEs underneath (in some cases at least), seemingly
> reintroducing the MADV_DONTNEED concern. But your PUD version, because
> it never re-populates the PUD (or PMDs/PTEs underneath) does not have
> this issue. WDYT?

Could you elaborate more on the DONTNEED issue you're mentioning here?

> 
> Thanks for this series!

Thanks for reviewing it, James.

-- 
Peter Xu

