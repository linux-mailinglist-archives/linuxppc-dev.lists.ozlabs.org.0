Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575D802A41
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 03:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sk6vL4xRnz3clc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 13:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sk6tp5LW0z3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 13:24:34 +1100 (AEDT)
X-QQ-mid: bizesmtp82t1701656598t8frmqyu
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Dec 2023 10:23:15 +0800 (CST)
X-QQ-SSF: 01400000000000402000000A0000000
X-QQ-FEAT: hkpyk8INzQP5z8rsiS8kuwoY6xUdsRY8dW9WQcjJFdXel2qTU+ejDRcm6VyqC
	imh5Q0H5tFQijQhHaHLm0yo1zrgD2CtTy18O7IcZqVUghlE0gaZWgQDhPrlnVPOFnaEO7zC
	alJqNiPdXhaIesMDJkgqolVaLUKWezM+6qDO2jl2pnqJNzpZP2BwzSu9kDdnA2TAu4t8yNe
	i9tSPXYA7TrFaBpa3Eg4KbljeeX8cBB41xekY2eP0Iz4ZkeqB+k+kE8Vf6+hc2pm8XxV3fR
	o2iGDYNltm/I8WG/R83ot9cZSxCoCDEOBQQ/YhOAtKEvkinQ8AtAA3nbD/26WCW2JiNrPP/
	TSm8QIFMZfYlhC5WELPdSSAL3EbU9D7Gc5fxBTtn+OfUkwVlw7NZmQjQkxAnEN2YKELPWZs
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 18421861491899950962
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 1/2] powerpc/locking: implement this_cpu_cmpxchg local API
Date: Mon,  4 Dec 2023 10:23:01 +0800
Message-ID: <0EFBD0242622180B+20231204022303.528-1-luming.yu@shingroup.cn>
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

ppc appears to have already supported cmpxchg-local atomic semantics
that is defined by the kernel convention of the feature.
Add this_cpu_cmpxchg ppc local for the performance benefit of arch
sepcific implementation than asm-generic c verison of the locking API.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/include/asm/percpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index 8e5b7d0b851c..ceab5df6e7ab 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -18,5 +18,22 @@
 #include <asm-generic/percpu.h>
 
 #include <asm/paca.h>
+#include <asm/cmpxchg.h>
+#ifdef this_cpu_cmpxchg_1
+#undef this_cpu_cmpxchg_1
+#define this_cpu_cmpxchg_1(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 1)
+#endif 
+#ifdef this_cpu_cmpxchg_2
+#undef this_cpu_cmpxchg_2
+#define this_cpu_cmpxchg_2(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 2)
+#endif
+#ifdef this_cpu_cmpxchg_4
+#undef this_cpu_cmpxchg_4
+#define this_cpu_cmpxchg_4(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 4)
+#endif
+#ifdef this_cpu_cmpxchg_8
+#undef this_cpu_cmpxchg_8
+#define this_cpu_cmpxchg_8(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 8)
+#endif
 
 #endif /* _ASM_POWERPC_PERCPU_H_ */
-- 
2.42.0.windows.2

