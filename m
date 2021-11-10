Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A6644C024
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 12:32:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq2kv4xQPz2yP9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:32:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=hn9ucD8/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=hn9ucD8/; 
 dkim-atps=neutral
X-Greylist: delayed 396 seconds by postgrey-1.36 at boromir;
 Wed, 10 Nov 2021 21:52:57 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq1sP5Xbvz2xgb;
 Wed, 10 Nov 2021 21:52:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636541561;
 bh=h45DiQjGY0Dfm8CE9cn4qF+342ykeQ4Uk5C/gkooaIw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=hn9ucD8/6yj3DCjGeGMCL7TrhAg159x21SRHYMb8ewY7p2qoME1eIucAYnXb+xH1V
 lCWLwJwJ4r469oCbjWXDD2XsvFcWOJi/SnSiX3I63e7ug2byO6vDuSLCzkdmicaCeF
 +84m+aWKqZ87QQ36VMlMDJo9oE4GCfD7U8srZMEE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeQr-1nEmW91Bsx-00Vcng; Wed, 10
 Nov 2021 11:44:10 +0100
Date: Wed, 10 Nov 2021 11:43:55 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
Message-ID: <YYuia9KFdi+ETT+I@latitude>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com>
 <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
 <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
 <c0b52994-51f5-806b-b07e-3e70d8217ffc@gmail.com>
 <YYkIeBSCFka9yrqC@latitude>
 <04103df3-1ef4-b560-a5cb-fa51737d28ad@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2Vc8voT8F+nWl+5t"
Content-Disposition: inline
In-Reply-To: <04103df3-1ef4-b560-a5cb-fa51737d28ad@gmail.com>
X-Provags-ID: V03:K1:Jd3HsvpIvSkd1z9MZ8A+M8pmRMEjtJGTIH5/rKKzl1zv92guAhj
 9dWDOhUd2UJZ9MerqFJu2sL0Vqy01eD3StlZDn4FJIminWyxKafYCrFSKtByuDa87GeS9OR
 qeoUp0E4UiW3sjAndGidVfCkZjgUQcURUuhYsgKl5H5XKG1g/BTOt0/CSBYYpcJ5Udag/gd
 3wpmaE1MgAr/8Zxl8PaIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7mF2ZkznjSM=:hlrB/z88BNOpxm6kPS7Ycn
 ofob/nRkHmNbOVrePuAQCpXLj+D951wlIiCq1ths/1M2PHt95dky10JrqzFd0GDPSH7ipEwb9
 x94B7v7gbYONFiWZ9GgrY51G+VM8OiWf/csLJ2yT7HUlW2fphGLoc+oh3cdHg6lV+G+MlHT76
 8NxNOjDTwEbEQTzP7WLVd4nbwED2WEzgEmRtuonDClV+bTkljXXiYcWmyTGn6uy1Hhs4kTCGt
 oQvMU0YTycpC1/MJe3lFOosJHXDqHhTO4rpNzkLhRMEVhwFxkgFYVFN4If8SqEfHBclNHMrGs
 Cf1+ti2nRVk38dx39qpn2TFKj09WCX93TjIPQXNTFcHU/79bRa6EI6AhyTsLNhOe1Nu7WbC4g
 kW8OhvgIlQdXHbKCN1DBVVpKeUhzAIE8sASct4EN+DmM/sXDb1X5/ucBCiKSaTpHhmnmOAMeI
 hJoDz+AQ3/eMgC3uUtDayH1UoC0E+cakuOW4HSHrvWSokxzlpzYB+1jwapOWsZhgouuLcfEI8
 YHkwIhIudf2FJv+DTzcrJw1TJlIuGCwZkvBiJ3t0F34n2TiQAvU7tyyUE1j89BEqPGYUXSb1a
 nPu+a+ec+L442oSOVJ2RqwE3j7IrmLeRjeLJ66lkLG9gMZ/AxQ05aC0k2kBADP+d4VSV+J41y
 wZS33zkQAUtp2Hc4cLc16aLjcZdsyWRsWX9R+uA3rvrBxdqBtLnXU14a7HgjiOWezfeDyLFoZ
 CFxIJOdAsqTh5L/F/s5o5UQzW78q+R+Nbh6TIKc0jTEcGGJw42g8wTMiywC6SQEDVTpjJAi49
 IcgECR8E/EhgWdDNNpWqET1ppscprkWWNr8X94IHFI7PqegZ0pzpIUB/fTLv0Kqve87cnh3Pm
 5JVFFOO7N/5DJWx/H9OV/Q82vW/fizWdLjR+pyN4LEqNqSXd3SQcuGDMImuCL6uxrkWpPOlVe
 01bkLqzcNdDpVuBmiNCl78c3HmPmOoUi1mOoDblJmsD28ILkfWKoKdV7k4yHszHiJpVhZ39zN
 OImWnjwnJ2y3lEFZHmYxFLDPAHd+gqUmtpX0O7XR8CKQYuLrZNd1RmswRqoNeA7vMxEo/4CFL
 HO+l0943BBAcNM=
