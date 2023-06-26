Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD473D5F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 04:40:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Y2toNPQX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqBsk6fVQz3bVC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 12:40:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Y2toNPQX;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqBrn2NXNz307y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 12:39:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QqBrh51X0z4wb1;
	Mon, 26 Jun 2023 12:39:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1687747188;
	bh=YRYS5rodKLDM5QmZrejVxwridNiZjtQfoMD2mlp31Fg=;
	h=Date:From:To:Cc:Subject:From;
	b=Y2toNPQXtCZS6Aq1VDMwO7TuL0/HldJ/+//NbHVcOFRqE0bPf+QgWXu7OKR3YZkUk
	 ZC+l4bepQYRf3F0LrIxbFTSKa/1O0/nQ/R9ZN52deFSKkDC2eaOf6hA31bYhNsRZsW
	 7Tmc0zP8qHBKMoycSHXYP+xAYa9/ydaYYEe8inxlFQ+8TLbXZZ4J2aLMhNTH2e1by4
	 yjwKVK9AvCEJNF7IMnM5CX4dxgTJAnpjAJfjI87j/6qiH2CML6h5n2jMVlIG4aMRHP
	 Pm36ogGtZIonvyhH5y+NvkI57qHNkp4oHmTsvLQEoTMCvwQhDWZ3gXyPBwbVMmLUj7
	 9UHsv2lIa6ddw==
Date: Mon, 26 Jun 2023 12:39:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20230626123946.6de22527@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HScrxUH+i7hEBmNz4NBuy6A";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/HScrxUH+i7hEBmNz4NBuy6A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ld: warning: discarding dynamic section .glink
ld: warning: discarding dynamic section .plt
ld: linkage table error against `sm2_compute_z_digest'
ld: stubs don't match calculated size
ld: can not build stubs: bad value
ld: crypto/asymmetric_keys/x509_public_key.o: in function `x509_get_sig_par=
ams':
x509_public_key.c:(.text+0x474): undefined reference to `sm2_compute_z_dige=
st'

Possibly caused by commit

  e5221fa6a355 ("KEYS: asymmetric: Move sm2 code into x509_public_key")

This looks like it may be a compiler bug?  Maybe the deep ternary
expressions may be contributing to that? (cc'ing the ppc guys in case
they have any ideas.)

I have reverted that commit (and the following one) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/HScrxUH+i7hEBmNz4NBuy6A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSY+nIACgkQAVBC80lX
0Gxhugf/db+U5ipJ0TNqttnNlAMQqUTTN6HE01Vl/VDq2ZBVWgJGhiUEBsc6Hypa
a1vHn4xFm/A9z7sEeoiBJDzcnq/89LimWAquEQLhGlcyxcN7GUGyuNsuOL3TYktV
Kg6WpMSXTWbfmltvNKBVyr0cRe1TFGXgs2afNce8E9i24i+D6MLQUFIKfJv61cIB
nnd9swDUqJLCRjLVwRx/rV3Fsd0sRRuexOACVsfv+wN+Wy4qQWxAW90MakfyyQ1y
pPleqCBsmsxOpdE5qKcvy4SWm2KkdTODyZ/wQ/f+lSVM22xqiWLihhnzrc4Qe0jF
4GXxbymZqmfZl9QNJt4poJCD/gO4Dw==
=uP7F
-----END PGP SIGNATURE-----

--Sig_/HScrxUH+i7hEBmNz4NBuy6A--
