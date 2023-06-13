Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC5772D9CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 08:22:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=p257LeXX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgJPH42l7z30FN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 16:22:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=p257LeXX;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgJNK3D2bz2yyc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 16:21:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QgJNJ3Ywbz4x3y;
	Tue, 13 Jun 2023 16:21:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1686637281;
	bh=09oLrHGEmpgpyTpLPSc4jHEwyd/VNs8IHZbmFF1qxD0=;
	h=Date:From:To:Cc:Subject:From;
	b=p257LeXXti8Ytj43puEZXiR0jOqqbg0HzOPzCYhgkkV3Umbssxt9OYv6TIyHfy8sP
	 rlbDjbti7oFaeDP7lv5IZugyvCsDKiwrYRo6CWzoFiM/cJkmyfhUL0efoXJHC53Q+5
	 WtRuofXTdsvB/FRX8aWjwmKEUx8empsTq6wNg7DoQJ2iqeMoI2vcdiUS5gvDGJnxM7
	 DdKqGhm//56jaI/4d++oZ0aHn8qJAgO0YWF7IAyM4Ff835NO2FxseN6yiE7Vp5p0HZ
	 AhobZSuNsaYkLYCcPG9cqWFtmzTe658dKg9ncvgD992nkIkg16w2V5BF49DXsqkLGv
	 FyE6vTLL9DLxA==
Date: Tue, 13 Jun 2023 16:21:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20230613162119.4a7a7d3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IxEZ4RJthVOEGv9b4i2lpKw";
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/IxEZ4RJthVOEGv9b4i2lpKw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

In file included from arch/powerpc/include/asm/page.h:247,
                 from arch/powerpc/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:60,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:56,
                 from include/linux/ipc.h:5,
                 from include/uapi/linux/sem.h:5,
                 from include/linux/sem.h:5,
                 from include/linux/compat.h:14,
                 from arch/powerpc/kernel/asm-offsets.c:12:
arch/powerpc/include/asm/page_32.h:16: warning: "ARCH_DMA_MINALIGN" redefin=
ed
   16 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
      |=20
In file included from include/linux/time.h:5,
                 from include/linux/compat.h:10:
include/linux/cache.h:104: note: this is the location of the previous defin=
ition
  104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
      |=20

(lots of theses)

Caused by commit

  cc7335787e73 ("mm/slab: decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINA=
LIGN")

I have applied the following hack for today - we need something better.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Jun 2023 16:07:16 +1000
Subject: [PATCH] fix up for "mm/slab: decouple ARCH_KMALLOC_MINALIGN from A=
RCH_DMA_MINALIGN"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/cache.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/ca=
che.h
index ae0a68a838e8..e9be1396dfd1 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -142,5 +142,14 @@ static inline void iccci(void *addr)
 }
=20
 #endif /* !__ASSEMBLY__ */
+
+#ifndef __powerpc64__
+#ifdef CONFIG_NOT_COHERENT_CACHE
+#ifndef ARCH_DMA_MINALIGN
+#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+#endif
+#endif
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_CACHE_H */
--=20
2.39.2

--=20
Cheers,
Stephen Rothwell

--Sig_/IxEZ4RJthVOEGv9b4i2lpKw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSICt8ACgkQAVBC80lX
0Gyh2gf/VSu16R9zpGg+AreGcHAXLfhTsn75srJGOYEEWqZPPHTW9DZUzOz1IavK
bf4fb8hYVMrLMHrDMJyLENSBxgTdflaDLrifPRkZymuWhkIwRChFPz7na1i8LY93
xo1yrKyYQqH1OEz5lJ3Kd3aXqIRH5dnnpT7Y1LxpmSPVPE+rQvg7PStaokJhgpeX
o6Lv3dnNFwCPtse2bB1EugDaZL+tm9Jj7c8srAT/qtJHjtT6U9NvOnAhWDdB9S+B
Xn7SxZBTA2W0ehVqHFdQtYiXoQONYiG8ILx3MIvGzwKN1YoO2XgsmC70uuVCUzUO
s6MVpN2Bz305ZseGeBP1mzdz2YPl6w==
=p8mM
-----END PGP SIGNATURE-----

--Sig_/IxEZ4RJthVOEGv9b4i2lpKw--
