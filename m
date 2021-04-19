Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEAF363E56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 11:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP1Np2fyxz3d33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 19:14:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=FgU4M1Vb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=FgU4M1Vb; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP1NN2QGHz2ydH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 19:14:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FP1NL1sDFz9vDw;
 Mon, 19 Apr 2021 19:14:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618823666;
 bh=U0cJZcwN5kd0CZDhnPI3sGatSBR5W6x83YHl7PmoKss=;
 h=Date:From:To:Cc:Subject:From;
 b=FgU4M1VbkYuuTSBRonfWtFS+tXhH0Kn5Skg9rSxe9eybR7oQcSW/EHjyO5C/hflwm
 wDGxqCKOwtVS8z9ORZqWnkQX6YIEiLp3iUeTU7JrNgoVHZwW2a+bPS9zzG9QyWlWOc
 ISw07N9Km1bhboUCjLc90MfZ7o5mcLMAqd8mP+pS6OJRHyQGHqzDVXk9/tmAM5Y9Gq
 lvGUD094wjxwEHJsd/H6kE/GtGfexZ6u6jX97d3KB9qT8W4DWNfeRLOPZdMSJwG47T
 I1VBnnHxA7c6qtfkaiE9AHP6FgF7etFWemJOXe5fpSB7QWmVWv0ajTvcNmCKg5B4rs
 J6gIwVeWuW74A==
Date: Mon, 19 Apr 2021 19:14:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20210419191425.281dc58a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/88=dafUnaphWXTJ0zHB+_3m";
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
Cc: Xiongwei Song <sxwjean@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/88=dafUnaphWXTJ0zHB+_3m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

arch/powerpc/kernel/fadump.c: In function 'crash_fadump': =20
arch/powerpc/kernel/fadump.c:731:28: error: 'INTERRUPT_SYSTEM_RESET' undecl=
ared (first use in this function)
  731 |  if (TRAP(&(fdh->regs)) =3D=3D INTERRUPT_SYSTEM_RESET) {
      |                            ^~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/kernel/fadump.c:731:28: note: each undeclared identifier is re=
ported only once for each function it appears in

Caused by commit

  7153d4bf0b37 ("powerpc/traps: Enhance readability for trap types")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 19 Apr 2021 19:05:05 +1000
Subject: [PATCH] fix up for "powerpc/traps: Enhance readability for trap ty=
pes"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/fadump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b55b4c23f3b6..000e3b7f3fca 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -31,6 +31,7 @@
 #include <asm/fadump.h>
 #include <asm/fadump-internal.h>
 #include <asm/setup.h>
+#include <asm/interrupt.h>
=20
 /*
  * The CPU who acquired the lock to trigger the fadump crash should
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/88=dafUnaphWXTJ0zHB+_3m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB9SfEACgkQAVBC80lX
0GxDOgf/U8+CxtKOnf6CZSpcm6aRJR+DOz+n6FD69G7bYDEcxlpLlmcH76mfHHPl
mEUFsU8At5CA7Clz6UiIvITGgA9roVm9AGpk44/9+gY3fRPmGQ+lywO1KvH5pk/z
LLFeXHzslP0hhzbWGi3xa8Gg160GrlDa9joBIf9mnLbhUsC+bh3US+cyjABG/HOx
+C7aSur6D/GX5ugp2wKlcKdesb9UGQC9LPo/jhSOLWJtOeUNKG0G2EMz5jJ6bW98
KgLVfPlihv9qlBvM+OzLaY2LPo6BWLZfnRUE+6EA9SU5ZVQEYt4lObT8JW2zDJKz
QtP05uG1PmiAxer7AjBsB68GVpNowA==
=MRFq
-----END PGP SIGNATURE-----

--Sig_/88=dafUnaphWXTJ0zHB+_3m--
