Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E127838A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 06:01:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fc8rKzY4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVFyl424Bz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 14:01:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fc8rKzY4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVFxq4ZmQz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 14:00:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8EFD60918;
	Tue, 22 Aug 2023 04:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E24C433C7;
	Tue, 22 Aug 2023 04:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692676844;
	bh=wF7a9DTAEc49b0LtDfqEP844tiSjl8LoV4OyVI84GrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fc8rKzY4a6NetmVD0Ho2yK279RGwV6y2FgZFgttHBRx7f8WzmFqM8tmWigz1DznfN
	 2K44pbbAm/BlD9hp9bYFmXCa3Rhg3Xhq7MWr2jPVIjB8VyO7Zt6d5PgPVqGgFQHdyQ
	 qszgAydz84pRpkftlQ0C7Lwnv6IYTu95rJmqCJbKCzgqePq6vpoI0Z51KozWW7xcKw
	 qLjcT7UzTqVVTMNz+dJFFWnWi2Ec+p8ACc9djXjXB8+SxGeZO8D7FAaLWgYyZTWQu+
	 8zSjo4c2TLMErstWhrj7rPhOpdcOuYR+S54H2VN3pVK95MgPzS3NxmKAtvLI0jg74j
	 vZtxLgnFBuuqA==
Date: Mon, 21 Aug 2023 21:00:43 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20230822040043.GB11263@frogsfrogsfrogs>
References: <20230822095537.500047f7@canb.auug.org.au>
 <ZOQLUMBB7amLUJLY@casper.infradead.org>
 <20230822112217.185c3357@canb.auug.org.au>
 <ZOQQjmxeLM920/Q/@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOQQjmxeLM920/Q/@casper.infradead.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-xfs@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 02:34:06AM +0100, Matthew Wilcox wrote:
> On Tue, Aug 22, 2023 at 11:22:17AM +1000, Stephen Rothwell wrote:
> > Hi Matthew,
> > 
> > On Tue, 22 Aug 2023 02:11:44 +0100 Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Tue, Aug 22, 2023 at 09:55:37AM +1000, Stephen Rothwell wrote:
> > > > In file included from include/trace/trace_events.h:27,
> > > >                  from include/trace/define_trace.h:102,
> > > >                  from fs/xfs/xfs_trace.h:4428,
> > > >                  from fs/xfs/xfs_trace.c:45:
> > > > include/linux/pgtable.h:8:25: error: initializer element is not constant
> > > >     8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)  
> > > 
> > > Ummm.  PowerPC doesn't have a compile-time constant PMD size?
> > 
> > Yeah, you are not the first (or probably the last) to be caught by that.
> 
> I think this will do the trick.  Any comments?
> 
> diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
> index 1904eaf7a2e9..d5a4e6c2dcd1 100644
> --- a/fs/xfs/xfs_trace.h
> +++ b/fs/xfs/xfs_trace.h
> @@ -796,15 +796,6 @@ DEFINE_INODE_EVENT(xfs_inode_reclaiming);
>  DEFINE_INODE_EVENT(xfs_inode_set_need_inactive);
>  DEFINE_INODE_EVENT(xfs_inode_inactivating);
>  
> -/*
> - * ftrace's __print_symbolic requires that all enum values be wrapped in the
> - * TRACE_DEFINE_ENUM macro so that the enum value can be encoded in the ftrace
> - * ring buffer.  Somehow this was only worth mentioning in the ftrace sample
> - * code.
> - */

Please leave this ^^^ comment, because the need for TRACE_DEFINE_ENUM to
make enums work in tracepoints is not at all obvious.

> -TRACE_DEFINE_ENUM(PMD_ORDER);
> -TRACE_DEFINE_ENUM(PUD_ORDER);
> -
>  TRACE_DEFINE_ENUM(XFS_REFC_DOMAIN_SHARED);
>  TRACE_DEFINE_ENUM(XFS_REFC_DOMAIN_COW);
>  
> @@ -823,13 +814,10 @@ TRACE_EVENT(xfs_filemap_fault,
>  		__entry->order = order;
>  		__entry->write_fault = write_fault;
>  	),
> -	TP_printk("dev %d:%d ino 0x%llx %s write_fault %d",
> +	TP_printk("dev %d:%d ino 0x%llx order:%u write_fault %d",

"order %u" to match the (non dev_t) style of the rest of the xfs
tracepoints.

--D

>  		  MAJOR(__entry->dev), MINOR(__entry->dev),
>  		  __entry->ino,
> -		  __print_symbolic(__entry->order,
> -			{ 0,		"PTE" },
> -			{ PMD_ORDER,	"PMD" },
> -			{ PUD_ORDER,	"PUD" }),
> +		  __entry->order,
>  		  __entry->write_fault)
>  )
>  
> 
> 