X-Mailman-Approved-At: Wed, 10 Nov 2021 22:31:51 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-omap@vger.kernel.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2Vc8voT8F+nWl+5t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 02:36:42PM +0300, Dmitry Osipenko wrote:
> 08.11.2021 14:22, Jonathan Neusch=C3=A4fer =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sun, Nov 07, 2021 at 08:42:33PM +0300, Dmitry Osipenko wrote:
> > [...]
> >> EC drivers tend to use higher priority in general. Jonathan, could you
> >> please confirm that NTXEC driver is a more preferable restart method
> >> than the watchdog?
> >=20
> > Yes. The original firmware uses the NTXEC to restart, and it works well,
> > so I do think it's preferable.
>=20
> Thank you, then I'll update the NTXEC patch like this:
>=20
> https://github.com/grate-driver/linux/commit/22da3d91f1734d9a0ed036220ad4=
ea28465af988

I tested again, but sys_off_handler_reboot called a bogus pointer
(probably reboot_prepare_cb). I think it was left uninitialized in
ntxec_probe, which uses devm_kmalloc. I guess we could switch it to
devm_kzalloc:

diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
index 1f55dfce14308..30364beb4b1d0 100644
--- a/drivers/mfd/ntxec.c
+++ b/drivers/mfd/ntxec.c
@@ -144,7 +144,7 @@ static int ntxec_probe(struct i2c_client *client)
 	const struct mfd_cell *subdevs;
 	size_t n_subdevs;
=20
-	ec =3D devm_kmalloc(&client->dev, sizeof(*ec), GFP_KERNEL);
+	ec =3D devm_kzalloc(&client->dev, sizeof(*ec), GFP_KERNEL);
 	if (!ec)
 		return -ENOMEM;
=20


With that done, it works flawlessly.


Thanks,
Jonathan

--2Vc8voT8F+nWl+5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmGLoj4ACgkQCDBEmo7z
X9tbGw/9GW9TBNeJDqVwinH41nEM2TsnygEKpr7D3uPWXiWIIh7wxva0XnLkeDOr
YZUOSFjLglCoW9n8UjIgpmScFQ9OY5em2dY9iSOPk55FYy/kkD1LKXl8Qbto3Xjr
XRwv4EDIxlfO2uvjXgc07E2zGjiZdqaFwcIiMz1l8Rns6jC+AbzO0KFcoffXXKCg
oCDi/e1hnVfze/XGWTTSXbofwfAKHJPVE11uF8lK2Uqv0THOAbvpIQdZiQPaNuVe
bZuJ1p6wMxzjc6HiB8C6aJ0sy5Po98ZKWTAvvqFXBitgvOx0VCgKfJfqS+06qxiA
gYnxdQAIJjcwrBJYfpry4rg9nBYvH7Jao/uKYoXSm73mtXdEqG4oIQIZ0eC7jS/d
dRGjzR5mrhaA3G8mWMssxg6RX1EGpYBimy7XGpgml/bIXrEjGYZi3FaGZSnk9UTd
oAutr3b9I43OZFYo/gRKjQmEl9C1Ru/ZsmKDin75X8hfCzrFOoAUCLQ7X/tbbPoF
As6x8TUBJY8Zd9xBW2i/4sm+ZPAuMG5TMzzpRj/DEs2RN5UouXycBqzTFNleFYYf
LuwPDYZYSqe75uXgu0K0weup8tULnVfBuvOJDR5yMF7tf90iNku7JIcIXjtKglWH
EA0twe/kQWknjeUcmaR65U1v+cf8ekV6V8TVrEKb4cCEYf3HPBw=
=z+7h
-----END PGP SIGNATURE-----

--2Vc8voT8F+nWl+5t--
