Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E76E50B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 21:16:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0cHS1BD2z3f96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 05:16:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P71Uwm3O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P71Uwm3O;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0cGV2lFXz3cDF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 05:16:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5852D62115;
	Mon, 17 Apr 2023 19:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75103C433D2;
	Mon, 17 Apr 2023 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681758957;
	bh=3pjer+RGMILMz18g1Tf5vlj2E6yHnERNJKjfP9RlMZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P71Uwm3OV9bNItKXU+tAYmFshPVvY4lQzMfChiVKoKQbqxnxcEbNn6amFMSanMuaL
	 HGgGWtX0E2oEKL1POmtRWv0crAZDTtyk3OtHm9LPwSL3I3PIx1kCqU9LstG0t22PSC
	 zp0eFMcUz0c6vAWXenaBoOLcR6ig5XGTetQtvDLGRpH/0g2tmQdbb/xWCrUUy5khCT
	 3z4okM/GsAc1JEHVYLeFVhfpR62k1tz2GbLjLOT4KEIOsdaE2Nuv/rD9/kdm6M77tx
	 jlg0JZjAYKt5bLmZMdgGwN7yMSwCV9Bzvh+c16WueNqQZRbS2wEjdGtAHQBh1XT1C4
	 fk7gnZ3f+5GhQ==
Date: Mon, 17 Apr 2023 20:15:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Liliang Ye <yll@hust.edu.cn>
Subject: Re: [PATCH 2/2] ASoC: fsl_mqs: call pm_runtime_disable() on error
 path
Message-ID: <591e902d-afb9-4b2b-baa0-910b6d74e4e7@sirena.org.uk>
References: <20230403152737.17671-1-yll@hust.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9F6xcT18d9sN4CTo"
Content-Disposition: inline
In-Reply-To: <20230403152737.17671-1-yll@hust.edu.cn>
X-Cookie: I'm having an emotional outburst!!
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
Cc: hust-os-kernel-patches@googlegroups.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Dan Carpenter <error27@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9F6xcT18d9sN4CTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 11:27:37PM +0800, Liliang Ye wrote:
> pm_runtime_disable was missed in cleanup operation, which corresponds to
> the earlier call to pm_runtime_enable.

This doesn't apply against current code, please check and resend.

--9F6xcT18d9sN4CTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ9muYACgkQJNaLcl1U
h9BMUAf+PnW18wz6sGANQlExJIeon2TwYOrrp9RHa2hkx65i/UJjI36L50t3jcg9
vZngy/COz43Es/GqsNfNBntqHgL66yH332vDc/17NXKRpf0jYb7oR6UO5D7WQPCt
cb/+PO4zE7sPIwDuOlemNGL8iqnV9ya6oXDPYJfmU0njYGJVClEkw9Th8iqu7dOA
dUOmGg6/Bdop+lAzX3S0W3EcocCHqHAJT3fXXcbttqLeP01KC4DOCnik29oBmMAp
t6lHdlgrDglj/HCq1u7LsZmoQG8GEtg1mdo43qNx3m1glwm3XehOmSZNh7G55qL6
BiL4K4amqeutEfx/23OAKiY3T2tuoA==
=Hr0m
-----END PGP SIGNATURE-----

--9F6xcT18d9sN4CTo--
