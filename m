Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 825B31F3D61
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:54:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hBSp01M0zDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 23:54:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=SgBCgfOg; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hBNN04DLzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 23:50:59 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B61520737;
 Tue,  9 Jun 2020 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591710656;
 bh=QLyGqEIUvJCZktBQO3E8b5CNoUk6xAoFrKqLtbqNglk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SgBCgfOg8D/M+dvQX5QNjeGmhKzkxrdjcDxhSSrj0Rjwea5+jRa4nCpF/cyiqPoFp
 SAG3+xF9PTbYhGHopwujbytcte2t2dYZlU11C8YOxHGzo8SoD8XYgQpP8f6MithbKO
 jUoT+p6ERnegqu65UE27VuvmLeA6tjTpMvi78y2s=
Date: Tue, 9 Jun 2020 14:50:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH] ASoC: fsl_asrc_dma: Fix warning "Cannot create DMA
 dma:tx symlink"
Message-ID: <20200609135054.GJ4583@sirena.org.uk>
References: <83e1682e88baf127d25e3470011bd034cfc32032.1591598561.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ELVYuRnMxQ5nnKRy"
Content-Disposition: inline
In-Reply-To: <83e1682e88baf127d25e3470011bd034cfc32032.1591598561.git.shengjiu.wang@nxp.com>
X-Cookie: Be careful!  Is it classified?
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
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, tiwai@suse.com,
 nicoleotsuka@gmail.com, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ELVYuRnMxQ5nnKRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 03:07:00PM +0800, Shengjiu Wang wrote:
> The issue log is:
>=20
> [   48.021506] CPU: 0 PID: 664 Comm: aplay Not tainted 5.7.0-rc1-13120-g1=
2b434cbbea0 #343
> [   48.031063] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   48.037638] [<c0110dd8>] (unwind_backtrace) from [<c010b8ec>] (show_st=
ack+0x10/0x14)
> [   48.045413] [<c010b8ec>] (show_stack) from [<c0557fc0>] (dump_stack+0x=
e4/0x118)

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

> ---
>  include/sound/dmaengine_pcm.h         | 11 ++++++
>  include/sound/soc.h                   |  2 ++
>  sound/soc/fsl/fsl_asrc_common.h       |  2 ++
>  sound/soc/fsl/fsl_asrc_dma.c          | 49 +++++++++++++++++++++------
>  sound/soc/soc-core.c                  |  3 +-
>  sound/soc/soc-generic-dmaengine-pcm.c | 12 -------
>  6 files changed, 55 insertions(+), 24 deletions(-)

Please split the core changes you are adding from the driver changes
that use them.

The change does look reasonable for the issue, it's not ideal but I'm
not sure it's avoidable with DPCM.

--ELVYuRnMxQ5nnKRy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fk70ACgkQJNaLcl1U
h9BOngf/aLSe603sBhY25UjUBm5u7bXy02u1WBCRODt4C2xhzRdn/ONB0kSnJZWH
sMhms0bZYQD3+F08frWKdLRZzzfTqjTCJYIUnI53dNTGflHB3eVyLSOwhL4VgRwd
kwjHJACGkDrwncomu6q5hoFNIBnnnz0Ng8hs17CnUmelNFbGyz7oUzLRNYboJy/8
6S5lJ8xXcCVzQshXwALtw1ap0i42G+lagJpgnslaguun5p2/f700o422CQiteofT
Wn6GMhF125HPe/MpKSheTO234UQ3xuPlrE/ZHEiu0cDH5UFWnFeIBeRmkqfSpKsz
jdUXsC+t9AipuS2loQv/KSDyrZG4MQ==
=rIq/
-----END PGP SIGNATURE-----

--ELVYuRnMxQ5nnKRy--
