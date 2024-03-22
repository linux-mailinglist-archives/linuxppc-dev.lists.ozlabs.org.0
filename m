Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9E0887012
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 16:56:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Toy4bsv3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Toy4bsv3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Rkr5wNTz3vgx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 02:56:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Toy4bsv3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Toy4bsv3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1Rk334h0z3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 02:55:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711122919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QJLFb75dlh9Ilo5izUjxoeGL/8+am1RJvB8MBnP+8/Q=;
	b=Toy4bsv3Ad85EA+NvHhY+40Wru/FLAZfGe5Va6JZ2KGVavZpglqvuJLQ+1oTB7EtyfyHM2
	ZydbIPdbAg0z6EHbiLi7IpXveKI5PQTW3tCfNf+/yoBiixUmpN3zvNLydlbKPjMaq58U0P
	fVP4gPz4L4phy7Szq+YaNPZgCJb93Rw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711122919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QJLFb75dlh9Ilo5izUjxoeGL/8+am1RJvB8MBnP+8/Q=;
	b=Toy4bsv3Ad85EA+NvHhY+40Wru/FLAZfGe5Va6JZ2KGVavZpglqvuJLQ+1oTB7EtyfyHM2
	ZydbIPdbAg0z6EHbiLi7IpXveKI5PQTW3tCfNf+/yoBiixUmpN3zvNLydlbKPjMaq58U0P
	fVP4gPz4L4phy7Szq+YaNPZgCJb93Rw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-WVF4NXapPcqoDuvirRj74Q-1; Fri, 22 Mar 2024 11:55:16 -0400
X-MC-Unique: WVF4NXapPcqoDuvirRj74Q-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-690d3f5af86so5121046d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 08:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711122916; x=1711727716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJLFb75dlh9Ilo5izUjxoeGL/8+am1RJvB8MBnP+8/Q=;
        b=Wx/KvlPSc1pL5oL3+iprLtdw3aZpctv2J99GG3Uc07QwbHRT8w2ZVofOT8E9SynkhA
         Fj+ssNi1yI3+usFlwSaqDjty3x1V2UL50IqCBcGfRVmcNQF5coLq3wdMBHljY9vWPC/E
         MT3ysORtkkwisiKkmbrhObML57yGU9MSiyFPJb3+Pk4lK5TSkxqA3L73XdlE7eDpB2Z7
         xyM2YIK+8/qFb13vNrkgf2x05OPg7bxOqjqyND1styLice/UzqYQumwaZUBJm7vyBHKc
         VtOvcgOdk4Cv28Ky20ndKZH2WMLlk7EMEwJIdLE2oDABiZiriL97jojNe1JdTL1PBQ+h
         Cb7g==
X-Forwarded-Encrypted: i=1; AJvYcCWKCmq8Irk603/bOU5ETy/q0+Fimr7rmDITurokEBeA1LZUKQMxqM6Cbcvks7K0ENDTrVPVdDNnQFGZar91yMh7GHe44BQ1pTm4g7JtHA==
X-Gm-Message-State: AOJu0YwGLNZ3C/wfnVbxqC15r+1hgJT5qJQZO2JxkZfb1xerSoDcyexJ
	EzCklZ6wsFaJq9FW9Z8IKRpF01SS3mbt9BIk5AG/70Mh0EQGMWdc4PovT6+++NcSiDUDMcVZQ2/
	/H+wXNYhtM9v2ihgwoBrApuoTBlz60NiPsI2d+QIOPlk5M5b/e+Xw1ksuRPTaPd8=
X-Received: by 2002:a05:6214:2b86:b0:696:732f:41ce with SMTP id kr6-20020a0562142b8600b00696732f41cemr1030605qvb.0.1711122916029;
        Fri, 22 Mar 2024 08:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcGgYl+6vk8GOgJHrnHh9Bk553GXwTOWFwJfwdxmayaEVIZH35b8wrrTSaV+/rgNR3L0gYLQ==
X-Received: by 2002:a05:6214:2b86:b0:696:732f:41ce with SMTP id kr6-20020a0562142b8600b00696732f41cemr1030577qvb.0.1711122915578;
        Fri, 22 Mar 2024 08:55:15 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jx12-20020a0562142b0c00b0068ff8bda6c7sm1185452qvb.92.2024.03.22.08.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 08:55:14 -0700 (PDT)
Date: Fri, 22 Mar 2024 11:55:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <Zf2p38Pb51T3e9uB@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
 <20240322133012.GI159172@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240322133012.GI159172@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason,

On Fri, Mar 22, 2024 at 10:30:12AM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 21, 2024 at 06:08:02PM -0400, peterx@redhat.com wrote:
> 
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
> 
> I think this is probably fine for the moment, at least for this
> series, as CONT_PTE is still very new.
> 
> But it will need to be optimized. "slow" GUP is the only GUP that is
> used by FOLL_LONGTERM and it still needs to be optimized because you
> can't assume a FOLL_LONGTERM user will be hitting the really slow
> fault path. There are enough important cases where it is just reading
> already populted page tables, and these days, often with large folios.

Ah, I thought FOLL_LONGTERM should work in most cases for fast-gup,
especially for hugetlb, but maybe I missed something?  I do see that devmap
skips fast-gup for LONGTERM, we also have that writeback issue but none of
those that I can find applies to hugetlb.  This might be a problem indeed
if we have hugetlb cont_pte pages that will constantly fallback to slow
gup.

OTOH, I also agree with you that such batching would be nice to have for
slow-gup, likely devmap or many fs (exclude shmem/hugetlb) file mappings
can at least benefit from it due to above.  But then that'll be a more
generic issue to solve, IOW, we still don't do that for !hugetlb cont_pte
large folios, before or after this series.

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks!

-- 
Peter Xu

