Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA28A45FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 00:43:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ooE7y/Qj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHlhh30Hhz3vY8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 08:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ooE7y/Qj;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHlgr2m7Nz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 08:43:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1713134583;
	bh=4YxIT04d5iT4t/9CWLf2dJs39GSU2JGwBCGJMwje3e4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ooE7y/QjtRNgxNbD/iBXfW+vLDiRSXCPipXLjAPSVBegCGtlgGWZiackaWHNluCyN
	 5pU/pPht+GdlCVH7KenaDnUCSi76PMEKI8aZZE8n/2H2ge/wdXDEyNqNW3qJw17axm
	 InHjB1XcIctesdyRBXNz4dcMJOI38JH9v0niQ+CbHZ676+tnh2VVRE3/Xbp4NE2xAh
	 J5oYOFjdK5ffaKKQUcRrKJp4V6mjuq+p2ok1cG35PquEzalCDnOREc+hlQxDdjRvho
	 jEuuOnL8CEEPNcpWKqAyZa2z4QjCLcZqZqMGlzBxjZaPB9Y5/Ykw7eucwjdX0shbJ0
	 MlMR8xtLzoDag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VHlgb16rBz4wcR;
	Mon, 15 Apr 2024 08:42:51 +1000 (AEST)
Date: Mon, 15 Apr 2024 08:42:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default
 for SPECULATION_MITIGATIONS=n
Message-ID: <20240415084250.7b00ea63@canb.auug.org.au>
In-Reply-To: <87bk6dd2l4.fsf@mail.lhotse>
References: <20240409175108.1512861-1-seanjc@google.com>
	<20240409175108.1512861-2-seanjc@google.com>
	<20240413115324.53303a68@canb.auug.org.au>
	<87edb9d33r.fsf@mail.lhotse>
	<87bk6dd2l4.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hV./THoU9xeCGcZYyAV1HiA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/hV./THoU9xeCGcZYyAV1HiA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 13 Apr 2024 19:38:47 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Stephen Rothwell <sfr@canb.auug.org.au> writes: =20
> ...
> >> On Tue,  9 Apr 2024 10:51:05 -0700 Sean Christopherson <seanjc@google.=
com> wrote: =20
> ...
> >>> diff --git a/kernel/cpu.c b/kernel/cpu.c
> >>> index 8f6affd051f7..07ad53b7f119 100644
> >>> --- a/kernel/cpu.c
> >>> +++ b/kernel/cpu.c
> >>> @@ -3207,7 +3207,8 @@ enum cpu_mitigations {
> >>>  };
> >>> =20
> >>>  static enum cpu_mitigations cpu_mitigations __ro_after_init =3D
> >>> -	CPU_MITIGATIONS_AUTO;
> >>> +	IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AUTO :
> >>> +						     CPU_MITIGATIONS_OFF;
> >>> =20
> >>>  static int __init mitigations_parse_cmdline(char *arg)
> >>>  { =20
>=20
> I think a minimal workaround/fix would be:
>=20
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 2b8fd6bb7da0..290be2f9e909 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -191,6 +191,10 @@ config GENERIC_CPU_AUTOPROBE
>  config GENERIC_CPU_VULNERABILITIES
>         bool
>=20
> +config SPECULATION_MITIGATIONS
> +       def_bool y
> +       depends on !X86
> +
>  config SOC_BUS
>         bool
>         select GLOB

The original commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hV./THoU9xeCGcZYyAV1HiA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYcW+oACgkQAVBC80lX
0GzNlAf8CJkJCFVxONVRLci2DamLPZ4T4ZsMm4OWVge3NTf2ODxR5/6fodpWAuOx
Z4FTB9mMAJeazuf6SM1+K6bxNw3KKkfD9iexpu/bGgFgwJdZnObQp3NzxxGodpLp
sf9Fr8TjVXNjgXvmi0rCfLuBqZ3dfCxWSIWc1YgG1FgGdNu2XzEjYmllpmLqas2n
HG31in38tgVrVuwKMsIKX5Ma/qGGXFSTRWE0NETTzgCXJJQnXfm9VEEVrRzEHnl0
OGT6Y7IrdqT6XA9Lck1W6X97inzLj0GDGCdQjaqYsNwgjY39jQWNyU1mzi8BZQJk
CY2veoa0e7AKDZ7ZR/xMAebrEE7ahg==
=91NG
-----END PGP SIGNATURE-----

--Sig_/hV./THoU9xeCGcZYyAV1HiA--
