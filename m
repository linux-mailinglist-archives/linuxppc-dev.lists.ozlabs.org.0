Return-Path: <linuxppc-dev+bounces-7372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F9A74C53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 15:20:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPN3g1SZ7z2ygl;
	Sat, 29 Mar 2025 01:20:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743171647;
	cv=none; b=VRSy+ckoMNiuKuLFE8Ibj7P+sqHEE/wgqm79PWQHyP2GwWJeUuGKMfj+I0tOU5tJ8g2XWOtL1Ff3yceNvGUcJOGebjKgN4QaXkTJrr6Dm9piOQBxaeoX0tlm/xvGbGUy77vSMN8aPtYlIxGPMosSOwfW8YpADhWBaKx4h54jPNMvGEh9vRM+Bbr9zUz2oW2OzJvmbGrMxvac9oQRUpoJpaaDlha8bEMEI3gABx6suFWrBp6b9FZI3QTgfqPPD7cIM9U4WI9+bjx5EEh0Nded+aBJz+eJHel5CCuSC8s0CiW1ZAzRpVBfR29Q46kqICsDnf9ELTYwxZzAYezxoZeTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743171647; c=relaxed/relaxed;
	bh=qWDgEBlChICdLM0T5oU8HciDR1AnBMNWFm7dCMGjwLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMJEXZ0CJOsIGAFBL5PWvqs2+6EBf5dzNnwS08zdMN6ld2DKYdF81N3PO0fT6CmJgnUFLuksv8HZuo9JJAUQoJHcPk2qsq1ok7c/2ee+M+Pi5Bw2/Z+GdZoArnrrKQenebPLEizlRCOzXRy5Mj1i2GIQgexMkzrKJ7ol7PYSUXnhkuuc2r54eh8Do98fIIhSDXzprwPOonBwqy0+c+h++IYmfQPFHIy9ZinESBwC+KMjfEjwGQw/lkDnecYPUwKUUFdsr9veWlR6wY1qMnDSsu3fvUSw67E6j5f3eGmTyi3RK21CnoFY1MH32PN/LF9KabQAmLJAm6F98KGa1nNctg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IaOtsJF9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IaOtsJF9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPN3f073rz2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Mar 2025 01:20:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4050543803;
	Fri, 28 Mar 2025 14:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DECC4CEE4;
	Fri, 28 Mar 2025 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743171643;
	bh=52BY8RWxqGI39nW50Uzq7mTE1cOGjvlmsJ2EgrcA9Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaOtsJF9a/s3cBIUbR9Tqvn77dZbDpoeNbSKE+9o5W+xe5prQl6V2XimIGQqSPRYd
	 5VfjWfPhjXQLQfEz78hahUx8cEJL7qeI4fFnehitos4eSBhlzGDfRRklcoYjvM/zc3
	 wbOkObSERHHtODK1mOYAW8F2H76k54tegqVkAAw/dIGbiwRQ5/s/wDw9UA3HpXwpf8
	 0B2Nl82gf//PCjWjulAvtdo/KBcAQt6O9NX5qL98eSrWMUgTqOVgFni+sgSnln2Z/C
	 cQUX/fNo/MyENG5iKFB3pgZGXINNHdL08ZXVTjV4NCT5SQEjBauHzWcBKsahMmFGDS
	 lPH6H7hIUumIA==
Date: Fri, 28 Mar 2025 15:20:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Kees Cook <kees@kernel.org>, 
	Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
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
Message-ID: <20250328-visionary-archetypal-caiman-77dedc@houat>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <20250328.sah9oog5ahSh@digikod.net>
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
	protocol="application/pgp-signature"; boundary="paxtxmnckc7vplgu"
Content-Disposition: inline
In-Reply-To: <20250328.sah9oog5ahSh@digikod.net>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--paxtxmnckc7vplgu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
MIME-Version: 1.0

On Fri, Mar 28, 2025 at 11:38:23AM +0100, Micka=EBl Sala=FCn wrote:
> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Mar 13, 2025 at 10:17:49AM -0700, Kees Cook wrote:
> > > On Thu, Mar 13, 2025 at 11:43:15AM +0000, Alessandro Carminati wrote:
> > > > Some unit tests intentionally trigger warning backtraces by passing=
 bad
> > > > parameters to kernel API functions. Such unit tests typically check=
 the
> > > > return value from such calls, not the existence of the warning back=
trace.
> > >=20
> > > Thanks for picking this series back up! I honestly thought this had
> > > already landed. :)
> > >=20
> > > > With CONFIG_KUNIT enabled, image size increase with this series app=
lied is
> > > > approximately 1%. The image size increase (and with it the function=
ality
> > > > introduced by this series) can be avoided by disabling
> > > > CONFIG_KUNIT_SUPPRESS_BACKTRACE.
> > >=20
> > > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of=
 my
> > > very noisy tests much easier to deal with.
> >=20
> > And for the record, we're also affected by this in DRM and would very
> > much like to get it merged in one shape or another.
>=20
> Here is another case:
> https://lore.kernel.org/all/20250328.Ahc0thi6CaiJ@digikod.net/
>=20
> It would be very useful to have this feature merged.  Without it, we may
> need to remove useful tests.

AFAIK, it's been merged in next a couple of weeks ago, so it should be
in 6.15.

Maxime

--paxtxmnckc7vplgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+awOAAKCRDj7w1vZxhR
xbs6AP9BZSaotqaSUmBTtc4k3Uj9az+ck0f+76K8QNHFnxjslgD/XFEDSUboHQ6N
QI2urzu11I1VyDIFnSJoU7c57HPzZQ0=
=XSrM
-----END PGP SIGNATURE-----

--paxtxmnckc7vplgu--

