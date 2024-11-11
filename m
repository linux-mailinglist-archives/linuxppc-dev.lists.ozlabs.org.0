Return-Path: <linuxppc-dev+bounces-3085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB3F9C36F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 04:23:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xmvxs3gyCz2xs4;
	Mon, 11 Nov 2024 14:22:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731295377;
	cv=none; b=eeUHFAokmvIONYz0iss89fXwES0c/cA4lXn0CcIm4IEsxmhNSGgAt2DeTzu6zqX+snGxB4EA2PxgeXxbxLlRPftJDsxmhETdYRJb6S+Ae4xNwNGgIOu2IbIxh7vBnOCqxLIFPV+OAnhD0M+9seavpsnYxWKcUhq1u4qItkUWkt1XfUE5phXk/Ay4X0+/RPlVxzqAVXLC1eamxyHI/BLDT8QW3aUKu71dnVdtROpMENPsSLhIF23tAWaP6IK4PdIY4NEy9FpjcopEMv4GCOPMtlYKOHQ1E+zYBMy1u6jrLto+faJ6JSgS27VTS+xhZ35GT+7WucFAoW53RNnV84X6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731295377; c=relaxed/relaxed;
	bh=+Zqma3iqIdRjkeMGOL9TOEljkUvhtqoTvXcsm7XW+ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vv2SmKcTp4Ccbg1KXjBdFkZw+M8CtMz9b89eFwUftwX5HuT9Dp97OPXHV/xaXJYVU/m1RSgckIb6imZH4C5cN6u2OMZeTyyVkmh+zPDCKwL5Kd51I7Q3hzP3uNR92snP56PV5TpxHDep5rrhrtC8wSdUe4D46sNON4NhZmVw6Z6jbIbzeTsf9t3P2Mk+3wBYMmUV9LddCrOUSIX4f2y+O4cdtEjEKvNTctVN/bCzG30RNTEoiZ3tdJruNsGhVhPwm9ashZGmD0oDAtQmzDUSocIkf+VSq8Fq9fggD4M9lwaxK2TUJzK4CGFddqnFaIRS/MtSvUNI1JOttaW7eZalAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xmvxr2tcSz2xs0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 14:22:56 +1100 (AEDT)
X-QQ-mid: bizesmtpsz5t1731295321typ3e2q
X-QQ-Originating-IP: ofFtZ1fxMvOEsrfXFBQDQFF1hbpHJHJxVxCs/vPXlOc=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Nov 2024 11:21:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1828540669171451381
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH v2 4/8] powerpc/debug: hook to user return notifier infrastructure
Date: Mon, 11 Nov 2024 11:19:32 +0800
Message-ID: <C6F501DF61F2B5B0+20241111031934.1579-8-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241111031934.1579-2-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Macl0gWiWu4ePjFBT404aWJMhJ/w32LwXi3H18Zl9fH1DSw5ayl/UCzJ
	oYDFFCJhfU1iVJ5mermE3b1zSAvlpvksDkvHfTFpcnTBtn0HwlWMxXZKptHPArIaAyX6pc2
	JdHU9RqSxMi6bDVPT7DYgN+H9q3mW/cvQ1mrD1krvfVXcw1KtwExuf28Qw9qPoegH75850H
	GLSYE30mRkGofaeO1gSn3/RT6c4IyOcz8wb1KejFSHz4MB3argHth/Un5Zaq0hZRvXnGk4t
	wCp738exAmJG1Z+2WtYXVA8kaNHA184w8t8gz8uQCDfTAQD9thRpxBT4DldpRsIvM+ZYZ8Q
	uGHuRxGHzW82k0eoiIcXqzSfOK9K+jL5/xqvs/78hGdfrusFAaIA+xbsRapmUk/HLvQMBxM
	7RT0N5sSRjCXH1GsAY2MI9QkMguFAPt3oK3X5X4BxSbN8c4VsQFCZA3F+m0jcmnTAugkzCC
	FlBkhfNQ/JnE6ImllitPTfYMaMh7y1hNfACQjFjyiMVdUmLTy+ro4fVdcZlks5MWeXUJpK7
	PwvpaOT90WH/0iAgk7LqMC+XghZzX4NCmPIuZYkJtNcELFqq6uuRdGb3n58fdLv2voRB8r9
	sk1XvKNP8WHpxl9y56eU7OCXNWsdzdQPXuSo1RNGKj6CyH8fOE87oEZuyzhUn8eOZ1X36Fd
	Gaoky3W90TiF5Diz1fdhMcNMmT5lYVrofiI/mxXQjo/ZcO5y7vYrt3Vm8bVMw91zPlDwL11
	oGE62ejdBSb4GVgc7kU1/Ld59cD3so9iwlUERBj/X3VkJtTNriAcG1kYBZt/TrU7z7wz3F5
	NON5oEcyRhdnUT7QlXC9F9ZmLojMvygHHV8VC64mkaB40ksxQDQ9nJNw9RaNyhL5j68mto5
	tmlbT4UpMU0avasAyqKdVt3qK0NSOxFPQoAiJlEGIp4xc1VzYBVnuTQXed09M3KU2TCmAXk
	nqxOLB3Ohtoe0jpqfeZQGXFXIoVSDTFhIIM7fRXm8rjN520JsWKpk0jQF
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

calls back to all registered user return notifier functions.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/kernel/interrupt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8c532cecbc60..609ba48034de 100644
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


