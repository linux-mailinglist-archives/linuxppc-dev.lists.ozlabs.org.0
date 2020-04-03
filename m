Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7D19CF0F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:13:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tmlB6Zx0zDrQQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:13:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tmh8193tzDrJV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 15:11:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tmh75vw1z9sRY;
 Fri,  3 Apr 2020 15:11:03 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/dt_cpu_ftrs: Advertise support for ISA v3.1 if
 selected
Date: Fri,  3 Apr 2020 15:10:55 +1100
Message-Id: <20200403041055.27535-2-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403041055.27535-1-alistair@popple.id.au>
References: <20200403041055.27535-1-alistair@popple.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mikey@neuling.org, npiggin@gmail.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable Advertising support for cpu feature ISA v3.1 if advertised in the
device-tree.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index ad75095c121f..7c00419bfb64 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -26,6 +26,7 @@
 /* Device-tree visible constants follow */
 #define ISA_V2_07B      2070
 #define ISA_V3_0B       3000
+#define ISA_V3_1        3100
 
 #define USABLE_PR               (1U << 0)
 #define USABLE_OS               (1U << 1)
@@ -658,6 +659,11 @@ static void __init cpufeatures_setup_start(u32 isa)
 		cur_cpu_spec->cpu_features |= CPU_FTR_ARCH_300;
 		cur_cpu_spec->cpu_user_features2 |= PPC_FEATURE2_ARCH_3_00;
 	}
+
+	if (isa >= 3100) {
+		cur_cpu_spec->cpu_features |= CPU_FTR_ARCH_31;
+		cur_cpu_spec->cpu_user_features2 |= PPC_FEATURE2_ARCH_3_1;
+	}
 }
 
 static bool __init cpufeatures_process_feature(struct dt_cpu_feature *f)
-- 
2.20.1

