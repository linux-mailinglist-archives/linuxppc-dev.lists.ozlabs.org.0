Return-Path: <linuxppc-dev+bounces-5669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED163A217F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 08:19:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjYRl5Cjyz30MR;
	Wed, 29 Jan 2025 18:18:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738135139;
	cv=none; b=OyeZBs1vRoDU6quW/WyLozaoRt/2IyHBv/VGfofY0LtuNA84ZP0xleUC0eazqez0m2YVgibeJN0+XuXtym2knHiQDWnFfozighejvQ4iN6C2TFQAWJlROwi9G1hVx97snQ7qafPu351vZqmGksa1f4SmygF/wJRkYkTmtzqXjOAJaXMgJywVvZXLCIjnZl/kGn9cbAJxppGy0z96JPHWAZ06wp/oaISfLYg3rxFwSRYzEsEPXFkb6XCdYZJAwxS/osXI/XECc/MxdmRxm9X8d0GAGl53WzWjgDf+UaSHgXEf17rMR9Nz3uu69gybcMSJYcciyNgxvUmm5Gg6Zl9UOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738135139; c=relaxed/relaxed;
	bh=irP8nmkfLDHPhn/4WV2oljCRFLuH8gFSrvjZK3XY7tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAc3lCl725TkZSQMs0v+X3REmzkeDQm6bc4xPEFNRyoVXHDeaYGbEjG+QmoT7r1cEEv4RIeey2PKW+O80hLXFGH0XiwH8ws3fA/PoIJUxsyKM00tFyy4cxrs5NEOSx2ppLrZrLpxpXXD6/gin+D5JkBGPHpqfHYbCdkJfVf3H/NXlKct44ZRH5VjDUFdMy+DyG7QkFO9DkmBdaxc7SXKHjhslyPLWsCtYB8W6gCaTvVg5g9uSzO3ulgeMi6ZoyET/BgWAqo0676yUdKuuaeXDuMN6jPealyJD3Wv84hSja+SYQKBpDwpEvVpGSulGDVk1gzSVEWiP3clwqpASweRSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=owAz95hN; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=owAz95hN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjYRl1W4Pz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 18:18:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738135130;
	bh=irP8nmkfLDHPhn/4WV2oljCRFLuH8gFSrvjZK3XY7tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owAz95hNh231B8vCa+n+AJs7HsbJzxwSRed7Z3Sp0K9RAtGSQdNYWskRPwdaWKMz9
	 DnKimxYSCMthOsz2RPYcTyuVEtpNOppvXFS2a2NEBsD6rMnLgPlAEfVRixcFx5tfEc
	 P9l1YZCNlV34ezpcC1IbK+/T5kIZ20XsFMywp+dvNq+hsPucXn5dwPk7twyxNPNceR
	 pWVDyA5hvhUguA6dO4fRlbkSvIJ831rTvccPgCo6YGU4AZzK3dvyzPgjxYdMg3DGiF
	 cg2d+JmMaw1jjycXa9eo8c8SVoT3UZuzIHWQwCM5TJ9DzTvvP1t+xOrNGvxH3L3s2N
	 x2QBpXglIE0PQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjYRZ3829z4x3d; Wed, 29 Jan 2025 18:18:50 +1100 (AEDT)
Date: Wed, 29 Jan 2025 18:18:54 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/5] powerpc/microwatt: Device-tree updates
Message-ID: <Z5nWXtdCokYuVbXo@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lfmZtfHD7t2IvK@thinks.paulus.ozlabs.org>
 <D7ECKPNWAU7O.39PRDJ4PIG0P9@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7ECKPNWAU7O.39PRDJ4PIG0P9@gmail.com>
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 04:36:14PM +1000, Nicholas Piggin wrote:
> On Wed Jan 29, 2025 at 8:52 AM AEST, Paul Mackerras wrote:
> > Microwatt now implements ISA v3.1 (SFFS compliancy subset), including
> > prefixed instructions, scv/rfscv, and the FSCR, HFSCR, TAR, and CTRL
> > registers.  The privileged mode of operation is now hypervisor mode
> > and there is no privileged non-hypervisor mode; the MSR[HV] bit is
> > forced to 1.
> 
> Cool. Lots of development in microwatt.
> 
> Come to think of it we should have put a broadcast-tlbie feature
> in there and you wouldn't need the other patch. That can go on
> the todo list I guess.

I thought about doing that, but it would add complexity and I'm not
sure it would actually have any measurable performance benefit.  When
I saw it was optional in the ISA for LCS and below, and that the
kernel has all the machinery for handling the cross-CPU invalidations
via IPI, it became very much the path of least resistance to use the
kernel machinery.

> system-call-vectored was available in ISA v3.0. Not that we do much
> with it at the moment IIRC, but there were dreams of wiring it in for
> compat guests. With that fixed,

Interesting.  I looked in my copy of v2.07 (PowerISA_V2.07_PUBLIC.pdf)
and it mentions rfscv in a couple of places, but has no description of
scv or rfscv.  I'll change it to v3.0.

Thanks,
Paul.

