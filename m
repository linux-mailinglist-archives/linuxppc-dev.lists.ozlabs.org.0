Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2963B571
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 00:00:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLgt04WDfz3f3f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:00:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=p/c6sfRX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=p/c6sfRX;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLgs42lHRz3bjH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 09:59:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7ACDFCE109D;
	Mon, 28 Nov 2022 22:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A99DC433D6;
	Mon, 28 Nov 2022 22:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1669676369;
	bh=8eUsQnXrojDc3xf/FA0TCQqqadaNCz4PLnjHT4xDE/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p/c6sfRX9un7PSA9WHRKHQPKKlq0P4NHxZWk+3LaBZS7DQenvFmjKk0jQBgH6o535
	 rwsyByROkiEJmDN58P/Z53hmZWo4xmybXT0VaPtvGqyQZyuQQjThzncIMjLPHHFdpc
	 3v4hl13h6A47jhJOM5850oDp2I/9vqahh0Q1uqps=
Date: Mon, 28 Nov 2022 14:59:27 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
Message-Id: <20221128145927.df895bf1966cfa125cae9668@linux-foundation.org>
In-Reply-To: <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
	<20221116102659.70287-17-david@redhat.com>
	<81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com>
	<08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
	<9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@
 kernel.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Nov 2022 09:18:47 +0100 David Hildenbrand <david@redhat.com> wrote:

> > Less chances of things going wrong that way.
> > 
> > Just mention in the v2 cover letter that the first patch was added to
> > make it easy to backport that fix without being hampered by merge
> > conflicts if it was added after your frame_vector.c patch.
> 
> Yes, that's the way I would naturally do, it, however, Andrew prefers 
> delta updates for minor changes.
> 
> @Andrew, whatever you prefer!

I'm inclined to let things sit as they are.  Cross-tree conflicts
happen, and Linus handles them.  I'll flag this (very simple) conflict
in the pull request, if MM merges second.  If v4l merges second then
hopefully they will do the same.  But this one is so simple that Linus
hardly needs our help.

But Linus won't be editing changelogs so that the changelog makes more
sense after both trees are joined.  I'm inclined to let the changelog
sit as it is as well.
