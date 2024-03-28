Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCBF8908D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 20:02:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=EuRHhQSu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5Cb81fNcz3vfY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 06:02:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=EuRHhQSu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5CZL6sQhz3vYp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 06:01:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F050A61851;
	Thu, 28 Mar 2024 19:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F78C433F1;
	Thu, 28 Mar 2024 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711652503;
	bh=75zJQi6/t8Bugee7Y/WvYhL+nXJNnuKScwY0EXrSoes=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EuRHhQSuhT6UhLje68IlwmCQqCGilcULpK7LoI7ffKimNB38kuwasGAwdmey5M3bK
	 w76Dbmfxu5cMJPhJmPKXGTUSaluFio9ZuNxZZjD9m62mGWpZNm0O1s3PHo4jeQl/xU
	 PchmtkI3nAt7scT0o5FtyP+3XAlYHJwqdV8wlpBc=
Date: Thu, 28 Mar 2024 12:01:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 06/13] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-Id: <20240328120142.32c6676dc7fbf1af82da5e58@linux-foundation.org>
In-Reply-To: <372a9331-6d95-4083-9a8f-a4f714868bea@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
	<20240327152332.950956-7-peterx@redhat.com>
	<372a9331-6d95-4083-9a8f-a4f714868bea@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: James Houghton <jthoughton@google.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Mar 2024 11:10:59 +0100 David Hildenbrand <david@redhat.com> wrote:

> @Andrew, you properly adjusted the code to remove the 
> gup_fast_folio_allowed() call instead of the folio_fast_pin_allowed() 
> call, but
> 
> (1) the commit subject
> (2) comment for gup_huge_pd()
> 
> Still mention folio_fast_pin_allowed().
> 
> The patch "mm/gup: handle hugepd for follow_page()" then moves that 
> (outdated) comment.

OK, thanks, I fixed all that up.
