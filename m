Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840EA33D496
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:09:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0DBq3cWGz3bc2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 00:09:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aKEMIhQC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aKEMIhQC; 
 dkim-atps=neutral
X-Greylist: delayed 524 seconds by postgrey-1.36 at boromir;
 Wed, 17 Mar 2021 00:08:45 AEDT
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0DBP2hvsz309c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 00:08:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F25F65054;
 Tue, 16 Mar 2021 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615899595;
 bh=qwBm7m6FV8Asv3SjFX/QnnnbKfOuU9r79opiM9sj9mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKEMIhQCaVn3lLwByE24nqImVHqNJUT+/8j9sbtM2chyG0jSLvPAZM8F4f8axyuJC
 jybxzpe172SfZXs7qpx2d8s4Qd5wugn26nfNH9T8evegc5LjBsgS2HufHzR6sTDVbG
 XE8PdCmwfF0CKowDN3d9zh5QtPEsWcllXIT3CrmHYj0QgSFwxguhxamKYdfrEhKFFt
 vDR7CBPirXnx8k3GpIkjLMNLO6/XIPxcQXLP0WO1rx+gJW9TtC8HNyXPboNaw2UziF
 4VETN9iyh3qPO+vDqK5V5c26AkvUZqHeW+EwMVuLTZ7pw5Q+9opRUb2vB2Dx5hS5N6
 UA0XsjjW8xtpw==
Date: Tue, 16 Mar 2021 12:58:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
Message-ID: <20210316125839.GA4309@sirena.org.uk>
References: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 05:27:06PM +0800, Shengjiu Wang wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
>=20
> SAI software reset is done in runtime resume,
> there is no need to do it in fsl_sai_dai_probe.

People can disable runtime PM in their configurations - do you not still
need a reset on probe in case there's no runtime PM?  It'd probably make
sense to factor the rest code out itno a function though.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQq34ACgkQJNaLcl1U
h9B1lQf0DcB6TePE9N4R6M55ENvpw+3OXeo/AocY7jVKhtvhyr3WBZe8nDwnwbMQ
m8jPvvIuRx2l6ozvCdpJkIWkjGLEdOG0q/+n7HGEV8EFPa20tQPSkWRt/3zPKaAD
oSJP/xemNE7Gt9DnZXM+kgI4NxgXXjbHGt06YUPy/h9SGjgpoaggkdI+zwGdWYJZ
BoJjaI5+cAnAXzp3RFnVmJGwIWER8vF/Mv4vIdbEz5lbamaVpG80yJEiyJOn8GmY
ZA5Wc/4wOBLOpdCCXklTQi7YU/nJpgCflBrsXtqT9WNUH1OIqYc4oqiMb9acw/G2
L23Zg+uzwL3ZBYsq5CyQU74jmCTa
=M0pT
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
