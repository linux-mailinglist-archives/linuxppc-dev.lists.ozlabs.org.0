Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CB15FD432
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 07:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnyX34N09z3bjc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 16:20:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=cNgEjXjx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=njaz=2o=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=cNgEjXjx;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnyW51HHfz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:19:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AA7BDB81CFA;
	Thu, 13 Oct 2022 05:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812F3C433D6;
	Thu, 13 Oct 2022 05:19:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cNgEjXjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665638359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lcJRRVBiuZoG3cV61t2lzgRn8ZXdwknC9Fh8mKPwMvo=;
	b=cNgEjXjxnwPTcBYgqBJ6KwRRQcHuFgP2swPyuCTIcE3K2aODI/zwO7uKjzMc+Glc1egRQ9
	G9MFjt5SMq+mPDTYK8Rvtt9xqHt28Wq/dpzYYkAiITV57ncx1noYlthc78enwz0c6MJqS3
	eSPuPQPz8SSJKWCN/+6C9iltvLbllwA=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id af73e1cb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 13 Oct 2022 05:19:18 +0000 (UTC)
Date: Thu, 13 Oct 2022 07:19:17 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <Y0ef1SuIpFZxNCcJ@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net>
 <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <20221012221615.GA364143@roeck-us.net>
 <87bkqgmvxl.fsf@mpe.ellerman.id.au>
 <20221013002148.GA535574@roeck-us.net>
 <CNKJ6FE6U35I.3ERMDQR9MHRLX@bobo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CNKJ6FE6U35I.3ERMDQR9MHRLX@bobo>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, Guenter Roeck <linux@roeck-us.net>, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 13, 2022 at 03:03:14PM +1000, Nicholas Piggin wrote:
> On Thu Oct 13, 2022 at 10:21 AM AEST, Guenter Roeck wrote:
> > On Thu, Oct 13, 2022 at 11:03:34AM +1100, Michael Ellerman wrote:
> > > Guenter Roeck <linux@roeck-us.net> writes:
> > > > On Wed, Oct 12, 2022 at 11:20:38AM -0600, Jason A. Donenfeld wrote:
> > > >> 
> > > >> I've also managed to not hit this bug a few times. When it triggers,
> > > >> after "kprobes: kprobe jump-optimization is enabled. All kprobes are
> > > >> optimized if possible.", there's a long hang - tens seconds before it
> > > >> continues. When it doesn't trigger, there's no hang at that point in the
> > > >> boot process.
> > > >> 
> > > >
> > > > I managed to bisect the problem. See below for results. Reverting the
> > > > offending patch fixes the problem for me.
> > > 
> > > Thanks.
> > > 
> > > This is probably down to me/us not testing with PREEMPT enabled enough.
> > > 
> > Not sure. My configuration has
> >
> > CONFIG_PREEMPT_NONE=y
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > # CONFIG_PREEMPT is not set
> 
> Thanks very much for helping with this. The config snippet you posted here
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-October/249758.html
> has CONFIG_PREEMPT=y. How do you turn that into a .config, olddefconfig?
> 
> I can't reproduce this so far using your config and qemu command line,
> but the patch you've bisected it to definitely could cause this. I'll
> keep trying...

Voila https://xn--4db.cc/dt00j0mt this repros it for me.

> 
> Thanks,
> Nick
> 
> [...]
> > > > # first bad commit: [e485f6c751e0a969327336c635ca602feea117f0] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
> 
