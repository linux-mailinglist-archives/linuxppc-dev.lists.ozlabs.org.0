Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0910A88DF79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 13:24:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dM5pT+c4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4QpL5fsGz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 23:24:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dM5pT+c4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Qn03ZDGz3vXj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 23:23:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48EF6CE25AF;
	Wed, 27 Mar 2024 12:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F72C433F1;
	Wed, 27 Mar 2024 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542194;
	bh=9ZItdATIGM0losrcIOR5Cm0pmyfUPs2WpbOAFhoPJrI=;
	h=From:To:Cc:Subject:Date:From;
	b=dM5pT+c4/QxaWzOeCdiKHDuuGFOhkrdkodnjNVaQEPA8oJQohr91B3X8cUaJ8ANEM
	 1uDJwjY/Mvc4PPDPUctxUdsy+2kOXzRRr9QRK1rN65q8Wap/Y0biawUbJOa1QQrglI
	 n0k+Sl5qi3q4mNzeC4mHA3u50ObwzMhIFDM5OgyNt/H2dFwAkjybj3qnNSkSHPqkfn
	 L2E4wn19792KwGboUYW8kZnokmIk2Z3HwMC9DBKDfgRqFLxnxKxwx2RAIFFikEPEM5
	 A8UdC4hPC/m/Fjt5qd+JQKcwPeI16Vg9KUTMlQ9F/ZIuDWMUjWuxce78A0E56HXaEA
	 V88FbLvY56+xQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	mpe@ellerman.id.au
Subject: FAILED: Patch "powerpc/smp: Increase nr_cpu_ids to include the boot CPU" failed to apply to 5.4-stable tree
Date: Wed, 27 Mar 2024 08:23:12 -0400
Message-ID: <20240327122313.2838323-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch below does not apply to the 5.4-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 777f81f0a9c780a6443bcf2c7785f0cc2e87c1ef Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 15 Feb 2024 00:14:04 +1100
Subject: [PATCH] powerpc/smp: Increase nr_cpu_ids to include the boot CPU

If nr_cpu_ids is too low to include the boot CPU adjust nr_cpu_ids
upward. Otherwise the kernel will BUG when trying to allocate a paca
for the boot CPU and fail to boot.

Cc: stable@vger.kernel.org
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20231229120107.2281153-2-mpe@ellerman.id.au
---
 arch/powerpc/kernel/prom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 58e80076bed5c..77364729a1b61 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -381,6 +381,12 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 			nr_cpu_ids);
 	}
 
+	if (boot_cpuid >= nr_cpu_ids) {
+		set_nr_cpu_ids(min(CONFIG_NR_CPUS, ALIGN(boot_cpuid + 1, nthreads)));
+		pr_warn("Boot CPU %d >= nr_cpu_ids, adjusted nr_cpu_ids to %d\n",
+			boot_cpuid, nr_cpu_ids);
+	}
+
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
 	 * meet various levels of the architecture:
-- 
2.43.0




