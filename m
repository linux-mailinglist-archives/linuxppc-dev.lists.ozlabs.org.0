Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5BF7A013
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 06:38:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yP2X4z0CzDqR5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 14:38:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yP0d0Q2FzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 14:37:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="CTRXVnpH"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45yP0c5bvwz9s3Z;
 Tue, 30 Jul 2019 14:37:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1564461424;
 bh=ZEK/SveL+CYAKkTNLqtDMeYcvcYDJezeg9+KKvNlKX8=;
 h=Date:From:To:Cc:Subject:From;
 b=CTRXVnpHci8dgwsm4WCheU0z7Wo7RhRqoLsYsB9dHCqCAqBuW/V0C43fq8dnSdqvS
 G89D86dDP6iOiXMy8YMBGh2U1E/PJJ/5SWBNYjbgsfAGPeUslwM4+vBhb5otx/bCEq
 tZhSdPCRoaUnXhl0Ow8yRxkYjcSxI+ORx4sY8wbCtQQz53lnfw7rutolOzGJwWnEEG
 /uKoL12TKT610vhMFkemVe9d0L8Ta1ky8eRa+QqOG8i/QMA65E/nJTqEtn6BYPorL0
 JSDh1womcDyczzaJOwKPC2lQ5oEckKnnlJPqO42sAOyr7NRXvfWft3BMrQ+49kPLFr
 ncu6ya2dz0k4w==
Date: Tue, 30 Jul 2019 14:37:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: [PATCH] drivers/macintosh/smu.c: Mark expected switch fall-through
Message-ID: <20190730143704.060a2606@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WkrTSZW/7hwA8JeT.W=8kOU";
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
Cc: Linux kernel Mailing List <linux-kernel@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/WkrTSZW/7hwA8JeT.W=8kOU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: powerpc):

drivers/macintosh/smu.c: In function 'smu_queue_i2c':
drivers/macintosh/smu.c:854:21: warning: this statement may fall through [-=
Wimplicit-fallthrough=3D]
   cmd->info.devaddr &=3D 0xfe;
   ~~~~~~~~~~~~~~~~~~^~~~~~~
drivers/macintosh/smu.c:855:2: note: here
  case SMU_I2C_TRANSFER_STDSUB:
  ^~~~

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/macintosh/smu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index 276065c888bc..23f1f41c8602 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -852,6 +852,7 @@ int smu_queue_i2c(struct smu_i2c_cmd *cmd)
 		break;
 	case SMU_I2C_TRANSFER_COMBINED:
 		cmd->info.devaddr &=3D 0xfe;
+		/* fall through */
 	case SMU_I2C_TRANSFER_STDSUB:
 		if (cmd->info.sublen > 3)
 			return -EINVAL;
--=20
2.22.0

--=20
Cheers,
Stephen Rothwell

--Sig_/WkrTSZW/7hwA8JeT.W=8kOU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0/yXAACgkQAVBC80lX
0GwhmAf/ePhS1Q79PIStbUXViKasLy26Y63miHzQp6DC0yYLAPcNySioEUZDBVuV
Pd4/3Pk/y8AKLhfuMOer8EMs7c16qY/yXKHn645SatMojhyHPR2HwYMLbNXQQip0
ziPURJty85qxE0ipdZJhWqtk5LC8kaIxXTXO4MRtzBOHHgSVOrMpv4LzIyuCxxbO
I59imbAfo5Uaf4EVlgg59yslaTKNc8Bf9LR2/E2KHez4eb4kh4G+mWk6hQ2p0lp8
zcsjrJpVJXUX/gZpngjhfMtiqr1KDQFHDCeOOAB4v6NwABvOqMDx5xN5Cs2OYi+K
/S1vr+2r9m0yvPEn80pZ8/HrBvhVvg==
=Gr+3
-----END PGP SIGNATURE-----

--Sig_/WkrTSZW/7hwA8JeT.W=8kOU--
