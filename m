Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D893452E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 01:55:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=NkqhUNbp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPXqY3L6nz3dD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 09:55:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=NkqhUNbp;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPXps2c2fz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 09:54:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721260469;
	bh=XKKG24LUHfwl+S6Lasz6G9yozksEgNION8fi9ihfAwU=;
	h=Date:From:To:Cc:Subject:From;
	b=NkqhUNbpWVtWzkOx0BkPMwI5r1NPtY4WVHsIvOW3PJAZLrS0YVrgAWd+QEDjL+ccT
	 qwZFdXdossa0xfkPir2aALQ4l9BD3wnFq8x1A/QyzUS0PCCycE7UO0Nx7l3JLiPEh9
	 5eSSdgN6bXwUBI1BwcqhWWQIwf9f+hQ1yo6+1ZgsyCkjq19y3UP5GyoZuMluemRNx9
	 EQerT9EJpRpFK+Q7+EJeTqHV1iji3w87mut8vgKwhu4XE8HGRdYgzmsqTCuV1AQVqg
	 2f4BfA9VeCnPr8JjQtYhuEbTQ54QLrzkxwEmi38DSaxPcyZIpfur4HvmVV0XTflWp5
	 lHW90Dajc/vvw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPXps0QZXz4w2Q;
	Thu, 18 Jul 2024 09:54:29 +1000 (AEST)
Date: Thu, 18 Jul 2024 09:54:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Borkmann
 <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii
 Nakryiko <andrii@kernel.org>
Subject: linux-next: duplicate patch in the powerpc tree
Message-ID: <20240718095428.56145ce1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//jK+5O_.IB6DwYZQ1hxVMBz";
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
Cc: Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_//jK+5O_.IB6DwYZQ1hxVMBz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the bpf tree as a different commit
(but the same patch):

  358492fc426f ("MAINTAINERS: Update email address of Naveen")

This is commit

  afcc8e1ef7bb ("MAINTAINERS: Update email address of Naveen")

in the bpf tree.

Note also that commit

  e8061392ee09 ("MAINTAINERS: Update powerpc BPF JIT maintainers")

from the powerpc tree is almost identical to commit

  c638b130e83e ("MAINTAINERS: Update powerpc BPF JIT maintainers")

from the bpf tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//jK+5O_.IB6DwYZQ1hxVMBz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaYWbQACgkQAVBC80lX
0Gyo2Qf/aP4pe+3KIej3vnuuDJZ0ucpzlphiDpk9T51qRvpQEn51tdj2M82xGRrv
01wigo+s4fb0t/BLDRgnJN2YjN0Y5U3IlBt+yWa1Y2JD9AHl4Ak0hX8uCGuPYJCL
oD9szYrpnGCEYVnQj5KMbHCCmiD5rDSPZMwgBBlOLcARliXg9QD8YdtAv7lyUgZH
Mjp1mpirRDOiAqnA2TsuCNPuUyJody3IwTEaijJpqYI0EaoXbbCFqM+o68avIGNv
ge3MSdP5rRSwFd05C9j4IMEoBJ0GeNEN9tPtUw99MZUM+TevGnTykbneJZcLD6cT
JeNw7oSC0VYsz8V+SIKPWNeR9ixRYg==
=3S5l
-----END PGP SIGNATURE-----

--Sig_//jK+5O_.IB6DwYZQ1hxVMBz--
