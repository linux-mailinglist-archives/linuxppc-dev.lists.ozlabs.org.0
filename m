Return-Path: <linuxppc-dev+bounces-1126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42CB96F615
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 15:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0d8z3RxCz2ytm;
	Fri,  6 Sep 2024 23:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725631075;
	cv=none; b=jnlYVGih0D4jgkkWaMW0NssnZk6N4kOKMKk6KDCaKq1t0B9UoMaS/H23TY3GV4PC+YIGPK1tmgYW56fiXdRiAOjwGxHDIyU6/aFZgGq8x+BYz9Q/CxQ7+BYa+10CBMulbAzzR9j1zKrlJYxsddNHtwW2jkevpX7emylER/0um3HwA+odUEzJWHQ+8Pto+8yKGHfh9wohsUifRl/oq+sS+Z8ttf2WAU8IomnU9sG2RKXpM3yaGkoSmJt7gTYTu2Io1Ky9UtuKCLDsSyJ6tYqrx7GP1EsvEBumohJNyuIFDXlg3GY3vd5mPuYuaawKq+z5rY6m7ROR/cbq7+A/sSsqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725631075; c=relaxed/relaxed;
	bh=eVji+rszu06foO1e6CakulF0N2byoXPnMimNShIBYe8=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=U+227SZ+8EhbVwV3nESXPVaYMw2/dyF4U9dcA6eP9fWzs9DNsrbuvGcPvNEZstP/2rsqBuDfDzvEVV1GJpyc9sx719GzYBGCI+kdcX5qwffoMftBDxqem25V6Nt4Z1IcWLN1EurhY8aX0Y1KhIezbKJUexjHdGC5egOeOhEK3U+DKNHu+Twn0g6BCoM2v3jUcuAuOxS7snI7B+mdO5jFisuEvHQHtpZOq3I94fz8ekcqh67L+z8WfPQ3SKQK+5u7XP20OWT7mTIlne6AJcAi5MtqVjIyvQzLAxpFeoeD6qha+oKjRKmaBGuEdGcXe5N7TVTYRE3OjoXNZwZi5ffi/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=dVuEmOKn; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=dVuEmOKn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0d8z0Xvrz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 23:57:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F29EF5C48E1;
	Fri,  6 Sep 2024 13:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2359FC4CEC4;
	Fri,  6 Sep 2024 13:57:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dVuEmOKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725631069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVji+rszu06foO1e6CakulF0N2byoXPnMimNShIBYe8=;
	b=dVuEmOKn0Yk1JiHrrco01DA24HYjdC4awNSSHS0nKBUqxoGoEpbDurNaBcgVQe9c6erqgC
	cpt0f0OdgGsXdAX9CNZP0my5WgLzZCXLvvvnixo05G7SV/XHJ/BOTRxM2DsZ0v/4Z6Xh58
	qG8+xmK/ZQCVWqiIoCggTBYekd+LAps=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca54950d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 13:57:49 +0000 (UTC)
Date: Fri, 6 Sep 2024 15:57:47 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrei Vagin <avagin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/vdso: Fix VDSO data access when running in a
 non-root time namespace
Message-ID: <ZtsKW3LLfwmz7icC@zx2c4.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <87r09x3r9v.fsf@mail.lhotse>
 <ZtsG9Q6vKD9XOsZN@zx2c4.com>
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
In-Reply-To: <ZtsG9Q6vKD9XOsZN@zx2c4.com>

On Fri, Sep 06, 2024 at 03:43:17PM +0200, Jason A. Donenfeld wrote:
> On Fri, Sep 06, 2024 at 10:23:08PM +1000, Michael Ellerman wrote:
> > Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > > When running in a non-root time namespace, the global VDSO data page
> > > is replaced by a dedicated namespace data page and the global data
> > > page is mapped next to it. Detailed explanations can be found at
> > > commit 660fd04f9317 ("lib/vdso: Prepare for time namespace support").
> > >
> > > When it happens, __kernel_get_syscall_map and __kernel_get_tbfreq
> > > and __kernel_sync_dicache don't work anymore because they read 0
> > > instead of the data they need.
> > >
> > > To address that, clock_mode has to be read. When it is set to
> > > VDSO_CLOCKMODE_TIMENS, it means it is a dedicated namespace data page
> > > and the global data is located on the following page.
> > >
> > > Add a macro called get_realdatapage which reads clock_mode and add
> > > PAGE_SIZE to the pointer provided by get_datapage macro when
> > > clock_mode is equal to VDSO_CLOCKMODE_TIMENS. Use this new macro
> > > instead of get_datapage macro except for time functions as they handle
> > > it internally.
> > >
> > > Fixes: 74205b3fc2ef ("powerpc/vdso: Add support for time namespaces")
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >  
> > Oops.
> > 
> > I guess it should also have:
> > 
> >   Cc: stable@vger.kernel.org # v5.13+
> >   Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >   Closes: https://lore.kernel.org/all/ZtnYqZI-nrsNslwy@zx2c4.com/
> > 
> > Jason how do you want to handle this?
> > 
> > I can put patch 1 in a topic branch that we both merge? Then you can
> > apply patch 2 on top of that merge in your tree.
> > 
> > Or we could both apply patch 1 to our trees, it might lead to a conflict
> > but it wouldn't be anything drastic.
> 
> The merge window for 6.12 is pretty soon. Why don't I just take this in
> my random.git tree (with your ack) as a prereq to the ppc vDSO work.
> It'll slide in _before_ Christophe's other commits, and then the
> separate vgetrandom fixup will be squashed in the right place there.
> 
> And then it'll hit stable when that's submitted for 6.12. It's an old
> bug that nobody noticed, and time namespaces are kind of obscure, so I
> think waiting a week and a half for the merge window to open is probably
> fine.

So I've just done this (preliminarily, pending Michael's approval), and
it comes out decently clean and everything works fine. The commit
sequence becomes:

...
c206cd11e7f2 selftests: vDSO: ensure vgetrandom works in a time namespace
...
e59cc170924c powerpc/vdso: Fix VDSO data access when running in a non-root time namespace
887e7a77dc99 mm: Define VM_DROPPABLE for powerpc/32
f2ee39ec52c2 powerpc/vdso32: Add crtsavres
994148e87080 powerpc/vdso: Refactor CFLAGS for CVDSO build
c49ec121a6dd powerpc/vdso: Wire up getrandom() vDSO implementation on VDSO32 <-- fixed up
a8a5e16cde32 powerpc/vdso: Wire up getrandom() vDSO implementation on VDSO64

So I'm happy with this.

Jason

