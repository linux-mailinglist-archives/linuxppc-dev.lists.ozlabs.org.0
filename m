Return-Path: <linuxppc-dev+bounces-7876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C4A95C5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 04:51:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhRZx0sqxz3bwR;
	Tue, 22 Apr 2025 12:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745290002;
	cv=none; b=Fw8j27qOEbpkoJu0jNBsnRTc20m51Yj8jwvtsthKuk3EHd501o+pEIVXainzGNNvepD6tVt9jrC5UM1tiH7m04/cfUv5ZYChhSVhEBiVS+SYW2fXxkj6s4oZ9Aieu2qqbd9gypmEY90WOm9Tk3ZIeZTDn1ZtXc3RzaU54BTiznCUmjFmifvrqMB+VY1U5APiSDQKqnK8ZbPBr9VNyBE8NOj1lzLMUNBV0VlGt7rFYA0PtfEbd4MmHYiV5x23iTWgTk6sIMstMKjn60r1IJT0x/fd5lnewzakTUDeg+CZrIxebQfQDwWwXuF9VjGh+lWDOlMi/9YzgkMyd3AdmdCHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745290002; c=relaxed/relaxed;
	bh=UHqJNxoN2EkZKoX2Nvs/ll2psHRNdLh5BlrYxTMxZlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SUQxv9WVo1XPmFxpkarYvCBiEjBy7ZqshzXu1taPlPsctGPiFVagkJqKnafsuH0+PS+8uAsVKJBniLm1RL5URI7f6C9LACmzpm9VEcSOLFPUxVM6QniHhxwpr2JkJk5El1HNPVp6KE0J86asApupApxEO6R1/3CHEcRu/3bHH11i44zzKlDXBNfNstHFs+j5LiwO/N8abaAirO75wxaRhkF+J6aiU4RToA1KGGwjIlAxj+c7PTZRI41nAR/M8PjIHu/gV2gAht4cewyDc69JRqO94+cB5NRWHm1oG4yhy/pjBELHg8x1pTa+Y0XrqF+5/AZA+hyiqHT/uQ1/iHvOKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=91.218.175.188; helo=out-188.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.188; helo=out-188.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhRTF4jy9z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:46:41 +1000 (AEST)
Date: Mon, 21 Apr 2025 22:46:19 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: iommu@lists.linux.dev
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] fsl_pamu: Use 40-bits for addressing where appropriate
Message-ID: <2025042122-prudent-dogfish-eac6bf@boujee-and-buff>
Mail-Followup-To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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
	protocol="application/pgp-signature"; boundary="pj6oaviibqdhrhkl"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--pj6oaviibqdhrhkl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] fsl_pamu: Use 40-bits for addressing where appropriate
MIME-Version: 1.0

On 64-bit QorIQ platforms like T4240, the CPU supports 40-bit addressing
and it's safe to move resources to the upper bounds of the 1TiB limit to
make room for > 64GiB of memory. The PAMU driver does not account for
this, however.

Setup fsl,pamu driver to make use of the full 40-bit addressing space
when configuring liodn's that may have been configured in this range.
Specifically the e5500 and e6500 CPUs.

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/iommu/fsl_pamu.c        | 5 +++--
 drivers/iommu/fsl_pamu.h        | 7 +++++++
 drivers/iommu/fsl_pamu_domain.c | 5 +++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index f37d3b0441318..ceb352f824010 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -198,7 +198,7 @@ int pamu_config_ppaace(int liodn, u32 omi, u32 stashid,=
 int prot)
=20
 	/* window size is 2^(WSE+1) bytes */
 	set_bf(ppaace->addr_bitfields, PPAACE_AF_WSE,
-	       map_addrspace_size_to_wse(1ULL << 36));
+	       map_addrspace_size_to_wse(1ULL << PAMU_MAX_PHYS_BITS));
=20
 	pamu_init_ppaace(ppaace);
=20
@@ -475,7 +475,8 @@ static void setup_liodns(void)
 			ppaace =3D pamu_get_ppaace(liodn);
 			pamu_init_ppaace(ppaace);
 			/* window size is 2^(WSE+1) bytes */
