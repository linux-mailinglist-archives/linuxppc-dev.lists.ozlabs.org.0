Return-Path: <linuxppc-dev+bounces-11003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F284B263E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 13:14:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2jL10y0hz30Vn;
	Thu, 14 Aug 2025 21:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.205.221.250
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755162422;
	cv=none; b=Vul3XSyJidbaY+lJRTi273jFJpwdYGu8QZjHVQ9o/SvhZnycqkz9xjkpMaQ4M6nktJKvnMOk1fCsgGY3GCHe3EoY1gHhuUxRNOMqJOZFZ5l2IW26/Pjs4Cw9U2sWVcPqCpoReoyroKKSWeiLCfa8okMqYbA+gmRqifowmacln46Vjl+dNWKfW0Jd8D3xsAQV3zdm+RpxpI288VlHyaeePI4Cxrs4ljeWaIVE92hOk/a36C0cPjFZhpKk1fgHM1f+YuttHMJnb9wEiPzeCBLGkLlKWUDRcC/pu9M/XkHcDOXR4hrY47bH101LBtkFIVTIG8TyMkWj1pzB8PyRHLoCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755162422; c=relaxed/relaxed;
	bh=N/RCDYzoGGGtQMS42zug99z+6gLmBa7KLqRyaAfRQUs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=l76hcymEE7JqTrVVmV+1gy35SxZrz9iBuy7r+6Nyh0EycM9pHfr4HZNIElEXyHxdVIpeiQ+5mhnPh20YmbTFJDGuTSQUfNyzffFbBbCLCCz5ivzgticxgwSrdnNG7R9KKjOXx5ah0xOm1PMHVDncWTiv23KYGy8QRooVlYvxM0gdKG86pzFFhrZEbnz3bkrEuYF1Iv+wfca0y8UjUseQ9vYto3of1x0/xTseyXzeppcaUHQSp5pb0gDHLlP6JfndtOToAY+/EJNo2sbkhsGDtw/AUqCXgomvmuxwozzCqdrbLiNk7FPOx4i9EaSazJM6yjOX8F9iCVI7hwXkcYUhEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=h/+u0g74; dkim-atps=neutral; spf=pass (client-ip=203.205.221.250; helo=out203-205-221-250.mail.qq.com; envelope-from=961342126@qq.com; receiver=lists.ozlabs.org) smtp.mailfrom=qq.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=h/+u0g74;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=qq.com (client-ip=203.205.221.250; helo=out203-205-221-250.mail.qq.com; envelope-from=961342126@qq.com; receiver=lists.ozlabs.org)
