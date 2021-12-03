Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B20467CA0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 18:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5Khr3FZ0z3cFg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 04:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GVrlZDTQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GVrlZDTQ; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5KhC42fGz2xtZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 04:34:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98B1CB828D8;
 Fri,  3 Dec 2021 17:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E2AC53FAD;
 Fri,  3 Dec 2021 17:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638552870;
 bh=WHTBc4bgkCtBeEhRXEgFiz4s5kKd4i8rh+TOXdUqZJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVrlZDTQZV7r3Hi+G/5SPgmOHvHCCsgPx3SiNvOWU1VkhlHEnR9KCf8MzUvbROnvQ
 pGMDwShFgRbunhVW76WvIYMb4g7cMJ+XveF7oR7X78f5IyscuWVvQ/MvyVIVtDKRUn
 3Kesbb0/K6VxIfmcpZzVmL+7wIcePSbGA5jBFOTPvi0BtYoHFQs0wW+0w3NzKrhjyU
 0Tc75DoN8dJM54SsIDmomSdwSoTjU3sGyQMMRVDnM2+2f4F+1SQK7J1E5X/D4nT5Pz
 WhbxH60D0VJc3DMFt7LVUyqRhZSfAVyYY2UYryqyVmGDSKX3HFGvR6zaAfiDYE147a
 4CivT/QABHpAA==
Date: Fri, 3 Dec 2021 17:34:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
Message-ID: <YapVH3b9urxvngWG@sirena.org.uk>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <163762561675.2471742.16439171676950432106.b4-ty@kernel.org>
 <6a2ff1f0-ebd9-be6d-9b2c-5704edd7c25d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0HmQJ345lS0f+Xyw"
Content-Disposition: inline
In-Reply-To: <6a2ff1f0-ebd9-be6d-9b2c-5704edd7c25d@collabora.com>
X-Cookie: Don't get mad, get interest.
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com,
 bkylerussell@gmail.com, michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0HmQJ345lS0f+Xyw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 03, 2021 at 02:25:17PM -0300, Ariel D'Alessandro wrote:
> On 11/22/21 9:00 PM, Mark Brown wrote:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

> I gotta send a fix for one of the patches. So, should it be a new
> incremental patch or I can still send a patchset v2?

See above.

--0HmQJ345lS0f+Xyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGqVR8ACgkQJNaLcl1U
h9BVOgf/XdVufglD/qP9remM5BJT0aYWhxGy2k/SnulImK+rVelJFADnkoCZr+tr
acRDTwVyTzcLaXjqzLy18Q5EyBKOan9TBayKNN3kiv60LMacGJZ3Vh+1A31tMns/
qxnKMQ2yOHQp+43Fy5l446Q8gNVfSbBSnr6uhuPXrLqPadPfvm8h7o0o/aqr1q+x
lBu9YRqlZLwtuCOv80lgGtoCjstbLlAcPZqgnzX3VKu76H83cfHjLk+n2s4PO3Uw
q76pYz7sxKaWLJlLw+2DLN2Yf1S3JD7rTHxXhohtrGQFnoAd0wOcD36ezRRERVux
b7lFaTv8PgmD40D1j+UIWK1CRm6kQA==
=nhC3
-----END PGP SIGNATURE-----

--0HmQJ345lS0f+Xyw--
