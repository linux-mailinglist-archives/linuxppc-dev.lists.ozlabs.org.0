Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53762216A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 02:48:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6SY54v2Cz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 12:48:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oCh9xJ9o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oCh9xJ9o;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6SX73pfrz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 12:47:35 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id g24so15774392plq.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Nov 2022 17:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFiQ8yrjAlu5znJjGKWnW7N78yY9mCgalJ70ibzG+ng=;
        b=oCh9xJ9oUKKILoRe5QDlFP54kKTfklbomAYRLGMq9JZosnmEb3/63FkNJ1FQoEMtsh
         Wrp/BB0+uHZjVR59x+5BrwuSAWI8GsxvloqqNQtBqTnWcCi1Z2lJFT3TkKjYtHZc2rd8
         TVJopvWQi5VSzvOiQLFti098ESk4tvS+m6Msy8L+M8xFkvp24omusHsF0aMHYVMuX6tr
         Lsg/PgSWPisnKTIDajNwVgMPJB7PGOxoMovrHzyI9hhsu0rCVl3UKx6veQlmnyOhQawD
         /u8A8i85p7d8/QqBYtHUyG+dZqpokD4xLreaIjwqFslkh0MPzcozYjXIh5dMtgkFV23n
         8Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFiQ8yrjAlu5znJjGKWnW7N78yY9mCgalJ70ibzG+ng=;
        b=4vVb6MFc2VlQkqwqjP688evCtWYEjaI+++vw86zC8NvPLxlyotyqm1AbV0eCi3zXOe
         5wN83IT/My8J+GcdpbkaTpWiyCtSLpPTGiFE4cDlHHPK8PMNxGzhPdaqA3cJkbXSLiVO
         6HZs2lV6VboqC1qlFg1VwWfBxoJo05eb9NJUeqad4IeyYFmpK87SVW6tvQMWfemLXGhb
         ZOkrX5kSLAKT+zfy3amCr+by+IWhNGPnMBIF/pDif1hrAkaoOU4g+8wfTqAXrI/rClZ3
         so9sqWx8tqiSI30zuMO+33D0UoUl08kH1f6m+j820lz12il+pATn+KlUVArPZMUNRxCi
         VAZA==
X-Gm-Message-State: ACrzQf11Lv8n35ioTZi4VgQezZS5fhaa9esycQ3xYuXZ2ZoSAFE77UvH
	4d3YNooKxbZYmwvgS/lPV9M=
X-Google-Smtp-Source: AMsMyM6UqZa83zJujrnKHC7JbTzJ9UswKPa4PYCmrh7ZZB9x/ofQrmMFZjXxbjS+NZx7WWsvqdGGAQ==
X-Received: by 2002:a17:903:2c2:b0:182:df88:e6d3 with SMTP id s2-20020a17090302c200b00182df88e6d3mr58216653plk.81.1667958453283;
        Tue, 08 Nov 2022 17:47:33 -0800 (PST)
Received: from localhost.localdomain ([114.242.248.205])
        by smtp.gmail.com with ESMTPSA id y123-20020a623281000000b0056bb4dc8164sm6992779pfy.193.2022.11.08.17.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 17:47:32 -0800 (PST)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	atrajeev@linux.vnet.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org,
	paulmck@kernel.org,
	rcu@vger.kernel.org
Subject: [PATCH linux-next][RFC]powerpc: move pseries interrupt cleanup code to under __cpu_disable
Date: Wed,  9 Nov 2022 09:47:06 +0800
Message-Id: <20221109014706.10484-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to
Link: https://lore.kernel.org/lkml/20220914021528.15946-1-zhouzhouyi@gmail.com/T/
Link: https://lore.kernel.org/lkml/CN6WCMKCWHOG.LT2QV3910UJ2@bobo/

During the cpu offlining, the sub functions of xive_teardown_cpu will
call __lock_acquire when CONFIG_LOCKDEP=y. The latter function will
travel RCU protected list, so "WARNING: suspicious RCU usage" will be
triggered.

According to Documentation/core-api/cpu_hotplug.rst:
__cpu_disable should shut down the interrupt handler.

This patch move pseries interrupt cleanup code to under __cpu_disable.

RCU torture tested in ppc VM of Open Source Lab of Oregon State University,
by comparing the test results, our fix don't introduce new bugs and fixed
previous "WARNING: suspicious RCU usage" bugs.

Suggested-by: Nicholas Piggin <npiggin@gmail.com> 
Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear PPC and RCU developers

I tries do move pseries interrupt cleanup code to under __cpu_disable.
During this process, I learn the XIVE interrupt controller architecture
by debugging the qemu virtual machine, and reading the following documents:
Link: https://www.qemu.org/docs/master/specs/ppc-spapr-xive.html
Link: https://www.qemu.org/docs/master/specs/ppc-xive.html
It is a fruitful journey, thank you for you guidance ;-)

I also tested the patch in ppc VM of Open Source Lab of Oregon
State University by invoking
tools/testing/selftests/rcutorture/bin/torture.sh

Thanks again
Zhouyi
--
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index e0a7ac5db15d..c7c86ea0a74d 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -62,12 +62,7 @@ static void pseries_cpu_offline_self(void)
 {
 	unsigned int hwcpu = hard_smp_processor_id();
 
-	local_irq_disable();
 	idle_task_exit();
-	if (xive_enabled())
-		xive_teardown_cpu();
-	else
-		xics_teardown_cpu();
 
 	unregister_slb_shadow(hwcpu);
 	rtas_stop_self();
@@ -96,3 +91,10 @@ static int pseries_cpu_disable(void)
 
 	cleanup_cpu_mmu_context();

+	local_irq_disable();
+
+	if (xive_enabled())
+		xive_teardown_cpu();
+	else
+		xics_teardown_cpu();
+
	return 0;
 }
 
-- 
2.25.1

