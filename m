Return-Path: <linuxppc-dev+bounces-1582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BC985726
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 12:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDCfY4ZdYz2yGY;
	Wed, 25 Sep 2024 20:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727260213;
	cv=none; b=c2YKAAyHxm1xWtT2mX+iY1TEephkHHeJQZVNSJWcbadK0MxJJSd5F3xlfdrBwxox66ENtdDPXwvkTUWtWGO8HZyJME++28ejTPzuy20lT/gTqVFtRjoUsWw3nmmky7+SBp21UCae0bnUyYoCgx0/nnK3mvVqZJemBwQYaei2qUDDXYZL70s3W98PeGqKIghRHNFW8W5xHZhXI+/S11yIwbUEO0dJzfVEHxvlHl/CE8PCSZaarJx7NCMLNfA7dhnOh2mjshTJmh7w46yJrQLR5uBu3udhTUiJHfRo4j2P/XqvtEgME4i2eLUTB/Z1PKPQeIr98YkEuX5FcnutQwmk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727260213; c=relaxed/relaxed;
	bh=E4Bdh0fNaTtFYe9gHjWtFQgG3/q6LHFdqIPWSQ5Uy+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QRgl9QeYmtML24kyjabvx62/NOjZVs3K3XSnpcFURE6p4cMOXQLViTpJz4GKf/ArsXbCesgldkN/9QPtVYOoXkF2djB9NpBhaSccZ20nf+icEcfKWTvhNvZ5xtvHaC19hLF25Jbxug+jLZL6YJcC7VLRuMnwZDiDkUAM2So7pjMVQeFNuDKAggP78xTJI26D004/1CZxOscJOfYSxRJC4MXBJc7jMNjRnP1n0E0RJW1Q4nFpVooncx1UeoYeJyWtK9AKLWDqh30FH+tbnxNTbxAhIcB2oEJpBRHtw66+Jfx/HM7hH2iumw83VEOsB+hPbwknudThd9s395e36UwWMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PyLAOjHP; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PyLAOjHP;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDCfX10pXz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 20:30:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1727260208;
	bh=E4Bdh0fNaTtFYe9gHjWtFQgG3/q6LHFdqIPWSQ5Uy+A=;
	h=From:To:Cc:Subject:Date:From;
	b=PyLAOjHPpEPQxbS4uQKvbxrx0b0o3W1oDUQ6ZfSML3MpmrcUnwUOCmcFx4Gn6uidu
	 Che+rcMAvAYhPGZuoOHDRQNjUMid3rwiJSxCt0qaIXLh1aGCsTDV+Yvpco5jSLMO1Y
	 zWuW22vQBU7DXL/RRAR8KaxkXM31ly43NdRQJrkugaJtsOBVxlVyrmhGXbjohMDLdv
	 Lq1JhOxQ31qqRC9VANG8mG+1pIDhc52HL94FRU7riEfHx/FTuTISe5o87D8HGt2NRt
	 4yTfnEXpMX5z5mj0FLyoTUYgq6MW52MBChN9rqNSDynPDtsy6HF07GeDhJXWc9ruLy
	 gVVVf9tNtFqqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XDCfS45klz4xGl;
	Wed, 25 Sep 2024 20:30:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nnmlinux@linux.ibm.com
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-2 tag
Date: Wed, 25 Sep 2024 20:30:08 +1000
Message-ID: <87y13g10wf.fsf@mail.lhotse>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull a couple of powerpc fixes for 6.12:

The following changes since commit 3a7101e9b27fe97240c2fd430c71e61262447dd1:

  Merge tag 'powerpc-6.12-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2024-09-19 08:03:00 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-2

for you to fetch changes up to 3af2e2f68cc6baf0a11f662d30b0bf981f77bfea:

  powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block (2024-09-20 19:06:25 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.12 #2

 - Fix build error in vdso32 when building 64-bit with COMPAT=y and -Os.

 - Fix build error in pseries EEH when CONFIG_DEBUG_FS is not set.

Thanks to: Christophe Leroy, Narayana Murty N, Christian Zigotzky, Ritesh
Harjani.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/vdso32: Fix use of crtsavres for PPC64

Narayana Murty N (1):
      powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block


 arch/powerpc/kernel/eeh.c    | 198 ++++++++++----------
 arch/powerpc/lib/crtsavres.S |   2 +-
 2 files changed, 100 insertions(+), 100 deletions(-)
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRjvi15rv0TSTaE+SIF0oADX8seIQUCZvPl5AAKCRAF0oADX8se
IXFDAP9VM7hzp0mbUtc4IgDC1yXVhIyeQnn4iZB99uplOl0rJQD+MAr+QY1YMS/d
8xE1RW8os//z8VJ+Kfq0JIWxKxqbrQw=
=Jokt
-----END PGP SIGNATURE-----

