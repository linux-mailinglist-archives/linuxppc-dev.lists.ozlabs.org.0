Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05F427998
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 13:49:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRNcx445Cz3c87
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 22:49:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRNcX2Fypz2xKP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 22:48:42 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Ur6bLbj_1633780115; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Ur6bLbj_1633780115) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 09 Oct 2021 19:48:35 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, amit@kernel.org,
 arnd@arndb.de, osandov@fb.com
Subject: [PATCH v10 1/3] tty: hvc: use correct dma alignment size
Date: Sat,  9 Oct 2021 19:48:27 +0800
Message-Id: <20211009114829.1071021-2-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
References: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
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
Cc: Xianting Tian <xianting.tian@linux.alibaba.com>,
 shile.zhang@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use L1_CACHE_BYTES as the dma alignment size, use 'sizeof(long)'
is wrong.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Reviewed-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 drivers/tty/hvc/hvc_console.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 5bb8c4e44..5957ab728 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -49,7 +49,7 @@
 #define N_OUTBUF	16
 #define N_INBUF		16
 
-#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))
+#define __ALIGNED__ __attribute__((__aligned__(L1_CACHE_BYTES)))
 
 static struct tty_driver *hvc_driver;
 static struct task_struct *hvc_task;
-- 
2.17.1

