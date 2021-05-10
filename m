Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67465379B94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 02:33:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfJnM1X0hz3bs1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 10:33:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=chris.zjh@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdtXy6TDCz2yRW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 17:51:25 +1000 (AEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FdtTh0Tt2zkYQY;
 Mon, 10 May 2021 15:48:40 +0800 (CST)
Received: from huawei.com (10.67.174.96) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 10 May 2021
 15:51:09 +0800
From: Zhang Jianhua <chris.zjh@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <gustavoars@kernel.org>, <ojeda@kernel.org>, <ndesaulniers@google.com>,
 <chris.zjh@huawei.com>
Subject: [PATCH -next] ppc: boot: Fix a typo in the file decompress.c
Date: Mon, 10 May 2021 15:51:34 +0800
Message-ID: <20210510075134.252978-1-chris.zjh@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 11 May 2021 10:33:27 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/input buffer/output buffer/
s/length of the input buffer/length of the input buffer/

--------

Signed-off-by: Zhang Jianhua <chris.zjh@huawei.com>
---
 arch/powerpc/boot/decompress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/decompress.c b/arch/powerpc/boot/decompress.c
index 6098b879ac97..977eb15a6d17 100644
--- a/arch/powerpc/boot/decompress.c
+++ b/arch/powerpc/boot/decompress.c
@@ -99,8 +99,8 @@ static void print_err(char *s)
  * partial_decompress - decompresses part or all of a compressed buffer
  * @inbuf:       input buffer
  * @input_size:  length of the input buffer
- * @outbuf:      input buffer
- * @output_size: length of the input buffer
+ * @outbuf:      output buffer
+ * @output_size: length of the output buffer
  * @skip         number of output bytes to ignore
  *
  * This function takes compressed data from inbuf, decompresses and write it to
-- 
2.17.1

