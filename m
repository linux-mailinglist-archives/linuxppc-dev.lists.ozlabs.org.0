Return-Path: <linuxppc-dev+bounces-7872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4DA95C57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 04:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhRZQ53MHz3bpt;
	Tue, 22 Apr 2025 12:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ae"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745289432;
	cv=none; b=MOQ28ZCDahJTtZDcTSGwoaqjfaK6sECCv15U2J+4RnQP9dAbMOPUmrfPQXvqnQnv2QdmWDsQPqFcoL9bcTCgPKaF/P523c6If3XlXgs+1pYn5Px/5wvyP3HJKIksqC66jXw6D6h8CdJeiK3r448vat3YgFUUVzAIDZBlIK/QycOCk2aLBR6vh6eoikFQBtpBiHKBHcsesZWqxne13Nrmvs3FlTwQPGinJOqdFFzjozohq2EdX8oc05NctszunaIR5yvG/QhDMJosItAaMJZAm7esxgQMLv48NCz8hQGwexXouiQp4Hs6cBV/JwgFInoPYsqVREHEDM++z9sgVcC5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745289432; c=relaxed/relaxed;
	bh=2Nw6SGmFuOHiMnCDJg0/g7L7mJqzQ17JM76NGIuuNfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nCjP41FlQqgNrYxGUlqA163tfaobqlPa3vF1DAHLKdTY/mnsPgV/1r6BGr+YEU/D15VOqQv3RvcFQSWM7Zh3ArZIzlCh/t6K2zx8sRPJJnYiIeBnIQtCC4UXlpfHX0EFashgEGn8sCFEiqIhFDjkcRiQzvFGZthYPxLVLVI0PA2PtcPsgKCpgX5HzBpWt3JICF1B/lcWWFdu3KpetEQsZsKEmfkIqTzabefdZkpaPa4UGev/93aWrTPV0sOE4UEY6y01BQPnO+BnB9jBcnFC2mgEwOJyh0j4vPeANCKtUfCLDhMuH5FBVtGm7zXkHcQTgEgSmH/OoTZrdPmY7iZsUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=2001:41d0:203:375::ae; helo=out-174.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ae; helo=out-174.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 71 seconds by postgrey-1.37 at boromir; Tue, 22 Apr 2025 12:37:11 AEST
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [IPv6:2001:41d0:203:375::ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhRGH60hwz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:37:11 +1000 (AEST)
Date: Mon, 21 Apr 2025 22:36:46 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: [PATCH] kexec: Include kernel-end even without crashkernel
Message-ID: <2025042122-inescapable-mandrill-8a5ff2@boujee-and-buff>
Mail-Followup-To: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-kernel@vger.kernel.org
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzde7snpamx2jdcs"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--nzde7snpamx2jdcs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] kexec: Include kernel-end even without crashkernel
MIME-Version: 1.0

Certain versions of kexec don't even work without kernel-end being
added to the device-tree. Add it even if crash-kernel is disabled.

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/kexec/core.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 00e9c267b912f..7b5958c37f702 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -22,6 +22,8 @@
 #include <asm/setup.h>
 #include <asm/firmware.h>
=20
+#define cpu_to_be_ulong __PASTE(cpu_to_be, BITS_PER_LONG)
+
 #ifdef CONFIG_CRASH_DUMP
 void machine_crash_shutdown(struct pt_regs *regs)
 {
@@ -136,17 +138,10 @@ int __init overlaps_crashkernel(unsigned long start, =
unsigned long size)
 }
=20
 /* Values we need to export to the second kernel via the device tree. */
-static phys_addr_t kernel_end;
 static phys_addr_t crashk_base;
 static phys_addr_t crashk_size;
 static unsigned long long mem_limit;
=20
-static struct property kernel_end_prop =3D {
-	.name =3D "linux,kernel-end",
-	.length =3D sizeof(phys_addr_t),
-	.value =3D &kernel_end,
-};
-
 static struct property crashk_base_prop =3D {
 	.name =3D "linux,crashkernel-base",
 	.length =3D sizeof(phys_addr_t),
@@ -165,8 +160,6 @@ static struct property memory_limit_prop =3D {
 	.value =3D &mem_limit,
 };
=20
-#define cpu_to_be_ulong	__PASTE(cpu_to_be, BITS_PER_LONG)
-
 static void __init export_crashk_values(struct device_node *node)
 {
 	/* There might be existing crash kernel properties, but we can't
@@ -190,6 +183,15 @@ static void __init export_crashk_values(struct device_=
node *node)
 	mem_limit =3D cpu_to_be_ulong(memory_limit);
 	of_update_property(node, &memory_limit_prop);
 }
+#endif /* CONFIG_CRASH_RESERVE */
+
+static phys_addr_t kernel_end;
+
+static struct property kernel_end_prop =3D {
+	.name =3D "linux,kernel-end",
+	.length =3D sizeof(phys_addr_t),
+	.value =3D &kernel_end,
+};
=20
 static int __init kexec_setup(void)
 {
@@ -200,16 +202,17 @@ static int __init kexec_setup(void)
 		return -ENOENT;
=20
 	/* remove any stale properties so ours can be found */
-	of_remove_property(node, of_find_property(node, kernel_end_prop.name, NUL=
L));
+	of_remove_property(node, of_find_property(node, kernel_end_prop.name,
+						  NULL));
=20
 	/* information needed by userspace when using default_machine_kexec */
 	kernel_end =3D cpu_to_be_ulong(__pa(_end));
 	of_add_property(node, &kernel_end_prop);
=20
+#ifdef CONFIG_CRASH_RESERVE
 	export_crashk_values(node);
-
+#endif
 	of_node_put(node);
 	return 0;
 }
 late_initcall(kexec_setup);
-#endif /* CONFIG_CRASH_RESERVE */
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--nzde7snpamx2jdcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHAL4ACgkQXVpXxyQr
Is/Rdw//aZ/gDOUiLOgJS8j1ko2eGjIzxYlBW03r8PuxmJYsvyE2NQafHwyBcZIW
7LgYOCArrlqW8hJJN0bU9fPEqgb/pbsQZWdNlGQlgXL/Q6mmQCunEzdPiyXCuduf
kZZKYy6J0h4uxcA3r9zlPbwfePgC279IS3cHWDhQW9+KX/1VatTgQCa9ouMaBuLm
l4QZfLU8lBkZhUT6uZ9xk5977s0uUN++30VTNujVAgW8jFQmkmoScVuj40GsdnuL
MMi1Q7PQSgsM9sjAtTczAo6b5VWysSc4cqZFbZYRPk72E+heGptKxngVo84It7a1
jFozTTQycO9jp8x4k6ootp4xmn+yM2x5LqAfXy9lwE5QCRG1PjSQJsXupWGW3bMT
URa3zqNySf3yhmCxi0pHXhU0ZNhUpFX7IwfMEouZR8qcqOCarZ9PXNXp7dordh/L
Lpi9MEJx8HZG46+TxFAK1QGwv3hY7K1L7yAGwt7IPr/tR8dDXFn1FN0AJ+pPkmiN
IJ7UGlNZliwvr4CzB7CjH2hwi528tXfoBgR2xp9cKUuEnweyFKXPtCpcYRI4Z6xq
lDzmRTBk2u/Re/uXzziLOPciUUxjNTEl0lEuJ9pHNAtcHD+4dh0u07sGEopWlf6h
oZtck4zNVZQh6ak+nvXuf44c5RDqvYaQkclumtE6GBzFpjZeh+g=
=oqyi
-----END PGP SIGNATURE-----

--nzde7snpamx2jdcs--

