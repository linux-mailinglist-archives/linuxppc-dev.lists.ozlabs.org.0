Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E5558B6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 00:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTbJT2PW5z3dxt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 08:58:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=175.27.65.136; helo=smtpbg.qq.com; envelope-from=jiangjian@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (smtpbg139.qq.com [175.27.65.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSlWz1D8jz3bkW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 00:04:54 +1000 (AEST)
X-QQ-mid: bizesmtp79t1655906315t7m9cd90
Received: from ubuntu.localdomain ( [106.117.78.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 21:58:31 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000B00A0000000
X-QQ-FEAT: eTtJes0duVtiagenvj6h5EHoH3+bpCWSfJ+9c57vDG73WyQb93c0oVI0STkaS
	ubkPgSL+uJw/jZ+9rrbBqEUT0QFBkZoAS/VKZ8XLYDo04KJmEOpA3tDQW3GR5d3YizHbyId
	WMAmZsGBWN0Ow/r2yAAaZEzd8wTXy3Z/++xxPMVSiEp/YiV/jueKA1tCanj/oHX/38RGaY2
	X8KlJk2I/ckg30gaUoqq5lAOXTfhSKTKUO/62b8YTZDHELwjv0gPaGGsL6wBKeR6BAgv7QY
	2aTWUCRuhjtHGOzX++Ywq1+Eeg4jUQLPcATJHljGcXVfCZCg6lxYWDya2oM1L+b8dHWNFDx
	VQi0bavIl4u6dEgjkhyvyWRpM39lz2h603FkzCS
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/64s: drop unexpected word 'and' in the comments
Date: Wed, 22 Jun 2022 21:58:28 +0800
Message-Id: <20220622135828.4568-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
X-Mailman-Approved-At: Fri, 24 Jun 2022 08:56:56 +1000
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
Cc: farosas@linux.ibm.com, aik@ozlabs.ru, linux-kernel@vger.kernel.org, jiangjian@cdjrlc.com, paulus@samba.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

there is an unexpected word 'and' in the comments that need to be dropped

file: arch/powerpc/kernel/exceptions-64s.S
line: 2782

* - If it was a decrementer interrupt, we bump the dec to max and and return.

changed to:

* - If it was a decrementer interrupt, we bump the dec to max and return.

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b66dd6f775a4..3d0dc133a9ae 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2779,7 +2779,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 
 /*
  * An interrupt came in while soft-disabled. We set paca->irq_happened, then:
- * - If it was a decrementer interrupt, we bump the dec to max and and return.
+ * - If it was a decrementer interrupt, we bump the dec to max and return.
  * - If it was a doorbell we return immediately since doorbells are edge
  *   triggered and won't automatically refire.
  * - If it was a HMI we return immediately since we handled it in realmode
-- 
2.17.1

