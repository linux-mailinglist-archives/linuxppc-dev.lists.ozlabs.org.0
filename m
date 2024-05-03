Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 092698BA5BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 05:32:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=BHBHRqMj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVxFw4KBwz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 13:32:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=BHBHRqMj;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVxFC0NHwz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 13:32:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714707134;
	bh=sUFc2gXkeB9EsZtCduQJ0VzLx4vfZjF6MlUww5elcHc=;
	h=Date:From:To:Subject:From;
	b=BHBHRqMjD/Wago3eVBmQReHnnVQjqj8mgCbyO3rQmacsxAJ5V5hJC2BuUBf5zqKYc
	 nIm0UeUsJ6O6FWNLNYNox73NFuME3rO//z4XH+AxGVwtKe0YF0RZWMJa684mUMK171
	 SLLNbclOabdzWCmAcd3mKVEtPzMYzVSike4y9aCz6yke370oKqdhvY1zTxXXQtAN2B
	 mvMr84DbXhUiFpaF4kghpPDfbqFTQYY7u9PoZlWM0plFpC/UkYrxuC+cYHgp1Rmi/9
	 9F+HoRxusZCOrAeZlTNZ4gCqbkepbIvJrOkZuA/fM29VWketKipZjSaK5DW/rNSIy/
	 5Tp3WMu5HAh/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VVxFB5bWNz4wyq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 13:32:14 +1000 (AEST)
Date: Fri, 3 May 2024 13:32:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Administrivia: remove old list address
Message-ID: <20240503133213.680fe1f9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6uRa//eBcU.RZ/MEx4jZv8F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/6uRa//eBcU.RZ/MEx4jZv8F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Many years ago, linuxppc-dev was moved from ozlabs.org to
lists.ozlabs.org.  These days most of the mail sent to linuxppc-dev
@ozlabs.org is spam (causing added burden to the list owner i.e. me),
so I intend to drop that name.  Initially, it will bounce with a
message pointing to the new name, but after some time it will just
bounce.

I have submitted a patch to fix up the remaining (fairly obscure)
references to the old name in the kernel sources.

Does anyone have any objections to this plan?

I also have a longer term plan to not accept HTML formatted emails on
the list (as they are also mostly spam).
--=20
Cheers,
Stephen Rothwell

--Sig_/6uRa//eBcU.RZ/MEx4jZv8F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY0Wr0ACgkQAVBC80lX
0Gylxwf/XtnIB05xTrSjxEwFIvMIqCS0BQ5FAiCEF8VsEcANnWav7kOJQBfdFQdg
GZBQaW6+YqACNKge93P/B77o/3WtbLdIROkNPAfPXHEamc/W7nMfcIXw6iFpOlNZ
CSLOZHWpV2rHjhEhz2DTHwlJlPOoXr9aXRjCn4g44d5eZIW2ap/5R8FYkuyBXd7e
Xnc6XRVSWEB0qeoRDN5TpSi/RInjS11NfinhGpSNVMbatirLSWROBJ70GCUbZ8ai
jmem7UFGct4926xMgcR8iATQhWlqaW/maH2+UeOA8NIoIQt0lg8Ed5r9/fpSrZvJ
iUm3Zx0LkCM5HChXPsR3HI1ytr3KDg==
=wLky
-----END PGP SIGNATURE-----

--Sig_/6uRa//eBcU.RZ/MEx4jZv8F--
