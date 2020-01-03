Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0412F6F0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 11:59:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47q23j49xZzDqCb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 21:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47q21c1DzyzDqCK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2020 21:57:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="IBpkPEJM"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47q21Z5rYbz9sPK;
 Fri,  3 Jan 2020 21:57:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578049075;
 bh=bqSX2iDNAZgwCMfGhfx9ExOLwqxWZ1cAcPCE85PldsQ=;
 h=From:To:Cc:Subject:Date:From;
 b=IBpkPEJMkrn1edHJezOu0b+wDFqTTH54HDrK0EjjQmXm9z9eO29XzBrNFbBFenWdn
 nhO28xc9iIfJnGgDeVbnPmeocixV14Jn40A1ba1sagW8A3BnV2dxW7CSPG2yXPRNYD
 yofDyShDbuBbZzxvnwEgZ1QJVvddzXSVRU8g+UWhX+VnnDpaj6alDgxRvDNelh7NAf
 wN/S0Ivegb3xTLWk6DZ/6lvqN++LR9D3Xtw2pobW4ULTz1C/uMJafyUupv04sxapZF
 5lmbSMIfhhbaNc9MLbxrhCFpOnCiWjm0+yCA87KTo2tWyQEsdnhyROA9KnCH5S9K/e
 7VEftfsTbFkdQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-5 tag
Date: Fri, 03 Jan 2020 21:57:51 +1100
Message-ID: <87k168lscw.fsf@mpe.ellerman.id.au>
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
Cc: Jason@zx2c4.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull two more powerpc fixes for 5.5:

The following changes since commit 46cf053efec6a3a5f343fead837777efe8252a46:

  Linux 5.5-rc3 (2019-12-22 17:02:23 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.5-5

for you to fetch changes up to 6da3eced8c5f3b03340b0c395bacd552c4d52411:

  powerpc/spinlocks: Include correct header for static key (2019-12-30 21:20:41 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.5 #5

One commit to fix a build error when CONFIG_JUMP_LABEL=n, introduced by our
recent fix to is_shared_processor().

A commit marking some SLB related functions as notrace, as tracing them triggers
warnings.

Thanks to:
  Jason A. Donenfeld.

- ------------------------------------------------------------------
Jason A. Donenfeld (1):
      powerpc/spinlocks: Include correct header for static key

Michael Ellerman (1):
      powerpc/mm: Mark get_slice_psize() & slice_addr_is_low() as notrace


 arch/powerpc/include/asm/spinlock.h | 1 +
 arch/powerpc/mm/slice.c             | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl4PHf0ACgkQUevqPMjh
pYD6QxAAshIxGnQ7CfaqbjGRFgXCEEcOhJfR6+D/Kph43vzV5w4v/j0lk2mlydua
eWL1MGvbby1K5rRtNyFJm8+6bScYHxo/GSdsCJ+8UNMt6hTYqlzjn3IqQs0pWQKO
2kJu8/2TpUweemXDQSxWR9NqYuhj9TIKxlk6swdHBfUG/RvQOv+hRow1dPS1QzwG
Euu30QiezEvf2wq7OXbeAub82k243FrRDp3+dMfsXAcYxLlmCDJCQgh91uVIA3yh
PF8EuYbB8sqkJkH5wE2QT6cgssBwthrC9/J5/fVZnnyj9ObRJKt5sPMQ7WXG19D7
TcsXLkHZiwhnas2j7Ze9HFJ7R99lPSy182w8VoSCHjyPB72O3EYVS+7IwvcfnwEe
fBmTQUnR3ToByRig3TaErUZBSn2CSm3mmJTlXP38NOREExJijh92yfSeTlE+cdWD
1B7KhrQlsZ+4cMTX5v3aJXlx02zbghFF7Sbdll7qgjPcDGc+cOTX6UkDmMGLwCN1
0N78mX6YagjYf4Umh29uwwBJ7iXpVzHiSwqoZ79QVVUhAvU2TSvqUthCQZPLLcyy
ssT2WQ3xiCvwS33O5N6arA/1vxB4deUW7ZQbOzPo4tcKDKrF52LnfgWtdJKai877
RRD7jkKxBU0MPcZ4Ohamie/h25gAWDipbScrX8rlXh2zmoH/zB0=
=W3Ow
-----END PGP SIGNATURE-----
