Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BCF66D79D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 09:10:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx1lb3h2jz3cdd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Missing IP4: 74.116.198.153) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=ye.xingchen@zte.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 426 seconds by postgrey-1.36 at boromir; Tue, 17 Jan 2023 19:09:33 AEDT
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx1l169y8z307T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 19:09:32 +1100 (AEDT)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4Nx1Zm32c4z1DF1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 16:02:24 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4Nx1ZM2VWqz4xBV7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 16:02:03 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4Nx1Yf6y79z9tyJY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 16:01:26 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Nx1YY6XLBz5PkHg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 16:01:21 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4Nx1YL0N2Bz4xpyC;
	Tue, 17 Jan 2023 16:01:10 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 30H815we005478;
	Tue, 17 Jan 2023 16:01:05 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 17 Jan 2023 16:01:08 +0800 (CST)
Date: Tue, 17 Jan 2023 16:01:08 +0800 (CST)
X-Zmail-TransId: 2af963c655c4ffffffff87b29564
X-Mailer: Zmail v1.0
Message-ID: <202301171601080312252@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <herbert@gondor.apana.org.au>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGNyeXB0bzogcDEwLWFlcy1nY20gLSByZW1vdmUgZHVwbGljYXRlIGluY2x1ZGVkIGhlYWRlciBmaWxlcw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 30H815we005478
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 63C6560F.000 by FangMail milter!
X-FangMail-Envelope: 1673942544/4Nx1Zm32c4z1DF1/63C6560F.000/10.35.20.165/[10.35.20.165]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63C6560F.000/4Nx1Zm32c4z1DF1
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

From: ye xingchen <ye.xingchen@zte.com.cn>

crypto/algapi.h is included more than once.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 arch/powerpc/crypto/p10-aes-gcm-glue.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/crypto/p10-aes-gcm-glue.c b/arch/powerpc/crypto/p10-aes-gcm-glue.c
index 777e6b5254da..a17d3e8d8f3c 100644
--- a/arch/powerpc/crypto/p10-aes-gcm-glue.c
+++ b/arch/powerpc/crypto/p10-aes-gcm-glue.c
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
