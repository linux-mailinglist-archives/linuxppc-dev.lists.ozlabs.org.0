Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E247338168B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 09:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhxd43XsMz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 17:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ucw.cz
 (client-ip=46.255.230.98; helo=jabberwock.ucw.cz; envelope-from=pavel@ucw.cz;
 receiver=<UNKNOWN>)
X-Greylist: delayed 354 seconds by postgrey-1.36 at boromir;
 Sat, 15 May 2021 17:20:13 AEST
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhxcY51fKz2yYY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 17:20:13 +1000 (AEST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 6324B1C0B80; Sat, 15 May 2021 09:14:11 +0200 (CEST)
Date: Sat, 15 May 2021 09:14:10 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210515071410.GA27201@amd>
References: <20210501151538.145449-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-05-02 00:15:38, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=3Darm64 requiring
> GCC 5.1.

Please don't. I'm still on 4.9 on machine I can't easily update,

>  Documentation/process/changes.rst | 2 +-
>  arch/arm64/Kconfig                | 2 +-
>  arch/powerpc/Kconfig              | 2 +-
>  arch/riscv/Kconfig                | 2 +-
>  include/linux/compiler-gcc.h      | 6 +-----
>  lib/Kconfig.debug                 | 2 +-
>  scripts/min-tool-version.sh       | 8 +-------
>  7 files changed, 7 insertions(+), 17 deletions(-)

and 10 lines of cleanups is really not worth that.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCfdMIACgkQMOfwapXb+vJRuQCgkvFNWySx/cRHndnAzB2BNEcE
fUgAoLeFGahKOr8VmTLEps0tT667xra4
=bRN/
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
