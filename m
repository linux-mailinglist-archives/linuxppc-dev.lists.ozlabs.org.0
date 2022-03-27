Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D34E8A5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 00:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRVCz5Jj9z3c1t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 09:01:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=s8a/oMsf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRVCJ6hTWz2xTs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 09:01:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=s8a/oMsf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KRVCC645Tz4x7X;
 Mon, 28 Mar 2022 09:01:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1648418472;
 bh=bfqGnwHxbXXrLj5FZG0b7iogD6D0yJ/ab6cTkkeGjPI=;
 h=Date:From:To:Cc:Subject:From;
 b=s8a/oMsfC2Hm5757N1x/8jZ3u0EyfBMZFqrSuZ4FBlWPprOkZ+Bkgylok9S4iwEYQ
 4CxOeRO10cZhNjnGZItjHrfZAnT4FsI2hKX+qNq1W3D5At1YS4V2I3Aw16hP7YSfzS
 JgEcNVhq0+kL1mOoFFQRdOiZCtd43GWDhKnsqBZsOzFqtAn0+yIH34Ya45tojzGdM6
 Ip+SdWk4k2IIGNsFgNUqgAG2gLylHukowChqU7RezOiLEjy0WENJL4hrn85U3AgkwI
 434bKcHy0zczop8yvsDE+OoGWuTJrlLyBlsSs1VJXIo1XXz8oRMHOVLyfVMqX9mPKb
 2QlWVz7MvPcZA==
Date: Mon, 28 Mar 2022 09:01:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20220328090111.26f8980f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L.iZ1TLmoRQAosbi/tUErGk";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/L.iZ1TLmoRQAosbi/tUErGk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building LInus' tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from arch/powerpc/kernel/irq.c:66:
arch/powerpc/include/asm/livepatch.h:7: error: unterminated #ifndef
    7 | #ifndef _ASM_POWERPC_LIVEPATCH_H
      |=20

Caused by commit

  7001052160d1 ("Merge tag 'x86_core_for_5.18_rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tip/tip")

A #endif got removed during the merge resolution :-(

I have applied the following patch for today

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Mar 2022 08:55:39 +1100
Subject: [PATCH] powerpc: restore removed #endif

Fixes: 7001052160d1 ("Merge tag 'x86_core_for_5.18_rc1' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/livepatch.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/livepatch.h b/arch/powerpc/include/as=
m/livepatch.h
index fd65931a739f..1c60094ea0cd 100644
--- a/arch/powerpc/include/asm/livepatch.h
+++ b/arch/powerpc/include/asm/livepatch.h
@@ -16,6 +16,7 @@ static inline void klp_arch_set_pc(struct ftrace_regs *fr=
egs, unsigned long ip)
 {
 	ftrace_instruction_pointer_set(fregs, ip);
 }
+#endif /* CONFIG_LIVEPATCH */
=20
 #ifdef CONFIG_LIVEPATCH_64
 static inline void klp_init_thread_info(struct task_struct *p)
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/L.iZ1TLmoRQAosbi/tUErGk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJA3qcACgkQAVBC80lX
0GzEOgf+Ont4XKzz2D7eAdtpGmyQSfAaCkq9M2KJB19PcaFBOlbA+y51WSJag05k
OF8oc1dCbgufAipb+LFszLUqDGw3AnJfwyNKO95L6lY3GZE1Vg2ACwdyQ9CxU+KQ
3o/3L/2yAEslXRFCAiLw8qB+x7IxOA3xSOdfgzkqHGGZg/Rr1/sZ2cQyHSNtbdfb
XCr6TjTBzNs9orlnfMmUvrVX+n7BNdahDU8c7Ws6o2kR+LlLhPWGKeSPx+eEFiqG
WUrJ1vcNg8qwgIWjy95ckMDu7tbvG/dzh3fP6OhJCC1ZKj03bKp4vKXfeG9QrB3N
RRgNJ4zqJtff4RugBTItaW5nFBpwQg==
=7DOZ
-----END PGP SIGNATURE-----

--Sig_/L.iZ1TLmoRQAosbi/tUErGk--
