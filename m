Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AC835BE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 08:45:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBu8+uXr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJMhN4TDKz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 18:45:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=batv+f852a6472c07d339093a+7456+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJMgT38WSz30YR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 18:44:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dR6yx6tN67WvcGk22bfKMLtWLGB0Su5dqNJD6Sk4JUQ=; b=WBu8+uXrPFN46pwRaBFARTzEwz
	BTwc4Pz8LPt1Fqn8IVxHsE4uzB01j9gUoHrZg1sOYkZYoAVys53D0DpJ8iSKFPpjTP8YS7AAaec0c
	3mEQN405x+d3rJ3RuYaVyhVkhmJzmcDbV0S+m25vaJlc4nmjvu5Yw89rNHHf0lTGhOsgKsKVqOWV1
	6W7K/KrBBAl+kJK4s9uL5uYbGtywtn8YWThJg3rcDEsPhRKD1LyF46FZTVbDjoezyc0jAsDenhi2K
	aoMnIZ9xkfG/2SiyVHT5Dkc7DlWhSmUKoGQJhKQhVBEJ3s/J1Cm5aCtRYaT6r+uASa0BJgXOZ72/R
	CI7KFzJw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rRowZ-00Atfo-0s;
	Mon, 22 Jan 2024 07:42:07 +0000
Date: Sun, 21 Jan 2024 23:42:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <Za4cT3tATxVlMki3@infradead.org>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
 <ZaajDheNtqKkCoeD@infradead.org>
 <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, Chris Li <chrisl@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 16, 2024 at 12:19:39PM -0800, Yosry Ahmed wrote:
> Well, better compression ratios for one :)
> 
> I think a long time ago there were complaints that zsmalloc had higher
> latency than zbud/z3fold, but since then a lot of things have changed
> (including nice compaction optimization from Sergey, and compaction
> was one of the main factors AFAICT). Also, recent experiments that
> Chris Li conducted showed that (at least in our setup), the
> decompression is only a small part of the fault latency with zswap
> (i.e. not the main factor) -- so I am not sure if it actually matters
> in practice.
> 
> That said, I have not conducted any experiments personally with z3fold
> or zbud, which is why I proposed the conservative approach of marking
> as deprecated first. However, if others believe this is unnecessary I
> am fine with removal as well. Whatever we agree on is fine by me.

In general deprecated is for code that has active (intentional) users
and/or would break setups.  I does sound to me like that is not the
case here, but others might understand this better.
