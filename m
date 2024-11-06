Return-Path: <linuxppc-dev+bounces-2895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F69BDD64
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 04:04:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjqmf4BHDz2yGZ;
	Wed,  6 Nov 2024 14:04:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730862258;
	cv=none; b=Be+zoG8Pc6vI6co8RR5mLUXPKAJwzAkKVEJeBn/4X6UgfasWx9mcH5wT0CrJVT8MYLJHYJK2PThARNQdNasDgIPHzgdpnGGicleis3Fqno6tf60BOZiMkgPiMgz3aYzYO8A81xlFOXoy4V3j06SZ7utItcamUxDlIn6mn2XChFdwlRPo90S67MGUICaeoQ0biV4yKPwfsqunH4gW3Gq30VBN6OQnSlKgIFjlxfY6urUNykCw4UEvEKVZPJR2mlnRD3MiPXLaaCs4QGiRnHfm/zgLSOeYkdhTWMIW/60k4caz4OvU/oP0NF0xjm11X6auDC++pkzEylCSe34nf/PSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730862258; c=relaxed/relaxed;
	bh=s9b01BRLDdx+kydfCLwn4XCUIydahSsmU7oeUYqYYTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iIrt3jLO+3j0qy5VMhT2/mI/KCy/RW23z5eUFW6NMT5YIp+PzQywiUC1MzArZvoKp0yvO5uoz/GmpC+cz7JM3Y+idNds9utXTRr7AbdiCsy+TWvGyJTX+0qPvkfdRf5p33C5ADp8yVS34g2Nq+LlukskuYlUsozqBHCdYwM2lOfkZiuX0Bx4z/0rk3914ZN4WnS50GP83A2xwchYAqHQ9e6RE4R6h1F5TiTpybhu3iPE7osBRsUJ+u8L8Ao3W1SSE4PLfbWtiKDj2sdNR65CAhRmwZIao1grVHSVurs7mAE0/SfieNcgE44uwV8frcFNZkR1TRFce3bsJvmwnhMucw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ASsBZCc8; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ASsBZCc8;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjqmb4cJPz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 14:04:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730862253;
	bh=s9b01BRLDdx+kydfCLwn4XCUIydahSsmU7oeUYqYYTY=;
	h=Date:From:To:Cc:Subject:From;
	b=ASsBZCc8TzsAp7qXjbYNsz7PBkvTpDSMiN2C7d9onxvhX5UDPq6PPHCMrFHtM5HsI
	 L3EOVz2OMqt9X+RTnHQypBagY0xKe0ilgsF8gOGr51aTfp/p9fteWIjYUsXKvnIWtr
	 VELWK/5iY7YkD0J2Tn9e0bHkZ1/wj8bi6xtp/EZ3iTeM3SJ+ac3cAlpJ/IhL3Nce5V
	 RGSV5ObhVWA7GR4UpZecMsb5MdMImtLK2gqjuL4/sfgsV6WuyTztQnmQ6aVUt1FXPi
	 BsTD+4DYNHlbO9xupcd9OglgedffGBbgjSDlO+4E5r4ElTmi/N/iNR/ChvFIJXbEQ0
	 J2UjtRmWab9lg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XjqmY0lBsz4x7D;
	Wed,  6 Nov 2024 14:04:12 +1100 (AEDT)
Date: Wed, 6 Nov 2024 14:04:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241106140414.760b502c@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DAq6YdHv5B=ZCDY1RGE2RU.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/DAq6YdHv5B=ZCDY1RGE2RU.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/ftrace.h:23,
                 from include/linux/kvm_host.h:32,
                 from arch/powerpc/include/asm/kvm_ppc.h:19,
                 from arch/powerpc/include/asm/dbell.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:36:
arch/powerpc/include/asm/ftrace.h: In function 'arch_ftrace_set_direct_call=
er':
arch/powerpc/include/asm/ftrace.h:141:38: error: invalid use of undefined t=
ype 'struct ftrace_regs'
  141 |         struct pt_regs *regs =3D &fregs->regs;
      |                                      ^~

Caused by commit

  7888af4166d4 ("ftrace: Make ftrace_regs abstract from direct use")

interacting with commit

  a52f6043a223 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT=
_CALLS")

from the powerpc tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Nov 2024 13:33:53 +1100
Subject: [PATCH] fix up for "ftrace: Make ftrace_regs abstract from direct =
use"

from the ftrace tree interacting with "powerpc/ftrace: Add support for
DYNAMIC_FTRACE_WITH_DIRECT_CALLS" from the powerpc tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/ftrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index bb2c90997618..db481b336bca 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -138,7 +138,7 @@ unsigned long ftrace_call_adjust(unsigned long addr);
  */
 static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs=
, unsigned long addr)
 {
-	struct pt_regs *regs =3D &fregs->regs;
+	struct pt_regs *regs =3D &arch_ftrace_regs(fregs)->regs;
=20
 	regs->orig_gpr3 =3D addr;
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/DAq6YdHv5B=ZCDY1RGE2RU.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcq3K4ACgkQAVBC80lX
0Gw0JAf7Bq9qv+tbPiKn8tlsulBba4WywVS6jwuTJH64TQY2YwCql1EcSviO8v/E
+6rw8LM0Xx0lljiKx38noD4SJghE34EGMO0w5/X6SFUengJ10pMu/3mihJM681r9
BVlfSqqxR3PMNBQ45oYxTb5zz8yM9rKf/uWzTcumEx824K3Apx3Kd3vG5go6P4sd
gj9b9YOV6tM46s70zfIJJiarINvA5pbteoMPa20C//GSk5nyj993AVBlQxYarYTn
dRSekAWryp9OhN+R5FzgTWyy6cpD6fGssnNRmGnB76DuHdYdvxy2NYLmFlGv0ZGS
9Rj+q+p9bVVvNjqzPjlVbgfzp8zJ7w==
=J8sY
-----END PGP SIGNATURE-----

--Sig_/DAq6YdHv5B=ZCDY1RGE2RU.--

