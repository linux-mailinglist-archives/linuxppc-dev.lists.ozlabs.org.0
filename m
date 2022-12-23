Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E10A654FC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 12:36:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdlWK109wz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 22:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fjasle.eu (client-ip=217.72.192.75; helo=mout.kundenserver.de; envelope-from=nicolas@fjasle.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 475 seconds by postgrey-1.36 at boromir; Fri, 23 Dec 2022 22:35:57 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdlVj1SPcz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 22:35:44 +1100 (AEDT)
Received: from leknes.fjasle.eu ([46.142.99.43]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MFslN-1p5gp12y1X-00HSLg; Fri, 23 Dec 2022 12:24:04 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by leknes.fjasle.eu (Postfix) with ESMTPS id CF3693C1BD;
	Fri, 23 Dec 2022 12:23:50 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
	id ADC623615; Fri, 23 Dec 2022 12:23:50 +0100 (CET)
Date: Fri, 23 Dec 2022 12:23:50 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 3/5] kbuild: do not print extra logs for V=2
Message-ID: <Y6WPxmUSHAOcFiXc@bergen.fjasle.eu>
References: <20221222162535.1578462-1-masahiroy@kernel.org>
 <20221222162535.1578462-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MOyNmKm5mYc+g3ky"
Content-Disposition: inline
In-Reply-To: <20221222162535.1578462-3-masahiroy@kernel.org>
Jabber-ID: nicolas@fjasle.eu
X-Operating-System: Debian GNU/Linux bookworm/sid
X-Provags-ID: V03:K1:Gt71Tj7jfrMEnuIBlN1aGujpmmp/GpuSdUh5qo5mNnf3e++ISDT
 AFT1CvhAB7vMd8Ig/nxGP9iMBXE073ttmIEJOIi8lc+KiCSG8bkCxAx3qRaeAJF5DdCqB2u
 vOcvTCKYT3m50DiFCBBUoONVkAzi12EBPMCrKvEpWg6XRyL5/Y21+Pev6joZPgRLMHTDLsX
 kVnnQBCDuR8CNBg+MtT3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BjL5cjn846s=;z83r6XXJHIhGA5kkz9tAzMdYLFC
 ktAn0Cr1u3AKwrNJBkvtoMC8iofKwmDBi12d57OZKJJ5rjKBFAVPvliYzzYNEW8CsIRStrU/m
 Ih8tk7r38e+DcncUAe8XHvWJ2erbB1zJpt2rbJZ18SvLbCxBqL07udoM5LDUyY0BkTcKEr9yY
 4X5rHyxrUQe59CO3DQzW+EBwQ6svy6xqvFezV8whCBoXPzO3xIJMWVKHRIknpge1GdUZd3zyW
 b16Ni48cotFR0w2TNnqy5xOdV1mrQ7LFQutiVVyZeuDlLXWgR9qvrudK0d+jpE03T+D60dnxy
 U2PYn7RcDqRnRahhQnJAbVuFjvAZ4LAtKiIFKXh8EhyWIObjCBcAL7p+xbrkQyaBs/OWCJNk5
 hhPzfZGi4wk3LrVewghlV/zEWKX8NQqInlJDXTbyLFomTz4JmvZwBJd5TcUiBu+UeQYfx2IOJ
 htgZYjtZ+HUMt7GdK4PqtjLUfSemLPEXryaglgALcJnbc8WEDKG4d9b54A8brVRmwf2LUaS5P
 sXFydKtjZjq8vYkvyLejoikqOjDfkBcKZcW1gntpD/2BtGbtDjQ7AB7BwqLCf/ZmonhfXOLLY
 +tNcyP3+zxAC6HeZAfZ3u7+3aqVS3SbVSPnOS5uNd6Hpd32xZf/1YWOLJmVSvRzCkVMYSRz4d
 HDafUDUaP4dl6DdMVKPafS2a6R8E71G8TyNX5IcS0LTff0Im89R9cGcubi2u1N5czWNsHyqah
 WUgfpH9DSqgdg4FwpGTU67l+Mt+jg2jmQ==
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
Cc: Zeng Heng <zengheng4@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Liam Howlett <liam.howlett@oracle.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--MOyNmKm5mYc+g3ky
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 23 Dec 2022 01:25:33 GMT, Masahiro Yamada wrote:
> Some scripts increase the verbose level when V=3D1, but others when
> not V=3D0.
>=20
> I think the former is correct because V=3D2 is not a log level but
> a switch to print the reason for rebuilding.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  Documentation/Makefile                 | 2 +-
>  arch/powerpc/kernel/prom_init_check.sh | 9 ++++-----
>  certs/extract-cert.c                   | 9 ++++++---
>  scripts/asn1_compiler.c                | 4 ++--
>  scripts/kernel-doc                     | 4 ++--
>  5 files changed, 15 insertions(+), 13 deletions(-)
>=20

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

--MOyNmKm5mYc+g3ky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmOlj8YACgkQB1IKcBYm
EmkVNw/8CL/ubhKUFMOA9zeW/scQHRiMh6alvKn8TaMvoJ+htOm/riO0zQ7fzTkZ
7JffTDASXN2SL0Pwll404qStccCWgdYRK1W39DJ4/7eRXdfWoiEVNuRb5L1R33CN
N7qCeW+odreG1nikMMQe2mpJDoib7bgWRTGvC5iB1yqxVX7kGVE8fCx2OFjgqqwG
dxQz4REyJl8Gjxe3WOPcZdsFtAwA2tczeTepngKiAZjciUMj6zBcIuooDzDUyTwN
86GDkLq4CEOmmbYb1ASeASyHsrYEQax2sgAZbgUcR6uGlrAzAeJpmb/uDETFOTbn
ixAay3fFdnzXRO9+o5JvCHFH1crlCgnpgNtimTiknxNyHq1WRjZ/4vsAF59IRT8W
bcY3xokEhNMRpCselInHWeR7ZWaIOQv8+FC24fmqznyGeqeGrkW+NZ94QyNpuR7O
gx1NG6jBrXBLP/QJz9vrLF/P4oAGpGN+hAqYvAnwn8FLHwFCNdCoyzuQU36t9EOp
mMcFbY6o/eFEU7d9TYMrj236YCSeYDBMNQAb0il4Ow/JGubX5SoC565WBm/zJxao
4xm0uve1jNz9i5CGsTljRbSPNLthHdoATqfGNvVjN4uVsE1FEcTXqH3ynQcFzFO5
TBETLnZQM3HlHrpHS/ONO0dVyHcCdOVtsckOh4VwtD6AKtCHcTs=
=iH0k
-----END PGP SIGNATURE-----

--MOyNmKm5mYc+g3ky--
