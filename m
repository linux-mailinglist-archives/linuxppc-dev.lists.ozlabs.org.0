Return-Path: <linuxppc-dev+bounces-2162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D3799B7AC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 01:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQzwT6dCXz2yGX;
	Sun, 13 Oct 2024 10:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728775177;
	cv=none; b=KvBZVD3Ag7RS0YRDDZdG5kTwIeFU5bbi5y+8qFpyTQsYzFbgAr5E3oaPuAjXxxst3UfDUhTG79CsB7C3gmmhlLefuuVhGDFXjuyQcSXuEaV5BNFQ45RzNq3eZuJORCbrPNjX9Mzkz64TZp/PAJhu8YHNEcsOwbftJe0Xr3ZCJuTECb8eFmfKdubs0Q21DSBFSwcYHgQ2F/tgcq0Pu/zj6+KJ5r+n9eDTj6yDJXj46FB0r4GUt4d/YJYZSpmDWEqEHVo056Ldco66e99f7P9XLfDaRPJEzBEmI56KFoA2tFwsJIOxGk2PCtGecCOpUVvanIeH6ooM2/hsFPl7E7DMww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728775177; c=relaxed/relaxed;
	bh=iPe6bARDbmutmL/3UO+PHaMpdoI/drRBAgwzRmjlJxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XqHXOtDhjcaZtOvzcgD9+DooV/SNF3bUl/i9jcn/IzaLMvRfTlk/r6sgDrg5vFp9S45Udz9lWK2dmpZ4ec5rOqWOMKL0bcah+0Pop2VleRODUaBmyfhoUZFw2pARLO6oBKQ8fQgmIVnyvGKLO9nwjoiYy+5PVpmwTHoPXt1bcolj619WYG/nD1ZBLmTPlHqxmWAaoZawzwD17ZS7UFMd0RpgmokhDD0eUG4+kn6BAEOlyGhTAPvV2dF3NUINBubB7LXqfGLlJ7zf2M00TCVjSxw80yEeAiKfybLHvRSRyfGqePusJ4vplaobYetWTmOwDKXtkO4ocf4GD5iiKWb9Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=INMHSXTR; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=INMHSXTR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQzwS72RBz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 10:19:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728775172;
	bh=iPe6bARDbmutmL/3UO+PHaMpdoI/drRBAgwzRmjlJxw=;
	h=From:To:Cc:Subject:Date:From;
	b=INMHSXTRcx1fU9CHXGZGhH70HQ1sy0kCKGE0AtZJyVnnwhwJu03JaXfh/Rb3apAuI
	 nJZ7wtjyob94jH6RSzZ2xkcoWgie8SioGYgGoRrxHzofY7gK/tJHlX64ylPd4rm/+X
	 p4YiCSctCucgN/CeB4e77OnlcPPv0ZeK2vGNJSo9IsIHWIgt+HjHP8+rffBg0YIot6
	 QNG3eBulue8sfk9C2Oeq5V0Eaw9BaszRawvsCSqSfuW/FrLntg1+To6ZuhFo2lKgY2
	 ssHiaorVKP7tb4VEJSskNyJ5XPosXEVUd4pL75sUUMY1+V/2Z/nmY0Swl/vw97A0Pc
	 3TIYrTvbiWB6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XQzwN1KN0z4xG8;
	Sun, 13 Oct 2024 10:19:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-4 tag
Date: Sun, 13 Oct 2024 10:19:32 +1100
Message-ID: <87ldys6ha3.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull another powerpc fix for 6.12:

The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-4

for you to fetch changes up to 8956c582ac6b1693a351230179f898979dd00bdf:

  powerpc/8xx: Fix kernel DTLB miss on dcbz (2024-10-11 15:53:06 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.12 #4

 - Fix crash in memcpy on 8xx due to dcbz workaround since recent changes.

Thanks to: Christophe Leroy.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/8xx: Fix kernel DTLB miss on dcbz


 arch/powerpc/kernel/head_8xx.S | 1 +
 1 file changed, 1 insertion(+)
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRjvi15rv0TSTaE+SIF0oADX8seIQUCZwsDnwAKCRAF0oADX8se
IUiFAPwIQZD7X3Mpo3dgmVEJCGf+Nlk2ClikbZYQ4ylWKDt1GwEAplRpNFLhXioN
J1Jxc6kZ6s42alDWXfj0xVTo1/hsnwI=
=xWuO
-----END PGP SIGNATURE-----

