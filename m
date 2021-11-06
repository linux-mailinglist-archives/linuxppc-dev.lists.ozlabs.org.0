Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD24470E9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 23:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hmsxg363kz2ywB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 09:49:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=h06/7/tP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=h06/7/tP; 
 dkim-atps=neutral
X-Greylist: delayed 417 seconds by postgrey-1.36 at boromir;
 Sun, 07 Nov 2021 08:03:54 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmqcB143lz2xfD;
 Sun,  7 Nov 2021 08:03:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636232619;
 bh=Mwd00qb2ZiJx72AR8VOZy+k9pKeasCOoFRxt9I1uV2U=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=h06/7/tP0ZWy0v0n/bk0w+qqC3J4P5pP65h1+f+oMPKVhQ7gYJROQLFPhUArLsuuj
 sAdS9r2lqRD4xR5J9wfz8Nuf9AAycmie3qoF12y2qdKfqsvDs4MLp5uj60h+AMDeJQ
 sGOXwo0iyFk7+2Mwn6jTlgsknRg/s3x6lAVadLbg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.79.195.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOA3F-1n7sEw3p2f-00OWCa; Sat, 06
 Nov 2021 21:54:16 +0100
Date: Sat, 6 Nov 2021 21:54:06 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
Message-ID: <YYbqlmOM95q7Hbjo@latitude>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EIEte5+tjVxDHmE6"
Content-Disposition: inline
In-Reply-To: <20211027211715.12671-28-digetx@gmail.com>
X-Provags-ID: V03:K1:SVFlmtuvvynO7MrtDzObaEyN/WaPcv8tOsGAlIRvdbuKBKDAEQ/
 nVePqR5eYOMd9xdpGO5unEqHbls4MbMcwDHHiD/2xW054xRTDPzVuInIGVNwfhVnOpuaRe4
 ac8qzmvsisWAHTSwATyyh2lQM4j3GTT+YgfTlnX+xnTkWWDcDQ1QJM/FLNOUp2gu+vKNebi
 4PIdlh56euOWziRZzNIlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+q4twkx5HbQ=:c6NWW/lGyz+JrrEJOfeSU1
 SbdM2xrm6euZgxRw7dVhrAaUHO1zelRx5cOKxQGxOMT7QAx66Da75vDzNqQCWWxDYOdojhDK1
 DJAqQVrMPelTvzp/kb11dyJ6o9L2Z89wNvC/KaKDVRWw50xyWWy1LzeT5amKb/91ezYOhPts0
 p6bdhlVzvn1pK8/164HGZf2/lM9lXB3/eWZvqZWFVeHX+obzdLGFnTl2Imzx2hAk6yJs7n0uo
 f3AWu3WY1gbQGdUDjYgfXiYEpcn8EjXPl+MfItXqGBMDx8YIGG734fW1T/DPqh8AVn0K2Kx9W
 TEGngW9+G57vuJWwQR374U91rnqlrAMFVMzRT+zgAXMkRAbSmyY8v4jpM+nQruDJ9wANa/0aK
 eu2SdgZeXdZMgXRv7cvfWzblWX3IwcMJag6Xo4AHIhG4MnASO4MG4SfufT7sGLFQP232taj02
 ZtZrM89OqkaP2USIkav5fwKnU4K91mY0Glh+QCTYUJnyGlcj9QCRIBpqUs3DaY44H2jhtJ0r3
 1xFhWcNhHUypIamywPWNeiJzkX232e1svbgoC0SSvGJpBeitpPIYOAUvklUQWVo7z5msOIAIf
 mzzEO8/o9Z39ZQdAdgzLvOzlg13TqWGOi9JNEAQUAXgfVN9V1dEx9hpdfiytfiBoziXwdqGaM
 A/Lg5tFCmIyyMiniDUDTQjfvKtkljS16AJqKvoYg7LAE0UI5Ws646b/yjuf7n5SRBoJtPI1IS
 1NX6fdLstkTC5BY+OXOnwQDj5Sw2myqm39nuwA+ibmdIB1nBYQqozUBp3VqOAYO8p/zarwQZQ
 QLD6kChqUB2tOtZqHvPLDBQSfro+UyFvMZakRfSJn8R4/x4x7uGlaxRbVOglCOdenP+q0psnb
 xNr/MUWACDrWFi2qYGeo1Xm3jbvxVTU1xpmcsiPOb7z0uH385dbDNyZe647CScQHfzoAOK5l4
 tSDRPqcwTz5ZiyV0RvknBXQdRbK0Sp815LiYolVqxBGF2+lnuDfXFDtm1nDpKpxUABeBa7Ov9
 gd/QUJ9YsMbA0VAiOPRTc0TEJaiNPVMH89D2NeA2defW6th3cPpXvvcQOJtjGljchFaQqgZs4
 gLk78skJYnmLNA=
