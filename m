Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F7A6B8D91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:39:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbRlB0dpxz3cGr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:39:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=ye.xingchen@zte.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 356 seconds by postgrey-1.36 at boromir; Tue, 14 Mar 2023 19:38:34 AEDT
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbRkf4gfsz3cD8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:38:33 +1100 (AEDT)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4PbRbk6yVDz1Drl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:32:34 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.36.20.94])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4PbRbK0X0GzBRK7X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:32:13 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4PbRbB6zdZz9wn5l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:32:06 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PbRb06HTlz8R040;
	Tue, 14 Mar 2023 16:31:56 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 32E8VmVB046544;
	Tue, 14 Mar 2023 16:31:49 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 14 Mar 2023 16:31:51 +0800 (CST)
Date: Tue, 14 Mar 2023 16:31:51 +0800 (CST)
X-Zmail-TransId: 2af9641030f7ffffffff9c4-ca210
X-Mailer: Zmail v1.0
Message-ID: <202303141631511535639@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <herbert@gondor.apana.org.au>
Subject: =?UTF-8?B?W1BBVENIXSBjcnlwdG86IHAxMC1hZXMtZ2NtIC0gcmVtb3ZlIGR1cGxpY2F0ZSBpbmNsdWRlIGhlYWRlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 32E8VmVB046544
X-FangMail-Miltered: at esgde01-2.novalocal with ID 6410310C.000 by FangMail milter!
X-FangMail-Envelope: 1678782733/4PbRbK0X0GzBRK7X/6410310C.000/10.36.20.94/[10.36.20.94]/mxus.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 64103121.000/4PbRbk6yVDz1Drl
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

crypto/algapi.h is included more than once.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 arch/powerpc/crypto/aes-gcm-p10-glue.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index c95f5b7cc456..1533c8cdd26f 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -8,7 +8,6 @@
 #include <asm/unaligned.h>
 #include <asm/simd.h>
 #include <asm/switch_to.h>
-#include <crypto/algapi.h>
 #include <crypto/aes.h>
 #include <crypto/algapi.h>
 #include <crypto/b128ops.h>
-- 
2.25.1
