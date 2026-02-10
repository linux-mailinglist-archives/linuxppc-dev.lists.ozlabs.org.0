Return-Path: <linuxppc-dev+bounces-16776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id x1ZZJF85i2ksRwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 14:57:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF0411B9FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 14:57:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9NRw4ncfz2xQ1;
	Wed, 11 Feb 2026 00:57:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770731868;
	cv=none; b=j+sk55fpNAh5srY1OnsSI3q45XCjEtnAoYWYrE2Y5B9G5qN0KXxE48nZRGmW6oEtbXxvsbG5w+S8kqZgnwIJKTsX0wNXu/9W9TwvDvoRHTiN1bBKq8OSJEZ6zfswy30/AvD2as4J2XJKPlg8OVK3YsqSz5M5bE9vztGeifnuamrLfQGUzEMDcK6LkY7/mWP0f77BEjQG86ZbKnMfnvMsspisyrYN85nLbxbu4+telSkz6PHTKW5729nPIzM8bcMQ4v0e/kk2phT2DuIvwV3bv/tr93iLQKqvhpDFTf7sfZQTs1llaPMDTnCt3oCdax4j0FcLSUwApsSAYZj66eq/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770731868; c=relaxed/relaxed;
	bh=czuI6swrGaUma7tJTDCAg011fytzT+/paEmEhPyGsU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1J9WP3t7RpXWTQ2Q1EU6dKtcYmGZb1Jq1cwbaJPcbhbcZ0BSR7qAnnHOBQnyg+2Lx+XEKTCyx30areH4x885xI0DaoX7NUlJYFiRNCgK2HQFR8kntqWdnkCljZXbVEzndTFY1DqKhwYSPJFQ7d1p+Mc94H9AGuVCwwuLZXvdXB1gZ8QQQBYqDiIO7jZ1wg0M64eBZmue15jGrB73KqomNWmurCK2VE6IqriX8c5HeIKyeZ4hYYQR1C2kQyvRD6/v+EDIlBn2avZkCAMrCwaINwutpb1jn9fFQoJnbd9ZakrMtjTyY90GqiOEZqCb1okXcowwyekNU8XRT9yxG5R8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C3Dk3Mxa; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C3Dk3Mxa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9NRv6zSvz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 00:57:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 142AB60097;
	Tue, 10 Feb 2026 13:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CF2C116C6;
	Tue, 10 Feb 2026 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770731865;
	bh=czuI6swrGaUma7tJTDCAg011fytzT+/paEmEhPyGsU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3Dk3MxaHzrB0xSFsF/QWEkTbi0xTrXBqqsULVouwbf+v5h0sOwJj5ucK6np5rul1
	 h/FPHvSA73j4GUi/k5ZT7BA5bRuudh4OW6OAQxB5mP/cvDPKtj2lln6DVIhM+zjwYR
	 wrfOeu3wGN7Z8wkuimeBN9ZrHvC4eRux1QwrDUs/WQaPn9tqU2maRrePW0oSy/PPX1
	 vB6VXnItP51Q0CEPUIJVc/bW6aeKflJJbGVSGTPQwCLbXFaz0g4f7EDpi4v56PQ8+K
	 6Qov5ktEKJtsXsiaP3mlC19FNJyNYDZUqSkzsmbAWZJvYvNKJEQhMKrhyqpZBTsQaA
	 uhRLR/cgWzqng==
Date: Tue, 10 Feb 2026 13:57:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
Message-ID: <df0669e2-949b-4d6e-b734-d87333c2d6f9@sirena.org.uk>
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
 <5056506.GXAFRqVoOG@steina-w>
 <CAMFT1=aJa92RO4j8ipcRc0NJ7DjAvgStkTiSx-QsrqQQzqkV=Q@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C2ElNylhWZPDuDeN"
Content-Disposition: inline
In-Reply-To: <CAMFT1=aJa92RO4j8ipcRc0NJ7DjAvgStkTiSx-QsrqQQzqkV=Q@mail.gmail.com>
X-Cookie: Spelling is a lossed art.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16776-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:n7l8m4@u.northwestern.edu,m:alexander.stein@ew.tq-group.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ew.tq-group.com,gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BCF0411B9FE
X-Rspamd-Action: no action


--C2ElNylhWZPDuDeN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 10, 2026 at 07:55:28AM -0600, Ziyi Guo wrote:

> Thanks for your time and apologies for the inconvenience. I think we
> can drop this patch.

Please send a revert explaining the issue.

--C2ElNylhWZPDuDeN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLOVQACgkQJNaLcl1U
h9BN3wf/QVUs+vKPEw6CuD6bOSL1eUA0yxJmuZhjqWvNw6dsLfYqcFtB7qkqNMFX
rD4KmO6+UPFzjxbYSxond/gajh4FLfNExuwZJfK7FpWVKXBPRB9aP6R1tKEVnYhh
X6MXKjhTLWHYWD63BcNIeZebEavzrvhXiZ00KzKJHh5DwBXjd7uaitXVvHAApbOn
ThZBVdif7uO+EQU//CHvhZO0WT6OycXWog8cq/12uKFQWltBjYHZRmISMcrFyjwI
1Q3JOfvt4asCc1ISpA3uftImFiAf4j2hxBwgBjEWNLPEfxKhPD4AF6/cRI9QskJs
Lwv0dmVRlqN3GhCfu5HvWd5JG/oHRg==
=3ICV
-----END PGP SIGNATURE-----

--C2ElNylhWZPDuDeN--

