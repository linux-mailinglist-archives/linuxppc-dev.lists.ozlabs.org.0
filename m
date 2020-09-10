Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E426523B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:11:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnWlz60p1zDqRK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:11:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnWYx2Sb4zDqh2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:02:59 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id BD415603F5F8;
 Thu, 10 Sep 2020 23:02:54 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Sep
 2020 23:02:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005685c7734-472e-4f8f-9067-62977696e0cb,
 8FE11AEDAF16247B821E16C08928A26F58BE1972) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/7] powerpc/prom: Fix W=1 compile warning
Date: Thu, 10 Sep 2020 23:02:45 +0200
Message-ID: <20200910210250.1962595-3-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200910210250.1962595-1-clg@kaod.org>
References: <20200910210250.1962595-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0ff1a18c-cdb3-4478-b604-1c02fd84242d
X-Ovh-Tracer-Id: 10699989767890766816
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

arch/powerpc/kernel/prom.c: In function ‘early_reserve_mem’:
arch/powerpc/kernel/prom.c:625:10: error: variable ‘reserve_map’ set but not used [-Werror=unused-but-set-variable]
  __be64 *reserve_map;
          ^~~~~~~~~~~
cc1: all warnings being treated as errors

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kernel/prom.c | 51 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index d8a2fb87ba0c..4bae9ebc7d0b 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -622,11 +622,6 @@ static void __init early_reserve_mem_dt(void)
 
 static void __init early_reserve_mem(void)
 {
-	__be64 *reserve_map;
-
-	reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
-			fdt_off_mem_rsvmap(initial_boot_params));
-
 	/* Look for the new "reserved-regions" property in the DT */
 	early_reserve_mem_dt();
 
@@ -639,28 +634,34 @@ static void __init early_reserve_mem(void)
 	}
 #endif /* CONFIG_BLK_DEV_INITRD */
 
-#ifdef CONFIG_PPC32
-	/* 
-	 * Handle the case where we might be booting from an old kexec
-	 * image that setup the mem_rsvmap as pairs of 32-bit values
-	 */
-	if (be64_to_cpup(reserve_map) > 0xffffffffull) {
-		u32 base_32, size_32;
-		__be32 *reserve_map_32 = (__be32 *)reserve_map;
-
-		DBG("Found old 32-bit reserve map\n");
-
-		while (1) {
-			base_32 = be32_to_cpup(reserve_map_32++);
-			size_32 = be32_to_cpup(reserve_map_32++);
-			if (size_32 == 0)
-				break;
-			DBG("reserving: %x -> %x\n", base_32, size_32);
-			memblock_reserve(base_32, size_32);
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		__be64 *reserve_map;
+
+		reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
+				 fdt_off_mem_rsvmap(initial_boot_params));
+
+		/*
+		 * Handle the case where we might be booting from an
+		 * old kexec image that setup the mem_rsvmap as pairs
+		 * of 32-bit values
+		 */
+		if (be64_to_cpup(reserve_map) > 0xffffffffull) {
+			u32 base_32, size_32;
+			__be32 *reserve_map_32 = (__be32 *)reserve_map;
+
+			DBG("Found old 32-bit reserve map\n");
+
+			while (1) {
+				base_32 = be32_to_cpup(reserve_map_32++);
+				size_32 = be32_to_cpup(reserve_map_32++);
+				if (size_32 == 0)
+					break;
+				DBG("reserving: %x -> %x\n", base_32, size_32);
+				memblock_reserve(base_32, size_32);
+			}
+			return;
 		}
-		return;
 	}
-#endif
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-- 
2.25.4

