Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C7269787
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 23:15:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqzfv4p7bzDqJq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 07:15:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqzXV42FGzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 07:10:16 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 7EFBA6192E92;
 Mon, 14 Sep 2020 23:10:11 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 14 Sep
 2020 23:10:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006457ec02e-4141-404b-bda1-b7e52dec9d1c,
 D669A8CAADBA69FE96853FFB68FF36F34E8DD5E5) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/7] powerpc/prom: Introduce early_reserve_mem_old()
Date: Mon, 14 Sep 2020 23:10:02 +0200
Message-ID: <20200914211007.2285999-3-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914211007.2285999-1-clg@kaod.org>
References: <20200914211007.2285999-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4ae79c46-b72a-46c4-a7dc-6adcf5551cad
X-Ovh-Tracer-Id: 15867025913806162912
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

and condition its call with IS_ENABLED(CONFIG_PPC32). This fixes a
compile error with W=1.

arch/powerpc/kernel/prom.c: In function ‘early_reserve_mem’:
arch/powerpc/kernel/prom.c:625:10: error: variable ‘reserve_map’ set but not used [-Werror=unused-but-set-variable]
  __be64 *reserve_map;
          ^~~~~~~~~~~
cc1: all warnings being treated as errors

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kernel/prom.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index d8a2fb87ba0c..c958b67cf1a5 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -620,27 +620,14 @@ static void __init early_reserve_mem_dt(void)
 	}
 }
 
-static void __init early_reserve_mem(void)
+static void __init early_reserve_mem_old(void)
 {
 	__be64 *reserve_map;
 
 	reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
 			fdt_off_mem_rsvmap(initial_boot_params));
 
-	/* Look for the new "reserved-regions" property in the DT */
-	early_reserve_mem_dt();
-
-#ifdef CONFIG_BLK_DEV_INITRD
-	/* Then reserve the initrd, if any */
-	if (initrd_start && (initrd_end > initrd_start)) {
-		memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
-			ALIGN(initrd_end, PAGE_SIZE) -
-			ALIGN_DOWN(initrd_start, PAGE_SIZE));
-	}
-#endif /* CONFIG_BLK_DEV_INITRD */
-
-#ifdef CONFIG_PPC32
-	/* 
+	/*
 	 * Handle the case where we might be booting from an old kexec
 	 * image that setup the mem_rsvmap as pairs of 32-bit values
 	 */
@@ -658,9 +645,25 @@ static void __init early_reserve_mem(void)
 			DBG("reserving: %x -> %x\n", base_32, size_32);
 			memblock_reserve(base_32, size_32);
 		}
-		return;
 	}
-#endif
+}
+
+static void __init early_reserve_mem(void)
+{
+	/* Look for the new "reserved-regions" property in the DT */
+	early_reserve_mem_dt();
+
+#ifdef CONFIG_BLK_DEV_INITRD
+	/* Then reserve the initrd, if any */
+	if (initrd_start && (initrd_end > initrd_start)) {
+		memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
+			ALIGN(initrd_end, PAGE_SIZE) -
+			ALIGN_DOWN(initrd_start, PAGE_SIZE));
+	}
+#endif /* CONFIG_BLK_DEV_INITRD */
+
+	if (IS_ENABLED(CONFIG_PPC32))
+		early_reserve_mem_old();
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-- 
2.25.4

