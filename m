Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6582E57815E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 13:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmgRL2ryZz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 21:56:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=smtpbg.qq.com; envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (unknown [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmgQs293Hz2xrY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 21:55:50 +1000 (AEST)
X-QQ-mid: bizesmtp73t1658145336tq5j77rk
Received: from localhost.localdomain ( [171.223.96.21])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Jul 2022 19:55:35 +0800 (CST)
X-QQ-SSF: 01000000002000E0U000C00A0000020
X-QQ-FEAT: tyV+f0f3wWdqykYe5zQ7mwRy9UwHLWPO8Uv42zkLwW+tZ33nKlElnTElPdVFb
	Bmo9UjblvyzgZnUaXDwd2g04trnMZCA5zixxjiic1DKLIAVlwOTC8AGNEbyJO026xT78aIk
	uZSCn8n13vREfV3sKStCbhhMPUvCZHf1bPz1bZRs4CEwneJMJHZLZg7Ha0tbnw2tFzL9dXS
	QBZXg8SMfq/HmcRFpW826v04ZbmF8THezYSKGLCiWfahJzmpKhql/Y1nJONygyJhpEwygUG
	OC4ls9XqCPc2HuyXm2AoBr92hcZJssPtWh9kHpNr/auk7e9W6pUJLlBPLr3UxmsNluH+hWf
	1xK9wlvjanGTS6cNcvCdlj9xwt9SEIk77ApupeWOLU5MyAFGQOOrtAj9c326oBnJwNDCDCZ
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: paulus@samba.org
Subject: [PATCH] powerpc/sysdev: Fix comment typo
Date: Fri, 15 Jul 2022 11:52:50 +0800
Message-Id: <20220715035250.5978-1-wangborong@cdjrlc.com>
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
Cc: nick.child@ibm.com, linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The double `is' is duplicated in line 110, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/sysdev/cpm2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/cpm2.c b/arch/powerpc/sysdev/cpm2.c
index 3f130312b6e9..915f4d3991c3 100644
--- a/arch/powerpc/sysdev/cpm2.c
+++ b/arch/powerpc/sysdev/cpm2.c
@@ -107,7 +107,7 @@ EXPORT_SYMBOL(cpm_command);
  * memory mapped space.
  * The baud rate clock is the system clock divided by something.
  * It was set up long ago during the initial boot phase and is
- * is given to us.
+ * given to us.
  * Baud rate clocks are zero-based in the driver code (as that maps
  * to port numbers).  Documentation uses 1-based numbering.
  */
-- 
2.35.1

