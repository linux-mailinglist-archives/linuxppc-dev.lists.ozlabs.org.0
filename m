Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 869CD239DF1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 05:58:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKkd55N7GzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:58:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKkZd13kpzDqT4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 13:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=uIZo74We; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4BKkZc1md2z9sTb;
 Mon,  3 Aug 2020 13:56:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1596426968;
 bh=vbcRypub2OuKr5vENleAT6uxcMOFsdaFUBivNswPLbM=;
 h=From:To:Cc:Subject:Date:From;
 b=uIZo74WeJaPb/YpVhSlA9P9gFnfCveSF5sTRIhe6j+XycYin8toTQBBcb03XxvEFS
 ojplhqAkhria7j7V6iD37kZOwHda2yWdTGloXQ0X9dOHZogzxhxDob4vCyclhjXzg/
 aaon684LB2KiA7pPsotXB/wpg1giGjXIqrHh5P2kP+5ZW/H6qrxsv073yX7uzeVUVn
 vrhlmPU8Jxms/Jj5A2yBTAfCSMZuFF+urYPrFoDhUvVdbEIgYTAd1fYn2royI22HO+
 USmZUDGtdvMsEuk0ZQqRB39j1foFKssOru0Plfd09Zm4yGjk7Ob+l3w6QLukGP14RA
 baipChTdPsktQ==
Received: by neuling.org (Postfix, from userid 1000)
 id EC80A2C2E29; Mon,  3 Aug 2020 13:56:07 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Fix P10 PVR revision in /proc/cpuinfo for SMT4 cores
Date: Mon,  3 Aug 2020 13:56:00 +1000
Message-Id: <20200803035600.1820371-1-mikey@neuling.org>
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
Cc: grimm@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On POWER10 bit 12 in the PVR indicates if the core is SMT4 or
SMT8. Bit 12 is set for SMT4.

Without this patch, /proc/cpuinfo on a SMT4 DD1 POWER10 looks like
this:
    cpu             : POWER10, altivec supported
    revision        : 17.0 (pvr 0080 1100)

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/setup-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index b198b0ff25..808ec9fab6 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -311,6 +311,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 				min = pvr & 0xFF;
 				break;
 			case 0x004e: /* POWER9 bits 12-15 give chip type */
+			case 0x0080: /* POWER10 bit 12 gives SMT8/4 */
 				maj = (pvr >> 8) & 0x0F;
 				min = pvr & 0xFF;
 				break;
-- 
2.26.2

