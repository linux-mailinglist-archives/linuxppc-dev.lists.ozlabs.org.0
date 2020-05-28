Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4F1E700A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 01:09:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y3Ks11tdzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 09:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Y3JB46gRzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 09:07:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=nEg6A4S4; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 49Y3J95qHzz9sSp;
 Fri, 29 May 2020 09:07:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1590707258;
 bh=ZqDcXrnKtbDhD7f27IYbj2XIbF+KrmpTF647NmJmTzs=;
 h=From:To:Cc:Subject:Date:From;
 b=nEg6A4S4RsHkcFQVYQUB/lv/IMz9r/GuJvPtETwRm0v9ZyfFTRAIB5h1QAEUi+AZS
 t7FFXYGvGvS2W19mamC+PN7ymugU2wY4pOrgeYiSJVNlesJfpKi3xRtamexPOFmKSC
 ZSy3ZIju7RrSKb4Mre1wOgQwDItMdbT08NelTi6d5jUXxntIHSHnG8C9NnOxuVfsB7
 14Zb+yY5RUPCBR5zx3O8D43wyCPjIanPDhuXdGvl6/EFr42V5dExmxvuetTKDsbPbr
 uPpQH+ey+h4tKezPXtbdyMSdbyYFURxzlg8/kJZkNo7znQQV4vpX6JPk5qlwWrz0Y1
 eGejpagYLiD2A==
Received: by neuling.org (Postfix, from userid 1000)
 id A9CAE2C0498; Fri, 29 May 2020 09:07:37 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Fix misleading small cores print
Date: Fri, 29 May 2020 09:07:31 +1000
Message-Id: <20200528230731.1235752-1-mikey@neuling.org>
X-Mailer: git-send-email 2.26.2
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently when we boot on a big core system, we get this print:
  [    0.040500] Using small cores at SMT level

This is misleading as we've actually detected big cores.

This patch clears up the print to say we've detect big cores but are
using small cores for scheduling.

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6d2a3a3666..c820c95162 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1383,7 +1383,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
-		pr_info("Using small cores at SMT level\n");
+		pr_info("Big cores detected but using small core scheduling\n");
 		power9_topology[0].mask = smallcore_smt_mask;
 		powerpc_topology[0].mask = smallcore_smt_mask;
 	}
-- 
2.26.2

