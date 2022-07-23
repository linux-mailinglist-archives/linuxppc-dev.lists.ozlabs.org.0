Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1D457ED0D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 11:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lqgt547pRz3chs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 19:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.54.12; helo=smtpbg.qq.com; envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (biz-43-154-54-12.mail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lqgsh3h8cz2xXS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 19:25:55 +1000 (AEST)
X-QQ-mid: bizesmtp72t1658568280tzvi1vyk
Received: from localhost.localdomain ( [125.70.163.183])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 23 Jul 2022 17:24:38 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000000
X-QQ-FEAT: CR3LFp2JE4lL1GLCr4icph6+qQFBccuI/ZemMcyWA7bPB5CinROu62HTGBe+L
	RezNBmLkE2Kn831ezk3xivGhwn40wFxvvdawTQQ1vAW/7keeVRId81pC+TgaBC5Bz0DtpnX
	dk+wiaSta+Y2kedmDSMXUIafVbypCTjJeyAziMAxPjW7pS5qCvAzCGlF+nEXJ9cVzGut+wn
	aXonOGYNLKlMqb26Knki8ILjVmHV6QRgGRUTMD+5uhyMaak43bRvx127hZ+sV6SfN8dc8gX
	9TGUr3WgoF7rfZqCS21kGL92zLE6iUW+oZTQ0KS2iERrloNw5JnAXLV9ail3mRho/oFeVxZ
	SmHtC+mELLuBnr41bVzSqvK5FMF416bHdlsCFHcfpJXD7j26cv65hAD8mH+GAEhwQZlfyYs
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: paulus@samba.org
Subject: [PATCH] powerpc: Remove the static variable initialisations to 0
Date: Sat, 23 Jul 2022 17:24:36 +0800
Message-Id: <20220723092436.7149-1-wangborong@cdjrlc.com>
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, Julia.Lawall@inria.fr, joel@jms.id.au, Jason Wang <wangborong@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Initialise global and static variable to 0 is always unnecessary.
Remove the unnecessary initialisations.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/kexec/core_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index c2bea9db1c1e..2407214e3f41 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -135,7 +135,7 @@ notrace void kexec_copy_flush(struct kimage *image)
 
 #ifdef CONFIG_SMP
 
-static int kexec_all_irq_disabled = 0;
+static int kexec_all_irq_disabled;
 
 static void kexec_smp_down(void *arg)
 {
-- 
2.35.1

