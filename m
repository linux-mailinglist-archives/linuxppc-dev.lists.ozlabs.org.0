Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3D40A1C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 02:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7kHH6jBcz2ymr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 10:09:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=IOEknN+e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=IOEknN+e; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7kGc51Mqz2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 10:08:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1631578134;
 bh=v90zIYjxmWk7ZcxcpQ8ejCaQLB9RypWd6ospIYJbweg=;
 h=Date:From:To:Cc:Subject:From;
 b=IOEknN+eZ8Adpj7/vLgyXCC7SV+e6VM1rumxhZfOx8snd515mlwrccDEbFtki+ZAF
 4pg2bFjNEgaQJK5I8TEgXOZzS2tAZzC8XojQ+u0E0hypfVpM+c1epPwRGyBcjRDLMD
 yWKlBvUWfedU5iLpoo7KMPuw10zAQaO9wi6l6MuCWUju8b/s87IVXvi4mlrogfJ8p+
 wLiJH2zS8xDdM6d4B2KLCqFnrLmAC878bu3EyHHl+blPZyRLQPJpnMB0SE0Z167Zuc
 2L1P86WHhEy2Lh/jeFs8rwQaBNzfarahn8ensDgE0Z7cMl7AvdEgiATZ7qIvStexeG
 pikMI9BGhTC0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7kGZ0yPlz9sW4;
 Tue, 14 Sep 2021 10:08:53 +1000 (AEST)
Date: Tue, 14 Sep 2021 10:08:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20210914100853.3f502bc9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+fAm=g2A=.HjuXM/KZoYRo=";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/+fAm=g2A=.HjuXM/KZoYRo=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from <command-line>:
include/linux/compiler_attributes.h:62:5: warning: "__has_attribute" is not=
 defined, evaluates to 0 [-Wundef]
   62 | #if __has_attribute(__assume_aligned__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:62:20: error: missing binary operator b=
efore token "("
   62 | #if __has_attribute(__assume_aligned__)
      |                    ^
include/linux/compiler_attributes.h:88:5: warning: "__has_attribute" is not=
 defined, evaluates to 0 [-Wundef]
   88 | #if __has_attribute(__copy__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:88:20: error: missing binary operator b=
efore token "("
   88 | #if __has_attribute(__copy__)
      |                    ^
include/linux/compiler_attributes.h:113:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  113 | #if __has_attribute(__designated_init__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:113:20: error: missing binary operator =
before token "("
  113 | #if __has_attribute(__designated_init__)
      |                    ^
include/linux/compiler_attributes.h:124:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  124 | #if __has_attribute(__error__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:124:20: error: missing binary operator =
before token "("
  124 | #if __has_attribute(__error__)
      |                    ^
include/linux/compiler_attributes.h:135:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  135 | #if __has_attribute(__externally_visible__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:135:20: error: missing binary operator =
before token "("
  135 | #if __has_attribute(__externally_visible__)
      |                    ^
In file included from <command-line>:
include/linux/compiler_attributes.h:171:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  171 | #if __has_attribute(__no_caller_saved_registers__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:171:20: error: missing binary operator =
before token "("
  171 | #if __has_attribute(__no_caller_saved_registers__)
      |                    ^
include/linux/compiler_attributes.h:182:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  182 | #if __has_attribute(__noclone__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:182:20: error: missing binary operator =
before token "("
  182 | #if __has_attribute(__noclone__)
      |                    ^
include/linux/compiler_attributes.h:199:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  199 | #if __has_attribute(__fallthrough__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:199:20: error: missing binary operator =
before token "("
  199 | #if __has_attribute(__fallthrough__)
      |                    ^
include/linux/compiler_attributes.h:226:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  226 | #if __has_attribute(__nonstring__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:226:20: error: missing binary operator =
before token "("
  226 | #if __has_attribute(__nonstring__)
      |                    ^
include/linux/compiler_attributes.h:238:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  238 | #if __has_attribute(__no_profile_instrument_function__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:238:20: error: missing binary operator =
before token "("
  238 | #if __has_attribute(__no_profile_instrument_function__)
      |                    ^
include/linux/compiler_attributes.h:296:5: warning: "__has_attribute" is no=
t defined, evaluates to 0 [-Wundef]
  296 | #if __has_attribute(__warning__)
      |     ^~~~~~~~~~~~~~~
include/linux/compiler_attributes.h:296:20: error: missing binary operator =
before token "("
  296 | #if __has_attribute(__warning__)
      |                    ^
make[2]: *** [arch/powerpc/boot/Makefile:225: arch/powerpc/boot/crt0.o] Err=
or 1

Exposed by commit

  6d2ef226f2f1 ("compiler_attributes.h: drop __has_attribute() support for =
gcc4")

Powerpc uses BOOTAS to build arch/powerpc/boot/crt0.o (and others)
which (with V=3D1) is

  gcc -Wp,-MD,arch/powerpc/boot/.crt0.o.d -D__ASSEMBLY__ -Wall -Wundef -Wst=
rict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-float -mno-a=
ltivec -mno-vsx -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc -in=
clude /home/sfr/next/next/include/linux/compiler_attributes.h -I/home/sfr/n=
ext/next/arch/powerpc/include -I./arch/powerpc/include/generated -I/home/sf=
r/next/next/include -I./include -I/home/sfr/next/next/arch/powerpc/include/=
uapi -I./arch/powerpc/include/generated/uapi -I/home/sfr/next/next/include/=
uapi -I./include/generated/uapi -include /home/sfr/next/next/include/linux/=
compiler-version.h -include /home/sfr/next/next/include/linux/kconfig.h -m3=
2 -isystem /usr/lib/gcc/powerpc64le-linux-gnu/10/include -mbig-endian -nost=
dinc -c -o arch/powerpc/boot/crt0.o /home/sfr/next/next/arch/powerpc/boot/c=
rt0.S

I am not sure what is missing here to get __has_attribute defined.

I have reverted the above commit for today ( and reapplied the bits
from commits

  7ed012969bbc ("Compiler Attributes: fix __has_attribute(__no_sanitize_cov=
erage__) for GCC 4")
  b83a908498d6 ("compiler_attributes.h: move __compiletime_{error|warning}")
).

I assume that this needs some work in the powerpc arch Makfile(s) ...
--=20
Cheers,
Stephen Rothwell

--Sig_/+fAm=g2A=.HjuXM/KZoYRo=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE/6BUACgkQAVBC80lX
0GyYQgf6Ak0293PpiqdwsDmQ5V0aJ0jtRJdt/XPFzeDcvOIRHcA2T4ReoWyXlcHP
GYVekkSInE/9x0vIeMGIEh4DRVj0X5gntdQ7O4IblUYwypEjyuCB8wz8QatIzeg2
hrbtN3SFApTC7haf83VwDXalisCfpEIaJpNpJqNOzj4gQs0PEEmRsVrkusAT73C7
sD799LU/XK+09tE6D9xHZm1FsQg1aRtdswuJAojUBNSwQDjgwDeVAOUNC3VQ4pyj
POscsAoFX+Cskg7KVOK5tJgD/okG8UkZ9/PqI9ISGZltnyH+BO8QINXxhchO0E9H
t7aB3eAHqU/+vQxCNdJ9PED32BDMAQ==
=HgYZ
-----END PGP SIGNATURE-----

--Sig_/+fAm=g2A=.HjuXM/KZoYRo=--
