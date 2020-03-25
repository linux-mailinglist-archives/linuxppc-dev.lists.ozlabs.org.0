Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EC191FA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 04:21:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nD0c0gPfzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 14:21:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz; envelope-from=chrisp@alliedtelesis.co.nz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=BLEduHMy; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nCyK3187zDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 14:19:04 +1100 (AEDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 16A3780237;
 Wed, 25 Mar 2020 16:19:04 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1585106344;
 bh=44FbT0mY8dOR0hwrYqg7wYOelRc5U4Tpq4XNZFjkj7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BLEduHMykXfOplW6ragwvQQqpcdRpobJPpQFFburhQek0Z80PQCnS496Yk4YEpXPs
 dkS/F4EOvcT80UScHmghxLCzBrsNtCkMPo620PIaLTc/+Xru/e/QFQNPY9y9dNGEPP
 RpvhySnIFFD2VTLo68s0nc7GP5RGbTilU9KDZN4Ig6QogFIMeV8u+roM+iLsOA+Xhs
 bF1gE0VauUcbHIDk5S6SXv9AbhRNUBcl6QBh73HxeenFBLRyHBB+s4Z+LicGgWsej2
 0Rs5YfVsFSz6i4tZIbiW/uv40nPXbZgFwkP9qqr+K8/BKiglc3UpNABDfW4wwDXnzG
 fjbV1Ml2naPaQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5e7acda20000>; Wed, 25 Mar 2020 16:19:03 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id 3866C13EEB7;
 Wed, 25 Mar 2020 16:18:58 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id CF44A28006C; Wed, 25 Mar 2020 16:18:58 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr, tglx@linutronix.de, oss@buserror.net
Subject: [PATCH v2] powerpc/setup_64: Set cache-line-size based on
 cache-block-size
Date: Wed, 25 Mar 2020 16:18:54 +1300
Message-Id: <20200325031854.7625-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dd342c71e03e654a8786302d82f9662004418c6e.camel@alliedtelesis.co.nz>
References: <dd342c71e03e654a8786302d82f9662004418c6e.camel@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
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
Cc: Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If {i,d}-cache-block-size is set and {i,d}-cache-line-size is not, use
the block-size value for both. Per the devicetree spec cache-line-size
is only needed if it differs from the block size.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
It looks as though the bsizep =3D lsizep is not required per the spec but=
 it's
probably safer to retain it.

Changes in v2:
- Scott pointed out that u-boot should be filling in the cache properties
  (which it does). But it does not specify a cache-line-size because it
  provides a cache-block-size and the spec says you don't have to if they=
 are
  the same. So the error is in the parsing not in the devicetree itself.

 arch/powerpc/kernel/setup_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_6=
4.c
index e05e6dd67ae6..dd8a238b54b8 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -516,6 +516,8 @@ static bool __init parse_cache_info(struct device_nod=
e *np,
 	lsizep =3D of_get_property(np, propnames[3], NULL);
 	if (bsizep =3D=3D NULL)
 		bsizep =3D lsizep;
+	if (lsizep =3D=3D NULL)
+		lsizep =3D bsizep;
 	if (lsizep !=3D NULL)
 		lsize =3D be32_to_cpu(*lsizep);
 	if (bsizep !=3D NULL)
--=20
2.25.1

