Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51AB82F1B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 16:42:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o9Gjjz+T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDtYS4t4Wz3bhr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 02:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o9Gjjz+T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=batv+143bb14a0bf582ab00cc+7450+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDtXY1SVNz3039
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 02:41:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WtuVntAUUaCAXXG4ld9RtlJPqwKTyVWfU729/RL/Hsw=; b=o9Gjjz+T5kDv5mjN1O1rCFpBHe
	GjyMdKlmHDPVacqgG9J02XTK47cYYGykjg8ppuXuvAip5m4Oo2tZLsNq/ngiRennfsaO7LQKCRdfC
	qWURBIOAj24mTBDP391o0WgYKYUTHzpdUcfKs3kbVaNIZ3LB13sVKEE6AuyhSZI1FfgYniot97q0q
	JwU9NGmxE4jrQ9E6lIc+yc9ue+6pJmffS5jgVXYFfDhm3V3qQxg9AAxGjzIYXx53VVaa2MtDMXvR/
	GH6yMxn9hYJ3LX3R0eVMBCTME4Qo8RVdm1YcrTt67RUCn8gs2XfbgYO2reqzRoAig72MObiBsStBH
	VwK/lYgA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlWg-00CSYJ-1w;
	Tue, 16 Jan 2024 15:38:54 +0000
Date: Tue, 16 Jan 2024 07:38:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Nhat Pham <nphamcs@gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to
 CONFIG_Z3FOLD_DEPRECATED
Message-ID: <ZaajDheNtqKkCoeD@infradead.org>
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Yosry Ahmed <yosryahmed@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 12, 2024 at 04:38:30PM -0800, Nhat Pham wrote:
> >
> > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > well.
> 
> Makes sense to me. Should we do the same thing to zbud? We probably
> have even less of a case for it, no?

Is there any user visible effect of switching the allocator?  If not it
seems a bit pointless to deprecate them vs just removing them (or maybe
making z3fold depend on !MMU for now).
