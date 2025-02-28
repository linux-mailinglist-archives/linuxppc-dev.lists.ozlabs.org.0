Return-Path: <linuxppc-dev+bounces-6578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DE6A4A0C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 18:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4Fxp1bZlz3bsm;
	Sat,  1 Mar 2025 04:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740764782;
	cv=none; b=N2XyFY56sgxvfFGA2ygsMhV5ZpTOHl2hKdvy532Z73Md76GU8Z5pGqlYEimCoexQ/lFQyWohd81NgQjU2Jqwn8e3cNlD0U6s1KX1Kjfd+mNEmUubh7EkluEHO8sMN4XE7caM+NLO5Nqo7jAy1dE5f+RIO8kOTIcAAZcplOahvH37oAk2525w+wN8p1/dsRlnmUagrBzajvyBp4n6cgkFBZ2F3m7wCrgsueXFlVSk7tkqXzYeR7H4YkjQiCKUHA+1+pecD36v+sZ9QKfCrhVNBakahM2m2YUNtZvVdG5CMWXc5gSUGQLRnPeyQSmUqV9fGFdA/W83POFAnOc4VvUhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740764782; c=relaxed/relaxed;
	bh=4Sdh3Tm5/FXaDLnZuBzXHN7eaYLYDv6a0scCcvv6Y/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7+mjRbeVpWBn9m9RQVn6Uz5TuJCgAMG4h7hS3p6gE35PjPbQJCXRd93CqmyBm1fRMcRoiRc+DmP5bFk/zJUvGuH3XD6GtkzSKCGp+uXNnXWHJj9iSQ9zuxgafxhcgXymbDDy+lAO/ZkRYbAZinuWdlzqQEXjuk/obSXGe2qnary631njeXsPrVHPFuZIDTCaVGqE+xrlpSC/jveU7BVWh9CWjOSpHK3t4fu7/kzmKnq2mIgEFBWt5ycqaZHMSu6JdLEEzbsqtLXE4WYuRnyFWFopCJ5w4b6HuYkfW4M/BwH2jz1+X2FrO08AiJ5DamS2mDciv1Elp2qD9UI55ajMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hlrBtcqS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hlrBtcqS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4Fxn3fPWz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 04:46:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5BD35C6363;
	Fri, 28 Feb 2025 17:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7123AC4CED6;
	Fri, 28 Feb 2025 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740764778;
	bh=DLV7axteULbZaaTMbZ0+lYVh+GxofeyhMw8FK1VhIUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlrBtcqS2iHOxk7/P06xwufWZBPQ3yIyBjjLEqELpFvcrRdCiLzkqJpxP36wl+P56
	 CX/KOCAIveJq0g7KipRj80JwwzAcys9bK+bDGc4Vpy6WHhJqx6+BTtX0u5jB9fQMhU
	 AljTEsS+lTAwqGnUL3jZK2JPvRKQyPt0lzhxvBMqbeWyPsjJHC9Mo/ym2J5kliN4ee
	 8MlGXK2pn/Y3eI4fuknyibez3fpdYOzI10DDZRfR9X44ESgr07wV/HO3Cg6V39SvPd
	 esGje86iCiMXRgW0Eb2xu5elXeuwCdeUYLKQIWUQ7islEGHumwGmT85nwLzZ/nuP+C
	 ih1KzaYWEWGbw==
Date: Fri, 28 Feb 2025 09:46:15 -0800
From: Kees Cook <kees@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [next-20250226]Build Failure
Message-ID: <202502280943.6558CAE@keescook>
References: <adbe8dd1-a725-4811-ae7e-76fe770cf096@linux.vnet.ibm.com>
 <20250227123804.5dd71cef@canb.auug.org.au>
 <14193c98-fb30-4ee8-a19a-fe85d1230d74@csgroup.eu>
 <SN6PR02MB4157A0C1B4F85D8A289E5CE9D4CD2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c68287f7-ad00-46fc-a92e-06e0c9074139@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c68287f7-ad00-46fc-a92e-06e0c9074139@csgroup.eu>
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 27, 2025 at 03:15:35PM +0100, Christophe Leroy wrote:
> 
> 
> Le 27/02/2025 à 15:05, Michael Kelley a écrit :
> > From: Christophe Leroy <christophe.leroy@csgroup.eu> Sent: Thursday, February 27, 2025 2:43 AM
> > > 
> > > Le 27/02/2025 à 02:38, Stephen Rothwell a écrit :
> > > > Hi Venkat,
> > > > 
> > > > CC Kees Cook for advice.  This is a result of the tests added in commit
> > > > 
> > > >     bbeb38b8487a ("string.h: Validate memtostr*()/strtomem*() arguments more carefully")
> > > > 
> > > > from the kspp tree.
> > > > 
> > > > I note that the comment about memtostr() says "Copy a possibly
> > > > non-NUL-term string".
> > > 
> > > Can you tell more about your config and your environment ?
> > > 
> > > I just tested with ppc64_defconfig and ppc64le_defconfig, with gcc 12.4,
> > > gcc 13.2 and gcc 14.2 and didn't get that build error.
> > > 
> > > Christophe
> > 
> > FWIW, I see the same build failures related to __must_be_noncstr()
> > when building natively on x86 and on arm64. In both cases, it's an
> > Ubuntu 20.04 installation with gcc 9.4.0 and binutils 2.34.
> > 
> 
> Looks like I get that problem only with GCC 8.5 and GCC 9.5.

Okay, I've figured this out, and sent an updated patch:
https://lore.kernel.org/lkml/20250228174130.it.875-kees@kernel.org

This matches what you found, namely:

> I don't get it with gcc 10.3 nor 11.3 nor 12.4 nor 13.2 nor 14.2

These have both nonstring and __builtin_has_attribute()

> I don't get it either with gcc 5.5 or 7.5

These have neither.

The problem was in the span of time when nonstring got introduced, but
__builtin_has_attribute() hadn't been yet (GCC 8 and 9). I had accounted
for having neither, but not for missing one. :|

Thank you all for helping debug this!

-Kees

-- 
Kees Cook

