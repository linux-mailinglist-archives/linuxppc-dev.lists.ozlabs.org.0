Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 180D236A809
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Apr 2021 17:46:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FSsp015Mwz302p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 01:46:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=lue/F1tB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=lue/F1tB; 
 dkim-atps=neutral
X-Greylist: delayed 327 seconds by postgrey-1.36 at boromir;
 Mon, 26 Apr 2021 01:46:09 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FSsnY0dSBz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 01:46:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619365552;
 bh=mNUgiY3ZCvTubomcKeyL01IM3v/S0Tq+ZulJFJPviO8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=lue/F1tBJz0CVbZsFnfiQArNrn1xglFUrKICe3JRBvARO3OWctrB3AdHjcZWYiOHb
 uqpjTx1TpfE1GT8bWg9w4SO+o8UXNKjarY1QQgA+gAzYw2iA/QPV+H8Oup+iD2hyDg
 WWa/UfHMIg+O0XEy8kvrLjpdLdhco5i12l3ZzoQE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.179]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1lR1ph3Je3-011mrg; Sun, 25
 Apr 2021 17:40:22 +0200
Date: Sun, 25 Apr 2021 17:40:20 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: PPC32: Boot regression on Nintendo Wii, after create_branch rework
 in 5.8
Message-ID: <YIWNZI4YhFuRZwHg@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K5FWEIAeobTuCola"
Content-Disposition: inline
X-Provags-ID: V03:K1:+CHbAFE+tLU42t7JbPhk+kXqjloe9ENTb/DYjrvs2j0riOkqfxB
 tCMx8b0eH1WteIo5Doaf7z9K9J8Vw3g16l5FrMbZtrtYdVjDCYtu/SVfINXzMt5fliPnwI3
 cB2RLW5Y91aDZAfousK99x4y4JusZH7Ks9GYO7yKzSM4NzIh3dtFBSHg4LdVjYXE7dD2OvX
 tABLqbq0Qt0xQcuUUUEgg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dFLB9j1M4wE=:DFT/EC6nKE9RMQgtokN98V
 kKRIzR4an1/PmJ2MeoszTNys5PNDcUeZv+YPC7pdaN2+qEyYpEypjB42ojRCvXYow+ld/+Rm5
 LQVP9Qyuq3OnGNOCIuPBbL0cYlXcw/RrCAuhJBJvdynxwaC6OPW2UvDyUF5UlYNhTVafb4Ujq
 u1BUtFVz229XcYR7kDVlABvOQXzn1a2P4IuoGPJva/PMGPmql92Rlq7wp25AqDMA425Q9r80Y
 gEF4mL/f1HLyfkPwqMxIt5LOXVL4+OkitiymKh464b+Xe5ddd6VVvZvKFKJTHOBl0gbApYqm6
 ql7ICmAEqTEGp7N4gBBcK/Db42HwXQrG3ytRpMCLs6PHPCfGoMzyB8vLOPkWTqu2J9tP1wiJ2
 SL1iyab3R9vMGJ1BTGFDOsT55BFKSl331+5Q8IPNUsArF/z9H+L6EK/8anQfmitrSqtiSnhas
 pG1zLD0D5mT3MGaTyRJZDOYLfpNcIDRT4CJFsbatbp8shQPJl2pSzyMGBqE8yM29nyw6Tswal
 y6PiWbVhCRjcYA2yJuZw1mrte/SXImwYJ/G4Mla1NapgSZKebz+5qEzUn1nVtMgxPUS7b1d6L
 qOieZG8IbhSKSOK7XeS+1pJMe7EZYi16NvAnkBURa6Liu1JxULvdP+EF8h5qhs7f3I4QCgTeN
 5Bm4UlkxCyFdRxr9yOgTo4eX2Wn+gr9bsR6WcvN369xrkGK1wgs8oU0K6Hs5SZlJztLiy/vUV
 4j+/t8pimExizPexRB6Dj+VOFydU3GEaWAiXl+ze3rq2pH4V2YmrORYX+lQgSTlKHwQVHoq1w
 x1EvngG1gRmbgIMajs8LFqqL+WsdB/FvPkIuGzBUc0oSMWeQjBq8CdUtJRwSkIGIlAh03y/NX
 /9Rbb5uzU/92dDEgw1WrHkT4PHD/0k6cvICp4qokE/b4jHVE3Q7ntos5b/c/q+9u7qon5l5VA
 fLduxBMGTKltV+MJUWIwkmHwlOiBcK85jxglolinhyXEDlwiit1wkiWD7g28N+bT2OdMeFj0R
 h2QKn9jMDaj8RicBSFB1Glxhteat7LE8sBwAHc6Z1ZI4midLgKzcrUV53zbd1p1agtb/5LyvV
 BBTmx7l0x+iCfFZJ2jRZTHxqIl+VJ8GxnUINwU1rp2tHfepEOFGeglvcXEEcHKLIYcne/LUEi
 PAnjm+hn+X2ro3iVhzn0Yy6TH60iX0ls3FDgU/dbuu6XRtKSE0NiH5V39kmRovLcDugRqzIYL
 o+00pLvGMzZkcgTmB
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jordan Niethe <jniethe5@gmail.com>, Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--K5FWEIAeobTuCola
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I recently booted my Wii again, and I noticed a regression at boot time.
Output stops after the "Finalizing device tree... flat tree at 0xXXXXXX"
message. I bisected it to this commit in the 5.8 development cycle:

