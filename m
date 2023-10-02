Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4057B5603
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 17:08:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=atF4iQwi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzkqs4L15z3cF4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 02:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=atF4iQwi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzkpw6thZz3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 02:08:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B74C3CE10E4;
	Mon,  2 Oct 2023 15:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED2AC433C7;
	Mon,  2 Oct 2023 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259284;
	bh=J+OwmH7fnLd3FjX0c5iBU4C0cZpYv0irsXmd/Nc8juo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atF4iQwivM2vmRHpHXqaQtNheefwRwC5MjGvX2c4mKcZwXwQvKGjY2e6hq8f8EVKj
	 0kStVfFoD8spZca0Kuo+IP28Cyj93OQ6KkOBjhTuBY0euutoi+jq2ZuwBhJ1Yye73X
	 SKAwqtIKHBgSW30WTST2zMd97Ix1lNTdBTqrUIv5rNMyLMo8Oszwlh3J5mePVyppfU
	 oT+gB8D+YpHaPxu+oEoJW/nTGLgR5Noi1z+Lflc0O1EO/zFSU4MKmAB5xP6p46hMh6
	 BO1V0QHJbtc3u91m60YTKhfJGBYbwP7ycVh25X3WDUb94drOOkHqa29unh+etrWD47
	 +8ktmKV608gCw==
Date: Mon, 2 Oct 2023 16:07:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v5 01/11] ASoC: fsl_asrc: define functions for memory
 to memory usage
Message-ID: <7af54654-d4d5-498e-bd53-78ad54e6d818@sirena.org.uk>
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
 <1695891619-32393-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KuYuv5Y+mxgMeyVy"
Content-Disposition: inline
In-Reply-To: <1695891619-32393-2-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Postage will be paid by addressee.
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--KuYuv5Y+mxgMeyVy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 05:00:09PM +0800, Shengjiu Wang wrote:

> m2m_start_part_one: first part of the start steps
> m2m_start_part_two: second part of the start steps
> m2m_stop_part_one: first part of stop steps
> m2m_stop_part_two: second part of stop steps, optional

The part_one/two naming isn't amazing here.  Looking at the rest of the
code it looks like this is a prepare/trigger type distinction where the
first part is configuring things prior to DMA setup and the second part
is actually starting the transfer.  Perhaps _config()/_start() instead?

--KuYuv5Y+mxgMeyVy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUa3MwACgkQJNaLcl1U
h9CpqAf+LBBYky8048zO16jau031dm9xveIOz9PkuENbvo2Uh2rQKQMPbnuhWDLH
h27vidoat8VGo5MFaqpCAKpJA+PReOLkzI4sk71WcW3RaNJ5MofIQO3E5ZIXanKo
ZqsjDFWImiT68/LPs/u7jjgl801Z3IgQ1ozVJgM0NyZr7w/mu603A8gnbenRNZyA
JLcybnLQ0CGi9P23UKjCLBJx4dZpvFgm6K31K175IcDnx+cOn5CBEyHe9nyhEI/S
iXFtO85ddjkuxyepQMqlED8ipo5sSZLgrHHGpTB13DmY08jDnFSQQH9czc/mLNty
KoKv69c+UgkKI6BSQ0hue4iiY/oIOg==
=Cq0X
-----END PGP SIGNATURE-----

--KuYuv5Y+mxgMeyVy--
