Return-Path: <linuxppc-dev+bounces-16778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACgJLnZDi2mfRwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 15:40:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D509411BFDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 15:40:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9PPb1xhbz2xQ1;
	Wed, 11 Feb 2026 01:40:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770734451;
	cv=none; b=LFmPc1SNol3xYw26Xqt4cOYFQJcrU1gaXSwc5W2U4/uJg1LCzD7J2qCLszh1WPiEsw7uECmpmJKe4NPVfPWcQ93JJGxriR5G+MgkrwqV/0N0c8Bs+AJgRdvoIk0AqdoVNTQC8yZLPYrLC/EbFlfPgqDKUpZh+qDimYo4CsArCvyviblxMe9dhSzn/+2lSIq00v3ZIql/OtS04iInUGr4e25IIQZr2pqCxOORiBjgt4oGuHwPt+KvR/uiNWGoKBY8q/wEOSCJt2sQxunrwIqtkUe+8XFTyLhSrQdbR6uOwzSPziiFIxejkHjxF112jO2Gbl1G7ai6IO5ma2VdKJhdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770734451; c=relaxed/relaxed;
	bh=jTCU+bOGKWZs/m0zlw0GMf4W0aa1RKds0gWzBn7yWI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZg8ibeABGJ1khmycqdlwjop66klnPNRNAtHom3kSXJAl73erS2ZDtJT6gYgZrCcmtfv7/zlqR+puerbrQkH2ciW1BogPhut3mF2Bv+4XFEvRd3YWbgGTabT7OStu0FZEz1RsGuPCY/hu7lcoLxqhlt1K9XNDPYyWtdxAti7yjWl0B8LsPC52IOYoFCCBqr/tgDrI+Dgk7NClah7HrqgVxPT05abQYAIEJaPPJox5aD+DX5sOfMWFfX2hTOoHn23Cda5hRKl0Hq4FbiiW2/xN0IENswPDxQSzqrw+EgkjwnYOPEYj0F91xBqxY6M+DcTvTkL4oTj4wEAgT8c4uyKdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JESPI7yt; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JESPI7yt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9PPZ4Z4Lz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 01:40:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F4F540729;
	Tue, 10 Feb 2026 14:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1850CC116C6;
	Tue, 10 Feb 2026 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770734447;
	bh=jTCU+bOGKWZs/m0zlw0GMf4W0aa1RKds0gWzBn7yWI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JESPI7ytWwfUvL7WCXgZ7O7OxvIMAs6O052e1hep6h9XLwCOYVh/3UAumqJQ4EfJi
	 TU3FhrwfiaCc+1lV5RwOh+zjBdlnNYHtcM0IDYusd40M8QTbVg3oqqncX1yDP81hOW
	 ELg5KYNzDuM3egZHsCId3J23nauG76RXiaXQwIKtUdVpZ5boUSZZxTR2KZ2vsgN/++
	 RvvL9XyQHBKkkrIsh6v2Q6WpNjtM8TR2mKAh0IyrGX37U/ynuerZg+E5vTqBzrMIQd
	 lnR1mYxk1c/EjKUM+9YySVCt9okLcJrrheAedXwLRiDZ6SrHDPeVanebSkosnQCogJ
	 3dct+0bpuHwIw==
Date: Tue, 10 Feb 2026 14:40:42 +0000
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
Subject: Re: [PATCH] Revert "ASoC: fsl_xcvr: fix missing lock in
 fsl_xcvr_mode_put()"
Message-ID: <937c2123-e384-4046-a1a8-390714b905e5@sirena.org.uk>
References: <20260210143809.297565-1-n7l8m4@u.northwestern.edu>
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
	protocol="application/pgp-signature"; boundary="QaCcNFHudlm6l9fn"
Content-Disposition: inline
In-Reply-To: <20260210143809.297565-1-n7l8m4@u.northwestern.edu>
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16778-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:n7l8m4@u.northwestern.edu,m:alexander.stein@ew.tq-group.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ew.tq-group.com,gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D509411BFDE
X-Rspamd-Action: no action


--QaCcNFHudlm6l9fn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 10, 2026 at 02:38:09PM +0000, Ziyi Guo wrote:

> This reverts commit f514248727606b9087bc38a284ff686e0093abf1.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.


--QaCcNFHudlm6l9fn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLQ2kACgkQJNaLcl1U
h9C+qwgAgmU9wHudJYALXuwSpuwnLKK7LNQAx9GkbTJfzcGCq2OjpqHi+bu3eBsJ
EwEUEbBKYo6LbgtGYzwMVu1qBfTLhWYMUxHdyNXXxcc90hCBBuG3hIW7v8wohCf9
yElLgtGmTLt/DyoPZR+H7BQc77n/zt+/3jnCjpfKca/JYmlWhdFPyToJya19q5jD
1nGz3SrgAUanMaAiQQQJ2Jc0tlZyKKEgWVXnzJd+pnWDMdTV0AegS4E9/a4JJnFY
EkGrUM1MINtpoXkL6xF1ICHsoHSvWmdJmWfbG2P/ZfIS5M8enqdP2ilPHHUtQu4M
gFWP5l9KseHF19wgckGu8rHmDMENRw==
=l/Ry
-----END PGP SIGNATURE-----

--QaCcNFHudlm6l9fn--

