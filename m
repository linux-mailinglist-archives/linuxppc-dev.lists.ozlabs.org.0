Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C670490F61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:26:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JczMs29HJz3dcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:26:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UmCpbtZn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UmCpbtZn; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcyvM1f6Rz30Jh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:05:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A422CB8113A;
 Mon, 17 Jan 2022 17:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DA2C36AE7;
 Mon, 17 Jan 2022 17:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439099;
 bh=ETddzE3Lq3EU9bMSDlE2ShnRd8iiKQWFS2i5TL7wyWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UmCpbtZnNH/+bkuWrJmE2ncLs31hHX6DSRUPaQVCjI7FI9RPUBjeKFWMEUW80lYxm
 den7RFVaTYV93PVZZ+iBKwc6pcwNc3AeeNz6jxlwkIBCKhjj7X6cBvZTQrxX3KxhzW
 JeIQweew6glZAR6s3Gnh/D+vS4XYia43OO7Lt+/czji4IJyrmdOut3qvMn3kdnSbgk
 CMi4LKy60ekafM9bTqNmycUTayG7K2yQnFGCbEs4Fp6A0GIPpUIMgLj34zZ0rBJ7fq
 ntuv6lXAjc2WW2naq4tjBJ7V+QUhgdsx/wbOYVm1jQlVmQkoBhP67GV/0VJpfzz0UL
 HzJJnHBj11ZWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/21] powerpc/6xx: add missing of_node_put
Date: Mon, 17 Jan 2022 12:04:34 -0500
Message-Id: <20220117170454.1472347-2-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170454.1472347-1-sashal@kernel.org>
References: <20220117170454.1472347-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nick.child@ibm.com, maz@kernel.org,
 Julia Lawall <Julia.Lawall@lip6.fr>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Julia Lawall <Julia.Lawall@lip6.fr>

[ Upstream commit f6e82647ff71d427d4148964b71f239fba9d7937 ]

for_each_compatible_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression e;
local idexpression n;
@@

@@
local idexpression n;
expression e;
@@

 for_each_compatible_node(n,...) {
   ...
(
   of_node_put(n);
|
   e = n
|
+  of_node_put(n);
?  break;
)
   ...
 }
... when != n
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/1448051604-25256-2-git-send-email-Julia.Lawall@lip6.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index a1b7f79a8a152..de10c13de15c6 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -215,6 +215,7 @@ void hlwd_pic_probe(void)
 			irq_set_chained_handler(cascade_virq,
 						hlwd_pic_irq_cascade);
 			hlwd_irq_host = host;
+			of_node_put(np);
 			break;
 		}
 	}
-- 
2.34.1

