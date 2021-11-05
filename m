Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE40446230
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:27:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlxXS1wNCz3cMd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:27:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.48.137; helo=9.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 9.mo548.mail-out.ovh.net (9.mo548.mail-out.ovh.net
 [46.105.48.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxWW3j2Cz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:26:44 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 09EA120FB2;
 Fri,  5 Nov 2021 10:26:40 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00361977d61-dd90-41f4-b429-feee822636e0,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 03/11] powerpc/xive: Activate StoreEOI on P10
Date: Fri, 5 Nov 2021 11:26:28 +0100
Message-ID: <20211105102636.1016378-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fdb7b6d7-9d04-4997-955b-888db463a937
X-Ovh-Tracer-Id: 495114487457221597
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

StoreEOI (the capability to EOI with a store) requires load-after-store
ordering in some cases to be reliable. P10 introduced a new offset for
load operations to enforce correct ordering and the XIVE driver has
the required support since kernel 5.8, commit b1f9be9392f0
("powerpc/xive: Enforce load-after-store ordering when StoreEOI is active")

Since skiboot v7, StoreEOI support is advertised on P10 with a new flag
on the PowerNV platform. See skiboot commit 4bd7d84afe46 ("xive/p10:
Introduce a new OPAL_XIVE_IRQ_STORE_EOI2 flag"). When detected,
activate the feature.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/opal-api.h | 1 +
 arch/powerpc/sysdev/xive/native.c   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 0b63ba7d5917..a2bc4b95e703 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1094,6 +1094,7 @@ enum {
 	OPAL_XIVE_IRQ_SHIFT_BUG		= 0x00000008, /* P9 DD1.0 workaround */
 	OPAL_XIVE_IRQ_MASK_VIA_FW	= 0x00000010, /* P9 DD1.0 workaround */
 	OPAL_XIVE_IRQ_EOI_VIA_FW	= 0x00000020, /* P9 DD1.0 workaround */
+	OPAL_XIVE_IRQ_STORE_EOI2	= 0x00000040,
 };
 
 /* Flags for OPAL_XIVE_GET/SET_QUEUE_INFO */
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 1aec282cd650..7ec8911dad57 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -63,6 +63,8 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xive_irq_data *data)
 	opal_flags = be64_to_cpu(flags);
 	if (opal_flags & OPAL_XIVE_IRQ_STORE_EOI)
 		data->flags |= XIVE_IRQ_FLAG_STORE_EOI;
+	if (opal_flags & OPAL_XIVE_IRQ_STORE_EOI2)
+		data->flags |= XIVE_IRQ_FLAG_STORE_EOI;
 	if (opal_flags & OPAL_XIVE_IRQ_LSI)
 		data->flags |= XIVE_IRQ_FLAG_LSI;
 	data->eoi_page = be64_to_cpu(eoi_page);
-- 
2.31.1

