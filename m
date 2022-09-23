Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E867B5E7BB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 15:23:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYtBs3s7Bz3cdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 23:23:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aZ0oqk6f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aZ0oqk6f;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYtBF5gWfz3c8B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 23:23:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1AAD6B82578;
	Fri, 23 Sep 2022 13:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6A6C433C1;
	Fri, 23 Sep 2022 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663939373;
	bh=RVX6YCnEgPI4npfeSwYsvQ8Gf/e9sgc8U0u0H6Y8QiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZ0oqk6fjDZQvffHK8g5EAGsHqnskW4tXF9+aITsnDzzQKltR1oHOBs/kdEaqs+Ti
	 2iLNY00l3AXoLayhZuA+kkQrfYcDcJhMUu5qPEc2QfUM8Vr+OEG2ykhfT42J2CDIgE
	 5BBY5PObg5NM+nMMGP6ei/FdLv/DyZFIH71yS/2JuBMn5hqWHzRytuG64L8EuC+eYI
	 DChRJGRBJRb70SNKclsp8T1GECIXvXR/+IfYq30vbV8eVDfV8Q+LszTxwD87rogkon
	 KZlZit6u6dKVrNb2tv9SolTakLYcpDKnrUpwsIag8BjhrI7iv781Y9THX7WrNTJz43
	 2IqVLep8/TShw==
Date: Fri, 23 Sep 2022 14:22:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl_audmix: make clock and output src
 write only"
Message-ID: <Yy2zKGJXmxq8kwQE@sirena.org.uk>
References: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+p2nOyHK3qW+kWsP"
Content-Disposition: inline
In-Reply-To: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Heisenberg may have been here.
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+p2nOyHK3qW+kWsP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 06, 2022 at 02:49:21PM +0800, Shengjiu Wang wrote:
> This reverts commit 944c517b8c838832a166f1c89afbf8724f4a6b49.

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

--+p2nOyHK3qW+kWsP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMtsycACgkQJNaLcl1U
h9AtDAgAhK+VTWFd0vLsZlcIJo6dWg8eYHQYOKvs5GtUAvSIbwvMar01Ec6xQGHi
QPtAKM+cc1+r4ZsBP0uLWMkK9B7SZk0wmkIU9yqdnvkxL/FSwrTYTZQSXYPKnXd9
iCYAux0/o++sZwgLMvUGdEWRWhK4WBKgpM8f9iwXUR8ZqHSp1LH5w2Xbo6QF3ulN
6NMnguzcSM9SLchdHv74X6DCJzHcSK9CaTrvBgx3YRYN3R8qA83YBKORCt73Jo/n
8tY9AHQnOBhotVM7TxWFptSMVx6iGP8z1EgaD4r5HV9PNg0R2iJBk38azCUD2fEg
xEEhbFgFxktNBWSgNlcJ12zvbSbPRw==
=ZIxE
-----END PGP SIGNATURE-----

--+p2nOyHK3qW+kWsP--
