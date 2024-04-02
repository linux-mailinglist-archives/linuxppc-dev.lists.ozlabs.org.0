Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C26189603B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 01:36:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SernlilP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3x39rLO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8PR75qrSz3vr2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 10:36:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SernlilP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J3x39rLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8PQN29X4z3vgf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 10:35:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712100951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HP6iCpNSGY021srGiNxOfFS1yawEzwYl7dLs1n/YW+Y=;
	b=SernlilPx0ivm1TcTtzb7+vEpxjwHEyJDuDBqj8+JyXykNsdXTQ+HHACBTxSxQ11VzxUqg
	jMuV5q7ipH+LXIHpJd2lJTYx1H59Z9EHIpua3K+zyajwImDVX1FQE30CKeZ9C+Rah+Uo9E
	gk69vgrtq6qhJefGuiVsjjtP3HkkVbM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712100952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HP6iCpNSGY021srGiNxOfFS1yawEzwYl7dLs1n/YW+Y=;
	b=J3x39rLOj3X+1wtKFNqvXdNcw6rGN5gutDYuKnFxDNGqxSrACZ4pwS2GeCy7B6gwyZr2am
	p59fOAde+dkXxY3iPlbSakJxFfz/UfPkZ3WGBBX3SUxaB+xWd+l2+reCoJOW8OP85F0cs+
	cIoTwim3Ew2+ztebme/PMARh1hduHpg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-g68KHLFcNxm5zphtCxc0nw-1; Tue, 02 Apr 2024 19:35:50 -0400
X-MC-Unique: g68KHLFcNxm5zphtCxc0nw-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6e6cb8055b8so1936323a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 16:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712100949; x=1712705749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP6iCpNSGY021srGiNxOfFS1yawEzwYl7dLs1n/YW+Y=;
        b=IiTedWd1J02VF0Ki3iv54WIb0ZBhy0QOvVfbqJF5NGnSf6x++Rr06OnRclL8TZhiHk
         YcvaHOHkwG11j/KnWHQN7O8TFs0yt+K8mpOzsiaxt5NEp8hA31pUITrL/+8Wc3Bzb2q/
         hpZ9c9lZkcPAvKBbTYEHjxRkF3o3lFhG60TeyylCBtcRvPQN0U3t4IkOlxse7DWCyWgj
         ksDFWNVjZe05NNs+elIG7oNtl2rjL08iVKfc16CJgVTxddeB3ZM3DXPpgP63BldyNHiC
         5Km2CUh8C/qqSxzW5Rk3239cGOWNRTRdhA0LVumq5N1raLIRFKlAsph2ci9hiO1TL2kX
         tIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvsehXwuZ/j8wpj3rFEsoXZ4K1nf7ejYmjbzI9Cvvu63JeKzFclQaxeQSAMt08PNWTk3hPm+JwBrGeK211dBRpQ+pd7IkVSBvYisoPBw==
X-Gm-Message-State: AOJu0YyDBagXVsdMnMCI/2QlvZwBWjqzA+VBaX/7vxe3AyRBC6TCD0uq
	vlbOyODolsji26JjEdYkOnagO6KKPNYqnrGBC7qd7GdkSEwvitWNeBlREr6Cd7Pj+cToagKzqBo
	wjd0p3O7LmSw2cPMWfP1tkJIf7tiM73wiPv81GMIdN918BnI/BXP/9t/bdBL16xA=
X-Received: by 2002:a9d:4c86:0:b0:6e7:7ef6:10da with SMTP id m6-20020a9d4c86000000b006e77ef610damr13684092otf.1.1712100949125;
        Tue, 02 Apr 2024 16:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvGEFvbrAiLdQh8lUIUnqC+uQoSnGXUScHs/S+SFU0VVogBN2f5CbF/OzNKGljOo4S/t2faA==
X-Received: by 2002:a9d:4c86:0:b0:6e7:7ef6:10da with SMTP id m6-20020a9d4c86000000b006e77ef610damr13684059otf.1.1712100948622;
        Tue, 02 Apr 2024 16:35:48 -0700 (PDT)
Received: from xz-m1.local ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ob12-20020a0562142f8c00b0069046d929a3sm5893803qvb.145.2024.04.02.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 16:35:48 -0700 (PDT)
Date: Tue, 2 Apr 2024 19:35:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <ZgyWUYVdUsAiXCC4@xz-m1.local>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240402225320.GU946323@nvidia.com>
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

On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> 
> > I actually tested this without hitting the issue (even though I didn't
> > mention it in the cover letter..).  I re-kicked the build test, it turns
> > out my "make alldefconfig" on loongarch will generate a config with both
> > HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> > THP=y (which I assume was the one above build used).  I didn't further
> > check how "make alldefconfig" generated the config; a bit surprising that
> > it didn't fetch from there.
> 
> I suspect it is weird compiler variations.. Maybe something is not
> being inlined.
> 
> > (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> >  triggering it elsewhere but failed..)
> 
> As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> called and the optimizer removing it.

Good point, for some reason loongarch defined pud_leaf() without defining
pud_pfn(), which does look strange.

#define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)

But I noticed at least MIPS also does it..  Logically I think one arch
should define either none of both.

> 
> Perhaps the issue is that the pud_leaf() is too far from the pud_pfn?

My understanding is follow_pud_mask() should completely get optimized and
follow_huge_pud() will be dropped in the compiler output if pud_leaf()==false.

Thanks,

-- 
Peter Xu

