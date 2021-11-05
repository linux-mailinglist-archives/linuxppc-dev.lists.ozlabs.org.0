Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D11446428
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:30:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm1bY1Tpyz302C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 00:30:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lh6jJaK+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lh6jJaK+; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm1ZN5Tscz2ywZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 00:29:32 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id np3so3073566pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XDqbATdfNlzouhWVfuisrloD7bDuizfPKKL/zO6gK0E=;
 b=lh6jJaK+1lDUfK6oYpETyRr4BQTq5nyGZfYCArRNH5FvVjiDPtazcHMpeUmM0x07Xi
 PgEPS6+4IJLDXaT6lxjKW9Ka1DX88nohZhffRW9grOcGkayzwDyRGcda5SiDgrWixo1R
 6I0trnU1IREZaPBapiZr/pF5hJ9xhysaUHDT5gZVM90KeLU9srtyzVY/dzaaf8Uj9uz6
 /lYt6RspCPTDhpr6UwqcjWyYT4QGUnQriQOKu3qBoJptY5YYDeNkhOVIZnQySnb2c+ys
 muTw7nQZDZXcijq3gCCHuYQPoQ4a9/yBQfeCjyXvtq1cdsZ43T/v/esBljq3wHBlZYF0
 KTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XDqbATdfNlzouhWVfuisrloD7bDuizfPKKL/zO6gK0E=;
 b=rCBnSmKAvx0EruhPYeFtef73nTAWfeGeWN2s4mLpiAh52k9CacmZJ7O2GQj5bqmuQ+
 aQQYJZMQJ1K0LthLfFcCIPw14W5dDb+KGhBfYQ8t+zLmpQICXlhhmPbF2E0FRtcSfyDQ
 G2Rx1fec0rLG9NFbr9yGD5f3cb1sHfvyA/h/udqw7F75+D9u4M18oyPOEXA+o6MKTE7o
 +8EzALsNZ8WM03KmfElAYqJqhpIRCCJKyM/hZcKECIxtoMQWXbfS/2yyIR10Xwx14tEA
 erTA8ImwMCWz01rdwd3E5kL41uHVpZl2Ik2EIOykiUl6yRR0pEaDdOI3XyMhFdCqS7kF
 3iFw==
X-Gm-Message-State: AOAM531Tnjr9MRX7uUiX+JwSdvzy7tdgckTZtZJEtxXP44fnNL6q8rxu
 BFtaHJa8d15P67+R2AWzVGHaCztRtcY=
X-Google-Smtp-Source: ABdhPJxB47Az973DZ3L4kyP1VpOFuy3VO0yFm8FfFPbCvp3wJJUrCEKOFIDA2oG0S30HTlsqGy3TPw==
X-Received: by 2002:a17:90b:4a92:: with SMTP id
 lp18mr9378258pjb.55.1636118970486; 
 Fri, 05 Nov 2021 06:29:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 x21sm7311005pfh.169.2021.11.05.06.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 06:29:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: use slab context cpumask allocation in CPU
 hotplug init
Date: Fri,  5 Nov 2021 23:29:23 +1000
Message-Id: <20211105132923.1582514-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Slab is up at this point, using the bootmem allocator triggers a
warning. Switch to using the regular cpumask allocator.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

This only matters when CONFIG_CPUMASK_OFFNODE=y, which has not been
possible before on powerpc.

Thanks,
Nick

 arch/powerpc/platforms/pseries/hotplug-cpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index d646c22e94ab..78a70ba60d24 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -1016,12 +1016,13 @@ static int __init pseries_cpu_hotplug_init(void)
 	/* Processors can be added/removed only on LPAR */
 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
 		for_each_node(node) {
-			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
+			if (!alloc_cpumask_var_node(&node_recorded_ids_map[node],
+						    GFP_KERNEL, node))
+				return -ENOMEM;
 
 			/* Record ids of CPU added at boot time */
-			cpumask_or(node_recorded_ids_map[node],
-				   node_recorded_ids_map[node],
-				   cpumask_of_node(node));
+			cpumask_copy(node_recorded_ids_map[node],
+				     cpumask_of_node(node));
 		}
 
 		of_reconfig_notifier_register(&pseries_smp_nb);
-- 
2.23.0

