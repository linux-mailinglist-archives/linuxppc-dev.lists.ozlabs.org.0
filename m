Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C764E831
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 09:39:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYMwN6syhz3cMK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 19:39:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=2a03:4000:10:469::; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
Received: from lug-owl.de (lug-owl.de [IPv6:2a03:4000:10:469::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYMvs13ncz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 19:39:04 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id 81CF142074; Fri, 16 Dec 2022 09:38:56 +0100 (CET)
Date: Fri, 16 Dec 2022 09:38:56 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc: Pass correct CPU reference to assembler
Message-ID: <20221216083856.rla4sfga2akjxno6@lug-owl.de>
References: <176b0f41a8b9e9f1191bf2b8857d121887c4fbe5.1671171965.git.christophe.leroy@csgroup.eu>
 <202212161638.VBZyfyMO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bozrjqcxjqwdy5jy"
Content-Disposition: inline
In-Reply-To: <202212161638.VBZyfyMO-lkp@intel.com>
X-Operating-System: Linux chamaeleon 5.14.0-0.bpo.2-amd64 
X-gpg-fingerprint: 250D 3BCF 7127 0D8C A444  A961 1DBD 5E75 8399 E1BB
X-gpg-key: wwwkeys.de.pgp.net
X-Echelon-Enable: howto poison arsenous mail psychological biological nuclear
 warfare test the bombastical terror of flooding the spy listeners explosion
 sex drugs and rock'n'roll
X-TKUeV: howto poison arsenous mail psychological biological nuclear warfare
 test the bombastical terror of flooding the spy listeners explosion sex
 drugs and rock'n'roll
X-message-flag: Please send plain text messages only. Do not send HTML
 emails. Thank you. 
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--bozrjqcxjqwdy5jy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-12-16 16:07:25 +0800, kernel test robot <lkp@intel.com> wrote:
> Hi Christophe,
>=20
> I love your patch! Yet something to improve:

[...]

> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    Assembler messages:
> >> Error: invalid switch -mpowerpc
> >> Error: unrecognized option -mpowerpc
>    make[2]: *** [scripts/Makefile.build:250: scripts/mod/empty.o] Error 2
>    make[2]: Target 'scripts/mod/' not remade because of errors.
>    make[1]: *** [Makefile:1271: prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:231: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.

I see similar failures for many/most (about 4/5 of them) defconfigs.
Needs some more testing, but I also think that's the route to go. :)

  IIRC there was another patch mentioned that needs to be applied as
well, maybe that's already the needed fix along with this one?

MfG, JBG

--=20

--bozrjqcxjqwdy5jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5wumwAKCRAdvV51g5nh
u+IOAJ9PVf8J5tqMYwYJfBxJ+BaNa+O4kwCfU2rAfoweU+LtpnidNBEdDS+DrDg=
=6o0+
-----END PGP SIGNATURE-----

--bozrjqcxjqwdy5jy--
