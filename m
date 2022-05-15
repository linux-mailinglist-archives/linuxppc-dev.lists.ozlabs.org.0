Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93F52775D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 13:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1LVW5WC1z3c8X
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 21:57:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QVktnGOZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1LTw6pcTz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 21:57:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QVktnGOZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1LTt1q8cz4xLb;
 Sun, 15 May 2022 21:57:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652615842;
 bh=Xdye5+RxfkUHM2P65UuYXD0dh6kuBiXg1IpOPsWTOwg=;
 h=From:To:Cc:Subject:Date:From;
 b=QVktnGOZQXXiEY/rgz/tEOEBAxCcwACd69Wy0j2y/0ggAZMq8p6+8Gk0iY2ZLmCBR
 mYfc402fW0hO5mHsf+7LTLq6Cwvoj+5WdCs6aNQ8K6MrXNrl+Uqn6jxb7R4XpEeS2m
 ixiEhUOKkT3xCu+/frGXH1P4Im6VYC7p8hdW6zHg6ChR2Zhnkyn4QUyOqVoBJ2uqA5
 LZZN6SivLc6K5e4nBgqymdFnAaaHS0q/qDsNTso0uZDAE4gKsMGTioYFhtlBJ93r/z
 rg1k5yWHWlFyvRb+RkqLNAG81+pkyhpV66oxTzNyYDfPay0JREzmfjdlBrvTqnbeNk
 g9pUW2cha/hkA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-5 tag
Date: Sun, 15 May 2022 21:57:18 +1000
Message-ID: <87ee0v6map.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, graf@amazon.com,
 linux-kernel@vger.kernel.org, matt@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 5.18:

The following changes since commit 348c71344111d7a48892e3e52264ff11956fc196:

  powerpc/papr_scm: Fix buffer overflow issue with CONFIG_FORTIFY_SOURCE (2022-05-06 12:44:03 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.18-5

for you to fetch changes up to ee8348496c77e3737d0a6cda307a521f2cff954f:

  KVM: PPC: Book3S PR: Enable MSR_DR for switch_mmu_context() (2022-05-11 23:03:16 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.18 #5

 - Fix KVM PR on 32-bit, which was broken by some MMU code refactoring.

Thanks to: Alexander Graf, Matt Evans.

- ------------------------------------------------------------------
Alexander Graf (1):
      KVM: PPC: Book3S PR: Enable MSR_DR for switch_mmu_context()


 arch/powerpc/kvm/book3s_32_sr.S | 26 ++++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmKA6GsACgkQUevqPMjh
pYB76A//fuV++okA+VBke3SwWOcZGg/0Wc78zv/k7+dYpRr3FTthFZQpiGH+Nfq3
xJAfzG/b72P2u/20tCVFsIYrNQzhsTZ7aui0c9fDtYIyw/ejpkaspmU/OB41DhMb
iumELPB9ZBaTgPSuxEeQ4O5oixW/WHO/QF8UdaaPqntiTsC1lH0hV70kqA+WQ7eh
Zw3KHPt2KUR34ib99PRsxE4eoIq7Qf8IjPN0oJaFRZkyRCJE03KPC9VQAmGZCe5j
uwfawFs36fSHuiJhBUfUzalCZmu54DkVzwI989GvuVfpZ08rW98eyCG9gAnWq0AU
uKz0oPqlyM+QA6n7iLsdM7LNZ5iFZjE18oor518NHzAOJtZuuXEF3T/V7PNs2tKG
Svzj16DtYrVNmXEJLkrtDPm3P3+jaw12+631Jh+uE4IkLP8o3cI4p/uo995vXb2K
a2cFm0hg2qMMMjE2fjrXS8xaJr7wGFInLz0/RNbCtCIT70+gcnkrdlo785kCFsNX
wDo/OaDvFA/pYYL1BTUeruUlQA/pAsm0danGJ99gFVOwJ9kd/bS6SV7yuB66uKpD
d+qJXETAF3XvJAodXLRrUqeiTDDsFwa5d/kQ6L7EVqpHUV6jvInhdZgIwHEuQUf0
QYddYvl6nWa1C5QSGeKZ00ooSy1Swe0jpHfwWB3ooCZGfo+/mTE=
=fNSB
-----END PGP SIGNATURE-----
