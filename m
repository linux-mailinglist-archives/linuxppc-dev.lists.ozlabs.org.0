Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DF7817AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 08:31:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h2Blb2+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSTR666DQz3c43
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 16:31:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h2Blb2+Q;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSTQD37VPz2ygy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 16:30:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692426644;
	bh=1NjeSLQdeMsoj1eyDCSseNAPyJoFa4K6nn0or+ADByE=;
	h=From:To:Cc:Subject:Date:From;
	b=h2Blb2+QXoUcOt4Uuamm4WdcU+4D2bh+c3BtsVlPgNCo/9HrQoGYp4OdSp25Z6tK+
	 Z1q/KSz+WaMXScwHLX/Hc/lyxb5pHdYdzE7lae4jukNKSwic2bqVM85ZsqIWtKclSx
	 m5HAi4PXgaBEC9AFn/E94xdbRBRX3S4WOE0gf2SI4U9TeIuR4sUMTv+Ss7i0XnFeHJ
	 3+DJ1fLoBDAbluJ84v9C335h4gj4j0Jairbu2kCfJmzy0/JNZUvde6Qsaj2SrY1/wK
	 t74mBW9jWoHlDsBo3wJVm0nkzjWLPx2Gnndtj13dbqYpmAdzZT4DtGghGSmO3oyx3S
	 OzoXVdeagn1/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RSTQD0bwCz4wb0;
	Sat, 19 Aug 2023 16:30:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-6 tag
Date: Sat, 19 Aug 2023 16:30:39 +1000
Message-ID: <87350fwnlc.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 6.5:

The following changes since commit 86582e6189dd8f9f52c25d46c70fe5d111da6345:

  powerpc/powermac: Use early_* IO variants in via_calibrate_decr() (2023-08-02 22:57:22 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-6

for you to fetch changes up to 4f3175979e62de3b929bfa54a0db4b87d36257a7:

  powerpc/rtas_flash: allow user copy to flash block cache objects (2023-08-17 09:46:14 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.5 #6

 - Fix hardened usercopy BUG when using /proc based firmware update interface.

Thanks to: Nathan Lynch, Kees Cook.

- ------------------------------------------------------------------
Nathan Lynch (1):
      powerpc/rtas_flash: allow user copy to flash block cache objects


 arch/powerpc/kernel/rtas_flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmTgYVoACgkQUevqPMjh
pYCzLg//VBXyEY+oJw4Oo4WVWTAlfCTFMOm2LmF8WodgbupH/x2CUYtSENdIBpIc
Qx1gTLrxfm+MMl95itp2qJLXszTenWTKWw66oSTtcJeN44K//jWznXeQn2eCpXx2
dJuuiXX13TKb/i6IOjrhEYTAjfJgS3eU8bCrAhjXMc4l6Jcczox199t1uskpUpAV
l+J3n+tYT+1tOIMLKDp6Awc3U0sS/bvbEV6CQoTe7a5R6QzSiG+fKY5fowuO2von
rwsSpHujmBsZviitAOPLEhMT+NEuH2iBwKRQjR2NXAGujV5wqoHsOh11vjs/tsKw
oSdqmYcwOuvNKpud1V8yXDZjXvzcZJxtYNdOIg89IRN0MC/AeN6NfNc5m2z8duNU
DpGAi2F/v76uqICr2XXxMEbCd7Rz9GBsSOtFPfyUeE01r7c73OaRw92d9MWM/Jcf
DeVwVVm1XD3dMw7LY4e/OJTuBhXUSwMx5scexL49TBKQ7fIKc/+YdI/oMNoDXYGO
iubNpjZ/N05Yasj3teIIwGo4dA3kt58zfl8STj/EWisMDs8AARHpWwE65h96GsS5
xR4eQ9yUpk5F1eUozvKZDJgVDs97jF1bXuKtUhcKRZf6ZoFlqRozkmpxD2aO4qEu
e2vR3vKkciN4M5w7BuyMRWY3nc3l9F86DbQymLBQ4HkLHL2jWdw=
=pTpH
-----END PGP SIGNATURE-----
