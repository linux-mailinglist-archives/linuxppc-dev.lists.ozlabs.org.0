Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96287C53B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 23:39:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GRtU3Red;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twj461Yk5z3vcy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 09:39:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GRtU3Red;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwVwF6Ffrz3dW3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 02:02:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED6C5614E2;
	Thu, 14 Mar 2024 15:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B709C433C7;
	Thu, 14 Mar 2024 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710428522;
	bh=M6nhtT/evAJaEm9Lfp2nSLULi/q0+AGWGYq3q98wPSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRtU3RedkF+6bGv6rzD962qdrdCPt5XDgiXEplTNKVxkNx+BIuJnWhNCE1d7fglx6
	 mD3/UhHdcLJkAegeGIp8aMtrgg1f0b/y3UcqWwJZgrDfVLPpuqICk/x/OHh10mfWf9
	 9YsckKa2LEMMFO1+nFohOEHh+n7JxokMvrZ7AY1lPZ93C5+da+53H8uiN9lkIsn/mG
	 PbIjyh8D25M/ryqLm3+qk7RRQZ75o0LR1Q14YeW1VbwFKaB6HUyEob0DHjjeglxh26
	 cOsiuXf/CpzhFvKk1cwkdBdstXFvCjaK7r6v+TsM8RvqXnl/V2kmn1OvsPAOnwiReg
	 I0c47dK/Lzi0A==
Date: Thu, 14 Mar 2024 16:02:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Message-ID: <20240314-victorious-chupacabra-of-management-baa5c4@houat>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
 <6d9269c0-bd38-4965-a454-4358e0a182e3@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nbx7v4z25kdu2nok"
Content-Disposition: inline
In-Reply-To: <6d9269c0-bd38-4965-a454-4358e0a182e3@roeck-us.net>
X-Mailman-Approved-At: Fri, 15 Mar 2024 09:37:24 +1100
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzim
 mermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--nbx7v4z25kdu2nok
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 07:37:13AM -0700, Guenter Roeck wrote:
> On 3/14/24 06:36, Geert Uytterhoeven wrote:
> > Hi G=C3=BCnter,
> >=20
> > On Tue, Mar 12, 2024 at 6:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> > > Some unit tests intentionally trigger warning backtraces by passing b=
ad
> > > parameters to kernel API functions. Such unit tests typically check t=
he
> > > return value from such calls, not the existence of the warning backtr=
ace.
> > >=20
> > > Such intentionally generated warning backtraces are neither desirable
> > > nor useful for a number of reasons.
> > > - They can result in overlooked real problems.
> > > - A warning that suddenly starts to show up in unit tests needs to be
> > >    investigated and has to be marked to be ignored, for example by
> > >    adjusting filter scripts. Such filters are ad-hoc because there is
> > >    no real standard format for warnings. On top of that, such filter
> > >    scripts would require constant maintenance.
> > >=20
> > > One option to address problem would be to add messages such as "expec=
ted
> > > warning backtraces start / end here" to the kernel log.  However, that
> > > would again require filter scripts, it might result in missing real
> > > problematic warning backtraces triggered while the test is running, a=
nd
> > > the irrelevant backtrace(s) would still clog the kernel log.
> > >=20
> > > Solve the problem by providing a means to identify and suppress speci=
fic
> > > warning backtraces while executing test code. Support suppressing mul=
tiple
> > > backtraces while at the same time limiting changes to generic code to=
 the
> > > absolute minimum. Architecture specific changes are kept at minimum by
> > > retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> > > CONFIG_KUNIT are enabled.
> > >=20
> > > The first patch of the series introduces the necessary infrastructure.
> > > The second patch introduces support for counting suppressed backtrace=
s.
> > > This capability is used in patch three to implement unit tests.
> > > Patch four documents the new API.
> > > The next two patches add support for suppressing backtraces in drm_re=
ct
> > > and dev_addr_lists unit tests. These patches are intended to serve as
> > > examples for the use of the functionality introduced with this series.
> > > The remaining patches implement the necessary changes for all
> > > architectures with GENERIC_BUG support.
> >=20
> > Thanks for your series!
> >=20
> > I gave it a try on m68k, just running backtrace-suppression-test,
> > and that seems to work fine.
> >=20
> > > Design note:
> > >    Function pointers are only added to the __bug_table section if both
> > >    CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
> > >    size increases if CONFIG_KUNIT=3Dn. There would be some benefits to
> > >    adding those pointers all the time (reduced complexity, ability to
> > >    display function names in BUG/WARNING messages). That change, if
> > >    desired, can be made later.
> >=20
> > Unfortunately this also increases kernel size in the CONFIG_KUNIT=3Dm
> > case (ca. 80 KiB for atari_defconfig), making it less attractive to have
> > kunit and all tests enabled as modules in my standard kernel.
> >=20
>=20
> Good point. Indeed, it does. I wanted to avoid adding a configuration opt=
ion,
> but maybe I should add it after all. How about something like this ?
>=20
> +config KUNIT_SUPPRESS_BACKTRACE
> +       bool "KUnit - Enable backtrace suppression"
> +       default y
> +       help
> +         Enable backtrace suppression for KUnit. If enabled, backtraces
> +         generated intentionally by KUnit tests can be suppressed. Disab=
le
> +         to reduce kernel image size if image size is more important than
> +         suppression of backtraces generated by KUnit tests.
> +

How are tests using that API supposed to handle it then?

Select the config option or put an ifdef?

If the former, we end up in the same situation than without the symbol.
If the latter, we end up in a similar situation than disabling KUNIT
entirely, with some tests not being run which is just terrible.

Maxime

--nbx7v4z25kdu2nok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfMRZwAKCRDj7w1vZxhR
xZe7AQCF0lwXl8k+ok+x1wLmfAsWf12MJtiFkJfF2M8fieBWywEA7IBXKWN1hKUp
6rSvzAgaLFB/0eisZYO9FXDq5sROGw0=
=qLwX
-----END PGP SIGNATURE-----

--nbx7v4z25kdu2nok--
