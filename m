Return-Path: <linuxppc-dev+bounces-1760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC599053B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 16:03:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKqyv1M0Gz2xZr;
	Sat,  5 Oct 2024 00:03:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728050631;
	cv=none; b=LC+IfICg5yRpbIsn/UEu6/V5LzBFucHo//SF7LnLlkS2KzFpinYGf5u81Gne6eqdoi/yc8itkb70n5y8JQYWpZ4Bl/zffFafZArGp7NbiqmbqjLPEqEnAEXhDm/Dg+f4gJ2yhFQi89O3HwANudOo5zJdbLn8Y4KTWul+iG12RfaiDHTpkrkC84agb6SFEzX1y0aWgYuk8oatSToSfHF/86M91QxLCcBvVzSQQ0COPvW9UgCB5zihAIb2BejANf5qthg3Uxt4MaDA30rqBqqg8HaYleOXTp4urTllDyIMyfjWxYtCp6/46kWrKZJIUeYtw86Int7ADEFQFwnDwzxAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728050631; c=relaxed/relaxed;
	bh=ur282vCe+GXFVEXwlujjDhdyy2V/Vuv1h16vjS6nUtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1GHG6UZdwqUH8RfMD4OqGFfqEqTlGAYOuFPIbZpwfoJKtEaUW4rfK0kwMr1P2XenJYhkIH6xT0oRj+m1Tw2e2hbLDxml2GAWn8c/g3EpkdpWz3JsOd3sSUWEBa5ziuMDCifzB8JFdg3/mIuZvPDFteX6YJ7PTzleGKrvVy0kTZnC7lr6+eBpSVHG6mYS3A3ALYTam+aYdICAuyOdhfYVLJ7mS3lYBM61xueA4N5+DlGwVi8FyOxJGAUFlk6kV2bTGtP/M8wKDR1ex1DPkJvH/VL56VHV5DGbWY4Suwg4sbm8cbAUFYEhsczJKk4dyrvRWh8sPfwE7uopbVzRu+Q+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=StHn2pU4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=xe1o=ra=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=StHn2pU4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=xe1o=ra=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKqyq5cqFz2xGW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 00:03:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 857175C5ABD;
	Fri,  4 Oct 2024 14:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849B5C4CEC6;
	Fri,  4 Oct 2024 14:03:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="StHn2pU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1728050617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ur282vCe+GXFVEXwlujjDhdyy2V/Vuv1h16vjS6nUtY=;
	b=StHn2pU4xLJWhZVZK448TxKQ6FtqpJbfgl4I87by9m2cpC6X/W8LL4Vb/d0ru61jMYw2Hg
	styy1k3tnm8bcS24kai8Q7kWTg4FzDsyQn22SHoEiwhDCmyRHZ1N6CGZFWqt+kb9GfXiLr
	2UczYNwEOpZtn454CCVJ4STdz01xr8E=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id febb0452 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 4 Oct 2024 14:03:36 +0000 (UTC)
Date: Fri, 4 Oct 2024 16:03:34 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <michael@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
Message-ID: <Zv_1tqMf-RIXapBD@zx2c4.com>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
 <Zv7HcuhVH1uM9BNI@zx2c4.com>
 <EF78F2DB-7219-407B-9017-990462128B13@ellerman.id.au>
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
In-Reply-To: <EF78F2DB-7219-407B-9017-990462128B13@ellerman.id.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 04, 2024 at 08:52:40PM +1000, Michael Ellerman wrote:
> 
> 
> On October 4, 2024 2:33:54 AM GMT+10:00, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> >Hey Christophe, Michael,
> >
> >This series actually looks pretty okay to me. I realize ThomasW is
> >working on more generic cleanups that might obliterate the need for
> >this, and that may or may not wind up in 6.13. But, I was thinking, this
> >seems like a good correct thing to do, and to do it now for 6.12, maybe
> >as a fix through the powerpc tree. Then ThomasW can base his work atop
> >this, which might wind up including the nice lr optimizations you've
> >made. And then also if ThomasW's work doesn't land or gets reverted or
> >whatever, at least we'll have this in tree for 6.12.
> >
> >Michael - what do you think of that? Worth taking these two patches into
> >your fixes?
> 
> I agree the series looks good. But they're not fixes by my reading, so I'd be inclined to put them in next for v6.13?

They're "close enough" to fixes. The get_realdatapage stuff is super
wonky and weird and it's quite good Christophe has gotten rid of it.
Returning NULL from the generic accesor function never really sat right
and looks buggy even if it does work. But more to the point, given the
other scheduled churn for 6.13, it's going to be a tree-clashing
nightmare to get this in later. And this Sunday is rc2 only, so why not.

Jason