X-Mailman-Approved-At: Sun, 07 Nov 2021 09:48:37 +1100
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


--EIEte5+tjVxDHmE6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
> Use devm_register_power_handler() that replaces global pm_power_off
> variable and allows to register multiple power-off handlers. It also
> provides restart-handler support, i.e. all in one API.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

When I boot with (most of) this patchset applied, I get the warning at
kernel/reboot.c:187:

	/*
	 * Handler must have unique priority. Otherwise call order is
	 * determined by registration order, which is unreliable.
	 */
	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));

As the NTXEC driver doesn't specify a priority, I think this is an issue
to be fixed elsewhere.

Other than that, it works and looks good, as far as I can tell.


For this patch:

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Tested-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


Best regards,
Jonathan
---

Full Oops log:

[    3.523294] ------------[ cut here ]------------
[    3.528193] WARNING: CPU: 0 PID: 1 at kernel/reboot.c:187 register_resta=
rt_handler+0x4c/0x58
[    3.536975] Modules linked in:
[    3.540312] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-00021-gcb24=
c628b307 #622
[    3.548214] Hardware name: Freescale i.MX50 (Device Tree Support)
[    3.554357] [<c0111540>] (unwind_backtrace) from [<c010cdd0>] (show_stac=
k+0x10/0x14)
[    3.562183] [<c010cdd0>] (show_stack) from [<c0bf240c>] (dump_stack_lvl+=
0x58/0x70)
[    3.569824] [<c0bf240c>] (dump_stack_lvl) from [<c0127604>] (__warn+0xd4=
/0x154)
[    3.577191] [<c0127604>] (__warn) from [<c0bec844>] (warn_slowpath_fmt+0=
x74/0xa8)
[    3.584727] [<c0bec844>] (warn_slowpath_fmt) from [<c01593c8>] (register=
_restart_handler+0x4c/0x58)
[    3.593823] [<c01593c8>] (register_restart_handler) from [<c08676c8>] (_=
_watchdog_register_device+0x13c/0x27c)
[    3.603889] [<c08676c8>] (__watchdog_register_device) from [<c0867868>] =
(watchdog_register_device+0x60/0xb4)
[    3.613764] [<c0867868>] (watchdog_register_device) from [<c08678f8>] (d=
evm_watchdog_register_device+0x3c/0x84)
[    3.623898] [<c08678f8>] (devm_watchdog_register_device) from [<c1146454=
>] (imx2_wdt_probe+0x254/0x2ac)
[    3.633346] [<c1146454>] (imx2_wdt_probe) from [<c06feb74>] (platform_pr=
obe+0x58/0xb8)
[    3.641314] [<c06feb74>] (platform_probe) from [<c06fb2f8>] (call_driver=
_probe+0x24/0x108)
[    3.649636] [<c06fb2f8>] (call_driver_probe) from [<c06fbe08>] (really_p=
robe.part.0+0xa8/0x358)
[    3.658384] [<c06fbe08>] (really_probe.part.0) from [<c06fc1c4>] (__driv=
er_probe_device+0x94/0x208)
[    3.667470] [<c06fc1c4>] (__driver_probe_device) from [<c06fc368>] (driv=
er_probe_device+0x30/0xc8)
[    3.676468] [<c06fc368>] (driver_probe_device) from [<c06fcb0c>] (__driv=
er_attach+0xe0/0x1c4)
[    3.685032] [<c06fcb0c>] (__driver_attach) from [<c06f9a20>] (bus_for_ea=
ch_dev+0x74/0xc0)
[    3.693253] [<c06f9a20>] (bus_for_each_dev) from [<c06faeb8>] (bus_add_d=
river+0x100/0x208)
[    3.701563] [<c06faeb8>] (bus_add_driver) from [<c06fd8a0>] (driver_regi=
ster+0x88/0x118)
[    3.709696] [<c06fd8a0>] (driver_register) from [<c06fe920>] (__platform=
_driver_probe+0x44/0xdc)
[    3.718522] [<c06fe920>] (__platform_driver_probe) from [<c01022ac>] (do=
_one_initcall+0x78/0x388)
[    3.727444] [<c01022ac>] (do_one_initcall) from [<c1101708>] (do_initcal=
ls+0xcc/0x110)
[    3.735413] [<c1101708>] (do_initcalls) from [<c110198c>] (kernel_init_f=
reeable+0x1ec/0x250)
[    3.743896] [<c110198c>] (kernel_init_freeable) from [<c0bfe724>] (kerne=
l_init+0x10/0x128)
[    3.752224] [<c0bfe724>] (kernel_init) from [<c010011c>] (ret_from_fork+=
0x14/0x38)
[    3.759844] Exception stack(0xc40adfb0 to 0xc40adff8)
[    3.764933] dfa0:                                     00000000 00000000 =
00000000 00000000
[    3.773143] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    3.781351] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.788347] irq event stamp: 143613
[    3.792102] hardirqs last  enabled at (143623): [<c01a3ebc>] __up_consol=
e_sem+0x50/0x60
[    3.800397] hardirqs last disabled at (143632): [<c01a3ea8>] __up_consol=
e_sem+0x3c/0x60
[    3.808491] softirqs last  enabled at (143612): [<c0101518>] __do_softir=
q+0x2f8/0x5b0
[    3.816591] softirqs last disabled at (143603): [<c01307dc>] __irq_exit_=
rcu+0x160/0x1d8
[    3.825014] ---[ end trace 7f6709d2c89774b4 ]---

