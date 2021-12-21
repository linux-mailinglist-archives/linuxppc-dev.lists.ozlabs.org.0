Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4E47B909
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 04:35:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ2D25j3pz305v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 14:35:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=59.36.128.82; helo=smtpbg604.qq.com;
 envelope-from=wangxiang@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJ2CY2MX8z2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 14:34:58 +1100 (AEDT)
X-QQ-mid: bizesmtp36t1640057672td298u9c
Received: from localhost.localdomain (unknown [182.148.14.81])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 21 Dec 2021 11:34:29 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: F3yR32iATbiWwFtQBNBo5sJaNmYFcaa2HQV0Jbgf2FLm/S+e/ehz4wRmp1/xK
 jCu1jd8+8eaW0DflD1tdNU89q6YMXc1wz+BbgWltyuz8iNxv9KmhpTvc43HIHyCw4cWbXpA
 PM34fYjAkhfTFvlOB2qkrv9gvixVpoEwbymeFHPFUBAs5Qog//9nzVsOcbEncTF6g6SgdHN
 uOqbXtmUK72FpcmB+DjihealX09Y1kpJyMcUlcVJ07yvwPUrUVumac8+rpuPUGrC2riNQNN
 V/pk1ISnOuN/JYoEjCzAAwZOuq8QfOZlAZP/8gZsr2gEIGEcyUcjOepo5ud3dnDwGjDuheU
 t7/mtiGVXRoiS5V4uhFk5hLeO2SXQ==
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: No need to initialise statics to 0
Date: Tue, 21 Dec 2021 11:34:23 +0800
Message-Id: <20211221033423.29820-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Static variables do not need to be initialised to 0, because compiler
will initialise all uninitialised statics to 0. Thus, remove the
unneeded initializations.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 arch/powerpc/platforms/powermac/nvram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/nvram.c b/arch/powerpc/platforms/powermac/nvram.c
index 853ccc4480e2..4d23793c2f1f 100644
--- a/arch/powerpc/platforms/powermac/nvram.c
+++ b/arch/powerpc/platforms/powermac/nvram.c
@@ -71,7 +71,7 @@ struct core99_header {
 static int nvram_naddrs;
 static volatile unsigned char __iomem *nvram_data;
 static int is_core_99;
-static int core99_bank = 0;
+static int core99_bank;
 static int nvram_partitions[3];
 // XXX Turn that into a sem
 static DEFINE_RAW_SPINLOCK(nv_lock);
-- 
2.34.1