-			set_bf(ppaace->addr_bitfields, PPAACE_AF_WSE, 35);
+			set_bf(ppaace->addr_bitfields, PPAACE_AF_WSE,
+			       (PAMU_MAX_PHYS_BITS - 1));
 			ppaace->wbah =3D 0;
 			set_bf(ppaace->addr_bitfields, PPAACE_AF_WBAL, 0);
 			set_bf(ppaace->impl_attr, PAACE_IA_ATM,
diff --git a/drivers/iommu/fsl_pamu.h b/drivers/iommu/fsl_pamu.h
index 36df7975ff64d..5d88871610cfd 100644
--- a/drivers/iommu/fsl_pamu.h
+++ b/drivers/iommu/fsl_pamu.h
@@ -42,6 +42,13 @@ struct pamu_mmap_regs {
 	u32 olal;
 };
=20
+/* Physical addressing capability */
+#if defined(CONFIG_E6500_CPU) || defined(CONFIG_E5500_CPU)
+#define PAMU_MAX_PHYS_BITS	40
+#else
+#define PAMU_MAX_PHYS_BITS	36
+#endif
+
 /* PAMU Error Registers */
 #define PAMU_POES1 0x0040
 #define PAMU_POES2 0x0044
diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domai=
n.c
index 30be786bff11e..a4bc6482a00f7 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -214,9 +214,10 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsi=
gned type)
 	INIT_LIST_HEAD(&dma_domain->devices);
 	spin_lock_init(&dma_domain->domain_lock);
=20
-	/* default geometry 64 GB i.e. maximum system address */
+	/* Set default geometry based on physical address limit. */
 	dma_domain->iommu_domain. geometry.aperture_start =3D 0;
-	dma_domain->iommu_domain.geometry.aperture_end =3D (1ULL << 36) - 1;
+	dma_domain->iommu_domain.geometry.aperture_end =3D
+		(1ULL << PAMU_MAX_PHYS_BITS) - 1;
 	dma_domain->iommu_domain.geometry.force_aperture =3D true;
=20
 	return &dma_domain->iommu_domain;
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--pj6oaviibqdhrhkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHAvsACgkQXVpXxyQr
Is/i3BAAgl5kSqFcIQKaB3suzOElgqN0+NBpccZSK6uwDAJHAkZr7dt3X/ODq2eb
UirHWny6+Os+NVhMoUJPi1YfwrMEcJ9zBcmm555rG5yjdjVfvG6qbspOCr9lvJqa
D/aKOcc9xDCzaRwcfCs3E4i4uQOp/LPIl7OTEnhMGDZ8SoV48KU5ZZsbO3WcqtZY
C0PF1V1WosMfNq4L16CX3G2eVKtmdUye55UxZTDYIRaZq3XxeskEu45ajZ7QASCd
rf/aNwEiQ0h/9OzDvODpVQETzDC2l0FX9zXz8D5SVNeMLZ7uJYM3ypjk+D88gI/z
qox/idKCOMhA0ig8D0TPQzJvqxozqyQxLBAdeTdgpbK/GiMT2FTubwqf1ieLlcLX
ETZrKQQZIGT8O2Kj+g6CHrqTrUoaqjhE5/UWvV5RAIUXz+JH4mD9zzQqvOZGK8g+
m1JQ/EZbvB1ORIkKUPkuzoH7/T7E6/fmFtTOOyHl8WLejHTM/fxOgH1qdCN3Qi79
9vUWnqCoqrzLSQdVzJiw46xe0F6hQxie5AkdhU6XvyclrC4mT3JM5oSNf8lNwXE6
RNLCriQafnXDOgKvwXZEhSDzNQmvD4oigZU28u5zBK5LwX8t6oLa2cvq3YMrBMXc
yF6DBrG74detuDsryoYJUG4wX8w6k0crgqv/+1JRNSUOiWD9jvE=
=cGYA
-----END PGP SIGNATURE-----

--pj6oaviibqdhrhkl--

