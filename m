Return-Path: <linuxppc-dev+bounces-7877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFFBA95C88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 05:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhS4l1wS1z3bq4;
	Tue, 22 Apr 2025 13:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745290212;
	cv=none; b=hT0nEG6lIeZI6X/zeYROVCZ9tjnzbS4T1iAvmR9mAPABlUUvi6w+ccLyVaVVc///TgfHJk1u1EMDJW5TmVh0IJcYyFhmhWY96fCs/B1xZRytYUbDUrAd7Vcv9ioUbpkPrImVDhFOmv5+/JcFb6w8bVdaQu5yEOa5kca29yCXb7AkKK1ttEG7ywauDgJl4i4Ld1aVsXjkQE1/8Jm36HaTkhF/e/7z/StXxZbCd5fDQdRmhvmr1RTpDOED49tXz2pcdQl+RfzbWjVLLxo4UZ9NVqY8iLp5J+9sgnhN3mVpfUhmnj4qqXqV4oi3ucWOE3VzxGxIR9wwMyzPGdGYqIP+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745290212; c=relaxed/relaxed;
	bh=TwFaQ7frDjrCefutC1zgMhdSId++3K1FDo66uteIkI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lS295PUhvFzCBUa81U4Ecdx0dmQujV1nUVwpsefrFmHER1YBSe5ifmfRhjg32nm6kk41Y8/ygUo3/CkBVz2lz+94Nq42ijlUmNUa2fWY1S4DDzIjrAdEntwKMv9f2Ui1jEnQsdJCs+yi71LtHdJPRUjrf8d0VJUQdtklQgsn0OaExbayaaCYxdBkNeYlpqVJyDXBMzSNCO7PUMdQ3mVLwzXtn+4lvayXawIjNjmXjYRbwqinvED4P/5uTExKw+P/PMhzQKL63faKNq0EZr7c0jGFkOhziGP8JsKi4VX4GIwNaHveRh9kq/TFjsMiKWGAHKd1jbYMvFuApN78h11csw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=95.215.58.187; helo=out-187.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.187; helo=out-187.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhRYJ24G3z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:50:11 +1000 (AEST)
Date: Mon, 21 Apr 2025 22:49:49 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Message-ID: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
Mail-Followup-To: dmaengine@vger.kernel.org, Zhang Wei <zw@zh-kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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
	protocol="application/pgp-signature"; boundary="ufg4z4oabgkqbv5p"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ufg4z4oabgkqbv5p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] fsldma: Support 40 bit DMA addresses where capable
MIME-Version: 1.0

On 64-bit QorIQ platforms like T4240, the CPU supports 40-bit addressing
and memory configurations > 64GiB. The fsldma driver is limiting itself
to only 64GiB in all Elo configurations.

Setup fsldma driver to make use of the full 40-bit addressing space,
specifically on the e5500 and e6500 CPUs.

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Zhang Wei <zw@zh-kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/fsldma.c | 2 +-
 drivers/dma/fsldma.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index b5e7d18b97669..8c01963ad47d8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1254,7 +1254,7 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->common.directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	fdev->common.residue_granularity =3D DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
=20
-	dma_set_mask(&(op->dev), DMA_BIT_MASK(36));
+	dma_set_mask(&(op->dev), DMA_BIT_MASK(ELO_MAX_PHYS_BITS));
=20
 	platform_set_drvdata(op, fdev);
=20
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index 308bed0a560ac..1e7bd37208412 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -13,6 +13,13 @@
 #include <linux/dmapool.h>
 #include <linux/dmaengine.h>
=20
+/* Physical addressing capability */
+#if defined(CONFIG_E6500_CPU) || defined(CONFIG_E5500_CPU)
+#define ELO_MAX_PHYS_BITS	40
+#else
+#define ELO_MAX_PHYS_BITS	36
+#endif
+
 /* Define data structures needed by Freescale
  * MPC8540 and MPC8349 DMA controller.
  */
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--ufg4z4oabgkqbv5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHA80ACgkQXVpXxyQr
Is9JeQ/8Dko2O5Urq432buc/7ynFHW0W1g3CqE4IA+G6+v1Cxo9qzCL4+vprFp/m
zXuzz+9pWxlM/rwuq/YWe0ZaAaaqas/501/G8E9hxnIuPrtnzLhu5vJlRy2pvcvI
ArbCZR+oz8fxPu/DspUMMJ1L4yQBKWxzHBnwP/R//iHNQYnyTftf8baSk5A+u0Z+
L/SFJUDDuMEY/4duUNciKLSUVSdCOcQJoiBemG0ZcSXAAweiJCKYTuqYDbcd3tNB
8k/Qq8MOE5+5Y6lxmACRM4rRz80x21MomBcJSkoQYdiHF2jQcJtAr8GNSCYKXqJt
Zu93agKXbjCyPuc+GQwtFbVVE5VPqHgPoEiCTi6OVGBejkFJ9W+IctpSNrRm7ufv
UMWq2oXbu1h8lXp23WhV1Up03oMAaaQ9EQlu1bsMwfnS0tc8OJyXo2GcqSbAP/C8
bM86k0NWYnUDdFUbwfhyVAtcjGmukL0uqe5RLpQULmM7U3kNpm8QQirJpIKZBlJ3
UWYCRlxSO3ol15bQFMhIOVvHwl4Z7Zlm8WP4beTwicy8diA2j7Ij6JTTbMxP+5Qi
wbma1y2UqUyfq/QaRhOvqpYlxXaGDiohYziTrHPph2rlWYsaM/70VdwJT9CUKXmP
6tZu38Fj3IT5Ozhu9pnfXpjfNiBEXMu4gED/bfMoBFN2UHKdbF8=
=KEhy
-----END PGP SIGNATURE-----

--ufg4z4oabgkqbv5p--

