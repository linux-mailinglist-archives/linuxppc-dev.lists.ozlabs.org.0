Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3511466916E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 09:45:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtZkP1064z3fB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 19:45:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kbN54ZF8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kbN54ZF8;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtZjR55Kwz3c92
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 19:44:40 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 55A695FEF1;
	Fri, 13 Jan 2023 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673599476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t+Dhoicyzz2oSGw52Ch3AcQ9AMccyEhYs3mWOWg6nDQ=;
	b=kbN54ZF8hfI37eBqJvuqMwtgiFgB6MgRjswFus9R2GLCGrN7a/vICdUHtJjgDzGorIFsrQ
	leuiZDg/hguwIPALzLC+aYn19fNRBrxgE1HAf8fubfQ4HeItUae9gsTxoxK1UoyWuUe40X
	8BDKFZqjyc97z4LSmiGUuyzYRO2Kpag=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 25A122C141;
	Fri, 13 Jan 2023 08:44:36 +0000 (UTC)
Date: Fri, 13 Jan 2023 09:44:35 +0100
From: Petr Mladek <pmladek@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH] kallsyms: Fix scheduling with interrupts disabled in
 self-test
Message-ID: <Y8EZ8+MgMqzu4/7H@alley>
References: <20230112105426.1037325-1-npiggin@gmail.com>
 <Y8BQaw5tVzDjZ9Sz@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8BQaw5tVzDjZ9Sz@bombadil.infradead.org>
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

On Thu 2023-01-12 10:24:43, Luis Chamberlain wrote:
> On Thu, Jan 12, 2023 at 08:54:26PM +1000, Nicholas Piggin wrote:
> > kallsyms_on_each* may schedule so must not be called with interrupts
> > disabled. The iteration function could disable interrupts, but this
> > also changes lookup_symbol() to match the change to the other timing
> > code.
> > 
> > Reported-by: Erhard F. <erhard_f@mailbox.org>
> > Link: https://lore.kernel.org/all/bug-216902-206035@https.bugzilla.kernel.org%2F/
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Link: https://lore.kernel.org/oe-lkp/202212251728.8d0872ff-oliver.sang@intel.com
> > Fixes: 30f3bb09778d ("kallsyms: Add self-test facility")
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> 
> Thanks Nicholas!
> 
> Petr had just suggested removing this aspect of the selftests, the performance
> test as its specific to the config, it doesn't run many times to get an
> average and odd things on a system can create different metrics. Zhen Lei
> had given up on fixing it and has a patch to instead remove this part of
> the selftest.
> 
> I still find value in keeping it, but Petr, would like your opinion on
> this fix, if we were to keep it.

I am fine with this fix.

It increases a risk of possible inaccuracy of the measured time.
It would count also time spent on unrelated interrupts and eventual
rescheduling.

Anyway, it is safe at least. I was against the previous attempts to
fix this problem because they might have caused problems for
the rest of the system.

Best Regards,
Petr
