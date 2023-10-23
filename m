Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E227D418A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 23:17:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=sgAr1vkU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDp0x21Gdz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 08:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=sgAr1vkU;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDp041Nzwz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 08:16:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1698095778;
	bh=D0yeEwspGZToug4I7VXU9FlsdciqujVRt9xPN/1plGY=;
	h=Date:From:To:Cc:Subject:From;
	b=sgAr1vkUsV9ffQaMOa/LFgd6o8m62W1M5pgscbs9OBssSqY1i3FfogdYJ1dwhgV9B
	 pE807wl7OKmD/t+xOACig7k6tEXAptgMmQAAyq9I/lM7qWZsuMreQpQNTSFHLIqWP3
	 hfvXfrFLKKmjNENJ1LncE2b1pybZBa3Je8XnjH8TYQgegUg5vK3sTvAMZ7lVUo9fSQ
	 TBya1HDStcHdV9wtuH4FRoD8BMzqLB71kLeKzPoB+QqloC1LcdiTMEuaTEqqqtZjIs
	 ZQtQRsGHpFAH7dWBi5MO5Wo6XtP9dd9xeZzzIHUMPV/pfE757JBXU4ELtas5AIAk8D
	 263FGfSs4XAOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SDp023PDtz4wcJ;
	Tue, 24 Oct 2023 08:16:18 +1100 (AEDT)
Date: Tue, 24 Oct 2023 08:16:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: Signed-off-by missing for commit in the powerpc tree
Message-ID: <20231024081617.686c086f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0pV_NK7c99nPUcyLur.Kr.z";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/0pV_NK7c99nPUcyLur.Kr.z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  351a050f602d ("Revert "powerpc: add `cur_cpu_spec` symbol to vmcoreinfo"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well ...

--=20
Cheers,
Stephen Rothwell

--Sig_/0pV_NK7c99nPUcyLur.Kr.z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmU24qEACgkQAVBC80lX
0GwGkQf/XJ4Mm38KSnnVJwtJ35imsiLP52PcHsITty5kXz/JMQrXjZYJv11bF1JN
HNt/iRC1RE440GhIlMgh9YvuewjAFfRAm1bCAXOqP3XuAYsV5twrN9hdIbyZnfWP
HWG0fnQpWzAGwyR8oMAz2aKyML6gFP4ITsFSeEd0p6EhIJkMlGoVYeqYLXX9b7QK
VXAsAsUZ/P8i8Dw54nbkGrqQKVifsAhXdbcskdsd/0Hwp+UmbPjsiRBF4VC65/aP
HmzSiUiSe/jwVDYBkgVcq0acFhVcucH6+Y+NdnboLfKpG/I744k00j8XpAWyr173
whitus6X0O8SFuqWu7GyDkkkhTq0Gw==
=VW7N
-----END PGP SIGNATURE-----

--Sig_/0pV_NK7c99nPUcyLur.Kr.z--
