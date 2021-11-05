Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA34446231
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:28:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlxXv5gz0z3bnq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:27:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244;
 helo=10.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxWX2hNcz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:26:47 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1F55222D29;
 Fri,  5 Nov 2021 10:26:43 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033933b172-7a8e-47d4-8032-f10cb3cf744f,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 10/11] powerpc/xive: Add a debugfs toggle for save-restore
Date: Fri, 5 Nov 2021 11:26:35 +0100
Message-ID: <20211105102636.1016378-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72165d19-5395-4e7b-b9a4-fdd1f0fb8140
X-Ovh-Tracer-Id: 495958910991961053
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

On POWER10, the automatic "save & restore" of interrupt context is
always available. Provide a way to deactivate it for tests or
performance.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h | 1 +
 arch/powerpc/sysdev/xive/common.c        | 1 +
 arch/powerpc/sysdev/xive/native.c        | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysdev/xive/xive-internal.h
index 504e7edce358..e0941bc64430 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -72,5 +72,6 @@ static inline u32 xive_alloc_order(u32 queue_shift)
 }
 
 extern bool xive_cmdline_disabled;
+extern bool xive_has_save_restore;
 
 #endif /*  __XIVE_INTERNAL_H */
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 67fd3a306369..39142df828a0 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1848,6 +1848,7 @@ static void xive_core_debugfs_create(void)
 				    &xive_eq_debug_fops);
 	}
 	debugfs_create_bool("store-eoi", 0600, xive_dir, &xive_store_eoi);
+	debugfs_create_bool("save-restore", 0600, xive_dir, &xive_has_save_restore);
 }
 
 #endif /* CONFIG_DEBUG_FS */
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 7ec8911dad57..d6a091dc1bce 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -41,7 +41,7 @@ static u32 xive_queue_shift;
 static u32 xive_pool_vps = XIVE_INVALID_VP;
 static struct kmem_cache *xive_provision_cache;
 static bool xive_has_single_esc;
-static bool xive_has_save_restore;
+bool xive_has_save_restore;
 
 int xive_native_populate_irq_data(u32 hw_irq, struct xive_irq_data *data)
 {
-- 
2.31.1

