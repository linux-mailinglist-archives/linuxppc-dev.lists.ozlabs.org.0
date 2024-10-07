Return-Path: <linuxppc-dev+bounces-1800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72799333B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 18:29:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMl2z383Kz2yhZ;
	Tue,  8 Oct 2024 03:28:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728318539;
	cv=none; b=RANhjRi7KFCfHKQxBcKL2RVEBCMvhqLRzaz9cU/OlqlRqcyr0aEtVPMB1WDBEng6TeDCVsJ3GMMhORlhuyYrPHvq/gEu2eiHpB0rFtBpWWsJwVR4uHIgxox4KzXUdrYz9Ofx12w7OzP2B9j95QBvBtJMGtEjuLLhmMWx56CZWnya/qEW5CbMV+Hf0GuPwlGoo+QvDeHnztak6oSM5HNdoKuKtJ9VktpKoGUXOG8xXDbe8BtGvBGyZ1nO9wHkSY7fjGxAMN5Nc+D0Gk4F+q5oAIuGi64D3sleefYklK+hIuqpyiyqqgaW+9Yu1bvs3VCoIyt2yZ6fP9j6ZYz4Z8QHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728318539; c=relaxed/relaxed;
	bh=8ilJfs6VwyezGkqdIQDo26qMLuBPXCOOn0/kg2C0MuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WffhNxue2RsJmBk1cyGfVmjcb6APaT2R2nhkY7wsOLI4Fx/JAreOhTEjvkCvTzhGCRVuNISM8BahvZrnca9eueQcXpMdUNkgu30v/ePaXE3uBlOjIdP27BR3TQgd+ac3ImX2iNxeARWSp5xQ+a6s/dhnQKxRXSlX5Oe2ypa95eEyugKX4lqGwKuwy3MGdHmzSQOcoLC1nKc2xdjGZ8p44ULAkDDoaX/0YaICeU7H2VlkegcBiLsDLSAtawb1PSVVtviPj7O2PAOJxAaHoqAyznriyvCARFyb4D+z/ZMLILzjgbm4JUbIa+ftjs4jXKh4GXP+iSYOK2K3Yvt35RGQQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=nNpnL+80; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=vtoa=rd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=nNpnL+80;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=vtoa=rd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMl2w2Wj7z2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 03:28:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40054A41B04;
	Mon,  7 Oct 2024 16:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B18C4CEC6;
	Mon,  7 Oct 2024 16:28:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nNpnL+80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1728318528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ilJfs6VwyezGkqdIQDo26qMLuBPXCOOn0/kg2C0MuA=;
	b=nNpnL+80WI/BOztRB/jqPyXCsNI5orRVV9Wd6MchqCBWOyV4W135834smfjaDQjd1xs1Fp
	c6SY857OpJNBGYJ1EYSWZANS28DzofmGclsTvS1y55cw2AjK6nUC+AQ+gXCphQ0cwWJh5K
	JhRnf7zX697PQOG0hPvpH0vTGESDbOs=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 404bc7f7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 7 Oct 2024 16:28:48 +0000 (UTC)
Date: Mon, 7 Oct 2024 18:28:46 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <michael@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
Message-ID: <ZwQMPmfG5zDGz1Wr@zx2c4.com>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
 <Zv7HcuhVH1uM9BNI@zx2c4.com>
 <EF78F2DB-7219-407B-9017-990462128B13@ellerman.id.au>
 <Zv_1tqMf-RIXapBD@zx2c4.com>
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
In-Reply-To: <Zv_1tqMf-RIXapBD@zx2c4.com>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 04, 2024 at 04:03:34PM +0200, Jason A. Donenfeld wrote:
> On Fri, Oct 04, 2024 at 08:52:40PM +1000, Michael Ellerman wrote:
> > 
> > 
> > On October 4, 2024 2:33:54 AM GMT+10:00, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> > >Hey Christophe, Michael,
> > >
> > >This series actually looks pretty okay to me. I realize ThomasW is
> > >working on more generic cleanups that might obliterate the need for
> > >this, and that may or may not wind up in 6.13. But, I was thinking, this
> > >seems like a good correct thing to do, and to do it now for 6.12, maybe
> > >as a fix through the powerpc tree. Then ThomasW can base his work atop
> > >this, which might wind up including the nice lr optimizations you've
> > >made. And then also if ThomasW's work doesn't land or gets reverted or
> > >whatever, at least we'll have this in tree for 6.12.
> > >
> > >Michael - what do you think of that? Worth taking these two patches into
> > >your fixes?
> > 
> > I agree the series looks good. But they're not fixes by my reading, so I'd be inclined to put them in next for v6.13?
> 
> They're "close enough" to fixes. The get_realdatapage stuff is super
> wonky and weird and it's quite good Christophe has gotten rid of it.
> Returning NULL from the generic accesor function never really sat right
> and looks buggy even if it does work. But more to the point, given the
> other scheduled churn for 6.13, it's going to be a tree-clashing
> nightmare to get this in later. And this Sunday is rc2 only, so why not.

Bumping to top of the box.

Jason

