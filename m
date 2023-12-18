Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC819816544
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 04:14:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StlLL6R09z3cXb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 14:14:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StlKt1BPNz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 14:14:25 +1100 (AEDT)
X-QQ-mid: bizesmtp74t1702869227t11cgp0b
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Dec 2023 11:13:44 +0800 (CST)
X-QQ-SSF: 01400000000000402000000A0000000
X-QQ-FEAT: ojreUey1GAJh8hL6tFNRr/A8uhfy7W4zq3Yz29fwbmPUxIt/sWXzmwhmi3hB7
	HEBw4koeQHjL3Qi/cVxpCKaWJG5ZGMO+/cXTzN6SfHcl0ULH600a3DcvPjlj6tyg2k/gKZu
	XSOQdClx+ydjQqzaULB6SML3BiQ88F2+h4RH4MXzqVhRMbVF5h5paqDpm/uMIfWMj1a8USz
	yihH3cUqAKqL9Ft5UEzlFMMSIrKJ4u45WR3Xcv+g+sI78M384cTjXLiJitHs42w41v9XQcG
	MGI0xeEB6FDlyTxOgcbMO4SEFL5vJL4qeb1zaXB4g4Db2+0uqy5u5u8U+IklyT7SGiEXHO7
	CnY03CRLj3jo60/R0YoLOMehhGvZCJwedC2KtL5v7sPa0tku5w+sPOoCOD6XFJwROfl/I1u
	7HpqbRCfybjinFJ3Xga9lQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 4197664245729680774
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH v1 2/2] powerpc/debug: hook to user return notifier infrastructure
Date: Mon, 18 Dec 2023 11:13:37 +0800
Message-ID: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before we have powerpc to use the generic entry infrastructure,
the call to fire user return notifier is made temporarily in powerpc
entry code.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/kernel/interrupt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4f6d3c69ba9..7fe704946e96 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -19,6 +19,7 @@
 #include <asm/time.h>
 #include <asm/tm.h>
 #include <asm/unistd.h>
+#include <asm/entry-common.h>
 
 #if defined(CONFIG_PPC_ADV_DEBUG_REGS) && defined(CONFIG_PPC32)
 unsigned long global_dbcr0[NR_CPUS];
@@ -245,6 +246,8 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
 	/* Restore user access locks last */
 	kuap_user_restore(regs);
 
+	arch_exit_to_user_mode_prepare(regs, ti_flags);
+
 	return ret;
 }
 
-- 
2.42.0.windows.2

