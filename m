Return-Path: <linuxppc-dev+bounces-1870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A3995EE1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 07:18:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNh4S6kqTz2yVG;
	Wed,  9 Oct 2024 16:18:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728451112;
	cv=none; b=n47gj/2W6OS1+g5ykVGsHDUZv6bHTKTp7iI/Ae5UKChC9u6eb8uu9ZvLrwu5ShbZsaXWxqvZV9SDzZJhAYAv/lu1BmEKiiJ31RrD13rwmK6OKb8yB6b6qjkSB6v7a4mE7UUHSO59RvrhXZ+Q5cFOEoAxzRCuxCzTy5Wx860GBzyPG04T/AWeYcDPp/KaSyUyDsQVd7VrgfAYaJeHog8nmY6RIM5Beya6cCSc3YHCv8r8Az+4uvhDrI78n5oaIZL5N+UnlwRoNyOGxmlvdg2LtuUPhpgP+BOv+efahr7AplihXrxD0UX66yqKAsj9VtiAW+XvhIXFi2T44E7Od9UqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728451112; c=relaxed/relaxed;
	bh=eWl+SngBEf+IgWIyKVrQhZ0jzt1CRGybVC4NFfwT/o4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFwcAdUzVboiKN8LQq8S9Xvy7Y+wRPhsqFzafAFM63eUDIsWxM3xTFhMUWrH5zwE+JLc3ZgBX9QtBUpca2x1LwNuMeEiiPiSX924huNFf1XyyUkntI0jYXqRRM2z/T45Vwbrq01ldL84gAIQZkIXMzQlseEIc0W1o77PFnCorX7ItdwqYX2TEOgmSGcsuey5OuSz/geuQIIUVIIixj5nCLiqz9KIudL56jq2KSxcnKs1Qld11u7/se8wbdBtJn07bH/PlsprLJnAHSSt9hasQmwLeYQBSDY200nQ2Iccm1+bYRUigJh65IKy/8nxYB+cdZoBXJX8+rizY5B6RGx5rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=myJQxFHt; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=myJQxFHt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNh4S3kLtz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 16:18:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728451111;
	bh=eWl+SngBEf+IgWIyKVrQhZ0jzt1CRGybVC4NFfwT/o4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=myJQxFHtkCqPjkhcPQ3S8e18kXSpNOHmdd27GGJZUhMCDHTba/C47lvDQkTYCM37j
	 jQKNiY8n+eSc0FfOWjywDDwgyYnLrHneWPbaInBBs4wF+Vw1xhsM77koY6t27N+UiB
	 rMypMvIJSfZHXzvtKO8pzAbtDPaGW0nAMVTb1UnorugR43BnvkhtLakaPl13pJzvHn
	 Rw9/qxXEl663qwKgJQuke3UvcDUH2NADC1igXCwN059HRccfhrVbMH3ICHBVYuOSZd
	 daOBg8Rlwb9Bs+9AtQjG5Sf2164FmQmtfTjLZ5di08JRHKyU3q2XiB/kyLUeRf1g9y
	 a7RZ96vdjTE5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNh4R2tZhz4x8C;
	Wed,  9 Oct 2024 16:18:31 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/machdep: Drop include of dma-mapping.h
Date: Wed,  9 Oct 2024 16:18:26 +1100
Message-ID: <20241009051826.132805-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009051826.132805-1-mpe@ellerman.id.au>
References: <20241009051826.132805-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Drop the include of dma-mapping.h in machdep.h, replace it with forward
declarations of struct device and struct pci_dev, and include time64.h
and page.h which are required for time64_t and pgprot_t respectively.

Add direct includes of some other headers to some files that were
getting them via machdep.h.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/machdep.h   | 6 +++++-
 arch/powerpc/kernel/sysfs.c          | 1 +
 arch/powerpc/platforms/pseries/svm.c | 1 +
 drivers/cpuidle/cpuidle-pseries.c    | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 3326730cd300..3298eec123a3 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -5,15 +5,19 @@
 
 #include <linux/compiler.h>
 #include <linux/init.h>
-#include <linux/dma-mapping.h>
 #include <linux/export.h>
+#include <linux/time64.h>
+
+#include <asm/page.h>
 
 struct pt_regs;
 struct pci_bus;
+struct device;
 struct device_node;
 struct iommu_table;
 struct rtc_time;
 struct file;
+struct pci_dev;
 struct pci_controller;
 struct kimage;
 struct pci_host_bridge;
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index b842c83ab497..6b3dd6decdf9 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -17,6 +17,7 @@
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
 #include <asm/smp.h>
+#include <asm/time.h>
 #include <asm/pmc.h>
 #include <asm/firmware.h>
 #include <asm/idle.h>
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 3b4045d508ec..10b8eb6bff39 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -9,6 +9,7 @@
 #include <linux/mm.h>
 #include <linux/memblock.h>
 #include <linux/cc_platform.h>
+#include <linux/mem_encrypt.h>
 #include <asm/machdep.h>
 #include <asm/svm.h>
 #include <asm/swiotlb.h>
diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index 14db9b7d985d..f68c65f1d023 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -22,6 +22,7 @@
 #include <asm/idle.h>
 #include <asm/plpar_wrappers.h>
 #include <asm/rtas.h>
+#include <asm/time.h>
 
 static struct cpuidle_driver pseries_idle_driver = {
 	.name             = "pseries_idle",
-- 
2.46.2


