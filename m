Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7E43E06E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg41G3Nv7z2yp4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:02:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PF+p5k3f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PF+p5k3f; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg3y824Plz2xDg;
 Thu, 28 Oct 2021 22:59:28 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17810610FC;
 Thu, 28 Oct 2021 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635422364;
 bh=6SRnBqGEu6kfrjY8F8AIxFOXpP3mk9uNLODc5pl6vYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PF+p5k3fPcX4g7U/HaBJuzIJ4k5E0pNaC5AYSReMWdptL5C6nDTIJaIE7qlYNYlG6
 n1n/PwUdpeEdECCRPixbjSlqTeevDW0OntTvozcAaeZnGpyg9v14UXE0Uy+uDhiwA4
 opUKp2Rh8z49oq5/De4kzH0wt2Tq2fvNA7/+mgp+6zfuqvEwWijrNqLYLBlBZuMPRL
 88N447RwKebi4Ez1WZLL28f9yHI1UOy8Ip53Ye3TTKmeO3nK2Kc7hLybqU9+9eT+Gw
 dD6HWh7fPMZRMI/QpI/9KZ3rirsCMx4Hs00YhSbDpBEZNMfr2ZfvOMHA6ZLmKCwWDw
 xkF14RX5nWTCw==
Date: Thu, 28 Oct 2021 12:59:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 24/45] regulator: pfuze100: Use
 devm_register_power_handler()
Message-ID: <YXqQjG+5Eshm9fl5@sirena.org.uk>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-25-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Wle3PKA2/qG6+6Vj"
Content-Disposition: inline
In-Reply-To: <20211027211715.12671-25-digetx@gmail.com>
X-Cookie: try again
X-Mailman-Approved-At: Thu, 28 Oct 2021 23:01:44 +1100
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
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
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
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
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


--Wle3PKA2/qG6+6Vj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 28, 2021 at 12:16:54AM +0300, Dmitry Osipenko wrote:

> Use devm_register_power_handler() that replaces global pm_power_off_prepare
> variable and allows to register multiple power-off handlers.

Acked-by: Mark Brown <broonie@kernel.org>

--Wle3PKA2/qG6+6Vj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF6kIwACgkQJNaLcl1U
h9AyhAf+Nziuu181EjKis21sdValh/0I2qd5n6cZmpuLUeA7g6K6TyFH79y+tEkd
Itu0nx35rsztyjl7+A8ECF9S9uJGD1N0o3cruhqU01R5Kloz9mrUDRii5R3Uh+fm
wjXlm+iYDXdXIzRmM07WyWi8rUTpLrhHx7ogAb291MVxgxc1LqxOBAwk6hcvnDCB
aLDZSKk0LT7/yHSU+s5sBmll+K1S09x+XUfo/7VEuf9WqctxN8t6DgnigNeg1sU1
S3cmBREB1bkkqHuPWJhOyUeW6YyuYI8inCcpXRNtdydg4jwo5l2h16fE8e0db953
VsD3Y2dmLQu1qKxLNZUqHCelyjTPow==
=sNsl
-----END PGP SIGNATURE-----

--Wle3PKA2/qG6+6Vj--
