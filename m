Return-Path: <linuxppc-dev+bounces-693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE096283A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 15:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4Sy6Slhz2yfl;
	Wed, 28 Aug 2024 23:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724850450;
	cv=none; b=l7fJzoEcYkXGz5karo1mLqK+aL+9/S3vQ26yTLJ2B/WcI947VSFyYWgcgUUken2Bke+joJ+MH53MTY2UWYDSI73jEYJIyhDri6LIjfDVwYtuanxa4cjqqs/x1QG2XgMuVLW7yGJ4vDQv2o9X27kFbDFfA3lXfjE1AJrpXN+A9HRWRCx1H9oyi7iP+dhR1KrAEwc0LcOyNgJ50TAgfJ9HtzIhM7NFq8L0dtpd5Y0aw7jm4/ht6ngMlNzlvXIIYLBIJA4C3vpbJPiv1Vpi07k3HjAAEtUzCQjdAmrR+FX3cma+9sNkMS3oMBqWTDUq2STFPtRr4vtiJeacCvXIP3CVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724850450; c=relaxed/relaxed;
	bh=oeaYEeMYW7hEo3u8qxst85yaDnh5A2IqHmNMDFLAgFo=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YjIoS267xAVJt6zG2modETlayXoIjjfUej/9Elnn2qeWtobkVBr7sqFomV4Vy1MDZzM22cC2PFJhKz7Mrmm1IPzyHGMnvbd1Sqn51qG6gakIEgUyRj+uX6ZRBzbjyqr3u7FDcIQKnmtx3PfjKuq8o4tEgqLuNr/qLTme5kiGOpQEx3MC4PdEWSBD4yueEeWSvqQFNIUz/z/wCApZ/YTOTu1N7/WhQDjEhxssri00RA0iulGdprcJs8QDbBQ+OHpkp+ZDHwZSLpFORZasKCkWUDtdR44wPGW1kPRalaazDMclMjC4Bu7kiRAhYfLjk2dcGJpqfGSMqxpnAJsitEfRxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ODK/7ERo; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=8w/7=p3=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ODK/7ERo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=8w/7=p3=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv4Sy4bL4z2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 23:07:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D548A4088C;
	Wed, 28 Aug 2024 13:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADC3C4FEAA;
	Wed, 28 Aug 2024 12:51:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ODK/7ERo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724849467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oeaYEeMYW7hEo3u8qxst85yaDnh5A2IqHmNMDFLAgFo=;
	b=ODK/7ERoI7S8QMrOJubKV+KYvxjfHTDZ1zzNE6AiRyLjnfeCtBY3W36gNo8wympvGHxdgN
	NSlxiq62JUyQC+aiXpMPbstKEvistBZZgAUjEOeILQQdAc9aNvROXJCsA6m9EfcUlXBIZM
	Xx5CPriIkEngv9c0pT/XBKJFCpvNkmI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0cc7065 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 28 Aug 2024 12:51:06 +0000 (UTC)
Date: Wed, 28 Aug 2024 14:51:05 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Message-ID: <Zs8dOXrSp0OdY9s8@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain>
 <20240827225330.GC29862@gate.crashing.org>
 <Zs8HirKLk-SrwTIu@zx2c4.com>
 <20240828123313.GD29862@gate.crashing.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828123313.GD29862@gate.crashing.org>

On Wed, Aug 28, 2024 at 07:33:13AM -0500, Segher Boessenkool wrote:
> On Wed, Aug 28, 2024 at 01:18:34PM +0200, Jason A. Donenfeld wrote:
> > On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> > > On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> > > > > +		for (i = 0; i < ARRAY_SIZE(params->reserved); i++)
> > > > > +			params->reserved[i] = 0;
> 
> This is a loop.  With -ftree-loop-distribute-patterns, the default at
> -O2, this is optimised to
> 
>     memset(params->reserved, 0, ...);
> 
> (which is perfectly fine, since memset is required to be there even
> for freestanding environments, this is documented!)
> 
> > > -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> > > what it actually does (and how it avoids your problem, and mostly: learn
> > > what the actual problem *was*!)
> > 
> > This might help with various loops, but it doesn't help with the matter
> > that this patch fixes, which is struct initialization. I just tried it
> > with the arm64 patch to no avail.
> 
> It very much *does* help.  Try harder?  Maybe you typoed?

Scroll up and reread the original patch. You are confused. The loop is
what fixes the matter. It's struct initialization that generates the
memset.

