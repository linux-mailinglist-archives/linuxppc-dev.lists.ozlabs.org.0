Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64A776707A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 17:25:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+2cgoUp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCBKr6qs4z3cTd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 01:25:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+2cgoUp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCBJx3TVJz307y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 01:25:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3295562169;
	Fri, 28 Jul 2023 15:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3476CC433C7;
	Fri, 28 Jul 2023 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690557902;
	bh=xF0X+qCCgDU+aCVXnCNOAuCkm3qHaATyuGP2PvOLG9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+2cgoUp+iR8NzknvyxQ5SoIRUemstGpTeSNqztN3Z8xZbGvw6DTHKdRrjl5kPUYD
	 rRKjMhUz7bIm4bnxk7oTgc13T2hnvqI2cef3AaWJ9lh+hO0Sr19FRCo2JneIFq5QZ7
	 aY+9YKQN3iPZlvGuiOOa4j1YaUDsBs206K9GTR9KmT58U2xwAMwnQBqlK2jyQ25Jk+
	 GPal1r2/A+ue9m9LTeDQm/01wgtSIUp3LayAgIpdHaqxNuZQPDSJelxy8Bl2vNzI1P
	 aAT62Wc4lZSFza4mLhaecD1KvLl+EmIRx2SVqwwS73bLs9hb4eUjwiMid3YPfnsNVJ
	 wLzBv4Upyfncg==
Date: Fri, 28 Jul 2023 16:24:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH v2 4/7] media: v4l2: Add audio capture and output
 support
Message-ID: <f28f7fa5-b557-4575-9cf0-e5cfb8187bc1@sirena.org.uk>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <1690265540-25999-5-git-send-email-shengjiu.wang@nxp.com>
 <20230728075933.pdepqspznenazs5f@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n2yYRXOnFZknHRi3"
Content-Disposition: inline
In-Reply-To: <20230728075933.pdepqspznenazs5f@chromium.org>
X-Cookie: Ontogeny recapitulates phylogeny.
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, m.szyprowski@samsung.com, mchehab@kernel.org, shengjiu.wang@gmail.com, perex@perex.cz, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--n2yYRXOnFZknHRi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2023 at 07:59:33AM +0000, Tomasz Figa wrote:
> On Tue, Jul 25, 2023 at 02:12:17PM +0800, Shengjiu Wang wrote:

> > +	case VFL_TYPE_AUDIO:
> > +		name_base = "audio";

> I think it was mentioned before that "audio" could be confusing. Wasn't
> there actually some other kind of /dev/audio device long ago?

OSS used /dev/audio.

--n2yYRXOnFZknHRi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTD3cYACgkQJNaLcl1U
h9AyAAf/QDvn8GIQGSGSQC1iB0Evn5vRrpuFbeQwz9agsf2Q7hgTr3lRxGTIPRiN
l2YvkGHBzxVr+euWBjEZHcrlZczWEPpenxQByp7MvurwwQOFpUz+7DFM2CEPQYRe
HyTiJk7O1W6C/CVLUV74RqG0RmkWcIqJ3DySUZ1TbckRp/1mQb+v8UZeRfU7SkDz
rBJLMpNEzwcSXy4srbN/IB09tQltPa90V3YUMOUiqiP6K58ree66GvRp9la617UL
qdJQdzH5qY0W74CqxxQAKMVdkNIl7aXg9p55VQmsghM70IxpvJXHW9E9tU/FwbQh
iML5/Bu1FlifhcPBbQShVHsZn+Wp+Q==
=UVLV
-----END PGP SIGNATURE-----

--n2yYRXOnFZknHRi3--
