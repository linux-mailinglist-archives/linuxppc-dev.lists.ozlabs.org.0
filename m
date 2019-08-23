Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DF29B1DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 16:25:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FNwK5lWfzDsFQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 00:25:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="lpANlXsh"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FNrv6SXLzDqwP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 00:22:19 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id 201so8288098qkm.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=moc3IlfprhHeTI7XClejHHobNYyvuFk0GwG2m6SxEgM=;
 b=lpANlXshmursICRsWV0tnI38Skc6/orrezhIGeTS4nRN00OxTi99Sz8HjQ0EWLe+MY
 YtQMhGKV7nUE4SsfKnktFnYEhEfbaGTJfD2w6cKRb25vauMpv71IYVSBU0HKW3+62Xdm
 7JfGsdFndSws9htjzAUugyt3CoP/Rl1EwQPKh1WiKHszNV23Ng6CZ5EEMaAMhRS0Zb8O
 kUV86nyiz+/KTQ4zGI3ED8rxws3+BcJtJleR+Esr38eTC5CLUd+yiDIyIdnwnim174zS
 5Qfh1EHNCWQ0+EYUMgm1J4BeFxZoQpma2on18wU9nSSfh/eZGBG0Eaz7zHAi5ni4kX4q
 A8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=moc3IlfprhHeTI7XClejHHobNYyvuFk0GwG2m6SxEgM=;
 b=Z4yKQUuiUSgwr0Q50PNxp79YcXG186sqxujNLiq2+HOvY34M6pisTW01LPIx909RfR
 0JltJ+H39B8mP09h92yirEQnB0FPMEB6coRyZYXyqw3yMvlrkdWtc+/bE29VX5E8gdqC
 7QzA87X+UBd7SGvaURkQvF593+y1x5gQ+F40rbg8uzKFFuYJh8I1D+YgbPVM/A2qiRhg
 45oY2qvjOwVP7K72bNIPvcNuuowT3H7iOJ1ZNEB2tULFgiZfZbMfArD0TZpCiKu+WNC2
 odu18itFDCWs//icqO2L62gNmOekKB3MXtlYypuml+8Mkq0Z9N5iJzN24azfiKNoGVBK
 0z7w==
X-Gm-Message-State: APjAAAW5K1GqMLELoqeiwW+p94C5/3clbmPKfjj8SxRtOKt8UlwnPWkX
 WvTjI6l6xGxc3Tl01CWiO2ctYg==
X-Google-Smtp-Source: APXvYqwSZ9XK9JhQ9qs2SXwccpU9qjSKONX9JS1AIawZ30G9AP70CqBgOPkqdDhUTyorHQc2nuLUDA==
X-Received: by 2002:a37:a483:: with SMTP id n125mr4410088qke.329.1566570135325; 
 Fri, 23 Aug 2019 07:22:15 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id m129sm1377605qkf.86.2019.08.23.07.22.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 07:22:14 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm/radix: remove useless kernel messages
Date: Fri, 23 Aug 2019 10:22:00 -0400
Message-Id: <1566570120-16529-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 aneesh.kumar@linux.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Booting a POWER9 PowerNV system generates a few messages below with
"____ptrval____" due to the pointers printed without a specifier
extension (i.e unadorned %p) are hashed to prevent leaking information
about the kernel memory layout.

radix-mmu: Initializing Radix MMU
radix-mmu: Partition table (____ptrval____)
radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB
pages (exec)
radix-mmu: Mapped 0x0000000040000000-0x0000002000000000 with 1.00 GiB
pages
radix-mmu: Mapped 0x0000200000000000-0x0000202000000000 with 1.00 GiB
pages
radix-mmu: Process table (____ptrval____) and radix root for kernel:
(____ptrval____)

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e678..b6692ee9411d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -386,7 +386,6 @@ static void __init radix_init_pgtable(void)
 	 * physical address here.
 	 */
 	register_process_table(__pa(process_tb), 0, PRTB_SIZE_SHIFT - 12);
-	pr_info("Process table %p and radix root for kernel: %p\n", process_tb, init_mm.pgd);
 	asm volatile("ptesync" : : : "memory");
 	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
 		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
@@ -420,7 +419,6 @@ static void __init radix_init_partition_table(void)
 	mmu_partition_table_set_entry(0, dw0, 0);
 
 	pr_info("Initializing Radix MMU\n");
-	pr_info("Partition table %p\n", partition_tb);
 }
 
 void __init radix_init_native(void)
-- 
1.8.3.1

