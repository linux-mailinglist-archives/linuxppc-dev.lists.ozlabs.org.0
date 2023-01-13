Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDE266A6C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 00:14:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nty0m0H4Sz3bPJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 10:14:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WK7iL3YG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntxzh2yssz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 10:13:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jUziRo06S+js26H0jEpikXECL+w+QlE/tWgpvgKsJA8=; b=WK7iL3YGO+YC4BSfnnwIJipBHy
	L/yPKa4Wr0ZWL0FxqZ4DMXCmcSA834QgpGSqZtyLNYRZA8jivE9DJxUqyBuG9l4FM5zI6xtv2K3SI
	rGHWNJJ33ufC97ZdHQKV2ujRZncan0nEeksdy/S5mv3orNTlVOFAy9t/FgGEdlKFFU3n+Xvk28Toq
	rzD/lU9k8vnuHybnkfompq2/ms5KQwcWJCKfQfj0ee/TlfJUWgTWTUP5s8QRS+KVgKhCr7ZL/ArAx
	qLjUSsDiJljaYfakgu8WFdxQapJOQdKNQgK2pP/4Vygvmp6gN/lrfIXRIgEwqfL7KWC84G9cAFvPK
	9EArjXew==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGTEN-004nM8-VM; Fri, 13 Jan 2023 23:13:03 +0000
Date: Fri, 13 Jan 2023 15:13:03 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] kallsyms: Fix scheduling with interrupts disabled in
 self-test
Message-ID: <Y8Hlf68u51j6uLeS@bombadil.infradead.org>
References: <20230112105426.1037325-1-npiggin@gmail.com>
 <Y8BQaw5tVzDjZ9Sz@bombadil.infradead.org>
 <Y8EZ8+MgMqzu4/7H@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8EZ8+MgMqzu4/7H@alley>
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
Cc: "Erhard F ." <erhard_f@mailbox.org>, Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, kernel test robot <oliver.sang@intel.com>, Zhen Lei <thunder.leizhen@huawei.com>, Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 13, 2023 at 09:44:35AM +0100, Petr Mladek wrote:
> On Thu 2023-01-12 10:24:43, Luis Chamberlain wrote:
> > On Thu, Jan 12, 2023 at 08:54:26PM +1000, Nicholas Piggin wrote:
> > > kallsyms_on_each* may schedule so must not be called with interrupts
> > > disabled. The iteration function could disable interrupts, but this
> > > also changes lookup_symbol() to match the change to the other timing
> > > code.
> > > 
> > > Reported-by: Erhard F. <erhard_f@mailbox.org>
> > > Link: https://lore.kernel.org/all/bug-216902-206035@https.bugzilla.kernel.org%2F/
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Link: https://lore.kernel.org/oe-lkp/202212251728.8d0872ff-oliver.sang@intel.com
> > > Fixes: 30f3bb09778d ("kallsyms: Add self-test facility")
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > > ---
> > 
> > Thanks Nicholas!
> > 
> > Petr had just suggested removing this aspect of the selftests, the performance
> > test as its specific to the config, it doesn't run many times to get an
> > average and odd things on a system can create different metrics. Zhen Lei
> > had given up on fixing it and has a patch to instead remove this part of
> > the selftest.
> > 
> > I still find value in keeping it, but Petr, would like your opinion on
> > this fix, if we were to keep it.
> 
> I am fine with this fix.

Merged the fix. I'll push to Linus for 6.2-rc4

  Luis
