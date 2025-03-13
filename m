Return-Path: <linuxppc-dev+bounces-6984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF06BA5FDAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 18:24:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDDrc2Xltz3cBT;
	Fri, 14 Mar 2025 04:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741886672;
	cv=none; b=MdK2IjUTXnN6ePMr6tNZyO71nP1YERj9GYyPlrZc/YxUDxZr4d/fPtc99yPccZzJ+1bTva4p3hP6VbUpxyWROCWr0xyGqokSe4AYOINIjJadN2MOJBHEJT+gGYBYg9Ykn5x8ZQXxCzx++p5v10ZzkbHceE0BmUrJX5pgSox6Kp44fdZtfzPaJPa6L0epKlCB4NPDU/yyLVCUToUfZcsTCWlCPpjLkOxuSCaHCqUGCKXn8WdANqJjTp/De8CAvYTZP5lYZTB72BZV1EM0APllUc89bwZbM++nGxvC01Dd+w6aSIvD/U2fauvDhIjJo7k9CUTxTusHxiRLbNRyje5wTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741886672; c=relaxed/relaxed;
	bh=9/zmAAvs9NnopuZELdGFf5m30SQkrIgaibjOTSU2/4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBMMlqlfz29faiWR7KOKcYMKrE6gLTQ3IBuZ1bdIJlD4ECfKtdAgE0xpu0veWlCZi+qqX1oTR+BHcgcsvY7a+A7wkGii8VSLkjdxUwgucxWwoi5KfcKWL3UkiPrmixZOYbud+7NINVt3msmi0oJ8Cp63GcRBmLAVvHjKKhZurXUE76jnFtLX6ZEOYngHvVJx5BLdX0pw6rr6Db9beYA/TweT8X4ATRjzcXwNbWZezWAh1hQIzu9dRYjO15/TbtaGOQZE3DRLVNzlGPJ7ngs+0cDy/HFxJCH6GnliOvvPrvIWO8WYeb0oKRxUn9IyuIrKPOzB0Qj6fNVbRVzvOjYAQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LvyGRkVE; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LvyGRkVE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDDrb2khlz3c98
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 04:24:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DE4FA4570D;
	Thu, 13 Mar 2025 17:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C81C4CEDD;
	Thu, 13 Mar 2025 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886668;
	bh=9/zmAAvs9NnopuZELdGFf5m30SQkrIgaibjOTSU2/4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvyGRkVE67SzBgb1QxytGP4oCaiDm1tJxrYa6S762f1uCVELy9kUizXLZYLA53dFI
	 LKB6AnaccFkz/obvqyj95f4NBc0qIbgjsCSr6injy9nOKRnZ631Nz5jY6vtJhqfK9W
	 lfOaWqXafcfENzy2fADO6wmw4xv83Pcbrnp64dabwgF4V67YDxdHN3robsRH2ge3my
	 yyXxef+KA/0d2CifdqcRiTFlknqGJdXOg+TWR6xgA6Yw9w3MkQfmaKGP78AmYUgaDq
	 AxdUBErN29IHX2+C/CRP8J164+HWq5+oXjim9xRBBRx3EWs4UmnF9OTuMnKZeD2CHi
	 43mLTvGtWzx2g==
Date: Thu, 13 Mar 2025 18:24:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Alessandro Carminati <acarmina@redhat.com>, 
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Guenter Roeck <linux@roeck-us.net>, Alessandro Carminati <alessandro.carminati@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <20250313-abiding-vivid-robin-159dfa@houat>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="te6o3coodwf7546n"
Content-Disposition: inline
In-Reply-To: <202503131016.5DCEAEC945@keescook>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--te6o3coodwf7546n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
MIME-Version: 1.0

Hi,

On Thu, Mar 13, 2025 at 10:17:49AM -0700, Kees Cook wrote:
> On Thu, Mar 13, 2025 at 11:43:15AM +0000, Alessandro Carminati wrote:
> > Some unit tests intentionally trigger warning backtraces by passing bad
> > parameters to kernel API functions. Such unit tests typically check the
> > return value from such calls, not the existence of the warning backtrac=
e.
>=20
> Thanks for picking this series back up! I honestly thought this had
> already landed. :)
>=20
> > With CONFIG_KUNIT enabled, image size increase with this series applied=
 is
> > approximately 1%. The image size increase (and with it the functionality
> > introduced by this series) can be avoided by disabling
> > CONFIG_KUNIT_SUPPRESS_BACKTRACE.
>=20
> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> very noisy tests much easier to deal with.

And for the record, we're also affected by this in DRM and would very
much like to get it merged in one shape or another.

Maxime

--te6o3coodwf7546n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9MUyAAKCRDj7w1vZxhR
xdXjAQCCwQNRXUI4bvpTeTrsH0SDbsLYjlm1aQi9V/DpasrOoQD/cFET4LceVGmh
WT9gLea6FEbCN1GQ2T9KOoLGuMrzTAw=
=uGit
-----END PGP SIGNATURE-----

--te6o3coodwf7546n--

