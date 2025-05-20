Return-Path: <linuxppc-dev+bounces-8770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F4ABE531
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 22:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b26CG6P6lz2ygY;
	Wed, 21 May 2025 06:50:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747774250;
	cv=none; b=oKXq1TBS1i14oX8awQoS7D34/0L9hbJm4Bpdbr04YS4uhnC9n36ryyaNgchAgh3T1uxLS0lNGH0Wzc3m4XCPuTR1oYNjKl9moazwtiSaCR+q8YddTN4z9NhwO5dcbn3KquTL5nZ6mgzWWjIEfCP5zqVLkO5MHF3+pj5503T7QQ/+7jWpOn0JlPI8MU7QHHu4/PW9eKoN+RUMvWMG7Xxxy7qHFjk32NuVmhaqGQIe2aDAnC5ZpdtuHIlqIsV00AxrD7rdru2Rzg/tWc8PlvvhqiAlgdqflCjmvYl4E2a4CV3BHO0OIBakoj8X5sb9+WSaLkAuxOkHSEgcVILu8tK/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747774250; c=relaxed/relaxed;
	bh=6j/xQ/XDZ/5vwEelfWdXLSBU/lb9tzGJP7hwiRt5/ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt+HBs8GuYVZsB6haj1uKlkXKUH4DBH4E0JV9BFAQGN+rjyVhLf4FAOkI8JUUDT5v5Bo6vMOJx91pbOuuCWvrRmFD4pxJ9350gy13/DzVBcpOUIEeDW8L6k1XiyU6J+S9PbSNSpoLruOrEejS5lFiolEG4q3/T3UQSLq0ZuAmlVzOIK7XnZyyLBLKjX+eA9GR6YnlKsRZAuyhaGSRDTHaeG6uwyXP8IszmaQ0bECZ2pXfdNLrg5aP9drWffoIK2YyWNkyEOQVdgA4QWNM1wXfVwrIASZ3gK4AjZDxX8DvJW6gl/XOkllgUGsuGpzs/AN2YxVvOw8r9+8WdzRfXy1qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NFJa2xx+; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NFJa2xx+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b26CB1mzpz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 06:50:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6j/x
	Q/XDZ/5vwEelfWdXLSBU/lb9tzGJP7hwiRt5/ic=; b=NFJa2xx+LcX1VpOg/hNu
	qWyZoVtAkXbIi98iC6qH2/8R2H8b3Qfv0gutbNjmtHmsG+pz9pvBi6jQjhOqVE6F
	0T1QG+t0PoH6lc9myEQAeKU0ZF5v60uMQcpfKGC4ihFCcmxASp1rnA3VWxS9Wwzw
	tiUyzt9TCw9fQICxmvsEbbYcjxAA9I1ZC8B9xd1cxwEHaU5svar7mLwZ99QHYbdr
	+79O7y30stwO9M4V31HgQti0wL3DfAgERW4E3BoFvsNyuj+vOQh+HG3eWY14dvdV
	wJJXEBrYPcuM3CeqezAfB3yENFbYfgYQXOCJY6Q+LEqpgBhqJ+L58bNHokDUp+JB
	TA==
Received: (qmail 3015612 invoked from network); 20 May 2025 22:50:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2025 22:50:37 +0200
X-UD-Smtp-Session: l3s3148p1@AOeSZpc1xpZehhrK
Date: Tue, 20 May 2025 22:50:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/3] i2c: remove 'of_node' from i2c_board_info
Message-ID: <aCzrHZK_YN6dLxzO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
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
	protocol="application/pgp-signature"; boundary="+gdyaTKa0CKxLXgW"
Content-Disposition: inline
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--+gdyaTKa0CKxLXgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 01:13:11PM +0200, Wolfram Sang wrote:
> I promised Andy to support him in his cleanup efforts, and here is the
> outcome for tidying up i2c_board_info. It seems it was easier than
> anticipated. But my scanning scripts (awk, coccinelle) didn't find any
> more occurences and the build bots are happy, too. It really seems this
> is all that is left to do. No complaint, though.

Applied to for-next.


--+gdyaTKa0CKxLXgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgs6xkACgkQFA3kzBSg
KbYIcA/+Mwkwe+oxJeIG0cOfe2SNYP4uJEPz9J2/exPnSVguGXIF2+V2SfOFQjh8
zpjJnZxnKkS6Ja8lrrMvxWHpf6uExX2CtN6DA/O3Q2air0NTl4TezzzOGxMHgfZv
2aiVTjYANHnENTHQx29eWZx27WkKKqNMdVPm2K89JeUFpikEXPHJRsoUKiqYErGF
DgTuUorcj4wmsxZc7qE1HlzEnMpSguQeWQa+XT1TFZ2wazJRPveg330gVvBCT3q8
lTVkb9MkzBEEBVfbsVMHWn2wuuw/E1WeeOO7dkENGCMhHHjbjBBImRc6IKP82qtW
h60nxdw6BrcSHHhKwQvEQiQ83IZhDXzUeThLQ/gkog42S27uAAHVbt0Vc/fKmy6x
Ug7CvLupjzqDEqNYKZYHBzi1hckNgAR3Gz2wWs2Rf65dHFhcLPKmiMLzXGrkkiSq
gT+zp+JoLttG6RH4XtfFHZ7rmRMptO9r//JcUKFlp3in9lsyJyYqQqnJ4ziaUl6L
v/hhIfM4BPqAc4kljqmr9fggkEaHNw8LfBQVPC7KuYDEqsc8mrmekxFnFYJMSd+P
L3kyh3zdxnb0BMg33Vjyu+t4tXbqlqR6755ySE1tUbKRFWV0jI4GkMbB7b5eQwRw
Yqtbm1VKkit7akyPquHHk0gVl7It2n3KBmidaNSFf9v53K2cZ70=
=dOW6
-----END PGP SIGNATURE-----

--+gdyaTKa0CKxLXgW--

