Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBAC60847D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 07:19:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvV4r3NFCz3dsw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 16:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.221.58; helo=bg4.exmail.qq.com; envelope-from=wangjianli@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 323 seconds by postgrey-1.36 at boromir; Sat, 22 Oct 2022 16:18:51 AEDT
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvV4C0BNKz3bjh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 16:18:49 +1100 (AEDT)
X-QQ-mid: bizesmtp88t1666415576t0b427zo
Received: from localhost.localdomain ( [182.148.15.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 22 Oct 2022 13:12:54 +0800 (CST)
X-QQ-SSF: 01000000000000C0E000000A0000000
X-QQ-FEAT: 7DSX613YSL4mStkFXAdukSy9YKyEB26+OxIlPwbiB7rxj/NgdJdNx+niTz0sx
	75j99/ZyPiHWRsj7pTa6ArxQcHR23jnqa05IHb9ccl1D3ZDvw1DkO7zbpcVRUKfICw6O49Z
	pVGzawX9VW5Rh94Vd52d22uZqJyae3ejkmbxWEXtsgPK2XnvYU3h6XjenbQ8c/mSd1H6J3W
	UFpyqoehJl2vaI2yw5Dq29NJf9EbtzBChoYfduTM+vR/ern8dURiQ/a2Ttr+/nuPuom8m+8
	w8xLck0CSg6qODN94GXCd+WPZQJYtVxObweKvnkb90PcFYCmC4gtLCgCVqXtE2HPxk9INJG
	qMCpmvh
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org
Subject: [PATCH] powerpc/kernel: fix repeated words in comments
Date: Sat, 22 Oct 2022 13:12:47 +0800
Message-Id: <20221022051247.64377-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 arch/powerpc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index ee0433809621..ab786da8c30b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -173,7 +173,7 @@ void giveup_fpu(struct task_struct *tsk)
 EXPORT_SYMBOL(giveup_fpu);
 
 /*
- * Make sure the floating-point register state in the
+ * Make sure the floating-point register state in
  * the thread_struct is up to date for task tsk.
  */
 void flush_fp_to_thread(struct task_struct *tsk)
-- 
2.36.1

