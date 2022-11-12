Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C406267EA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 08:59:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N8SfK2Wsqz3cKG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 18:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=bg4.exmail.qq.com; envelope-from=wangjianli@cdjrlc.com; receiver=<UNKNOWN>)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N8Sdf5599z2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 18:59:04 +1100 (AEDT)
X-QQ-mid: bizesmtp81t1668239923t2v1yf82
Received: from localhost.localdomain ( [182.148.14.167])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 12 Nov 2022 15:58:41 +0800 (CST)
X-QQ-SSF: 01000000002000C0F000B00A0000000
X-QQ-FEAT: SFhf6fKhx/+csOBMGXrjySirmdkRZtfKQtvBEBQ5l9HtTY3Q3EubEtJjYwE9j
	uDhvIXf7jkrzqgWYK4w3kPbKwn+V1FC/7q710JgFktbNicUsW8OGqSaHaYcS4WJI/k2seig
	QhydBQJ7/esfVpmBR19TwS3RO7fdfdYdMtNusrVcxV/iq5Z9rkQNjL17Yv/PZrF1ZD8IjAn
	7NF7jUuUAcMEAOBpl/3rqKf07dz1hOjBavVzCykpkM9N3nQ+kn63cJ9Ah1ZbSNYH2v2aNLt
	Xwma55Gwg2toEzM3RWxgDMXxdaAWsZBNMsCYk9IxP0W7MjiPJG1fcNHEqBvvp/v2vL/wMoO
	ltXgj8gjaV65Z/DMb4=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org
Subject: [PATCH] powerpc/kernel: fix repeated words in comments
Date: Sat, 12 Nov 2022 15:58:33 +0800
Message-Id: <20221112075833.37730-1-wangjianli@cdjrlc.com>
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
index ab786da8c30b..6fa4ddec6c11 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -281,7 +281,7 @@ void enable_kernel_altivec(void)
 EXPORT_SYMBOL(enable_kernel_altivec);
 
 /*
- * Make sure the VMX/Altivec register state in the
+ * Make sure the VMX/Altivec register state in
  * the thread_struct is up to date for task tsk.
  */
 void flush_altivec_to_thread(struct task_struct *tsk)
-- 
2.36.1

