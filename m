Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43C81E469
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Dec 2023 02:36:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XmL7t7s1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SzcnR1XfKz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Dec 2023 12:36:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XmL7t7s1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 506 seconds by postgrey-1.37 at boromir; Mon, 25 Dec 2023 17:44:07 AEDT
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sz7fb2LsPz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Dec 2023 17:44:04 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703486132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Mj5NvpEvY0iaWI1AN4f/AnoPa53HvYK2B531TwP00g=;
	b=XmL7t7s1mV7uCwwvgAvOsQNdk/tGvy2JL2lM6W19eCBhgHn71dxcaoEEYsrHNYenfGaMpQ
	Py9rLBYF5VznAlI0wgRIke5z88kJE8izkPcvSvHAZg64NlIgJ9nuzcCZVZDSGOh5qMb6sY
	eIEJ36Kut/a/uk8xqi0T4yvgH/wybTk=
Mime-Version: 1.0
Subject: Re: [PATCH 05/13] mm: Introduce vma_pgtable_walk_{begin|end}()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20231219075538.414708-6-peterx@redhat.com>
Date: Mon, 25 Dec 2023 14:34:48 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <0D9E28F4-AFA8-479C-8311-093DAFD9DF41@linux.dev>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-6-peterx@redhat.com>
To: Peter Xu <peterx@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 26 Dec 2023 12:35:13 +1100
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Linux-MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Dec 19, 2023, at 15:55, peterx@redhat.com wrote:
> 
> From: Peter Xu <peterx@redhat.com>
> 
> Introduce per-vma begin()/end() helpers for pgtable walks.  This is a
> preparation work to merge hugetlb pgtable walkers with generic mm.
> 
> The helpers need to be called before and after a pgtable walk, will start
> to be needed if the pgtable walker code supports hugetlb pages.  It's a
> hook point for any type of VMA, but for now only hugetlb uses it to
> stablize the pgtable pages from getting away (due to possible pmd
> unsharing).
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.

