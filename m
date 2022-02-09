Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9204AE7DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 04:30:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtlkn0QJ2z3bbH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 14:30:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OmnJp9CN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.dev (client-ip=2001:41d0:2:aacc::; helo=out2.migadu.com;
 envelope-from=cai.huoqing@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=OmnJp9CN; dkim-atps=neutral
X-Greylist: delayed 315 seconds by postgrey-1.36 at boromir;
 Wed, 09 Feb 2022 14:29:48 AEDT
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtlk430Qtz2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 14:29:48 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1644377060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eoWIYOaZeRs/v2aMKLkHveIxx9A2/s6u9pylLwYovIg=;
 b=OmnJp9CNrdZk/a9TzXx8vCi8716xgp/uNAup98z+s4zNeI6MSCvu3i6HL/4WElm+e0D2Cs
 GKun9bntMjXpsUwydOlhlkJPAT8GMeUm394ER6vCl6/8h1rRh1Xfb+ksKxPtY9Fp8LCAaM
 wTIe6JNRDNrjO16WhE7TX3WtHzvXTsU=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH] oc: fsl: dpio: Make use of the helper macro LIST_HEAD()
Date: Wed,  9 Feb 2022 11:23:53 +0800
Message-Id: <20220209032353.37610-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Roy Pledge <Roy.Pledge@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace "struct list_head head = LIST_HEAD_INIT(head)" with
"LIST_HEAD(head)" to simplify the code.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 1d2b27e3ea63..36f0a9b799b1 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -51,7 +51,7 @@ struct dpaa2_io_store {
 
 /* keep a per cpu array of DPIOs for fast access */
 static struct dpaa2_io *dpio_by_cpu[NR_CPUS];
-static struct list_head dpio_list = LIST_HEAD_INIT(dpio_list);
+static LIST_HEAD(dpio_list);
 static DEFINE_SPINLOCK(dpio_list_lock);
 
 static inline struct dpaa2_io *service_select_by_cpu(struct dpaa2_io *d,
-- 
2.25.1

