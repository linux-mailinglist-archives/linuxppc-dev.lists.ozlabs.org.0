Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E7D5BD3E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:36:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWX0d6WLwz3bbj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:36:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kqubps6P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kqubps6P;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWzz5p1Fz2xJG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:35:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7E3D8B80819;
	Mon, 19 Sep 2022 17:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5063C433D6;
	Mon, 19 Sep 2022 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663608952;
	bh=/852PW2VlJHyiSgQsLwdhlZsO86XrfHstwRhfor+u30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kqubps6P1Yp/qBJJxiDo7XPigGAvl2S0Q5BqgKXbTCSsXeebcoeb8IB3l0kXBN0JZ
	 d+tj328dfG/sX+ABbLBIJn/8PE2gZ2xfiC3woDKXnBhTSQXodT96+dM/dbfg3RCJDl
	 GGl73fqtQXVxbY02vYNT4O6+eqa0qU7pcRuJEX5WcBFVSeXiA5OTLbzYVf3upVBtnv
	 HTaqKpI3s5tqR6+X4Md4U9o/ZXdwvnkBUlmN4Duh3tFda1ybGBV6lny0TY79VxuODT
	 zIbXiTZbpjxIOi+xsjB4m0aSpTZtRZzKMaqvH9HHDPeBcHCdxzHWn6RWaqU3+KxXUZ
	 s8q1mchMv4BFg==
Date: Mon, 19 Sep 2022 18:33:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Omar Sandoval <osandov@osandov.com>
Subject: Re: [PATCH 2/2] Discard .note.gnu.property sections in generic NOTES
Message-ID: <Yyin1FUU7enibeD8@sirena.org.uk>
References: <20200428132105.170886-1-hjl.tools@gmail.com>
 <20200428132105.170886-2-hjl.tools@gmail.com>
 <YyTRM3/9Mm+b+M8N@relinquished.localdomain>
 <e15de60c-8133-3d93-eb1c-c6b1b5389887@csgroup.eu>
 <YyimOW229By98Dn7@relinquished.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IQ0PHAJ6cTaIwjtK"
Content-Disposition: inline
In-Reply-To: <YyimOW229By98Dn7@relinquished.localdomain>
X-Cookie: One FISHWICH coming up!!
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Borislav Petkov <bp@suse.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--IQ0PHAJ6cTaIwjtK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 19, 2022 at 10:26:17AM -0700, Omar Sandoval wrote:

In general if you're going to CC someone into a thread please put
a note at the start of your mail explaining why, many of us get
copied on a lot of irrelevant things for no apparently reason so
if it's not immediately obvious why we were sent a mail there's
every chance it'll just be deleted.

> I'm not sure what exactly arch/arm64/include/asm/assembler.h is doing
> with this file. Perhaps the author, Mark Brown, can clarify?

I don't understand the question, what file are you talking about
here?  arch/arm64/include/asm/assembler.h is itself a file and I
couldn't find anything nearby in your mail talking about a file...

--IQ0PHAJ6cTaIwjtK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMop/QACgkQJNaLcl1U
h9CuYQf+LhieRHN+lWuscUX0Gz1aGefX2uk+u1/zVHlI3IS+bi5cEzI4YZz15Fhm
dFlonqfvTgV7AtLj9TiUMT97M/LxM9nsW1x9N6OeSOwwOiNcmYkN+0NMsN8jI99S
wa+rK8Y+KJb1TG3+POFw2Itmy6dmpp5123NKssJodzlZmVn/MBSH5EyztZZv+MO4
giywJmdOZwonwThPfGztYY/yP3AZe2kvVfEwi7R6fEmh5/zXr++ETpkyRdGpph6i
ZBx6WFT70pez5QNA/tKJhPo/agvFApr8XTCllr/dr4zpyrDGKM577/al1JYoic9+
OowcdvXhPOF+9O0gq2jX73BRS0nPJQ==
=XHOY
-----END PGP SIGNATURE-----

--IQ0PHAJ6cTaIwjtK--
