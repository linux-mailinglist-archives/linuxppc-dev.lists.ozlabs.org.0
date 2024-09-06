Return-Path: <linuxppc-dev+bounces-1125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734696F5A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 15:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0crM01Psz2yp9;
	Fri,  6 Sep 2024 23:43:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725630210;
	cv=none; b=n5ZPnlPb4J02SsUnryVd/6pVhmB2ofl5XKT40E/dTYjqSskNTaV+FXSUQeX9hsGbPMA23F4STM462jpik7Er4d+ucSf10/RupqRs/t0Ypzk9kK4DDhYD+G7CRumvINx23jMdJAgmJFgGkmbMzYmmSmfDLzxoCtD37GQm/+maqckUXppUNf9bmo+onBqCELtLwGQWaKW8G9k2kiWIf0oAz33+edULa3J3Rp2oGYY30NCmXEdU9MACGZv/oAGTP3TqBhT0eVR6qbVTAQjukpwDNtjbr7ZyHuvyKAoKgg01EbhXlf/wSoSCbjXs9NQ35bOy2wt6q/W7CujSy3p2l/eQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725630210; c=relaxed/relaxed;
	bh=qPFFItz4weltxivaClWe1sh6Vsy3edyxwb4Jd24IaOc=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=hvo2ehv21calsgzfIth7Y65YWbsgusEt+i06xLBPBSPS8jvbXrf2mefmaFn+70/SBKm/HGJmVTaVbVKOxzxAfairV5CckR9HcUCxet7UWbruJDuBE+1XsRYoKMCmioNmhH+u7RdyxhxirYLKgTCHkGUxaoQxG7YlaqYl4yogkKCWG2R+0N84I8KrNLL7ZEIL7ZswhsVt8mU5Clyoy6BynHZ/IpcCo6o/9Cbn/+GSqpLoMPjFS2rvGR+k1pjq3uF8qCdAiGxDLql6pYHA7bz3GMcTPAZFjFFGtqwMFKoS7yWbMqzMDjGkdwLVSSh6vSm7+cp3zwDNyqEwZzTj8cU6XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JIlXUBKk; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JIlXUBKk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0crJ1V4yz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 23:43:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87990A44F60;
	Fri,  6 Sep 2024 13:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C2AC4CEC4;
	Fri,  6 Sep 2024 13:43:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JIlXUBKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725630200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qPFFItz4weltxivaClWe1sh6Vsy3edyxwb4Jd24IaOc=;
	b=JIlXUBKk3VOj3pcGiwvCqZvvDB8ub6LoZcvZLmqdN53ng0ggXouu0gnixYtFT8Lg8xvbF6
	J0mRoQLz958kmLKE9adqGF9g9KA9bC1sHggQ3UdUIAqxKoQoEk0e/MexPmLBfrlqvkUTWk
	HCEmBXu7uyZA2oYLlbaFAzzMuunAm+0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 879548d5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 13:43:19 +0000 (UTC)
Date: Fri, 6 Sep 2024 15:43:17 +0200
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
Message-ID: <ZtsG9Q6vKD9XOsZN@zx2c4.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <87r09x3r9v.fsf@mail.lhotse>
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
In-Reply-To: <87r09x3r9v.fsf@mail.lhotse>

On Fri, Sep 06, 2024 at 10:23:08PM +1000, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > When running in a non-root time namespace, the global VDSO data page
> > is replaced by a dedicated namespace data page and the global data
> > page is mapped next to it. Detailed explanations can be found at
> > commit 660fd04f9317 ("lib/vdso: Prepare for time namespace support").
> >
> > When it happens, __kernel_get_syscall_map and __kernel_get_tbfreq
> > and __kernel_sync_dicache don't work anymore because they read 0
> > instead of the data they need.
> >
> > To address that, clock_mode has to be read. When it is set to
> > VDSO_CLOCKMODE_TIMENS, it means it is a dedicated namespace data page
> > and the global data is located on the following page.
> >
> > Add a macro called get_realdatapage which reads clock_mode and add
> > PAGE_SIZE to the pointer provided by get_datapage macro when
> > clock_mode is equal to VDSO_CLOCKMODE_TIMENS. Use this new macro
> > instead of get_datapage macro except for time functions as they handle
> > it internally.
> >
> > Fixes: 74205b3fc2ef ("powerpc/vdso: Add support for time namespaces")
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>  
> Oops.
> 
> I guess it should also have:
> 
>   Cc: stable@vger.kernel.org # v5.13+
>   Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
>   Closes: https://lore.kernel.org/all/ZtnYqZI-nrsNslwy@zx2c4.com/
> 
> Jason how do you want to handle this?
> 
> I can put patch 1 in a topic branch that we both merge? Then you can
> apply patch 2 on top of that merge in your tree.
> 
> Or we could both apply patch 1 to our trees, it might lead to a conflict
> but it wouldn't be anything drastic.

The merge window for 6.12 is pretty soon. Why don't I just take this in
my random.git tree (with your ack) as a prereq to the ppc vDSO work.
It'll slide in _before_ Christophe's other commits, and then the
separate vgetrandom fixup will be squashed in the right place there.

And then it'll hit stable when that's submitted for 6.12. It's an old
bug that nobody noticed, and time namespaces are kind of obscure, so I
think waiting a week and a half for the merge window to open is probably
fine.

Jason

