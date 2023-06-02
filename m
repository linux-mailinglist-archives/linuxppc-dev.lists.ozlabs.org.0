Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C83871FB49
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 09:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXZkN260Bz3fbf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 17:43:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXZjq6ScDz3c75
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 17:43:08 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4zQc-0007gF-PU; Fri, 02 Jun 2023 09:42:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4zQR-004XFY-Rv; Fri, 02 Jun 2023 09:42:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4zQR-00AOmZ-8f; Fri, 02 Jun 2023 09:42:19 +0200
Date: Fri, 2 Jun 2023 09:42:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Subject: Re: [tty:tty-testing 19/19] legacy_serial.c:undefined reference to
 `fsl8250_handle_irq'
Message-ID: <20230602074219.srlgpaaypewd2q5s@pengutronix.de>
References: <202306021041.qbRZZenE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ve3roce4gpxozldk"
Content-Disposition: inline
In-Reply-To: <202306021041.qbRZZenE-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-kbuild-all@lists.linux.dev, Paul Gortmaker <paul.gortmaker@windriver.com>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ve3roce4gpxozldk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 02, 2023 at 10:27:52AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tt=
y-testing
> head:   3a3d09a9ee0ef5b417d6bdf8486a4da2bef06dc3
> commit: 3a3d09a9ee0ef5b417d6bdf8486a4da2bef06dc3 [19/19] serial: 8250: Ap=
ply FSL workarounds also without SERIAL_8250_CONSOLE
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/202=
30602/202306021041.qbRZZenE-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/=
commit/?id=3D3a3d09a9ee0ef5b417d6bdf8486a4da2bef06dc3
>         git remote add tty https://git.kernel.org/pub/scm/linux/kernel/gi=
t/gregkh/tty.git
>         git fetch --no-tags tty tty-testing
>         git checkout 3a3d09a9ee0ef5b417d6bdf8486a4da2bef06dc3

For the new readers, this is about

	https://lore.kernel.org/r/20230531083230.2702181-1-u.kleine-koenig@pengutr=
onix.de

Greg already dropped it from his tty-testing tree. Thanks and sorry for
this second breakage. :-\

>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306021041.qbRZZenE-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    powerpc-linux-ld: arch/powerpc/kernel/legacy_serial.o: in function `se=
rial_dev_init':
> >> legacy_serial.c:(.init.text+0x46a): undefined reference to `fsl8250_ha=
ndle_irq'
> >> powerpc-linux-ld: legacy_serial.c:(.init.text+0x472): undefined refere=
nce to `fsl8250_handle_irq'

Urgs, this is ugly. Arch code uses a function from the 8250 driver
introduced in commit 9deaa53ac7fa ("serial: add irq handler for
Freescale 16550 errata.").

So the problematic case is SERIAL_8250=3Dm which results in
fsl8250_handle_irq being in a module.

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/lega=
cy_serial.c
index c9ad12461d44..ad9f15902abb 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -510,8 +510,12 @@ static void __init fixup_port_irq(int index,
=20
 #ifdef CONFIG_SERIAL_8250_FSL
 	if (of_device_is_compatible(np, "fsl,ns16550")) {
-		port->handle_irq =3D fsl8250_handle_irq;
-		port->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
+		if (IS_REACHABLE(CONFIG_SERIAL_8250)) {
+			port->handle_irq =3D fsl8250_handle_irq;
+			port->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
+		} else {
+			pr_warn("Not activating fsl workarounds for 8250 port %d\n", index);
+		}
 	}
 #endif
 }

would work. The warning would trigger in cases where before the port
just silently used the default irq handler and so the FSL bug isn't
workarounded[1]. If the warning isn't wanted, it could be simplified to:

#if IS_REACHABLE(CONFIG_SERIAL_8250)
	if (of_device_is_compatible(np, "fsl,ns16550")) {
		...
	}
#endif

But I wonder if in the presence of

        if (IS_ENABLED(CONFIG_SERIAL_8250_FSL) &&
            (of_device_is_compatible(np, "fsl,ns16550") ||
             of_device_is_compatible(np, "fsl,16550-FIFO64"))) {
                port->handle_irq =3D fsl8250_handle_irq;
                port->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
        }

in of_platform_serial_setup() the code in
arch/powerpc/kernel/legacy_serial.c can just be dropped instead?!

Best regards
Uwe

[1] Of course this won't happen because the help text of SERIAL_8250
clearly indicates that =3Dm isn't a safe choice in the presence of
"non-standard serial ports". So the issue is purly theoretic.

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ve3roce4gpxozldk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR5nVoACgkQj4D7WH0S
/k45Owf/RQIZ/tkvEslJTH7fcdK9qycxel/CpGP0wKndii5ft99uuONt4CoX3vVc
gekWe0d4PQmTPNLmomQ0H6QiHYtI3q/+w+LqsxRubu3woNEQ2zRv5pvBMA5itBam
K0rWT+8VZ+HcEpR/ZWB9utA1+d6J7fcFcISFcrDDIQDDGsxAiWAhFf6u19deg1w1
mcUp/NorCRpNwl9ylq/1uyQ3XXeVQ1j8tgDReWvfTS6dVGaYUz9KKFgQpVFV39i3
f3BbY03AkWojwI/NfHjsnqzr/pwLOzBJiTcMDdqukpp2DR6hcyuJ7DHbsHOELJkw
YB/4rUr7yMxKmahchJYwjLLZYVw3bA==
=OxiR
-----END PGP SIGNATURE-----

--ve3roce4gpxozldk--
