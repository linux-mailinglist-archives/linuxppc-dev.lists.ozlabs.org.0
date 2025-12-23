Return-Path: <linuxppc-dev+bounces-14957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016ECDA013
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 17:54:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbLhc4fD4z2xlP;
	Wed, 24 Dec 2025 03:54:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766508880;
	cv=none; b=aZ8iMwR6CqC4qUq8AfNcjzLYWLWaHuWrFUM9/64TxnmUnrEtFi/uZZ4pCiCfIy1EjZpMnw5MD4nf4Ahrb/gFAVqvvvUPrkhpFRlg6RlFMpQQz2F1nMCgkooFc+KmOpHAAmhexNNor8DhQda8hPbjs7KdlwNAU1vQN7Jkhtxb/rFZC0O5Uy2ZnS2Bg/UN0r/7odTpdqvsCWK6ciujy0PhUy62fT0woktquWMQehJ9I+AZg7vMXQIRJzZ5J8wQubmzFUeVT20Da/X/nMIUmXLYckqPOFn5VNN51fRCb3UZVL3g6zL+Dy56xBSga/R3oEzUM9zHUrvohrBhbbhhYWDPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766508880; c=relaxed/relaxed;
	bh=vonf8LqeLJwp9G0Ckr7Of+LnsMCBeDul1vYZDPZ2LVQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Vqj63w5J3vZhmaZ3nYl2Ye9gsKRFInlnAvDZ7+56aZl4BTruizH8Tc+Zorj1DgKvCRKWep+e1Bt+7A/TtoT2sL+i8jFt4QAxR5M50qfiCUK4P4CWwsPmNGgzaPDadL9w16gGJTowhg3JMmH8dq2AgNQIWMtbEoka+5Wyto1fd3BhJ3k6/OlrnTzWnWDy0oC3pdHXYTGjYf6Kz4Sv38zUIz7+esy3T3ozmKDkAmveAoUINBCu5330plaQtCFYlty6lpTh9BtMb8UvUaXJ8RrdAQz1MtRw+ZUKwB7C3CwJGnUSAsR5T5Z3n8DadXlTFwRFTniXxMf1PcT9hWOYWAStsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=y2uhOtTy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=y2uhOtTy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbLhZ6BWKz2xXB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 03:54:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D345840A3D;
	Tue, 23 Dec 2025 16:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558EC113D0;
	Tue, 23 Dec 2025 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766508875;
	bh=YSvTCQaekcYuL9cT3nyDik7utEEmbDcrz5nvozNxXXU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y2uhOtTyCjTw1tPpgTeL42HMR7NDR8YOrZMmVeoReXhmp5EKVThfwCgm9ZMq2H10F
	 oIzbBqYLLx4dJjMprtUcezIIPaEprCv7+Ivvq8DySDY/SkRr8lJUxxnEjv0nTy3DK7
	 vdoFrPcKrSwzR1BtpDgv8TYXz/1pAkkyi1dpscy0=
Date: Tue, 23 Dec 2025 08:54:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Sourabh
 Jain <sourabhjain@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens
 <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song
 <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas
 Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251223085434.a6d6ae08c3aedf420908f404@linux-foundation.org>
In-Reply-To: <aUqAcf2405H0pRW1@laps>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
	<20251223013045.4579-1-sj@kernel.org>
	<20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
	<aUqAcf2405H0pRW1@laps>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 23 Dec 2025 06:43:45 -0500 Sasha Levin <sashal@kernel.org> wrote:

> >> > Yes, -stable maintainers have been asked to only backport patches where
> >> > the MM developers asked for that, with cc:stable.  There may be
> >> > slipups, but as far as I know this is working.
> >> >
> >> > I don't actually know how they determine which patches need this
> >> > special treatment.  Pathname?  Signed-off-by:akpm?
> >>
> >> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
> >>
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
> >>
> >
> >Oh, that's a bit sad.
> >
> >- other trees sometimes mess with mm/ and they probably aren't aware
> >  that they need an explicit cc:stable.
> >
> >- misses drivers/block/zram and probably various other things that
> >  the MM team maintains.
> >
> >Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
> >little that useful fixes coming into mm/ via other trees without
> >cc:stable will get missed.
> 
> How should we improve the filter? mm/ AND signed off by akpm?

I think just signed-off-by:akpm please.  That way, mm fixes which come
in via other trees without cc:stable get backported.

Obviously we'd prefer that such patches get appropriate consideration
by the MM developers but sometimes other-tree people aren't that
cooperative.  In this case it's better to backport the thing rather
than missing a fix?

