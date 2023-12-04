Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85393802A4C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 03:31:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sk72L0Vx0z3d89
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 13:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.124.171; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 372 seconds by postgrey-1.37 at boromir; Mon, 04 Dec 2023 13:30:41 AEDT
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sk71s4nsxz3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 13:30:41 +1100 (AEDT)
X-QQ-mid: bizesmtp82t1701656608ty8azrma
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Dec 2023 10:23:21 +0800 (CST)
X-QQ-SSF: 01400000000000402000000A0000000
X-QQ-FEAT: uGhnJwy6xZKw3HYMUMtltLGm75iKrd0p9Mg4/P8rycRmhTyVbD11w/SP4bnWS
	xkFnJqlin6yip5DFMzorO23bnDYDqkAa53H9SKei1jG30ThzFmOQ18rKB6knc7iBaOurEBi
	UtMz5/WbYXY3fsMQDLbBnzr/Gk8cj/hbb6LaM+djjX4aqDdSRKUrFqm6F3xqzMT4iswY4Ll
	uN2cZS6upIg85/ItXCf7i8HmVr/8RUqeKPWo01J4b8yvLwUbKgqvbcfv3SGNK+QWkn7J+1q
	eg4TcD2f2WYioztZpfXgvgXyesSPrhHxjzm3hAJQevs/h/aRXPliziDbZFRF5yvoenE2F3M
	zEHEllLyrEKYGf1QczFwrAqeWeDfFXfUlvUpk0sGCNZ0GIQx8E01V+qwqZ09TNwUPbF9VeF
	JweGbcYAIaU=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 17993081573831466038
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 2/2] powerpc/locking: enable HAVE_CMPXCHG_LOCAL in kconfig
Date: Mon,  4 Dec 2023 10:23:02 +0800
Message-ID: <4250629DA95C6D4F+20231204022303.528-2-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231204022303.528-1-luming.yu@shingroup.cn>
References: <20231204022303.528-1-luming.yu@shingroup.cn>
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

enable arch feature HAVE_CMPXCHG_LOCAL for ppc by default

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..c10229c0243c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -226,6 +226,7 @@ config PPC
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
-- 
2.42.0.windows.2

