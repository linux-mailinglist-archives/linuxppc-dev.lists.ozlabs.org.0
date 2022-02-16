Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A457A4B81AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 08:40:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz8xZ146Qz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 18:40:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=T7F2dfWU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz8wt0sZgz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 18:39:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=T7F2dfWU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jz8wp2MpBz4xmx;
 Wed, 16 Feb 2022 18:39:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1644997162;
 bh=/U26tJeBObEoSC1s/7fYtLsQMr6peiXOynlsTU8O4ug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T7F2dfWUGkcnCrUoqK9sQLyXwB14aC7m5Jf2qLgh7EeLYX7ubDbsnYEuY9/cMaNxJ
 nWRDecWsFs1koim391WeGnuLLAhSPUM8p9F4NvG5Z+M5g2GSabamxiTJ3DtDRuUfvk
 +2ZTTXbGnMNHH9MW/5BOGMUbQ1FizuC0q8c/liEbv3U1UaphQ8899KrTGqA+a60Rod
 gyLo2gmIJ8BlLBZcj1E66T8tOoE3VFYzP5NPvx8gAeRwrVjueyV82n73lHl6va3sFM
 hlECkUTfJlR40yIv4YVzRZIKHEb2jPG2qNNytoFJ7VMFSEA4lOloNNhZ6WGvUd7qXn
 4hfLn/KyguRZA==
Date: Wed, 16 Feb 2022 18:39:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [next-20220215] WARNING at fs/iomap/buffered-io.c:75 with xfstests
Message-ID: <20220216183919.13b32e1e@canb.auug.org.au>
In-Reply-To: <5AD0BD6A-2C31-450A-924E-A581CD454073@linux.ibm.com>
References: <5AD0BD6A-2C31-450A-924E-A581CD454073@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F5rO7n/nNVGQuknA.HyUWHz";
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
Cc: linux-xfs@vger.kernel.org, riteshh@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/F5rO7n/nNVGQuknA.HyUWHz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Wed, 16 Feb 2022 12:55:02 +0530 Sachin Sant <sachinp@linux.ibm.com> wrot=
e:
>
> While running xfstests on IBM Power10 logical partition (LPAR) booted
> with 5.17.0-rc4-next-20220215 following warning was seen:
>=20
> The warning is seen when test tries to unmount the file system. This prob=
lem is seen
> while running generic/475 sub test. Have attached captured messages durin=
g the test
> run of generic/475.
>=20
> xfstest is a recent add to upstream regression bucket. I don=E2=80=99t ha=
ve any previous data
> to attempt a git bisect.=20

If you have time, could you test v5.17-rc4-2-gd567f5db412e (the commit
in Linus' tree that next-20220215 is based on) and if that OK, then a
bisect from that to 5.17.0-rc4-next-20220215 may be helpful.

Thanks for the report.
--=20
Cheers,
Stephen Rothwell

--Sig_/F5rO7n/nNVGQuknA.HyUWHz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIMqigACgkQAVBC80lX
0GybqQf/Znp9S7J2S5rKJCZC7ffvJEWf2lboBJaUiFkjtBS2vo6P95yBvM9ELy+k
L/pA+O3xkFZUR9ZqjusfI9X2Iz5mlJ5vIuB+ZT3mpQLOTOc1J+T6EAu1tFpl+C4P
UPx6Q+D2E6N6UzqTlrB0oOz6hoZCseJm52rp48ROVWwAWo4zZRDb4+sAzDmFKf5U
IIyTPQqM5GOO9vUiv6oCqjzLQUT2DPs6GyNhMhLl6PbhWo/kJyAXKebo/LPYGW98
/QozNc/68QA5ZZ+A6wfUUPNSzLAZPGTLL1n+tWcOVhKXy8NVrgZYo1B33ltrh4tK
kdrHFL/mxxNHa2Ty9kJDkUdvI+BP+w==
=yi3b
-----END PGP SIGNATURE-----

--Sig_/F5rO7n/nNVGQuknA.HyUWHz--
