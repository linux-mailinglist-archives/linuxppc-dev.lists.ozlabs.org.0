Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF627E8DE3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 02:26:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U9HbrMHL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SSZdN6jZ6z3cVZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 12:26:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U9HbrMHL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SSZcX32NKz3c01
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Nov 2023 12:25:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699752316;
	bh=7gwiB8Fg8kqP99lyRxFR15R7ZxKpn9Kg6BeeBha7Nog=;
	h=From:To:Cc:Subject:Date:From;
	b=U9HbrMHLQPVCbvOXtJC6l8819/TsXw5Y3ZlC5JZmahqBfKy9+CGUR4qyDHMCPHxNZ
	 Kms8187cb5McX3IAkhnGaIubzGy41do6eHSSsU4sIuL4THuxg9OlliohdkcHLnqbeT
	 9D05wv6z6emRbF0pW3Bp8z961yqvymZMdD6C/Q0RsmLAIkU9Yyv+e8QQ7fGP5p6i8N
	 O2NrsHsjcOXYO+26pdgT5ZB9euntlvKHkOf/GGxR4DcV2FeuQiL22unuOEU8nS1lYn
	 ChEqQe1J6nzf+W29t/rcBh06XNYRzxzjA9W1bRKcVVeQJeaEtqVrCHdBMXqkVazc93
	 k0wbhdROlg6JQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SSZcX0JDyz4wdC;
	Sun, 12 Nov 2023 12:25:15 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-2 tag
Date: Sun, 12 Nov 2023 12:25:12 +1100
Message-ID: <878r73930n.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a few more powerpc updates for 6.7:

The following changes since commit 707df298cbde200b939c70be2577b20775fe3345:

  Merge tag 'powerpc-6.7-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2023-11-03 10:07:39 -1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-2

for you to fetch changes up to 644b6025bcaff59737270d812c70302f5a8d4a8f:

  powerpc/rtas: Fix ppc_rtas_rmo_buf_show() kernel-doc (2023-11-07 13:13:45 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.7 #2

 - Finish a refactor of pgprot_framebuffer() which dependend on some changes
   that were merged via the drm tree.

 - Fix some kernel-doc warnings to quieten the bots.

Thanks to: Nathan Lynch, Thomas Zimmermann.

- ------------------------------------------------------------------
Nathan Lynch (2):
      powerpc/pseries/rtas-work-area: Fix rtas_work_area_reserve_arena() kernel-doc
      powerpc/rtas: Fix ppc_rtas_rmo_buf_show() kernel-doc

Thomas Zimmermann (3):
      powerpc/machdep: Remove trailing whitespaces
      powerpc: Remove file parameter from phys_mem_access_prot()
      powerpc/fb: Call internal __phys_mem_access_prot() in fbdev code


 arch/powerpc/include/asm/fb.h                   |  7 +------
 arch/powerpc/include/asm/machdep.h              | 13 ++++++-------
 arch/powerpc/include/asm/pci.h                  |  4 +---
 arch/powerpc/include/asm/pgtable.h              | 10 ++++++++--
 arch/powerpc/kernel/pci-common.c                |  3 +--
 arch/powerpc/kernel/rtas-proc.c                 |  2 ++
 arch/powerpc/mm/mem.c                           |  8 ++++----
 arch/powerpc/platforms/pseries/rtas-work-area.c |  1 +
 8 files changed, 24 insertions(+), 24 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmVQKR4ACgkQUevqPMjh
pYCHnw//bL9g7D/SOM6cLCTFs3INADo4Tvur/Y6KzIywDGMlGAcrScwbfcplfUIZ
vjGuUdJE2VRGsoNBineyovM6njXHhQ48cpgD7smr3giU1Qz3UlrNlzIqO5N23AlO
USHFRT1enP/pv9LelapiVJocVXiqatY+nIhzJjj+yvsVYSI+5Aq+4f83jM0JvHzK
y3yNgQm0xZZy86tOkm4jQZ4UKg5M4Ua92dCxKkgwshC2gsLI+TXIxRaP1PM3NDn8
3FZtrDzj9QR0ABooLDzh5rcndU+Un1VoFJgkzlBBPh3Ad0AQ0xQxOwPAlEicrru+
uEo5/bL+CsHdvd/tgf/x+3zjhNtDCx1p7Onz2Zp/iTzGWNq1BpB356AWSnjCIOdv
neg1kH+t+pMWf5NPOs+Idn6glKXK8eICMW6Mm1xlFzqV6YLObGVSOOzZJ5ehR8nN
OdZ3l+U6KyaEnLmpAhNfbh2cPue56JvnzPINpm5vleSvTN2OaajlMVjunwxt7YJl
MBNVHawaVYLUXXS6gmFo7/0q0QXAjpHYPQOhiLETLsV2vhbF25wmmphbakj63rlH
NokpCxRf0KZ5k0sT3GNhiETFJ0//jbyUgFKAh9PfmIusv0Haqu4/GZgwXy9+cazq
V9kQnQjpeUm3FxcUKRtQ9YZSXGdIuwXsIpy54dfcRtcUF7UX+5I=
=Cqjh
-----END PGP SIGNATURE-----