commit 7c95d8893fb55869882c9f68f4c94840dc43f18f
Author: Jordan Niethe <jniethe5@gmail.com>
Date:   Wed May 6 13:40:25 2020 +1000

    powerpc: Change calling convention for create_branch() et. al.

    create_branch(), create_cond_branch() and translate_branch() return the
    instruction that they create, or return 0 to signal an error. Separate
    these concerns in preparation for an instruction type that is not just
    an unsigned int.  Fill the created instruction to a pointer passed as
    the first parameter to the function and use a non-zero return value to
    signify an error.

    Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Reviewed-by: Alistair Popple <alistair@popple.id.au>
    Link: https://lore.kernel.org/r/20200506034050.24806-6-jniethe5@gmail.c=
om

 arch/powerpc/include/asm/code-patching.h |  12 +--
 arch/powerpc/kernel/optprobes.c          |  24 +++---
 arch/powerpc/kernel/setup_32.c           |   4 +-
 arch/powerpc/kernel/trace/ftrace.c       |  24 +++---
 arch/powerpc/lib/code-patching.c         | 134 ++++++++++++++++++---------=
----
 arch/powerpc/lib/feature-fixups.c        |   5 +-
 6 files changed, 119 insertions(+), 84 deletions(-)


Do you have any hints on how to debug and/or fix this issue?


Best regards,
Jonathan Neusch=C3=A4fer

--K5FWEIAeobTuCola
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmCFjVoACgkQCDBEmo7z
X9s8xRAA0jP7TtVl9ECStpklUJYouRghXCPGEp0aTb4xYKVqS87i3tX+BBKqSvhw
N8H5l33DiboZkqy14UETvz/m9Ta2kcBl3TskF4zHQG4fKTb+OL4on/rO7muxNTCU
/yxYeikedQ0ttjIxYjrQb2fd1PuHMHvsiBgAL2kO4SP2I6W1GnqRuEOMXcMai61h
JYE9jR08ZouqNuQZiuhZitZrpvzi0VQjCO/uI3e2O8sVmZwg1Om6gnQ9u1Lu4dEu
/b8PHFOABoZiFsod2NTfi4M626Q4cudatd18f/x93Eyo8ErmF7Jn2YPQXgYXlAEs
JWFiWfVimPqcJX3drO25tv6tWyROmw+w1XTZ71H55YL/eUhr+A+DKM/bWn4gLklm
4e82qVeEArj127DeyB5/t62WVO1VZhpnDYlvgUScmtDHlEoQ+IeEExGYp9pcdFoN
Sqe3Q/94vuEr2rewvNI+s3T8jkMHljxbwVurOMFZJTqX4TMonB5075xvs6BIq4GR
5OacmkMsAGDWW4VdpdUgsEJ9bL9mImqZ/O7632Otmvwl9zrSSdHX8tp/oUZ+tOkE
6g3ULVAVAhN9B1cbTtNvQ8sjVt+T6b/udNlcR5xTzUKEIgtLNrYHG6lSVg/MtkWC
coF/ZiuyOBFiQQ7KIlwaksiyBVCCSHQKQdd25mvGFtyL0pMgDqY=
=6P8K
-----END PGP SIGNATURE-----

--K5FWEIAeobTuCola--
