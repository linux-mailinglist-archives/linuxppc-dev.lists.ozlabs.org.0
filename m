Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE43C7D29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 06:05:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPkSf24sWz308B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 14:05:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=zhuangyi1@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1199 seconds by postgrey-1.36 at boromir;
 Wed, 14 Jul 2021 11:22:53 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPfrY6ZX3z2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 11:22:51 +1000 (AEST)
Received: from dggeml757-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GPfGF6rP8zXrJg;
 Wed, 14 Jul 2021 08:56:37 +0800 (CST)
Received: from huawei.com (10.90.53.225) by dggeml757-chm.china.huawei.com
 (10.1.199.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 14
 Jul 2021 09:02:14 +0800
From: Yi Zhuang <zhuangyi1@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH] powerpc/rtas_flash: fix a potential buffer overflow
Date: Wed, 14 Jul 2021 09:16:08 +0800
Message-ID: <20210714011608.15043-1-zhuangyi1@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeml757-chm.china.huawei.com (10.1.199.137)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 14 Jul 2021 14:05:37 +1000
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
Cc: hegdevasant@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, zhuangyi1@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since snprintf() returns the possible output size instead of the
actual output size, the available flash_msg length returned by
get_validate_flash_msg may exceed the given buffer limit when
simple_read_from_buffer calls copy_to_user

Signed-off-by: Yi Zhuang <zhuangyi1@huawei.com>
---
 arch/powerpc/kernel/rtas_flash.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index a99179d83538..4aa6bad28556 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -473,6 +473,10 @@ static int get_validate_flash_msg(struct rtas_validate_flash_t *args_buf,
 		    (args_buf->update_results == VALIDATE_TMP_UPDATE))
 			n += snprintf(msg + n, msglen - n, "%s\n",
 					args_buf->buf);
+			if (n >= msglen) {
+				n = msglen;
+				printk(KERN_ERR "FLASH: msg too long.\n");
+			}
 	} else {
 		n = sprintf(msg, "%d\n", args_buf->status);
 	}
-- 
2.26.0.106.g9fadedd

