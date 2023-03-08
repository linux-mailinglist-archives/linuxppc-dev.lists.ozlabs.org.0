Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E956B16C1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 00:44:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX86n6Bb3z3cd4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 10:44:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RUMNjnJk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+arbab.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RUMNjnJk;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWzl80LKFz3bgT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 04:26:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F27F9B81C13;
	Wed,  8 Mar 2023 17:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A302CC433EF;
	Wed,  8 Mar 2023 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678296414;
	bh=9bFZbeCJ+IXMUICe8k7A5Vm/02IJPU1Wkc3m6M+dmo0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RUMNjnJkYV47zwUNIX3Z+2RZLXdp69ngug4qlg4yLr3MILgmSTMc5P6xnBNbK+LZx
	 n35RUs2XF6bJpLd27LK42+YREh/H72q279INZYgGzMsb0OGktN1cdu2RLqMEW4pl/K
	 01MQQMy8zgY9f5awIfcx6UPY1Qe7jvSQ2+0O++ZHlIX6aTkBpbSKz2mj0BeCtjiSYu
	 ZHVCO6TenFieKU1wiR7SHsBPSo3Fi0/xC9RuSNmwZOW6g0n8CkGsQXiwdz4ftBzpqT
	 jneaDzX7xE1BHjMZrQGeYULMTNo+wqBulylTgoJ7VY0Qyfb8SFBGszkz6wwUJvtxHE
	 Iwh1wcm77ObmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826D9C6FD1C;
	Wed,  8 Mar 2023 17:26:54 +0000 (UTC)
From: Reza Arbab via B4 Relay <devnull+arbab.linux.ibm.com@kernel.org>
Date: Wed, 08 Mar 2023 11:26:47 -0600
Subject: [PATCH] powerpc: Remove TM XER[SO] bug workaround on POWER9 v2.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230308-cpu_ftr_p9_tm_xer_so_bug-v1-1-75e4c53c026a@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAFbFCGQC/x2NQQqDMBBFryKzbmBU2mqvUmRI0lGzMIaZWATx7
 o1dPj7vvwOUJbDCqzpA+Bs0rLFAfavAzzZObMKnMDTYtNhiZ3zaaMxCqae80M5CupLbJsP+3jl
 E2z/rBxTdWWXjxEY/XweL1cxyDUl4DPu/+R7O8weAvdfkgwAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833; i=arbab@linux.ibm.com;
 h=from:subject:message-id; bh=YY0g8Df5qjX6rJn6WmSARM9BAtsZyWTzfiGLnFG1Vnw=;
 b=owEBzQIy/ZANAwAKAdAlkqhpa2bdAcsmYgBkCMVdrTHkwCd44WVG04LfAi0LQWaygx2ucP4Ga
 PuzsAjQntOJApMEAAEKAH0WIQT1XwGdMQOjW/syvwXQJZKoaWtm3QUCZAjFXV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0RjU1RjAxOUQzMTA
 zQTM1QkZCMzJCRjA1RDAyNTkyQTg2OTZCNjZERAAKCRDQJZKoaWtm3W3QD/9/GDY4/Lr5gHTJmi
 M+RRu7NlGYQhLGUtK+Z1U4BQ7W4b5p/qJtDZw7mVoI9TF38dvhLYhS14QJUr+NnQL0yh/kcVbSY
 pF64ucQXT5rnd0M32YHJKv5n/Y6CltBzjKfBvS0SYj8rmLWbI1e18hz9nA+5r9kD7xadd8A4fxL
 slgzM+aEv8fLm/2Xat7AYvAhg7qiwTSo3LLabE6tF+p6qCeQEjA6vNhIxX3CmvTkYa3q6snzx9x
 aMIALxV26WCu03swEI+8lAeWJaM+LXBMXCh6/jJNOMb8pR8K8qWl2H7HrMc0pB2gW9WmlQkYfJe
 jBpkuDIswQu4br0D5Bo4jw73uU8GbQHT3V7g7ehG2CKBcIcQvKePooZu1NnWUUog8OV7PIjsH4v
 fgRzG5kwnzwlY6kl4ZMBzXQa8ThE1KryiDnAVlo1dJ1tYiCx+jH6hpbkSODlDVj+UkE6EmrTZ0b
 GtjYDe9140ZDGzZzl/PoeS1JcVmUpeTsI3mxAfaBnKA1xDGyAVRB3h3kO6aRV6c9r4ssL2E6BOQ
 yL62JNX8nP3W7Yy5fGXdIOrI0yYBMqzhyPar6BgImJ0TnAA8/Vf8Da01EspV91o2BGQaUFe2+Hx
 rG1kaQS+weagoVHFE7U4xH6/AZ3J6Q2t8sGn9vvNtEqB2Fp15wpg/8Za6bjfMfaYMW+Q==
X-Developer-Key: i=arbab@linux.ibm.com; a=openpgp;
 fpr=F55F019D3103A35BFB32BF05D02592A8696B66DD
X-Endpoint-Received:  by B4 Relay for arbab@linux.ibm.com/default with auth_id=37
X-Original-From: Reza Arbab <arbab@linux.ibm.com>
X-Mailman-Approved-At: Thu, 09 Mar 2023 10:43:49 +1100
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
Reply-To: arbab@linux.ibm.com
Cc: Reza Arbab <arbab@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

When creating the CPU feature bits for DD2.3, I should not have carried
forward CPU_FTR_P9_TM_XER_SO_BUG. That bug is fixed in DD2.3, so remove
the flag.

Fixes: 26b78c81e84c ("powerpc: Enable the DAWR on POWER9 DD2.3 and above")
Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/include/asm/cputable.h | 1 -
 arch/powerpc/kernel/dt_cpu_ftrs.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 757dbded11dc..5dc6906498ef 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -439,7 +439,6 @@ static inline void cpu_feature_keys_init(void) { }
 			       CPU_FTR_P9_TM_XER_SO_BUG)
 #define CPU_FTRS_POWER9_DD2_3 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
 			       CPU_FTR_P9_TM_HV_ASSIST | \
-			       CPU_FTR_P9_TM_XER_SO_BUG | \
 			       CPU_FTR_DAWR)
 #define CPU_FTRS_POWER10 (CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index c3fb9fdf5bd7..afcdbeed8b44 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -782,7 +782,6 @@ static __init void cpufeatures_cpu_quirks(void)
 		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
 	} else if ((version & 0xffffefff) == 0x004e0203) {
 		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_HV_ASSIST;
-		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_XER_SO_BUG;
 		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
 	} else if ((version & 0xffff0000) == 0x004e0000) {
 		/* DD2.1 and up have DD2_1 */

---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230308-cpu_ftr_p9_tm_xer_so_bug-ec58b00a9716

Best regards,
-- 
Reza Arbab

