Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD316A8DBA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 01:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSSvQ2xB0z3chr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 11:06:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
X-Greylist: delayed 2002 seconds by postgrey-1.36 at boromir; Fri, 03 Mar 2023 11:06:29 AEDT
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSSts27Tcz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 11:06:29 +1100 (AEDT)
Received: from [2601:447:c680:c050::eaf6]
	by baldur.buserror.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <oss@buserror.net>)
	id 1pXsNs-006371-0d; Thu, 02 Mar 2023 17:30:49 -0600
Message-ID: <8f1b02433cbeb90fab982a0b5377e8558e4eb5d3.camel@buserror.net>
From: Crystal Wood <oss@buserror.net>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Paul Gortmaker
	 <paul.gortmaker@windriver.com>
Date: Thu, 02 Mar 2023 17:30:45 -0600
In-Reply-To: <20230221214930.35ttgzntv2vfwlo6@pali>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
	 <20230221194637.28436-5-paul.gortmaker@windriver.com>
	 <20230221200308.gu3pwrg7layxzkpt@pali> <Y/U3vIKzkKJAc5iU@windriver.com>
	 <20230221214930.35ttgzntv2vfwlo6@pali>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2601:447:c680:c050::eaf6
X-SA-Exim-Rcpt-To: pali@kernel.org, paul.gortmaker@windriver.com, linuxppc-dev@lists.ozlabs.org, leoyang.li@nxp.com, claudiu.manoil@nxp.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config
 fragments.
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
Cc: Li Yang <leoyang.li@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-02-21 at 22:49 +0100, Pali Roh=C3=A1r wrote:
> On Tuesday 21 February 2023 16:29:32 Paul Gortmaker wrote:
> > [Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config
> > fragments.] On 21/02/2023 (Tue 21:03) Pali Roh??r wrote:
> >=20
> > > On Tuesday 21 February 2023 14:46:37 Paul Gortmaker wrote:
> > > > None of these have a reference anymore anywhere, such as like this:
> > > >=20
> > > > =C2=A0 arch/powerpc/Makefile:=C2=A0 $(call
> > > > merge_into_defconfig,mpc85xx_base.config,\
> > > >=20
> > > > As such, we probably should just clean up and remove them.
> > > >=20
> > > > Cc: Scott Wood <oss@buserror.net>
> > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > > Cc: Paul Mackerras <paulus@samba.org>
> > > > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > > ---
> > > > =C2=A0arch/powerpc/configs/85xx-32bit.config |=C2=A0=C2=A0 5 -
> > > > =C2=A0arch/powerpc/configs/85xx-hw.config=C2=A0=C2=A0=C2=A0 | 139 -=
-----------------------
> > > > -
> > > > =C2=A0arch/powerpc/configs/85xx-smp.config=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 -
> > > > =C2=A03 files changed, 146 deletions(-)
> > > > =C2=A0delete mode 100644 arch/powerpc/configs/85xx-32bit.config
> > > > =C2=A0delete mode 100644 arch/powerpc/configs/85xx-hw.config
> > > > =C2=A0delete mode 100644 arch/powerpc/configs/85xx-smp.config
> > >=20
> > > This change is likely going to break mpc85xx platform because defconf=
ig
> > > files includes all these files which you are going to remove. For
> > > example in arch/powerpc/Makefile is:
> > >=20
> > > PHONY +=3D mpc85xx_smp_defconfig
> > > mpc85xx_smp_defconfig:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(call merge_into_def=
config,mpc85xx_base.config,\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A085xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)
> >=20
> > OK, it seems you've answered a question for me.=C2=A0 That being "why d=
idn't
> > grep find a reference to these fragments?"
> >=20
> > It seems the ".config" extension is optional?
>=20
> I really do not know. (And I'm not sure if I want to know answer :D)

It's not optional; you have to leave it off:

# Used to create 'merged defconfigs'
# To use it $(call) it with the first argument as the base defconfig
# and the second argument as a space separated list of .config files to mer=
ge,
# without the .config suffix.
define merge_into_defconfig
...

> > This seems inconsistent at best, to reference some files with the
> > .config extension and others without it.=C2=A0 Not blaming you for that=
,
> > but it is probably something that needs looking into.
>=20
> I agree it is inconsistent. But it was there before I looked or touched
> any powerpc code. So it looks like something which nobody wanted to
> cleanup because "it works" and had no motivation.

No, it's intentional to reduce verbosity.  If by "inconsistent" you're
referring to mpc85xx_base.config, that argument sometimes refers to _defcon=
fig
files (i.e. the pseries targets which were the initial user of
merge_into_config) so that argument can't autoappend .config.

-Crystal

