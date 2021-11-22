Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F8459048
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 15:33:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyVBl6ZYbz30HR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 01:33:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/HpMvWY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S/HpMvWY; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyVB63QG3z2xBF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:33:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C771A60249;
 Mon, 22 Nov 2021 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637591596;
 bh=HQ/rBtmshuw/WiM8hjphmiy6FIeophJG9i6cPEOi804=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/HpMvWYEpjtGsN1Av5DUevXs3i6X9x1C+k8KKFVfrN81LQrd3pCbmuawx9aQ44Ab
 joW26hfLnlIc1AO9gfbU/MAEGu1QCVZfNgOnWlTji3u3Qd71tMp4oFHUmqnDYoL5kj
 my45BtSYWYsaJXzhD7AgrsCz7REdbPbkQxvXj4ilC0aZGCDcavb2O3H//IJxQ9Hi3y
 s+yWkr2fgbS5fJAbZjZO6UaH0iP0TF5mICfk1XzoCW3LkHK4yf8vnsE1KNpYa5UVN8
 p/Poe211EAor7LspS77bzWR1eOnNilutb45uyp1FVCrVgRntbjTNTf8yGvgnvSCKYV
 AJn68i0LNIZeg==
Date: Mon, 22 Nov 2021 14:33:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [RFC patch 2/5] ASoC: tlv320aic31xx: Add support for pll_r
 coefficient
Message-ID: <YZuqJiZznMfqmWR7@sirena.org.uk>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <20211119153248.419802-3-ariel.dalessandro@collabora.com>
 <YZunmnHqemZRJ6JK@sirena.org.uk>
 <CAOf5uwnrUdF4fOVGvp8GmuUL6SpsyjPq46WBP7hcY7bYbw7RHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1RMo0WyMSz1lb9Z2"
Content-Disposition: inline
In-Reply-To: <CAOf5uwnrUdF4fOVGvp8GmuUL6SpsyjPq46WBP7hcY7bYbw7RHA@mail.gmail.com>
X-Cookie: Lake Erie died for your sins.
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
Cc: bkylerussell@gmail.com, lgirdwood@gmail.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--1RMo0WyMSz1lb9Z2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 22, 2021 at 03:24:42PM +0100, Michael Nazzareno Trimarchi wrote:
> On Mon, Nov 22, 2021 at 3:22 PM Mark Brown <broonie@kernel.org> wrote:
> > On Fri, Nov 19, 2021 at 12:32:45PM -0300, Ariel D'Alessandro wrote:

> > > When the clock used by the codec is BCLK, the operation parameters need
> > > to be calculated from input sample rate and format. Low frequency rates
> > > required different r multipliers, in order to achieve a higher PLL
> > > output frequency.

> > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

> > Did Michael write this code (in which case there should be a From: from
> > him) or did he work on the code with you?  The signoffs are a little
> > confusing.

> It's fine. We are working together

In such situations it's best to include a Co-developed-by tag to say
what's going on, that makes it clear what's going on.

--1RMo0WyMSz1lb9Z2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGbqiUACgkQJNaLcl1U
h9AvtAf/cw+AV+VDF/3zHrh077dmoGB7oWdCofQf+EMfotDjQb7ln2ohOl5iIL8N
v/VZcOXCABOS0IS8UxhyNAtoa6T8hc2d+vKmxYBjmBAuq4LJ9UaYxIYVYschC4z3
Y/F6cvzPdQG62JFzxh6sOWuPI8u33jDIBhcnjG2i9j5RyxWhZ4bDsDE/qHmxfGnb
UaDdgcb7I/ImZnzxOAoEKq/piUZc3jBTPEpUlw671U/9qxm2ZIu0HuRwutYukUZn
dQKjU3uzK7tTdisZOQjl4XgxgtBJc4Do0D9ZOQ8DLIGyH4x+5ZNKo0S/w6V7x3x8
mBw/kmOkXQEx9gMIuPq2XgmaZ4g1LQ==
=ufg+
-----END PGP SIGNATURE-----

--1RMo0WyMSz1lb9Z2--
