Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D8C47A3E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 04:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHQ2H3k6Jz3c7d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 14:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=59.36.128.82; helo=smtpbg604.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHQ1n0r0Rz2yMV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 14:24:27 +1100 (AEDT)
X-QQ-mid: bizesmtp48t1639970647t66ah7sm
Received: from localhost.localdomain (unknown [118.121.67.96])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 20 Dec 2021 11:24:05 +0800 (CST)
X-QQ-SSF: 01000000002000D0K000B00A0000000
X-QQ-FEAT: Z7q/N3OHGe84WMDAKKh1niE7bGmiiMVnpPotlMmuk40ljh59ew1pW8gG/ctug
 eHPFoO6mxxzlx1Jxxmva3EvDFYSUOs1I03gX8Jku454Ek7yqf7Sx6WHXnD9l/LizUXSmlYa
 DtDXxBYHx/236sMVk5Ux5hThSmm83p7ZG+1wDjhnW3tv3zpzobv3ypwxRlkhy6qI1T2CTld
 SawXK6jPtXMn+3eP3nnrrrRix5Kw8q7Clmlrp63Bv4WK1kRBBbZWZBPmBR2iwEU0aOA8Qt7
 RzqnU3NJuAR5CMpLZ5hwJHxoxwyGZfHOlMMRsd3K/85USlUvUB8teng1oAfyV6L4+gA6DFG
 R/P1070Gj5JCNPz6a3Afarn0T/xQw==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: use strscpy to copy strings
Date: Mon, 20 Dec 2021 11:24:02 +0800
Message-Id: <20211220032402.630240-1-wangborong@cdjrlc.com>
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, wangborong@cdjrlc.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The strlcpy should not be used because it doesn't limit the source
length. So that it will lead some potential bugs.

But the strscpy doesn't require reading memory from the src string
beyond the specified "count" bytes, and since the return value is
easier to error-check than strlcpy()'s. In addition, the implementation
is robust to the string changing out from underneath it, unlike the
current strlcpy() implementation.

Thus, replace strlcpy with strscpy.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/platforms/pasemi/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pasemi/misc.c b/arch/powerpc/platforms/pasemi/misc.c
index 1bf65d02d3ba..06a1ffd43bfe 100644
--- a/arch/powerpc/platforms/pasemi/misc.c
+++ b/arch/powerpc/platforms/pasemi/misc.c
@@ -35,7 +35,7 @@ static int __init find_i2c_driver(struct device_node *node,
 	for (i = 0; i < ARRAY_SIZE(i2c_devices); i++) {
 		if (!of_device_is_compatible(node, i2c_devices[i].of_device))
 			continue;
-		if (strlcpy(info->type, i2c_devices[i].i2c_type,
+		if (strscpy(info->type, i2c_devices[i].i2c_type,
 			    I2C_NAME_SIZE) >= I2C_NAME_SIZE)
 			return -ENOMEM;
 		return 0;
-- 
2.34.1

