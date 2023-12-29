Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C224181FF4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 13:03:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IsqMDnK1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1kYV3FMrz3cb7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 23:03:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IsqMDnK1;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1kVv5gNgz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Dec 2023 23:01:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703851287;
	bh=0oLLh6xTaFHV7ztZTSdCfMJvFJXUC0ivOBQdCJBzZtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsqMDnK18x5YPzkaOyCA/haEgzR9EOlEHwmpEfFu6bO0/VTGNtJBe3EqgmCmxzN+X
	 mwuCB8pzpYbNzPSQBYCkzbBYU3ncUKuO/OqleyPgP/yjBZDMr7Em/F/lqNDLX+hNvG
	 nRb2S04/+q6N/ngZgRGnxlX+iFvQbBdnut99Hr3rE67C0nSE0hvOMveHfwFkntldmj
	 iObSg7aj1NrtNaqVxBIYvg3HYb/InXkWdKzOdYKQxDww6BxT/srXtmUWYf5syhtu91
	 u8cVprd1uH89OeaEMLk8iGPVy4MB0Mra5oe77REVMbj68U4Db2k7yOMuGBSCyZyWdA
	 OeMpYSenNxWag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T1kVt6nBgz4xTx;
	Fri, 29 Dec 2023 23:01:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 2/5] powerpc/smp: Increase nr_cpu_ids to include the boot CPU
Date: Fri, 29 Dec 2023 23:01:04 +1100
Message-ID: <20231229120107.2281153-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229120107.2281153-1-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <piliu@redhat.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If nr_cpu_ids is too low to include the boot CPU adjust nr_cpu_ids
upward. Otherwise the kernel will BUG when trying to allocate a paca
for the boot CPU and fail to boot.

Cc: stable@vger.kernel.org
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 58e80076bed5..77364729a1b6 100644
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

