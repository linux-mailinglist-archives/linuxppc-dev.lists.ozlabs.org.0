Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D441B36EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 07:43:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Tqb4pszzDr1V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 15:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Tnm0H1wzDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 15:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=GX/TBSar; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 496Tnl4GLsz9sSJ;
 Wed, 22 Apr 2020 15:41:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1587534091;
 bh=XuWKEeF8BBg+B4qgjVxumjZWdZt7o4zF4w7XnAYEqvY=;
 h=Date:From:To:Cc:Subject:From;
 b=GX/TBSarEJeMAwcf4HWb8ScGitBqDbw2HICPz61v7L5LT42VWAp5P39EGm8BWWtKr
 cIOpQkdeXF24yzcWVV/Vy/tpeCvMtqy1k8anIOyjCaLR0JCVlEUa5YEKN7M+MVkebJ
 UF8OjCp9RMunC55givYe+2a9jCeXOVB8/m/ceFVLg/yzvp/BewBWjzWEFYtvMoadKV
 TPI0IeOF0uM4k5ZuwABb9fw/aHJoRmx9Tz/UvQA6lf9gLCVf/AuYyqy1GxPJlEIcN1
 lq2LzlMSKdcKf8DkCcj6tsl8zpSVIDXoqIC2zei8SgJxa86XpSYfmktFnbBIVFYJzq
 E/u8XCCxOqCUg==
Date: Wed, 22 Apr 2020 15:41:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20200422154129.11f988fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ziQZNfCkH=foK2.bCCJ1ChG";
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
 Haren Myneni <haren@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/ziQZNfCkH=foK2.bCCJ1ChG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from <command-line>:32:
./usr/include/asm/vas-api.h:15:2: error: unknown type name '__u32'
   15 |  __u32 version;
      |  ^~~~~
./usr/include/asm/vas-api.h:16:2: error: unknown type name '__s16'
   16 |  __s16 vas_id; /* specific instance of vas or -1 for default */
      |  ^~~~~
./usr/include/asm/vas-api.h:17:2: error: unknown type name '__u16'
   17 |  __u16 reserved1;
      |  ^~~~~
./usr/include/asm/vas-api.h:18:2: error: unknown type name '__u64'
   18 |  __u64 flags; /* Future use */
      |  ^~~~~
./usr/include/asm/vas-api.h:19:2: error: unknown type name '__u64'
   19 |  __u64 reserved2[6];
      |  ^~~~~

Caused by commit

  45f25a79fe50 ("powerpc/vas: Define VAS_TX_WIN_OPEN ioctl API")

uapi headers should be self contained.  I have added the following patch
for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Apr 2020 15:28:26 +1000
Subject: [PATCH] powerpc/vas: uapi headers should be self contained

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/uapi/asm/vas-api.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/vas-api.h b/arch/powerpc/include=
/uapi/asm/vas-api.h
index fe95d67e3bab..ebd4b2424785 100644
--- a/arch/powerpc/include/uapi/asm/vas-api.h
+++ b/arch/powerpc/include/uapi/asm/vas-api.h
@@ -6,6 +6,8 @@
 #ifndef _UAPI_MISC_VAS_H
 #define _UAPI_MISC_VAS_H
=20
+#include <linux/types.h>
+
 #include <asm/ioctl.h>
=20
 #define VAS_MAGIC	'v'
--=20
2.25.1

--=20
Cheers,
Stephen Rothwell

--Sig_/ziQZNfCkH=foK2.bCCJ1ChG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6f2QkACgkQAVBC80lX
0GxALAf/TtAfuYHpLwphowcixvxzTN+fVF2vw+ejvc5W27ZTjpPwhLBHkMOQSMlp
26FtKpWUGvH/AHkovkqD+luZtbkQV4wKSwQMThnRsFbgt/GehhCs4cjMGzhzA/4a
88wJssIrsxPwWAVrumDF6OJrEogGiA/AJ9vgvYEPJFfwVL7jcnxz6n+E0+ssUe5U
NTIuy637nTEoxFUBnm+4Up5yq3O06Y5W2XdnV7p5AyrGbI+ojV698U2F9redrhwi
NHpHNeGRp6ZC3CSae3NhzB02hkhlVgU9RMo8Nft3022pYIavMEjD5i4/ckUKOrb4
fvVBP1f18q9ytOTDVkmot4hcEGw8eA==
=4Njs
-----END PGP SIGNATURE-----

--Sig_/ziQZNfCkH=foK2.bCCJ1ChG--
