Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75697691730
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 04:39:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCfc827z4z3f3m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 14:39:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=g+gp30X+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCfbD5q0cz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 14:38:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=g+gp30X+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PCfbC1gt9z4xNH;
	Fri, 10 Feb 2023 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1676000311;
	bh=+0AIMDf9647rvs8+Q7dwAwQ6K6344eJt+hok2qkYWRk=;
	h=Date:From:To:Cc:Subject:From;
	b=g+gp30X+1eVZAf3ALMnwy+5TwI9VVpx1/qHMMQLyIrven4LKyhkhUXfHsVIsVYlyX
	 mBw8zXLRp67XgvYWApIg5/DcKyo1go5ZR7Mq80q4a6m3ZUcPA8pQppFJd8g3kKIz2x
	 LgnOFzl6JCR0WMhB0uSJ9wH7c85LpIWKBEeqcV8S2U0fqotvW4f0k7SBT9mujXbDac
	 8CZmo6qfYt9Vk9BoclSjwbccmegFYhySwnpZpRiVNtqGKfEafCp6+O67jd5/uSCmRF
	 3L3ILk+bBrBV8nbs6MVXdOJwVHII1Fc7V0vOCDXyH3joXeCaKpM6Sf6ZUYfpVdnuJW
	 3cNyigMoNQ+TQ==
Date: Fri, 10 Feb 2023 14:38:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20230210143829.4ab676bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3jYrWzezKBrYae+EmJWEE1Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/3jYrWzezKBrYae+EmJWEE1Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

arch/powerpc/kernel/setup_64.c: In function 'early_setup':
arch/powerpc/kernel/setup_64.c:400:34: error: 'struct thread_info' has no m=
ember named 'cpu'
  400 |         task_thread_info(current)->cpu =3D boot_cpuid; // fix task_=
cpu(current)
      |                                  ^~

Caused by commit

  0ecf51ca51e5 ("powerpc/64: Fix task_cpu in early boot when booting non-ze=
ro cpuid")

# CONFIG_SMP is not set

I applied the following fix up for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 10 Feb 2023 14:21:33 +1100
Subject: [PATCH] fixup for "powerpc/64: Fix task_cpu in early boot when boo=
ting non-zero cpuid"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/setup_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 78d8a105764b..b2e0d3ce4261 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -397,7 +397,9 @@ void __init early_setup(unsigned long dt_ptr)
 	setup_paca(paca_ptrs[boot_cpuid]); /* install the paca into registers */
 	// smp_processor_id() now reports boot_cpuid
=20
+#ifdef CONFIG_SMP
 	task_thread_info(current)->cpu =3D boot_cpuid; // fix task_cpu(current)
+#endif
=20
 	/*
 	 * Configure exception handlers. This include setting up trampolines
--=20
2.39.1

--=20
Cheers,
Stephen Rothwell

--Sig_/3jYrWzezKBrYae+EmJWEE1Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPlvDUACgkQAVBC80lX
0Gx5dQf9H1dUoqhzZt/F/WloAtElvaCyEa2JzUllu9ogsjUNxxIpJz6Org/LHfjK
RhDsoNYPHIt5umUxmmZ0ZcfFI+ZK6QrvPoGeZsDGWY0Y1zj3BVqfxpKri90Waxae
AHJDPHJBJcyyNcymykYRJ7/eoqit1d4yFTYyERifTwuY6pKPxdH2Dm5YUsw4LRhN
6kJqbNZb/QzfkGgsO2rsvWhGmhdS7nDIkLfIUpx9lMqwj3On7M8iOzYLI6Ey5acy
avQ0YoK2YZyhzejsqRzRo3NjuRn1+ocl5+1O67fJPEeFwuXb81KdL2fliPiaEIaX
aUC1RTm4t06F8+RuIKH8OeyJQtDdZA==
=idtf
-----END PGP SIGNATURE-----

--Sig_/3jYrWzezKBrYae+EmJWEE1Q--
