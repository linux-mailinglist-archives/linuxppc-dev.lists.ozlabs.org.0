Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD357841F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 15:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmjsK4pdYz3bx8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 23:45:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.54.12; helo=smtpbg.qq.com; envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 20908 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 23:45:17 AEST
Received: from smtpbg.qq.com (biz-43-154-54-12.mail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmjrs3l9tz3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 23:45:05 +1000 (AEST)
X-QQ-mid: bizesmtp78t1658151862t9dksbz6
Received: from localhost.localdomain ( [171.223.96.21])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Jul 2022 21:44:20 +0800 (CST)
X-QQ-SSF: 01000000002000E0U000C00A0000020
X-QQ-FEAT: r/cTxDoDoiEZ/G1/U5cU0y7O5MUHcs2LuTI3rLif/Bz9p+J6ShcQ4p22QeLWx
	vBP+kG8gouBG1SdX1rQbF4roAPBzqZ+QcH26WsRBFztM8/apUntOm8PZgRNW2irIwSUNgY1
	2PFKGjhucs5RALQqyp0PTCajdrSsjJ0SW3NYBlfS2ApwB0K2miRZkW5tzH2DLcwd5l+/w3j
	RxGc/Gp9H81a9WxVxFYoDZBpRGPd+0PuxGus486XaHVPvz5NS+3lgTX3+ynGcfbntUEaVRw
	EyQzd9MVnu/aWBiI+fMha1lDSK/O2qEurONwbd7j11V+/LgxdlntfOkOC1KeonHXPDLbAof
	Ry41rUNVS/8XIYfgcqspCmcZRu2cFXL13ttEbA+5iNbr6oJxVfGNQZnWmCtTzGBapZDyxng
	LJdARLBXg7Y=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: geoff@infradead.org
Subject: [PATCH] powerpc/ps3: Fix comment typo
Date: Fri, 15 Jul 2022 13:42:24 +0800
Message-Id: <20220715054224.6583-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
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
Cc: linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The double `when' is duplicated in line 1069, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/ps3/ps3-lpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ps3/ps3-lpm.c b/drivers/ps3/ps3-lpm.c
index 65512b6cc6fd..200ad8751860 100644
--- a/drivers/ps3/ps3-lpm.c
+++ b/drivers/ps3/ps3-lpm.c
@@ -1066,7 +1066,7 @@ EXPORT_SYMBOL_GPL(ps3_disable_pm_interrupts);
  *  instance, specified by one of enum ps3_lpm_tb_type.
  * @tb_cache: Optional user supplied buffer to use as the trace buffer cache.
  *  If NULL, the driver will allocate and manage an internal buffer.
- *  Unused when when @tb_type is PS3_LPM_TB_TYPE_NONE.
+ *  Unused when @tb_type is PS3_LPM_TB_TYPE_NONE.
  * @tb_cache_size: The size in bytes of the user supplied @tb_cache buffer.
  *  Unused when @tb_cache is NULL or @tb_type is PS3_LPM_TB_TYPE_NONE.
  */
-- 
2.35.1

