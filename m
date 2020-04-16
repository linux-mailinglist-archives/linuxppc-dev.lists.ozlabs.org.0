Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A31AD2C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:21:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493DFv3QQWzDsGD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 08:21:07 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=jAcsCgXt; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493DCp6whVzDrqZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 08:19:18 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 26D8380237;
 Fri, 17 Apr 2020 10:19:14 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1587075554;
 bh=Q25O0zMYnj2n8G0DKq4+jMT0JQDqrMU1d/pgFwM9/iA=;
 h=From:To:Cc:Subject:Date;
 b=jAcsCgXtcFhtOGdV4tQQz8vYwPowCFu4SePo6vwj9K9+TJgexb2kGcwXFgsgvwfxp
 zW/Hxpw5R9QA/XMS7smG3U0KXqXDsWA9C9LvQdhOEZaV6q3tuSQM2K/rGDEUnjo8A9
 OjcwnpOArLlXZcDI+yACczJQjMBDxr//1C14ulyP4iYKbXlvusx0toT36Xr873bb3g
 ebi3raPEctRrfsxa5X0f5WyacvNaP2sFLgI5eA0n+VJRKno0jxisYHUhVlgVAtKzX2
 8Hp1Umcgyzy9kFHq7d1u3ABHmxtvtGGO3BcKLxGlPH54LF9J99xYaNFcNrw6aZHkAi
 AJw+i7ozQqlmQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5e98d9e00000>; Fri, 17 Apr 2020 10:19:12 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id B8E6013EF08;
 Fri, 17 Apr 2020 10:19:13 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id D339028006C; Fri, 17 Apr 2020 10:19:13 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, christophe.leroy@c-s.fr,
 tglx@linutronix.de, paulus@samba.org, cai@lca.pw, oss@buserror.net
Subject: [PATCH v3] powerpc/setup_64: Set cache-line-size based on
 cache-block-size
Date: Fri, 17 Apr 2020 10:19:08 +1200
Message-Id: <20200416221908.7886-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If {i,d}-cache-block-size is set and {i,d}-cache-line-size is not, use
the block-size value for both. Per the devicetree spec cache-line-size
is only needed if it differs from the block size.

Originally the code would fallback from block size to line size. An
error message was printed if both properties were missing.

Later the code was refactored to use clearer names and logic but it
inadvertently made line size a required property. This caused the
default values to be used and in turn leads to Power9 systems using the
wrong size.

Fixes: bd067f83b084 ("powerpc/64: Fix naming of cache block vs. cache lin=
e")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
It looks as though the bsizep =3D lsizep is not required per the spec but=
 it's
probably safer to retain it.

Changes in v3:
- Rebase against 5.7.0-rc1
- Add Fixes tag
- Add more information to commit message

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
index 438a9befce41..8105010b0e76 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -534,6 +534,8 @@ static bool __init parse_cache_info(struct device_nod=
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

