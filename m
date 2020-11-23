Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF302C00BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 08:42:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CffHg72RTzDqNW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 18:42:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CffFY6mRzzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 18:40:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=hzTsKrVr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CffFY0JXhz9sRR;
 Mon, 23 Nov 2020 18:40:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1606117217;
 bh=feBwx742S3KxPsGL6rDfJ09Kn4ZnORD8sGkRYwcY0Og=;
 h=Date:From:To:Cc:Subject:From;
 b=hzTsKrVrvVqhAY2PLgq/c9N58GEqXNEMyV4HI07riRoxZfNd+1h6YhPtIgsn3Hj4T
 JN1laq+Uz47M8OrV8y32cS3eGfcVSvWrNbRNqfiDPVywzeCDhI7KHmSINb+JoAAaKj
 ETZdHJNXiKrLjLcRLcRznTJ2EBH/neIGts6ANXl8PO34PL4cTu9B70Ntbfo6U62tGC
 +zepQJfIcBV3UfD9WuVwcSJ1NPY5l4/P7EaJJycyuaRPw22GR1pq1Co9oJEROM0Y8H
 syILem/9j4IhLBekDBVCJQWt8B1W53WoSvi0gY8+zT2Y7s1wJGKsYHGMyIJxFDxBrp
 3Wws9tTZ4d6ZQ==
Date: Mon, 23 Nov 2020 18:40:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20201123184016.693fe464@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EdvlojBL39g6k/WuaBky3z0";
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
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/EdvlojBL39g6k/WuaBky3z0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging most of the trees, today's linux-next build (powerpc64
allnoconfig) failed like this:

In file included from arch/powerpc/include/asm/kup.h:18,
                 from arch/powerpc/include/asm/uaccess.h:9,
                 from include/linux/uaccess.h:11,
                 from include/linux/sched/task.h:11,
                 from include/linux/sched/signal.h:9,
                 from include/linux/rcuwait.h:6,
                 from include/linux/percpu-rwsem.h:7,
                 from include/linux/fs.h:33,
                 from include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:14:
arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: data definiti=
on has no type or storage class
   66 | DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
      | ^~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: error: type defaults t=
o 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Werror=3Dimplicit-in=
t]
arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: parameter nam=
es (without types) in function declaration
arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_a=
ccess':
arch/powerpc/include/asm/book3s/64/kup-radix.h:180:6: error: implicit decla=
ration of function 'static_branch_unlikely' [-Werror=3Dimplicit-function-de=
claration]
  180 |  if (static_branch_unlikely(&uaccess_flush_key))
      |      ^~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: error: 'uaccess_flus=
h_key' undeclared (first use in this function)
  180 |  if (static_branch_unlikely(&uaccess_flush_key))
      |                              ^~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: note: each undeclare=
d identifier is reported only once for each function it appears in
arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_a=
ccess_return':
arch/powerpc/include/asm/book3s/64/kup-radix.h:189:30: error: 'uaccess_flus=
h_key' undeclared (first use in this function)
  189 |  if (static_branch_unlikely(&uaccess_flush_key))
      |                              ^~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'restore_user_a=
ccess':
arch/powerpc/include/asm/book3s/64/kup-radix.h:198:30: error: 'uaccess_flus=
h_key' undeclared (first use in this function)
  198 |  if (static_branch_unlikely(&uaccess_flush_key) && flags =3D=3D AMR=
_KUAP_BLOCKED)
      |                              ^~~~~~~~~~~~~~~~~

Caused by commit

  9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Nov 2020 18:35:02 +1100
Subject: [PATCH] powerpc/64s: using DECLARE_STATIC_KEY_FALSE needs
 linux/jump_table.h

Fixes: 9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/=
include/asm/book3s/64/kup-radix.h
index 28716e2f13e3..a39e2d193fdc 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -63,6 +63,8 @@
=20
 #else /* !__ASSEMBLY__ */
=20
+#include <linux/jump_label.h>
+
 DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
=20
 #ifdef CONFIG_PPC_KUAP
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/EdvlojBL39g6k/WuaBky3z0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+7Z2AACgkQAVBC80lX
0GwEzAgAoZEvlgCXERg+onNkmuCjQWCaqqGFZXyJV9Z7Tgs2pKSezeRvTn/Q2IuD
JxOWJuA9xnseQ6gScuUk7FbT4IqVNPEP4E6xcB3ijWqz+FoxCo13L0oHuvavKV7g
1YSDl0bI2lcTu3aLh8G4pl9u+Qsw2X7A1c/fOCRqzrJ9cPAQqI8n9bNJs6Wv7sSX
nbGvSWC/J9GXhr1eFtovk5sDjaIibxIK1wQrOfyJgN0N5CGBpvMTEOSMmhz1iyNI
UnsSeBQW9I5VWayCWBTLWfKCyvacpf4u3L8g4fyXQI4eL/ifTgmE35O/s1JEYmxn
LcL4KT4cDw4w/wLchVzvd81WVksT0Q==
=zrca
-----END PGP SIGNATURE-----

--Sig_/EdvlojBL39g6k/WuaBky3z0--
