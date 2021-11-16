Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B87453307
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 14:41:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtnJY4Rnlz308v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 00:41:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout2.mo529.mail-out.ovh.net
 (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtnJ31hxLz2xtC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 00:40:33 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.10])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7AE36CBDABAD;
 Tue, 16 Nov 2021 14:40:28 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 14:40:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ba902aba-7469-4690-932b-30ee350104e4,
 BFAEB7FE3C4E2C4D96001007C3BA12B7689A693E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/xive: Change IRQ domain to a tree domain
Date: Tue, 16 Nov 2021 14:40:22 +0100
Message-ID: <20211116134022.420412-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8a1d5da2-01c1-4648-a552-ae3e5b97b2ab
X-Ovh-Tracer-Id: 13027787825618848550
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Marc Zyngier <maz@kernel.org>, Greg Kurz <groug@kaod.org>,
 stable@vger.kernel.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 4f86a06e2d6e ("irqdomain: Make normal and nomap irqdomains
exclusive") introduced an IRQ_DOMAIN_FLAG_NO_MAP flag to isolate the
'nomap' domains still in use under the powerpc arch. With this new
flag, the revmap_tree of the IRQ domain is not used anymore. This
change broke the support of shared LSIs [1] in the XIVE driver because
it was relying on a lookup in the revmap_tree to query previously
mapped interrupts. Linux now creates two distinct IRQ mappings on the
same HW IRQ which can lead to unexpected behavior in the drivers.

The XIVE IRQ domain is not a direct mapping domain and its HW IRQ
interrupt number space is rather large : 1M/socket on POWER9 and
POWER10, change the XIVE driver to use a 'tree' domain type instead.

[1] For instance, a linux KVM guest with virtio-rng and virtio-balloon
    devices.

Cc: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org # v5.14+
Fixes: 4f86a06e2d6e ("irqdomain: Make normal and nomap irqdomains exclusive")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Marc,

 The Fixes tag is there because the patch in question revealed that
 something was broken in XIVE. genirq is not in cause. However, I
 don't know for PS3 and Cell. May be less critical for now. 
 
 arch/powerpc/sysdev/xive/common.c | 3 +--
 arch/powerpc/sysdev/xive/Kconfig  | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index fed6fd16c8f4..9d0f0fe25598 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1536,8 +1536,7 @@ static const struct irq_domain_ops xive_irq_domain_ops = {
 
 static void __init xive_init_host(struct device_node *np)
 {
-	xive_irq_domain = irq_domain_add_nomap(np, XIVE_MAX_IRQ,
-					       &xive_irq_domain_ops, NULL);
+	xive_irq_domain = irq_domain_add_tree(np, &xive_irq_domain_ops, NULL);
 	if (WARN_ON(xive_irq_domain == NULL))
 		return;
 	irq_set_default_host(xive_irq_domain);
diff --git a/arch/powerpc/sysdev/xive/Kconfig b/arch/powerpc/sysdev/xive/Kconfig
index 97796c6b63f0..785c292d104b 100644
--- a/arch/powerpc/sysdev/xive/Kconfig
+++ b/arch/powerpc/sysdev/xive/Kconfig
@@ -3,7 +3,6 @@ config PPC_XIVE
 	bool
 	select PPC_SMP_MUXED_IPI
 	select HARDIRQS_SW_RESEND
-	select IRQ_DOMAIN_NOMAP
 
 config PPC_XIVE_NATIVE
 	bool
-- 
2.31.1

