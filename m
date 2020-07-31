Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA60234691
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 15:07:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ6y8240PzDqgl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 23:07:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ6vj4pcKzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 23:05:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Fr3Qm6GQ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BJ6vj08n9z9sRK;
 Fri, 31 Jul 2020 23:05:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596200721;
 bh=cbtTbd1X6hBlPoUNAtbkqigXBbk7tL0v47li4l8IVdE=;
 h=From:To:Cc:Subject:Date:From;
 b=Fr3Qm6GQQJ1J3shWk88eS0fZB/kc9TrHoHWosbI75b1CN1r000P8/cUbaEzsA3BAU
 OVugrPXng0kMPpgJxb+XL9hbHrAZkbTk4GP81j2WoPkYg/y7A6kHRnUS2aU30SEAWd
 RkmZGOxlevkoizt9uFo4WwFNCg+EOIkfHy7ZRdgwwJX4KoPo9AzX6vNyWYKNJRVHe6
 0fZiFMyc4eM4smghkw15REEm8/tL0Fmos9bVqKGSLQyWL4W2oupKDd+CX8WxPaXXL/
 YPaNiu9DtdF4Cb2KQvdn39qm2HXyj9Y36+YZgEfZeLThR+phB9+gSJcbYiWgyBS3Co
 nRJOcIY0l2pJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-8 tag
Date: Fri, 31 Jul 2020 23:05:17 +1000
Message-ID: <87ime34yya.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull one more powerpc fix for 5.8:

The following changes since commit f0479c4bcbd92d1a457d4a43bcab79f29d11334a:

  selftests/powerpc: Use proper error code to check fault address (2020-07-15 23:10:17 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-8

for you to fetch changes up to 909adfc66b9a1db21b5e8733e9ebfa6cd5135d74:

  powerpc/64s/hash: Fix hash_preload running with interrupts enabled (2020-07-27 17:02:09 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.8 #8

Fix a bug introduced by the changes we made to lockless page table walking this
cycle. When using the hash MMU, and perf with callchain recording, we can
deadlock if the PMI interrupts a hash fault, and the callchain recording then
takes a hash fault on the same page.

Thanks to:
  Nicholas Piggin, Aneesh Kumar K.V, Anton Blanchard, Athira Rajeev.

- ------------------------------------------------------------------
Nicholas Piggin (1):
      powerpc/64s/hash: Fix hash_preload running with interrupts enabled


 arch/powerpc/kernel/exceptions-64s.S  | 14 ++++++++---
 arch/powerpc/mm/book3s64/hash_utils.c | 25 ++++++++++++++++++++
 arch/powerpc/perf/core-book3s.c       |  6 +++++
 3 files changed, 42 insertions(+), 3 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl8kFsQACgkQUevqPMjh
pYAkbg/9HzJB8KbjAVJpoXHOf9+aHylhZKU2pcVtdoYE07VV6JabWnlI5flvTSEY
3Dvr3h/X0k2Z3n52+s1kYlW27ErU+o9Hbz1j4O41Ardiy14GmQ02FSi5iXjhKxuk
AjX2MN76n1Te+1ee2Ib/Ubu8KOrbxLIya223tJ0TNu7RWuYVaCO/lNXPPTwm2JWI
s9lryRAHNc4qkPMytsWi/gzNml3IP6cqnGVt1H5fmnOwQXUYbSjdmhBa7AwjCsA1
xJBMkxBxWOnUSknRCxaCCUTQ3sD+sJMzp6verlwEIb+HRh08iJyVzuWCpT9m0ZOG
5F3CvhIxwLatDsJ9N5EeGI2V4qBstBlHEUJJAjkwKgZxzmEm7j9H+ItAc421eo2A
t/SYJTK4JltllCDyB22jCxdEgJh+opv8rki7U+INI01I8gHzqsr/0CHleGtMN5Cq
fUBf25LOMUCpjeAO207j4DzeY6rTXz9H07XWrR4su//4S9bNkYUYpFfeE/3Kwwdq
vZCxjm+fxxLPyAW+E2D2EGsyzIJootrAzly5T7gun8qwgCSgoCxI+YV9/DLmYaGf
OjcG6+X58sfn1FTc8cD6udKCIMKh0JmSccZRqw1Ijp4EiGMnDZUbP9jg/aSciD8a
+oco9QGvvxYQTMut4XUkXtqqZqaTISgWFD/QB9f4KGJ1Rs8tW5Y=
=oaTB
-----END PGP SIGNATURE-----