--EIEte5+tjVxDHmE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmGG624ACgkQCDBEmo7z
X9s6ChAAk6BAeo5fWoSSZHjjpn6ATqjK8ym6Qwe2EuauLkxbrtHK3OsbljBzCdtj
p4LUnHOvUjWpnlBRfbbZSXKo5B0LxFtUhe/Cz9IDICft4K2DmOExc+xY9zQNcjMO
rNIxDh4Q8qUdWv4c4B3p812s36yVKoaAGT6XHR9ISWOWmTWq/SNXiFetn9KdMaRs
INw4aNL0grB717V8ucg5RtEOcrLEHRPf6Rv0b6yhfRdBQGx5XCatsdkofBcM9Rlr
ECVr+SDk6hoMvPgqbnK3hh1fU0MGiDoyHN/+PhdW5k71EoqynneLlz1xhU4P1TAQ
4leH70X0lvTJSlpZ+dWkgVGkGzE8LtrjCwhCzZvf+UKqhKf4VWp9LInkiRU2mEaN
ZGeaNLEL/oEE2nHZuWuW8imYr/WoYQKyZX+rG/g+aViMxom4/RC/IF5GFWxInCgi
IBVFSiKxJOwKvKHZrsiJsk+zqcmb1TRObyYd0ecsOPD413IWwnFIl6502QRQolJH
UvdIANNtt2/XORmBBNNGCQtZJ82srfxBpn9jzBtCZu03m4RymWvURbqbIx7mAiz0
6nj5cArubiCB8WOnOcCmsgHzLZDzN2SAy5UFxsELy67LUXWjsGMG++sHbkDuaiji
/h71rvx5wmakG7quyBIQDCUtxgSMJL73yZA4N8UsQABCsmnNXgE=
=jBJI
-----END PGP SIGNATURE-----

--EIEte5+tjVxDHmE6--
