Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8154C9CBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 05:49:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7hTn4lbSz3flQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 15:49:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::231;
 helo=relay11.mail.gandi.net; envelope-from=ash@heyquark.com;
 receiver=<UNKNOWN>)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7hPS11TVz3chn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 15:45:15 +1100 (AEDT)
Received: (Authenticated sender: ash@heyquark.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 379B3100006;
 Wed,  2 Mar 2022 04:45:09 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: paulus@samba.org, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
 robh+dt@kernel.org, benh@kernel.crashing.org
Subject: [PATCH 11/12] powerpc: wiiu: don't enforce flat memory
Date: Wed,  2 Mar 2022 15:44:05 +1100
Message-Id: <20220302044406.63401-12-ash@heyquark.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302044406.63401-1-ash@heyquark.com>
References: <20220302044406.63401-1-ash@heyquark.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pgtable_32.c:mapin_ram loops over each valid memory range, which means
non-contiguous memory just works.

Signed-off-by: Ash Logan <ash@heyquark.com>
---
 arch/powerpc/mm/init_32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 3d690be48e84..59a84629d9a0 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -125,10 +125,10 @@ void __init MMU_init(void)
 	 * lowmem_end_addr is initialized below.
 	 */
 	if (memblock.memory.cnt > 1) {
-#ifndef CONFIG_WII
+#if !defined(CONFIG_WII) && !defined(CONFIG_WIIU)
 		memblock_enforce_memory_limit(memblock.memory.regions[0].size);
 		pr_warn("Only using first contiguous memory region\n");
-#else
+#elif defined(CONFIG_WII)
 		wii_memory_fixups();
 #endif
 	}
-- 
2.35.1

