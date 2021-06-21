Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA653AF7DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 23:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G835T234Xz307g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 07:46:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=E6VlaECK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=E6VlaECK; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G835209D8z2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 07:46:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G834v0FzBz9sRN;
 Tue, 22 Jun 2021 07:46:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1624311983;
 bh=S6/0Qi4z5TKTKPxmXM0B0vXD9WBjbz+0e6y8TXbtUAo=;
 h=Date:From:To:Cc:Subject:From;
 b=E6VlaECKukA+RFAyp8zodssoZlI2RIPCQmw/HrWOOGUeaBiLAQiL0EdCXnTGK776k
 vbpK8N5IuQWXBYfvVqykHqiulFDDfGa8sLajeQXTEA3hpT1fON/M+9wnxl0ylBiHIn
 AFSsE/q5FZtxIXgW43hbFkAp3iZb3ZJ0x+MZBRduRlT9sQBzoCbZrt6RUvUTRD2ja1
 0UgOJJ+gYQXzkLxHOOOBqw+GXczE+/rkhuA79Vdn3hF5emxgnaBqmUdshQB09M5bWA
 S1AKTQf+lLWS4+savGpBMPI0j9SSlLMayIGbtQGyovJzYaOgbSEA0GkmWMGVBN63x/
 C3h56aLOPHGxg==
Date: Tue, 22 Jun 2021 07:46:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: Signed-off-by missing for commit in the powerpc tree
Message-ID: <20210622074622.4e483a33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Slxqo9uVHAQnqix+QUyApP9";
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/Slxqo9uVHAQnqix+QUyApP9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  77bbbc0cf848 ("KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and=
 POWER10 processors")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Slxqo9uVHAQnqix+QUyApP9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRCK4ACgkQAVBC80lX
0Gw2cwf/fmJTtzQJTvuwwEzz6EwNr8vkOovqo0p/hovjFHzI4yvJZpsn1EZSkeWh
KKaL3c+orVjfuqniDfj5OxOExNGL195zpdn8LyUOKOrYJeXUmC+lP6Gh7ntQBa3y
NUEqedfDnbi8Bhm7HLKOcuiloLJMKWGMazd7dDHNRmTJU4Eq08VRnhQLhZq159jB
MlfOrOmp5vxWLNuXk5HjvlATAWtnGaQMdzpp+OLv4KG55UvL5c3eSWuEfjYQG/po
FvTJ1z4erEB7ZvPZtSdHyRDfVm6VAlaO+U941woJF5hEBYCOLfr82Clcb7CLSdeY
/KQdWYaoDqPE3EtbEPZAI5C7+whc1g==
=GUe3
-----END PGP SIGNATURE-----

--Sig_/Slxqo9uVHAQnqix+QUyApP9--
