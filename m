Return-Path: <linuxppc-dev+bounces-1729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B83AF98D110
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 12:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJW7H36g9z2xJy;
	Wed,  2 Oct 2024 20:21:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727864490;
	cv=none; b=kc8DOmTR6/hbXu01NvUEqzn/6DMkDK9xl0Yryzt/+NCMgBXw6gPnLhz1YUE1mDv3qUqjhq3FkcFHk6SEgGN9PfaTN+G1YgNizwvTVkjoLFmX4+MoXKi5w/CyzoJCZvyysfZYNQQLG5M9Cyd4w1fGxsm/tX3P+rxniJe9OR4Y1+kjMl/hnmLPGN5GPoQfR3C+NFUurLkp4WCOStn8XUJvLO9j81zsi3SIfO4RM7OEspxye+GHkgJp0g7yZhdVuMp00LJR7pTcoSWd/GBx7FuirmhJADNZM37AoGolfwEKr6Gy3fXY82nuEdY+B3V6YNoTv4W19lw8hDpJ6xR7I4Qnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727864490; c=relaxed/relaxed;
	bh=RhD25htocjLaJhhw/FN1jPZB8HhN+tD6ZhBBhAifomQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHE+U9XAstx6A0MV6Emc5xinJ1aBlkOp61Yo4FwlLhaKv5+54QtTHFgFsUMDzcrmQJx+3QWk4nwE2maiULuCf7l1A5oqQdy4j2otwMjy0Ke6KYxI+9v634LRAjfqst2vy4cY1u1Cz5dw07kpUl93KG4PvLq8r0IL8XN5Mk4Eigv2A2euX8HQ4k2k8sAJ0R6Hznp8bmaqEWA48P/pIC1Ktjc67SgwVDZTXn3s/xUeUykJvIh89e2p8MYFt2IzUKYKn638mpFCR1JjeET7yzCLnHrPC404umPYPK36voAcHgle0kes7melUTeI8EyTMlQo9fe/T4gnf2PQHkx+mw0WYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BnHe16rL; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RdHU7Mt2; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BnHe16rL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RdHU7Mt2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 5216 seconds by postgrey-1.37 at boromir; Wed, 02 Oct 2024 20:21:30 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJW7G3p3jz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 20:21:30 +1000 (AEST)
Date: Wed, 2 Oct 2024 12:21:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727864487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhD25htocjLaJhhw/FN1jPZB8HhN+tD6ZhBBhAifomQ=;
	b=BnHe16rL1tG8Y46BcKHdCWnMzIDHeM4kxsXos+WJq3VsWoGjgWmBpv1zv+Imj16+o4HSZV
	lIVE0kHplh4ZmM730AoTQ69DNB+1hX08//ELR92GjCRsUv9RunJzZblgC17mRvs+iX6bDq
	UgJxhtfx/u9kBFIpQBHNCjSBgK3DhZuS1zg3/0v5fqu5l12mq7lqvC2fRVZGAerXUm9gn4
	sr/aQag6hzSu3uMuA3vZnDGgVGO2cVTzdplp1TAQp58PlItYrnG+BrkbGac7MHqci1EiEY
	y8ZsWyQzkrngajsZnWkXWlVaDasRJHU0PTBi6jmr0f9NlHqFPhBFfXipjGCBmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727864487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhD25htocjLaJhhw/FN1jPZB8HhN+tD6ZhBBhAifomQ=;
	b=RdHU7Mt2IXp/zUN+hFhk2mjuCxd7zuMbvi/6WGPSE4HWRPXQQxPUNrmey5qPZAWOt+fbYt
	2PLF+0N0PRAxSSCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
Subject: Re: [PATCH 1/2] powerpc/vdso: Add a page for non-time data
Message-ID: <20241002121330-50b996cf-e296-4f0c-908d-300948728d1f@linutronix.de>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <20241002104334-b655500b-901b-42db-a2c8-582e10826889@linutronix.de>
 <368e38d3-5883-4192-b9cf-f66d0f558528@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <368e38d3-5883-4192-b9cf-f66d0f558528@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe,

On Wed, Oct 02, 2024 at 12:10:08PM GMT, Christophe Leroy wrote:
> Le 02/10/2024 à 10:54, Thomas Weißschuh a écrit :
> > On Wed, Oct 02, 2024 at 10:39:28AM GMT, Christophe Leroy wrote:
> > > The page containing VDSO time data is swapped with the one containing
> > > TIME namespace data when a process uses a non-root time namespace.
> > > For other data like powerpc specific data and RNG data, it means
> > > tracking whether time namespace is the root one or not to know which
> > > page to use.
> > > 
> > > Simplify the logic behind by moving time data out of first data page
> > > so that the first data page which contains everything else always
> > > remains the first page. Time data is in the second or third page
> > > depending on selected time namespace.
> > > 
> > > While we are playing with get_datapage macro, directly take into
> > > account the data offset inside the macro instead of adding that offset
> > > afterwards.
> > 
> > FYI
> > 
> > I am currently working on a series to unify the storage of the
> > VDSO data for most architectures, including powerpc.
> > This will also include a dedicated rng data page.
> > 
> > That generic infrastructure would replace the need for Patch 1.
> > Obviously, if your series gets applied, I can adapt mine for that.
> > 
> > If you are about to also modify other architectures in a similar way,
> > we may want to coordinate.
> > 
> 
> I'm not going to do anything on other architectures.

Ack.

> Indeed my patch is an outcome of the discussion at
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu/
>
> I'm all fine if you are doing something generic for all architectures. For
> powerpc will it handle the entire non-time data, not only rng ? The purpose
> being to revert https://github.com/torvalds/linux/commit/c73049389e58c01e2e3bbfae900c8daeee177191

Yes, it can handle arbitrary arch-specific non-time-related data in
addition to the rng data.
(In addition it also handles arch-specific time-related data)
The code introduced by the linked patch is gone in my series.


Thomas

