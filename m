Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C84409001
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 15:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7SVW6d2Vz2yQ6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 23:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.105.233;
 helo=2.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 363 seconds by postgrey-1.36 at boromir;
 Mon, 13 Sep 2021 23:47:38 AEST
Received: from 2.mo552.mail-out.ovh.net (2.mo552.mail-out.ovh.net
 [178.33.105.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7STk5MFgz2yKR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 23:47:38 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2CB1321542;
 Mon, 13 Sep 2021 13:41:27 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 15:41:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002c3902780-574b-4e3f-813f-8b4d8019164a,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/xics: Set the IRQ chip data for the ICS native backend
Date: Mon, 13 Sep 2021 15:40:56 +0200
Message-ID: <20210913134056.3761960-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a08d4afa-d702-4c46-aa61-47f32c369449
X-Ovh-Tracer-Id: 6126865821078293469
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ICS native driver relies on the IRQ chip data to find the struct
'ics_native' describing the ICS controller but it was removed by commit
248af248a8f4 ("powerpc/xics: Rename the map handler in a check handler").
Revert this change to fix the Microwatt SoC platform.

Fixes: 248af248a8f4 ("powerpc/xics: Rename the map handler in a check handler")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xics/xics-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index 5c1a157a83b8..244a727c6ba4 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -348,9 +348,9 @@ static int xics_host_map(struct irq_domain *domain, unsigned int virq,
 	if (xics_ics->check(xics_ics, hwirq))
 		return -EINVAL;
 
-	/* No chip data for the XICS domain */
+	/* Let the ICS be the chip data for the XICS domain. For ICS native */
 	irq_domain_set_info(domain, virq, hwirq, xics_ics->chip,
-			    NULL, handle_fasteoi_irq, NULL, NULL);
+			    xics_ics, handle_fasteoi_irq, NULL, NULL);
 
 	return 0;
 }
-- 
2.31.1

