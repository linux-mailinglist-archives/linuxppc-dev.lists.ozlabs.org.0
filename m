Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FEE314E71
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:51:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZh6l1Q7KzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 22:50:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZf572q29zDshL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 21:19:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=TS+Xn5Hr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZf562rbmz9rx8;
 Tue,  9 Feb 2021 21:19:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1612865962;
 bh=O151gfDDdxSnbws+w5Gl/2M/gAxACw1PS+d+7Fwc/dg=;
 h=Date:From:To:Cc:Subject:From;
 b=TS+Xn5HrWhjfN+wQ1BlEtDfB6vTMI4J9eJkOpjIVbggn366im563T1EfJjN+BLlzf
 2gi+jo3ambUWRff+PajW9Tu4iCHa6Gjp7a2FTH51eiZwdeJ2nJuqd8kPBHoW+eQTKK
 nCgM/FcYBbsYIspZr3dowD9Z1Z+STEKCWdq6np3f3GszDzPdDnjOXeS3TCtQUCAJyb
 BLbdLezSOXIEfysnDERHDHLeuL+5ddOgXE06SKSC7gIgSRd/GfNi+CeYMwZQzRmP7Y
 XgHhsPrdfVARDTg8GtaAbepekXHpNSFPTLPCfUFgjpFxkcehPIt5xR0GhbpyH79IVX
 rTnO0GVP1M8Aw==
Date: Tue, 9 Feb 2021 21:19:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20210209211921.777e3053@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qgUhga/cX7TmqXbGpC=4w=A";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/qgUhga/cX7TmqXbGpC=4w=A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x0): relocation truncated to f=
it: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd sect=
ion in arch/powerpc/mm/fault.o
arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x8): relocation truncated to f=
it: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd sect=
ion in arch/powerpc/mm/fault.o
arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x28): relocation truncated to =
fit: R_PPC64_REL24 (OPD) against symbol `unknown_exception' defined in .opd=
 section in arch/powerpc/kernel/traps.o

Not sure exactly which commit caused this, but it is most likkely part
of a series in the powerpc tree.

I have left the allyesconfig build broken for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/qgUhga/cX7TmqXbGpC=4w=A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAiYakACgkQAVBC80lX
0GzODgf6Av3auGL+x8wwz7etJ4YrThQzj3Q3WnEYs/01uB6rUjwanMOKk26gwIbd
vJIaFavzViS6MSyTci0bm/VY1kDNGkZHpeluF78dnMbUVAeHxKA+NLw3/Ha0TEjs
y3a8JB5UoavVSga0eB2d5Dlqfzbncxcah22eChlC1D0yUKqbU0h/6NtwuAATp1xU
WUGTEROUjigx7yO+Rb/me+41hHfpNTmDucIFT6jeFXeLAi4322W+WFemBIKQiIdf
Vh/NPzs5HkhvW5hvOn9Pn3t1kJzMCGMO7yNExMFY1vc8IOj/g+g9b53FM7DZdcRt
yuLEAHl3cvVmDfJu4kll/cnG742KwQ==
=mhS3
-----END PGP SIGNATURE-----

--Sig_/qgUhga/cX7TmqXbGpC=4w=A--
