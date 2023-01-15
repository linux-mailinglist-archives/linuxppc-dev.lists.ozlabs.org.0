Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED666B078
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 11:57:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvsYv4C87z3cBh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 21:57:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iMxfDIVs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvsXy6NCQz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 21:56:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iMxfDIVs;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NvsXt4WL2z4x1N;
	Sun, 15 Jan 2023 21:56:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673780207;
	bh=Oumi9CSr04M3uUu7seP0t24Gs0vaIvGZvsGd9wpANDI=;
	h=From:To:Cc:Subject:Date:From;
	b=iMxfDIVsp+Qa7ttF2qpv2kSlt+dbAfDm5cw98RJN4BPokknie/Y6TmAngTfVHmgoO
	 QclqaBGCaKNJ0jjkWDgIP1GzS6djg18kzSzrNWAvaJy4CerUS/eGUwCXvR2kpzSP4L
	 AGu/Ok/AclO0ShQ2CO+gmZIb3Je/BImupgQW26b+UxbvBpkM3z0my3CU2X1kqQTBlx
	 Kvarn7+ms7CbEXkQWGZFT2xoq8AiA8lKC9Jg8ogqP83fnfxthzN5mIiffi+v8Ryptg
	 7c7TIQyOP7nMCiT54EJ4OX+1vkbHGzA7s0iN4fbX9wN2ajP8CqaPQMMezhFJCFgCuN
	 +UoAy5PIXeMaw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-3 tag
Date: Sun, 15 Jan 2023 21:56:46 +1100
Message-ID: <87pmbg9ic1.fsf@mpe.ellerman.id.au>
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
Cc: kjain@linux.ibm.com, yangyingliang@huawei.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.2:

The following changes since commit be5f95c8779e19779dd81927c8574fec5aaba36c:

  powerpc/vmlinux.lds: Don't discard .comment (2023-01-06 00:25:12 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-3

for you to fetch changes up to f12cd06109f47c2fb4b23a45ab55404c47ef7fae:

  powerpc/64s/hash: Make stress_hpt_timer_fn() static (2023-01-12 10:53:37 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.2 #3

 - Fix a build failure with some versions of ld that have an odd version string.

 - Fix incorrect use of mutex in the IMC PMU driver.

Thanks to: Kajol Jain, Michael Petlan, Ojaswin Mujoo, Peter Zijlstra, Yang Yingliang.

- ------------------------------------------------------------------
Kajol Jain (1):
      powerpc/imc-pmu: Fix use of mutex in IRQs disabled section

Ojaswin Mujoo (1):
      powerpc/boot: Fix incorrect version calculation issue in ld_version

Yang Yingliang (1):
      powerpc/64s/hash: Make stress_hpt_timer_fn() static


 arch/powerpc/boot/wrapper             |   4 +
 arch/powerpc/include/asm/imc-pmu.h    |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c |   2 +-
 arch/powerpc/perf/imc-pmu.c           | 136 ++++++++++----------
 4 files changed, 72 insertions(+), 72 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmPD2sYACgkQUevqPMjh
pYDoDQ/9Gl0mGDGQGjbOz4iYKHhlqEB9vWq7NH+++tTSTIUHHuKOPHRWHgZKM+FI
6wxBpc0yU013oyqr+CcVP7NGYSry8pNG5kjC/GxyXcHBNcrmV9QEAYRs4Uo8qTU/
g1IZjrzhaxb3wlKNp0GiwEupGh428CkyziFXKndR9i5uryyzZnupmuQjig3fc4dt
ZyqHcK6LKzlgvKgSI+iMijBKvI2hDszlIp+/lkB2H3+9/ORSid/bVhfRuVIzJeum
B5cwN3BFnVZuRPtJMSIpdyHrDV5Yak6rkWdWB00NiHptZb13/wgytJwUuBPwnDRU
qQYYJwMC9vKTmFGB8h0crC3MapxSVWeXb6OfJGtgdKieLdaFrVV343n699KiqWJD
/pjBROJg+kvoR+YKgLVGvef/Nqu0cFI6wVB2JhjRJyuFuq81kXe4Va/CB6HeFKOJ
cgr4fBPuxoSY6JRSGJ767ISrRM5K6pKSUUBDtLX2B9Qbyfq9+klu7tlU7cnsEzYr
OuM90BE3XrrrquhCLYH7SO5QBbDiUSFP18Dp8ZizhyYjj4GmY8lmKlk/pQAAlwgw
udDABrN1gFl4iAGkSAN1pd4YYfHyWOwo+FATkHhvqO1Jg8VbEZQyy8jBCwgKFTYg
wHhUVYTnF4dEVUTTADbGpoYNppMzW/6yazZCBC8e2EaGq+o8+/Y=
=Qdd5
-----END PGP SIGNATURE-----
