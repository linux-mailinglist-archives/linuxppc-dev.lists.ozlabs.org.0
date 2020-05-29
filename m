Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C3C1E7202
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 03:18:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y6BZ5JhxzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 11:17:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zte.com.cn (client-ip=202.103.147.169; helo=mxct.zte.com.cn;
 envelope-from=wang.yi59@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
X-Greylist: delayed 972 seconds by postgrey-1.36 at bilbo;
 Fri, 29 May 2020 11:16:35 AEST
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Y68z3wCvzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 11:16:34 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id A9EB6564EFBEC90C84D5;
 Fri, 29 May 2020 09:00:13 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id 04T105YD060302;
 Fri, 29 May 2020 09:00:05 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020052909003964-3735731 ;
 Fri, 29 May 2020 09:00:39 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/nvram: Replace kmalloc with kzalloc in the error
 message
Date: Fri, 29 May 2020 09:02:15 +0800
Message-Id: <1590714135-15818-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-05-29 09:00:39,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-05-29 09:00:10, Serialize complete at 2020-05-29 09:00:10
X-MAIL: mse-fl1.zte.com.cn 04T105YD060302
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
Cc: wang.yi59@zte.com.cn, tony.luck@intel.com, keescook@chromium.org,
 wang.liang82@zte.com.cn, gregkh@linuxfoundation.org, anton@enomsg.org,
 linux-kernel@vger.kernel.org, paulus@samba.org,
 Liao Pingfang <liao.pingfang@zte.com.cn>, xue.zhihong@zte.com.cn,
 ccross@android.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org,
 allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Liao Pingfang <liao.pingfang@zte.com.cn>

Use kzalloc instead of kmalloc in the error message according to
the previous kzalloc() call.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
---
 arch/powerpc/kernel/nvram_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index fb4f610..c3a0c8d 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -892,7 +892,7 @@ loff_t __init nvram_create_partition(const char *name, int sig,
 	/* Create our OS partition */
 	new_part = kzalloc(sizeof(*new_part), GFP_KERNEL);
 	if (!new_part) {
-		pr_err("%s: kmalloc failed\n", __func__);
+		pr_err("%s: kzalloc failed\n", __func__);
 		return -ENOMEM;
 	}
 
-- 
2.9.5

