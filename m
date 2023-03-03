Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9126AA03A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 20:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSz230rpZz3fCk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 06:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSz1R4Zpkz3cdM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 06:43:55 +1100 (AEDT)
Received: from [2601:447:c680:c050::eaf6]
	by baldur.buserror.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <oss@buserror.net>)
	id 1pYBHZ-00682Y-Lv; Fri, 03 Mar 2023 13:41:34 -0600
Message-ID: <2a48667f70276ad7097e898d439dea6a9c0b414b.camel@buserror.net>
From: Crystal Wood <oss@buserror.net>
To: Arnd Bergmann <arnd@arndb.de>, Paul Gortmaker
 <paul.gortmaker@windriver.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>
Date: Fri, 03 Mar 2023 13:41:31 -0600
In-Reply-To: <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
	 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
	 <Y/o8bQz5CuRhdD8B@windriver.com>
	 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
	 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
	 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
	 <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
	 <ZAFHnaSN6F5ZYTO5@windriver.com>
	 <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2601:447:c680:c050::eaf6
X-SA-Exim-Rcpt-To: arnd@arndb.de, paul.gortmaker@windriver.com, christophe.leroy@csgroup.eu, leoyang.li@nxp.com, claudiu.manoil@nxp.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -1.0 GREYLIST_ISWHITE The incoming server has been whitelisted for
	*      this recipient and sender
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, Leo Li <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-03-03 at 10:14 +0100, Arnd Bergmann wrote:
> On Fri, Mar 3, 2023, at 02:04, Paul Gortmaker wrote:
> > 01/03/2023 (Wed 14:23) Christophe Leroy wrote:
> > > Le 28/02/2023 ?? 18:51, Arnd Bergmann a ??crit??:
> > > Hope it clarifies how those reference boards are used.
> >=20
> > It was really useful input and gave an insight into how things get used=
.
> >=20
> > But let me put a slightly different slant on things.=C2=A0 If there is =
no
> > maintainer for the platform/architecture/CPU, then where is the
> > obligation for mainline to keep it up to date just for your company to
> > use the code/BSP as a reference?
> >=20
> > Do they continue to do this for one more year, or three or ...=C2=A0 ??=
?
> > Does someone list themselves in MAINTAINERS for arch/powerpc/83xx ?
> ...
> >=20
> > If you see change 0123abcdef breaks boot on your platform, you have a
> > legit voice to gripe about it right then and there.=C2=A0 Don't wait!!!
>=20
> I think the answer here is that Christophe is already the only person
> that does this, so he is the de-facto maintainer for ppc32 regardless
> of whether he wants himself listed in the file or not:
>=20
> $ git log --no-merges --format=3D"%an" v5.0.. arch/powerpc/platforms/[458=
e]* |
> sort | uniq -c | sort -rn | grep -vw 1
> =C2=A0=C2=A0=C2=A0=C2=A0 61 Christophe Leroy
> =C2=A0=C2=A0=C2=A0=C2=A0 12 Michael Ellerman
> =C2=A0=C2=A0=C2=A0=C2=A0 11 Thomas Gleixner
> =C2=A0=C2=A0=C2=A0=C2=A0 11 Oliver O'Halloran
> =C2=A0=C2=A0=C2=A0=C2=A0 11 Liang He
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7 Uwe Kleine-K=C3=B6nig
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6 Nick Child
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 Rasmus Villemoes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 Randy Dunlap
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 Mike Rapoport
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 Julia Lawall
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 Andy Shevchenko
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 Xiaoming Ni
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 Nicholas Piggin
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 Marc Zyngier
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 Christophe JAILLET
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 Christoph Hellwig
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 Paul Gortmaker
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 Mathieu Malaterre
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 Markus Elfring
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 Jordan Niethe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 Dmitry Torokhov
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 Arnd Bergmann
>=20
> Pretty much everyone else on the list above only did treewide
> cleanups, dead code removal or compile-time fixes, while Christophe
> is the one that fixed machine specific bugs and added new features.

Speaking of that, I'd be fine with Christophe replacing me in the "LINUX FO=
R
POWERPC EMBEDDED PPC83XX AND PPC85XX" entry, given that he's been way more
involved than me lately.

-Crystal

