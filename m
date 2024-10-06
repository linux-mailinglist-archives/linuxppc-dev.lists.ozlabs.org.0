Return-Path: <linuxppc-dev+bounces-1772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ABD991CE6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2024 09:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLtXL13t7z2yVj;
	Sun,  6 Oct 2024 18:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728198178;
	cv=none; b=QF8NpoXJHyghezkzRz1+WDE81N+bto6jcp68jmPF+1B8pebFN0gAEZs1r/MZJnCywicp2JZ3Ok7z8TXodYM2zJiaDTKekaKWy+TRYHkjz2DIPrjl09dfb9DdM5MYlknfys68oY/nx6VZlC/dVGmaVriJsx6v5AfK/2UfF9YK6gFkul7A9kx3i4P+zWjB+pppBSH8G1msTzUYFmwcCrjPtt12E8T6cvjLGTKCSeVLC7Lz8I3SGUbrpW79q5n/5fs9vpud5U4GHd8C5jsoedyqw//zbTkfe94MqGAKwj2lvIvb9FHKh9j3QfjQUNfXfjvaawAGRS99VtgVU3UNL9LzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728198178; c=relaxed/relaxed;
	bh=U/EQGoaL7JZxS1pYk6j6uqf8Pcy74sEy3785WNTe6kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A1GIlDtcww7tx6EB/46yjv3IkEBDtpdaYzpqAjeWsA/LrbO4vfNbRDV/6Avv7AMoAwuC0P47BZjT1PfZqfOuqQfZlevWP1pusFC2bpIGcZpuPU8fBw/Kwuwri1e1l0ShMehBqBfbNnWo/yW96rP5LacSM1qHa3oIkU55R1WFiXFnlmVhJgyXLacB32siOw2hmpMt4ky8Vl+KVIcZEOknJrTLJ5WwphTvycWLoNrEyxuve91H81lxPyFGxUSil5Z01g6K0ZMYAWyeWCZf0gp8GAG1ifjFbwcMwOHsVe3ORShmjb1NMR38u+T3tOdNkaMuV/THtwZHGoymhjbWeqJlyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NDyjSmwy; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NDyjSmwy;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLtXH3xpFz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Oct 2024 18:02:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728198170;
	bh=U/EQGoaL7JZxS1pYk6j6uqf8Pcy74sEy3785WNTe6kg=;
	h=From:To:Cc:Subject:Date:From;
	b=NDyjSmwygkBHYeM0t5dP7EbGHj7aulY8BHUVRL4ZvqCxaK1jhSjsmBtqcbOvR9tpg
	 oeguSOCC6QB03S2bQOVJB2QUwFkq6OIP/5Tc3/yB5OWdoqdApDxxm/sV3f7WDH8g7Z
	 OdpLNlH/a4FmR05cF+4dLq8xT0DL9SdawmAlAHNv2jFBAh4nteMQ58g7R1/KIrBntK
	 Psn2gkR5WvZqXOOZVt47dPUh5Fy5Inu2f9Rid2fri0F+3lTaiHjjMdbkdcSNvFTAKV
	 YoIxXiXzg5XKSjV2taATHU0h9t06nJYA/oRj8pBmBsEW4K5z7I0Zv78TBcZMedYA1+
	 jC0Fb3TSaYh3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XLtX92kbRz4wxx;
	Sun,  6 Oct 2024 18:02:49 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jason@zx2c4.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-3 tag
Date: Sun, 06 Oct 2024 18:02:46 +1100
Message-ID: <87bjzxlnmx.fsf@mail.lhotse>
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

Please pull some more powerpc fixes for 6.12:

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-3

for you to fetch changes up to 4b058c9f281f5b100efbf665dd5a1a05e1654d6d:

  powerpc/vdso: allow r30 in vDSO code generation of getrandom (2024-09-30 19:19:43 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.12 #3

 - Allow r30 to be used in vDSO code generation of getrandom.

Thanks to: Jason A. Donenfeld.

- ------------------------------------------------------------------
Jason A. Donenfeld (1):
      powerpc/vdso: allow r30 in vDSO code generation of getrandom


 arch/powerpc/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRjvi15rv0TSTaE+SIF0oADX8seIQUCZwI15wAKCRAF0oADX8se
Ia03AP9Wmr2WQ9B2Ei8oQMJBIZkPxkdnqG+K98O3ggFZv8Qz3QD+NgQXIYs+Gvay
5Ql5F5hp1D+KepgXmJJsGVhql2vrMgI=
=vwqi
-----END PGP SIGNATURE-----

