Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319864D7FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 09:48:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXm966N9cz3bgG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 19:48:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=2a03:4000:10:469::; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
Received: from lug-owl.de (lug-owl.de [IPv6:2a03:4000:10:469::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXm8W6V7vz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 19:47:55 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id BA66042050; Thu, 15 Dec 2022 09:47:48 +0100 (CET)
Date: Thu, 15 Dec 2022 09:47:48 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221215084748.zkfb7h6uhfzx7dp5@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <20221213002613.GG25951@gate.crashing.org>
 <20221213100045.xebrbdcniwpopbnq@lug-owl.de>
 <20221214090025.f3k3juinxfhhnr6u@lug-owl.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ad3o33wql4dh5qkv"
Content-Disposition: inline
In-Reply-To: <20221214090025.f3k3juinxfhhnr6u@lug-owl.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ad3o33wql4dh5qkv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-12-14 10:00:25 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> wr=
ote:
> On Tue, 2022-12-13 11:00:45 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> =
wrote:
> > On Mon, 2022-12-12 18:26:13 -0600, Segher Boessenkool <segher@kernel.cr=
ashing.org> wrote:
> > > On Mon, Dec 12, 2022 at 10:51:17PM +0100, Jan-Benedict Glaw wrote:
> > > > 	Compiler ICEs (during GIMPLE pass: ccp) in align.c:
> Submitted as https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108095:

=2E..and already fixed upstream by Jakub Jelinek:
https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3Dbf3ce6f84a7a994a0fc87419=
b383b9ce4efed442

That's the second asm goto related bug I submitted (initially found
while looking at powerpc builds) and I'm actually surprised about the
speed both of them got fixed.  That's phantastic work!

MfG, JBG

--=20

--ad3o33wql4dh5qkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5rfMgAKCRAdvV51g5nh
uzZEAJwKLdgBfazNygs5i+g8MIsh8FdcGgCfdoT73s9IEk+iSiy6a+K5dSanKGw=
=W0dZ
-----END PGP SIGNATURE-----

--ad3o33wql4dh5qkv--
