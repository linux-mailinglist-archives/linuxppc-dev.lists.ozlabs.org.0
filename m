Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E12AC19D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 02:15:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hNG03LKmzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 10:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hND84lmgzDqC4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 10:13:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="A0YA+Mbb"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46hND75Gcfz9sP7;
 Mon, 30 Sep 2019 10:13:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1569802424;
 bh=ogk0hlYIoBCOu2Vho4ZY5MeUcLlebA5N8aJ7TT616wQ=;
 h=Date:From:To:Cc:Subject:From;
 b=A0YA+Mbbuj4wlaLbzPIug3ttR4qGgEwEOeWOvQD5atl2fLpFGGYtDrX/53W9MurmK
 6d2q4WWFgULpPva/Tlw+y32hLQvYkDyxfOjjT5L79zvzsTqx94hjVhPTAiZe1WWjo9
 zXX21AY8MWW/E59EHtDGWZQ00lrkeTuMWnQejMBlPnxBceXG78O5nO0+gSx3xZ5zXI
 1ecY4ch806DE2vef0wPHjViXSALXH7n8+HazB0z8HGDdXMQvo9eo+8RaFhmry3XeBs
 L1QlZ709Ojusn0Le22kUbN8+d56iJ7dw5Pb1CEWbY32IBdYfmyyitF1sJWuifFPYjY
 YX6Tcfx3BYrww==
Date: Mon, 30 Sep 2019 10:13:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20190930101342.36c1afa0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2k83OivJyP3s+fo16M7TyT4";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/2k83OivJyP3s+fo16M7TyT4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

arch/powerpc/mm/book3s64/pgtable.c: In function 'flush_partition':
arch/powerpc/mm/book3s64/pgtable.c:216:3: error: implicit declaration of fu=
nction 'radix__flush_all_lpid_guest'; did you mean 'radix__flush_all_lpid'?=
 [-Werror=3Dimplicit-function-declaration]
  216 |   radix__flush_all_lpid_guest(lpid);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   radix__flush_all_lpid

Caused by commit

  99161de3a283 ("powerpc/64s/radix: tidy up TLB flushing code")

radix__flush_all_lpid_guest() is only declared for CONFIG_PPC_RADIX_MMU
which is not set for this build.

I am not sure why this did not show up earlier (maybe a Kconfig
change?).

I added the following hack for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Sep 2019 10:09:17 +1000
Subject: [PATCH] powerpc/64s/radix: fix for "tidy up TLB flushing code" and
 !CONFIG_PPC_RADIX_MMU

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/pow=
erpc/include/asm/book3s/64/tlbflush-radix.h
index 4ce795d30377..ca8db193ae38 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -35,6 +35,10 @@ static inline void radix__flush_all_lpid(unsigned int lp=
id)
 {
 	WARN_ON(1);
 }
+static inline void radix__flush_all_lpid_guest(unsigned int lpid)
+{
+	WARN_ON(1);
+}
 #endif
=20
 extern void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
--=20
2.23.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_/2k83OivJyP3s+fo16M7TyT4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2RSLYACgkQAVBC80lX
0GxK5Qf/fRl1qjSxW74ZnbNlM9Qp3qgavwY8JTJA7WHERAFQxwC38n8CoHxMQ+RA
AIHhKJf9OSJj6gULfJROQDFj7oLYSFKor0gsZBkWsz9hzKlv/l0JnAmmScaxApAM
LjZJJnLg95JhLgwkjrBK6uoYlGW2gLnI2PxKPUSgGZJ2AO2Ylsg0aMamRNz4p7/H
6HHxYxk6gN5Idi0333uHjam1KQaa48NBxRisbPSHAv4ZhcxsqWbdaetc/h5FqDbY
LPqyJz5se9DECd6rxVB0iivvCWYHiTIXLCu54Ga3sHBIUARuTsNEUPurQ2jehn4e
3VT8pq/g5bo27xFXrrkR7hRDyn08ag==
=MWB0
-----END PGP SIGNATURE-----

--Sig_/2k83OivJyP3s+fo16M7TyT4--
