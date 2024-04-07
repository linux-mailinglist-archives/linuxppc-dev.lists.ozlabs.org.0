Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FF89AEE9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 08:42:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E48FhCYo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VC2hD3r7wz3vfb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 16:42:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E48FhCYo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VC2dw5PrCz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Apr 2024 16:40:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712471997; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=V4x/Lj77Qq2ZCIBC+j8JnalEbYJ25z8MZAvncLNZwfU=;
	b=E48FhCYoV+zF36jCxjbdqi9p4xbN5Snh7fd2L8SAXcku0cBdFz2bkwBkLpl6tsqvwqD6SGTpwmKNUbGBPkrrL0XeKRDPYNQwdrxZtE0pTmkJMbxPp117pHcA6AaH9I/3C03eZq9Yn2LjSnCt63SzDtwA7Hw4Z9GD6BnAXvbcluU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0W4.Zysc_1712471994;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0W4.Zysc_1712471994)
          by smtp.aliyun-inc.com;
          Sun, 07 Apr 2024 14:39:55 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: arnd@arndb.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH -next 1/3] powerpc: boot: Fix a typo in partial_decompress() comment
Date: Sun,  7 Apr 2024 14:39:50 +0800
Message-Id: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit adds kernel-doc style comments with complete parameter
descriptions for the function partial_decompress().

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/boot/decompress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/decompress.c b/arch/powerpc/boot/decompress.c
index 977eb15a6d17..6835cb53f034 100644
--- a/arch/powerpc/boot/decompress.c
+++ b/arch/powerpc/boot/decompress.c
@@ -101,7 +101,7 @@ static void print_err(char *s)
  * @input_size:  length of the input buffer
  * @outbuf:      output buffer
  * @output_size: length of the output buffer
- * @skip         number of output bytes to ignore
+ * @_skip:       number of output bytes to ignore
  *
  * This function takes compressed data from inbuf, decompresses and write it to
  * outbuf. Once output_size bytes are written to the output buffer, or the
-- 
2.20.1.7.g153144c