Received: from out203-205-221-250.mail.qq.com (out203-205-221-250.mail.qq.com [203.205.221.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c2fWS1T6Kz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 19:06:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1755162415; bh=N/RCDYzoGGGtQMS42zug99z+6gLmBa7KLqRyaAfRQUs=;
	h=From:To:Cc:Subject:Date;
	b=h/+u0g74THzzEh0Y/9jByqa9P1ffe4vJ42wZMgtNr8sC0aywbbui1/H3kelU8QLRi
	 /ckT8d4CTDsGuUqICVQzAYoFpVMH4FYRKbz3vG7w+WXVb/sLSWDcIZRbwJjTSObCJX
	 4kFUDBqWZs0XDdii4L+A0y2lorzS5d43z7h0iAVM=
Received: from VM-222-126-tencentos.localdomain ([14.116.239.37])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 63929001; Thu, 14 Aug 2025 16:24:57 +0800
X-QQ-mid: xmsmtpt1755159897td1m5xjle
Message-ID: <tencent_E69E39D3C1EAC68651075BCF298FFE81BE07@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLKNB2xFolFIhnp8fqpIAbYDBcppu4/+J5bh+jYbKiU3eQ3k+1eg
	 v73kX6H0N/eucNuBgbFhJVIUu+k8tChg/BH7fqmDif42EFJ1RlCdnTRBGqw7knDp3WUqdfpC6bQN
	 OuLt1YsmD5D5m5P4ri4YmCtK5iKPdU8EnlUxDUm2hw9HJi9iaScsyRGJSezuwjVTR3pxddtgaxue
	 9QEeiDkeXcivFLSCHtHHTrlktTPUhMCMO54eaaUQ+80IPDWr+FEUSoAYQm/R7nlOizd4cFX/g2vX
	 uNUC8X98Ucrs2Zof47PW+QJLl2KC5/SrnuALStYPNKr5wPK3So5zIrswRLVn+cpn6NXc7dgIgKGm
	 Oli4eZKM6/Cj/vxrGrQGHl6KzBx8mpMtG2KCU3ZUgSAfYutlAEtlA6pqOSox0czgc8uc46jQ4/ID
	 DWSHq3FwTdDwCcLsxuyXhlVeeJWh3WUf1/M0khm83l3I3H1nsqLzducwr9aqGV5ap+FXAMm0+cVo
	 HC3hOzwGwIqTlna3R61m/uvPbNScXlHwf4foaNJvbg9YbTJPeceFMcW89LbnvMBSDDKBHTUXgvtE
	 tCO6k2UQacJztek8fITzHM6hVg+5ArXinWOSiuUh/lXIoiHTiaoEznOBOY45YTSDvGapfp+qtn9G
	 U9v5neRfW68QWOORqun7h+9N2PeMvmTMzR6jbNbmsf1BQOkNGhsfnKuGvL4elHWmiKTwkGgCsozR
	 EKI7upytjjq8GeE9XcsxyXSls+yIDnYfodLpKYd0q0/f+1PAzTr3XXqQeQR1tFZVhImaqhW6vAZZ
	 20fO5rPn+sivcuo87RcDEjUUIucgTd2618O2ObJ07dg+6hQh0QSItyOfQoZSX+yQLsuJUoJhT4gD
	 96fDNAWV8XoqvH84+NAOD72MnYsDKa1jx35FyHXRu+gMq5g247wVyuTH19XdRaQ3r05LI9MsLF4K
	 fFLyhTUNMz+57olKOppUFP6kt9aaMJYdA41DqIM6Q24jwfTCIMOWCXiTDI1mSUnF1fSPUussg5N+
	 9uvQBsu2VpkCOniCZnhV0Bgrzr/CDPZmiYdRFYeOcdVxl2CLP69b1Xet1ZhJrqPL0nWyyngwejQH
	 Z9QpFB
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Vencent Liu <961342126@qq.com>
To: maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	961342126@qq.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Vencent Liu <Security@tencent.com>
Subject: [PATCH] powerpc: Fix resource leak in ls_uart.c
Date: Thu, 14 Aug 2025 16:24:50 +0800
X-OQ-MSGID: <20250814082450.768340-1-961342126@qq.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [203.205.221.250 listed in list.dnswl.org]
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [961342126(at)qq.com]
	*  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
	*      digit
	*      [961342126(at)qq.com]
	*  0.4 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  3.2 HELO_DYNAMIC_IPADDR Relay HELO'd using suspicious hostname (IP addr
	*      1)
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Vencent Liu <Security@tencent.com>

In the ls_uarts_init function, the device node
reference count wasn't properly released on error paths.
When `of_get_property("clock-frequency")`
fails, the function returns `-EINVAL` without calling
`of_node_put(avr)` to release the device node reference obtained by
`of_find_node_by_path()`.

Signed-off-by: Vencent Liu <Security@tencent.com>
---
 arch/powerpc/platforms/embedded6xx/ls_uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/ls_uart.c b/arch/powerpc/platforms/embedded6xx/ls_uart.c
index 6c1dbf8ae718..b889206bea4c 100644
--- a/arch/powerpc/platforms/embedded6xx/ls_uart.c
+++ b/arch/powerpc/platforms/embedded6xx/ls_uart.c
@@ -18,6 +18,7 @@
 #include <linux/of_address.h>
 #include <asm/io.h>
 #include <asm/termbits.h>
+#include <linux/cleanup.h>
 
 #include "mpc10x.h"
 
@@ -114,11 +115,11 @@ static void __init ls_uart_init(void)
 
 static int __init ls_uarts_init(void)
 {
-	struct device_node *avr;
 	struct resource res;
 	int len, ret;
 
-	avr = of_find_node_by_path("/soc10x/serial@80004500");
+	struct device_node *avr __free(device_node) =
+			of_find_node_by_path("/soc10x/serial@80004500");
 	if (!avr)
 		return -EINVAL;
 
-- 
2.43.5


