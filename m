Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 534EA6E6C0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 20:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1C681jYLz3fFM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 04:25:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQg2kFUF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQg2kFUF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1C5J4Kjdz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 04:25:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 923B162CC3;
	Tue, 18 Apr 2023 18:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E87C433D2;
	Tue, 18 Apr 2023 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681842306;
	bh=S/6EHOWuc1OCwzBu01MncxoGAJA8FJBP3KrCQHngqO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQg2kFUFfcu5bOhTS43y7mdyWRs7j5c0oxTqEEubBG1iBKoNlWYJhIqz4cOoeKYAP
	 eq95hFYDqApk1TUbjtTnvhSV+VM+U2lSZYDwG1IoyLK9lA8lA9oO17VSms8Us9H65U
	 7L+r2zx7OlrLjBuLsTM2Y+xoaBTglkU1oWVaiZVytBn0Vajrp3VxajOH+CAFN6lXf4
	 hvJ4Jl0zXscl5PZt2TBtrWPqTBzF8kkJpVLWjx1ZVWFH31eD4HrN42KXt8yxjq//Td
	 x7EpEGi/DesNWxv5oDbVasvOya7tpb1EWLH65FPVRiwNggMxAV+ru7Rh5hJAMWoPaP
	 FaWX1BnoiIRHg==
Date: Tue, 18 Apr 2023 19:25:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <57051c9d-aba4-4c47-bdaf-f7230dbab69a@sirena.org.uk>
References: <20230412112213.59365041@canb.auug.org.au>
 <20230413184725.GA3183133@dev-arch.thelio-3990X>
 <2d69ba0a-b12f-4bd1-83c5-d7c01ceec4e8@sirena.org.uk>
 <20230418182145.GA1392657@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KkoPfe6++y+jT109"
Content-Disposition: inline
In-Reply-To: <20230418182145.GA1392657@dev-arch.thelio-3990X>
X-Cookie: Just to have it is enough.
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--KkoPfe6++y+jT109
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 18, 2023 at 11:21:45AM -0700, Nathan Chancellor wrote:
> On Fri, Apr 14, 2023 at 05:55:10PM +0100, Mark Brown wrote:

> > Done.

> Thanks a lot, sorry for not saying it sooner! It looks like this
> regressed in next-20230417 and next-20230418 though.

Someone sent a mail saying they thought they'd fixed the DRM tree - is
that not the case?

--KkoPfe6++y+jT109
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ+4HsACgkQJNaLcl1U
h9Dolgf9E0lWvdvQD52i+syGYJf2isilo7NBP53wBNSydmOquDJx4/ptdtiLrWOW
BBQ95h285PWT0c+J/2ugnim1/1YTF0DUJcG7JfLYgj9vnGS5BZTtSDGcT3Mccqq5
UF8ljlkOnyJTr2l+XIZlS+9fQUOAJl6omg2RT22llIR2x6TUrYyp8Ua+me7coBwl
auVrJP5m3LANJgsggwZ2W4Iz8cRiBoEiuASuNmPjTHhxQ6j73j+qHOD7rTEAT+c1
WiL8arTNwJNNmq3z4axe+DWdTl0XW0OoHAjpk/bg29YGkGWXITOA0r6OwWcfpRTG
NTa0ZLF2WiCRxaNZK1SCknDkhAaPyQ==
=yab6
-----END PGP SIGNATURE-----

--KkoPfe6++y+jT109--
