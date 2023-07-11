Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4774F863
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:30:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cNjPPHJC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0rZM4hLcz3bws
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 05:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cNjPPHJC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0gh74jw8z30XP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 22:50:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D44261382;
	Tue, 11 Jul 2023 12:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36E0C433C8;
	Tue, 11 Jul 2023 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689079809;
	bh=dNf0h22e3NNw5WnIyQMA79RXwcCjXd4yUaNvlYSmEks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNjPPHJCjkBuTo31uxO23EaD7iBmnxEZwpJnZPbX4Xt0szcj8ZgyO+hFXrziDLnmJ
	 WJfKsnZYW2NOQL3/ej8bLyiHu3o1cYgHqGtMbPw/xU5DUyrh9wH/uRCTzT6nteqM17
	 ih0fj7MI3xs3DsWKDpGWHK/svwtx6ndwsmveTHwe5/53fRS3olzp6tBliGqf9sdGX9
	 kN9/UPhMXhRiCAx1fAJd0t7sk9E2Jrj7YEssyG4k1JXRDx+YpYchn3i5vwcM7u3hPP
	 uyPhDJtpjTnpxvOXge4E7SaouWn3esU19tKAKmZoLjNyYWqbKP+E5Cdjp80IatCv7m
	 LrjabKUWygppA==
Date: Tue, 11 Jul 2023 14:49:50 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Message-ID: <ZK1P7kkjTvSU8M++@example.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
 <ZK1K1BOf43JOJWMx@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZK1K1BOf43JOJWMx@casper.infradead.org>
X-Mailman-Approved-At: Wed, 12 Jul 2023 05:30:07 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, heiko.carstens@de.ibm.com, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, fweimer@redhat.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, firoz.khan@linaro.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, geert@linux-m68k.org, mattst88@gmail.com, linux-mips@vger.kernel.org, gor@linux.ibm.com, fenghua.yu@intel.com, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kerne
 l.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 01:28:04PM +0100, Matthew Wilcox wrote:
> On Tue, Jul 11, 2023 at 01:25:43PM +0200, Alexey Gladkov wrote:
> > -static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> > +static int do_fchmodat4(int dfd, const char __user *filename, umode_t mode, int lookup_flags)
> 
> This function can still be called do_fchmodat(); we don't need to
> version internal functions.

Yes. I tried not to change too much when adopting a patch. In the new
version, I will return the old name. Thanks.

-- 
Rgrds, legion

