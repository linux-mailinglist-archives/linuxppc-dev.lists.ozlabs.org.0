Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742D558B6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 00:57:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTbJ36j0hz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 08:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=175.27.65.136; helo=smtpbg.qq.com; envelope-from=jiangjian@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (smtpbg139.qq.com [175.27.65.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSj7G2pPCz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 22:16:56 +1000 (AEST)
X-QQ-mid: bizesmtp80t1655900185tjv9mfxl
Received: from ubuntu.localdomain ( [223.104.103.173])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 20:16:21 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000B00A0000000
X-QQ-FEAT: ZHWZeLXy+8eNRc6LoVbd8diuEGcYexDvpPzXtcbLFF5CF2z03xtRuZyndWyz4
	oyvWu7GZ0JEPtFyn2kMI/3K061US4zBX6B1Ul+J+qQ/He3n6ZwOPn/2GddDHa9gGb9aNp9b
	sn9cXopr1iLpDFbdC0ixcsYOhhqVJ6j2y7JS7uZKnEy+/nAgwYm7jqvW/ulcAGz/KhD9zuk
	bD/3Mp3wmGTp4179mEAj1wKe/EWLgm8ThwViPcWcrvpJC/XO/WNcLom6JMxI2/mBx7TS+be
	Uvpn6JCSSfAcNxCEZr+gEgg3CcPgxQ+8kFbSG9p6izMDvIad4+TrYpi8V/fZaeKJj5k3sSM
	VjF3wKMWA99CHAT7/6uh3Jkz42d/Q==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/ptrace: drop unexpected word 'and' in the comments
Date: Wed, 22 Jun 2022 20:16:16 +0800
Message-Id: <20220622121616.16243-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
X-Mailman-Approved-At: Fri, 24 Jun 2022 08:56:56 +1000
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
Cc: jiangjian@cdjrlc.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

there is an unexpected word 'and' in the comments that need to be dropped

file & line:
arch/powerpc/kernel/ptrace/ptrace-vsx.c:74:

* Currently to set and and get all the vsx state, you need to call
changed to:
* Currently to set and get all the vsx state, you need to call

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 arch/powerpc/kernel/ptrace/ptrace-vsx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-vsx.c b/arch/powerpc/kernel/ptrace/ptrace-vsx.c
index 1da4303128ef..7df08004c47d 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-vsx.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-vsx.c
@@ -71,7 +71,7 @@ int fpr_set(struct task_struct *target, const struct user_regset *regset,
 }
 
 /*
- * Currently to set and and get all the vsx state, you need to call
+ * Currently to set and get all the vsx state, you need to call
  * the fp and VMX calls as well.  This only get/sets the lower 32
  * 128bit VSX registers.
  */
-- 
2.17.1

