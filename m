Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A313DCBC2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 15:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gd1qs2x5qz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 23:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VIluqYAR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VIluqYAR; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gd1qT20w5z2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 23:16:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gd1qS58V0z9sWw;
 Sun,  1 Aug 2021 23:16:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627823780;
 bh=5AKuUXsX5mdXOPNOfHTKEXwhhJhi8/p1HRquQHqvrkw=;
 h=From:To:Cc:Subject:Date:From;
 b=VIluqYAR6Fg9PFcf8xb/t3xCBbKBPY85z53F3HuMNwHbxkeOwg2dn33juXcJhJgsa
 5+J92smUzeYb0qVnW3nD44nywkxl2idhbU9rBET9BMXz1q3FJ183kLfJ6ZHco78yaa
 wDI7PxqZh3MWbfvR2DAlpJa9jvh6+LFs9I/w8DPXHnAB/YHUrwhPwuvKG9CcZ5xXoC
 VI/5MQFLGGkP5btC2yfLz0XE3YiUjsBSd/jT75XwUw1CHhRiamfEalsZ04yK3Twaqx
 A9fipIsMB/vX5USujeo3sQUeqh4fY1qtzjMrRTcWSv+gnVQom76MATjyjp+5i9utZ7
 lDQsWU8CctNzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-4 tag
Date: Sun, 01 Aug 2021 23:16:16 +1000
Message-ID: <87y29lz4nz.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.14:

The following changes since commit d9c57d3ed52a92536f5fa59dc5ccdd58b4875076:

  KVM: PPC: Book3S HV Nested: Sanitise H_ENTER_NESTED TM state (2021-07-23 16:19:38 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-4

for you to fetch changes up to a88603f4b92ecef9e2359e40bcb99ad399d85dd7:

  powerpc/vdso: Don't use r30 to avoid breaking Go lang (2021-07-29 23:13:12 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.14 #4

 - Don't use r30 in VDSO code, to avoid breaking existing Go lang programs.

 - Change an export symbol to allow non-GPL modules to use spinlocks again.

Thanks to: Paul Menzel, Srikar Dronamraju.

- ------------------------------------------------------------------
Michael Ellerman (2):
      Merge branch 'fixes' into next
      powerpc/vdso: Don't use r30 to avoid breaking Go lang

Srikar Dronamraju (1):
      powerpc/pseries: Fix regression while building external modules


 arch/powerpc/kernel/vdso64/Makefile    | 7 +++++++
 arch/powerpc/platforms/pseries/setup.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmEGnawACgkQUevqPMjh
pYApeg/9E8l0SD4+NzC0ZwZxQ7sAxufs2X9uugWeTxjEMF3BvhnzAcfF3qPewP0+
Huy7UwhHYKMBGT9jpqqQuLMfxasbihizesdP89BAVIhzyL6odg6/fo+KaBVVADYr
F+jHugUXoimS47IntMyQa2HANpCLjl66ZIYWgqytuLgx8jnvIzCGbLmrTN/F4FTS
7mkNO7+wOmwEi4y3p1cCVnkBd7qkQnjkRgpwS/FQLbtE6G3qkcNhNK1v5AAuSblJ
eLJ0Lp/+z1OYKA/BSmyM5Aj7kytn9f5UjA2jBtS9O0sfcd19g5LTdKXxPftaAgO3
eNr947NTztadHQLkLdeeVCDyqrUnAZFZ7f4kn16JIc27ObCWFhFC/OQR+Ba9KGbN
0hgwVREZ+aqdquYPbqZTj4VWLeEQflgk9zfp9sZquZvOHoknBsvUmzvL24LLE8hw
ETYEoQwdtBZfCNCbEofCIu3BZXtvt99FUsJo65sUKGty7Vb2iuo3jq85jsgwrh21
8OhhQ1njfbw+InMYJO1LgFVAXE9f5FDLaV1oMJkkO6vhDZ73Lsac7AG5MP7TrB+z
dbT0BTfB6nevXzf+JX1OxHZtCXVriXuFWrzZpQVX65zkzbO4N6Q3+Wk28PmMU67P
oiDsdZWjBxk9rA4xXNGof6AIKr3SDt3/u2kMa/iR5r/mq1itZRk=
=dB85
-----END PGP SIGNATURE-----
