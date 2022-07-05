Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFEF5677F5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 21:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LctRs5Dg2z3bxS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 05:44:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=YViM5071;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=7kjp=xk=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=YViM5071;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LctRH2jjzz2ypH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 05:44:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 586C361B69;
	Tue,  5 Jul 2022 19:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4129FC341C7;
	Tue,  5 Jul 2022 19:44:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YViM5071"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1657050261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sv4easM90LU9yFBlq1sFHdwL6ijENpIpokQiIYjFjjs=;
	b=YViM5071mr4boZ+R5IcUzya7ZQUYBIM3DvHFWnQia1MOUwFQzxvLNSsqC2t97bqag2s1el
	rGglVwWuQK5FNCv2Q0gmwwCtJVyYrj2RKCr5ifIpsLV1cJjVyLN6ZJ2GrCKX2CSvqReYuN
	0PsdKWk1YR0uOUoLxAWftpUkFhkkdVo=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b585efd (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 5 Jul 2022 19:44:21 +0000 (UTC)
Date: Tue, 5 Jul 2022 21:44:17 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
Message-ID: <YsSUkapje04MP2a1@zx2c4.com>
References: <20220705190121.293703-1-Jason@zx2c4.com>
 <YsSStCQQf008hF2F@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsSStCQQf008hF2F@zn.tnic>
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
Cc: linux-s390@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey Borislav,

On Tue, Jul 05, 2022 at 09:36:20PM +0200, Borislav Petkov wrote:
> On Tue, Jul 05, 2022 at 09:01:21PM +0200, Jason A. Donenfeld wrote:
> > @@ -26,7 +18,6 @@ __setup("nordrand", x86_rdrand_setup);
> >   */
> >  #define SANITY_CHECK_LOOPS 8
> >  
> > -#ifdef CONFIG_ARCH_RANDOM
> >  void x86_init_rdrand(struct cpuinfo_x86 *c)
> >  {
> >  	unsigned int changed = 0;
> > @@ -59,8 +50,6 @@ void x86_init_rdrand(struct cpuinfo_x86 *c)
> >  	}
> >  
> >  	if (WARN_ON_ONCE(!changed))
> > -		pr_emerg(
> > -"RDRAND gives funky smelling output, might consider not using it by booting with \"nordrand\"");
> > +		pr_emerg("RDRAND gives funky smelling output; update microcode or firmware.");
> 
> It is highly unlikely to get a BIOS or microcode update for that matter,
> for old systems:
> 
> 7879fc4bdc75 ("x86/rdrand: Sanity-check RDRAND output")
> 
> so I guess here you're better off saying that the kernel simply disables
> rdrand support and do
> 
> 	clear_cpu_cap(c, X86_FEATURE_RDRAND);
> 
> here too.

Oh, huh. Maybe in that case I should adjust the message to say "consider
using `random.trust_cpu=0`," which is the thing that would actually make
a security difference.

But actually, one thing that wasn't clear to me was: does `nordrand`
affect what userspace sees? While random.c is okay in lots of
circumstances, I could imagine `nordrand` playing a role in preventing
userspace from using it, which might be desirable. Is this the case? If
so, I can remove the nordrand chunk from this patch for v2. If not, I'll
adjust the text to mention `random.trust_cpu=0`.

> If I read the commit message above correctly, it sounds like RDRAND
> output is not that important anyway...

In the sense that random.c can handle mostly any input without making
the quality worse. So, you can't accidentally taint it. The only risk is
if it thinks RDRAND is good and trustable when it isn't, but that's what
`random.trust_cpu=0` is for.

Jason
