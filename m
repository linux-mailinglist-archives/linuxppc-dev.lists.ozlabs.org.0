Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11CC7834E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 23:27:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KaPrNJ7n;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KaPrNJ7n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV5DH3Zrmz3c24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 07:27:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KaPrNJ7n;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KaPrNJ7n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV5CL05r6z2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 07:26:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692653208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kc1lL9HfVMeZHEEA4arnyJkoU4jVLawdPSW/zCLOVpk=;
	b=KaPrNJ7nbUAsMZcseyeZmdWhzliYD1KhRDMyReNAFe/0QUrUrRvQ5Xeuj7A/8+U+oPpoJi
	JDb5n5AEGCyiWziwk2uzx8ilRsz9BfW7XEUwXOPxRmXPXeNmtXpeYVeD/r1e39AsmKbnDB
	JTsAYEZM1rYVSjzlXzcXDMnVGaYLHLw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692653208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kc1lL9HfVMeZHEEA4arnyJkoU4jVLawdPSW/zCLOVpk=;
	b=KaPrNJ7nbUAsMZcseyeZmdWhzliYD1KhRDMyReNAFe/0QUrUrRvQ5Xeuj7A/8+U+oPpoJi
	JDb5n5AEGCyiWziwk2uzx8ilRsz9BfW7XEUwXOPxRmXPXeNmtXpeYVeD/r1e39AsmKbnDB
	JTsAYEZM1rYVSjzlXzcXDMnVGaYLHLw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-ReZbZGN2OFCeossGMH7O3g-1; Mon, 21 Aug 2023 17:26:45 -0400
X-MC-Unique: ReZbZGN2OFCeossGMH7O3g-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-63d2b88325bso10466596d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 14:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692653205; x=1693258005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc1lL9HfVMeZHEEA4arnyJkoU4jVLawdPSW/zCLOVpk=;
        b=NuRSAjKqrzuTdkmzeCXU/iYIYDaB4rmjkzLHgrf49UvaqGe52b7Fn6ZKOnyhrfdqwT
         mjFibolFHklttSMdZnc+p0lmjeIzhfIIuGbRhpW7tz4EteuQcD4MUvAxZdoyPnicJFGU
         WFeUKZso/px5/B7/+TddKruADNfR1LPhUCqyBJcsue4M8J3M8oIJGPKID4QI4JTCTU11
         +fZKDZTCNbH3RpBnomQrttAXTIkPVLINRnc6j8oEL7+j+c8wB5JdR5ooMbqGHXyeS6Cg
         OH6884JVK5xdQ4QcfXMXMxOipyrByD9gBbSh3WUGowpuBfK4B4KbQ8Q+eqjZGhHqw1EQ
         2uEw==
X-Gm-Message-State: AOJu0YzbZU+FjJU32AO2jym05DvCb5MS1lxeLkldSMbN24Hlft30fbEf
	bZctu3x02dUA3kXXNAIeNTF/b1flXxhMI+My83OAz+oMYorXohSzVVg/li+wcWVS7+FkRsdBpCT
	AH9Fh92RChiyKOzrlQ8qGgNkE/Q==
X-Received: by 2002:ad4:5c63:0:b0:645:3c6:56ab with SMTP id i3-20020ad45c63000000b0064503c656abmr9748574qvh.1.1692653205343;
        Mon, 21 Aug 2023 14:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgtWCOPeUpEzGq/iv0oKzAPjh78y7co8OVUrk5dfltW9vOj/sBZqVpomm+P1HZkyDqvpN/4A==
X-Received: by 2002:ad4:5c63:0:b0:645:3c6:56ab with SMTP id i3-20020ad45c63000000b0064503c656abmr9748513qvh.1.1692653205030;
        Mon, 21 Aug 2023 14:26:45 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id d28-20020a0cb2dc000000b0063d0b792469sm3261672qvf.136.2023.08.21.14.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 14:26:44 -0700 (PDT)
Date: Mon, 21 Aug 2023 17:26:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
Message-ID: <ZOPWkS7joexET6q8@x1n>
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
MIME-Version: 1.0
In-Reply-To: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Anshuman Khandual <anshuman.khandual@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraege
 r <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Jann Horn <jannh@google.com>, Heiko Carstens <hca@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 21, 2023 at 12:51:20PM -0700, Hugh Dickins wrote:
> Jann Horn demonstrated how userfaultfd ioctl UFFDIO_COPY into a private
> shmem mapping can add valid PTEs to page table collapse_pte_mapped_thp()
> thought it had emptied: page lock on the huge page is enough to protect
> against WP faults (which find the PTE has been cleared), but not enough
> to protect against userfaultfd.  "BUG: Bad rss-counter state" followed.
> 
> retract_page_tables() protects against this by checking !vma->anon_vma;
> but we know that MADV_COLLAPSE needs to be able to work on private shmem
> mappings, even those with an anon_vma prepared for another part of the
> mapping; and we know that MADV_COLLAPSE needs to work on shared shmem
> mappings which are userfaultfd_armed().  Whether it needs to work on
> private shmem mappings which are userfaultfd_armed(), I'm not so sure:
> but assume that it does.
> 
> Just for this case, take the pmd_lock() two steps earlier: not because
> it gives any protection against this case itself, but because ptlock
> nests inside it, and it's the dropping of ptlock which let the bug in.
> In other cases, continue to minimize the pmd_lock() hold time.
> 
> Reported-by: Jann Horn <jannh@google.com>
> Closes: https://lore.kernel.org/linux-mm/CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com/
> Fixes: 1043173eb5eb ("mm/khugepaged: collapse_pte_mapped_thp() with mmap_read_lock()")
> Signed-off-by: Hugh Dickins <hughd@google.com>

The locking is indeed slightly complicated.. but I didn't spot anything
wrong.

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

