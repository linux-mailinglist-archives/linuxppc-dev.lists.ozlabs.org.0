Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA25FA1F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 18:30:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmPXX2ZRkz3dxQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 03:30:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=bg4.exmail.qq.com; envelope-from=wangjianli@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 492 seconds by postgrey-1.36 at boromir; Tue, 11 Oct 2022 03:29:49 AEDT
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmPWx5zTDz2yPm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 03:29:49 +1100 (AEDT)
X-QQ-mid: bizesmtp83t1665418871tvs9zsly
Received: from localhost.localdomain ( [182.148.13.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Oct 2022 00:21:09 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: lj50s4tNr7r9OVSLH0oBgczjg+4dztI/UblukmQTC+KCNz8v/qlUickKb7X6W
	ZIbIPLeZX6uLu9k+s4J7mfCzTlVRd/ctiGKWL+SBNsAC/6nizA5MDv0rMeQGTbGRtVrqgAu
	m+BCO4YmKfUF/60bcDBwXWpuGs2FEPZ2cRGWa5fJf69e4tLYcp9WKCjFjNw9jVGRZw2ABkR
	Xs8xSSl9e83ycOE4AUd4R9AJGB+8V3aAKSIpfvin+rKfHwNdt4P7dOAloHLdfFzEhoYnhp0
	0msoAh3JGlMffbmEO/slGNV2lniu8qNTvfLnOVrcHejsKbkk/1A3omlJAUt04YYFqGOQwA4
	Kl01q2o
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc/kernel: fix repeated words in comments
Date: Tue, 11 Oct 2022 00:20:53 +0800
Message-Id: <20221010162053.6708-1-wangjianli@cdjrlc.com>
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
index 406d7ee9e322..7a6e54e4f1d8 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -176,7 +176,7 @@ void giveup_fpu(struct task_struct *tsk)
 EXPORT_SYMBOL(giveup_fpu);
 
 /*
- * Make sure the floating-point register state in the
+ * Make sure the floating-point register state in
  * the thread_struct is up to date for task tsk.
  */
 void flush_fp_to_thread(struct task_struct *tsk)
-- 
2.36.1

