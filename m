Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57F52488C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 11:06:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzQqz5TL9z3cHY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 19:06:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ithI42PX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ithI42PX; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzQqJ0XVsz3bWm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 19:05:46 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id n18so4293987plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 02:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=786wkcJ5s78jewmsUXyg4PXxshc2x0szKJgtpoGXHUo=;
 b=ithI42PXwNMmIlEz7dBqpzyzxm/cCqBccyhHhfDrZpmJfbs5eP1Yrl7cx/si/oy/nf
 VO35554++W2J8DM9xoydkmScEuAbQl6Jujm0Oh1oxvDSmqfKCJOevJs9aIgFHldebge5
 AZTqWaX2cRsCF0tvRwa/YPCjNLXS8BygaCQDtIXCfeETIr6wARUKvHCQcAgHvOPRy+Xd
 Yd5mUObhPjTloEsH4jiOec40AVnIa+gNWGffPMJQnsDoTf8l/bnrCOeZOWJ6s/C8quYS
 4vYH0705aDcBmJDVxU44GmrzqXjrJ1ufkzK7IIjjSpwZRq8r99669Ffg+e9/Z9Qcqrj0
 OeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=786wkcJ5s78jewmsUXyg4PXxshc2x0szKJgtpoGXHUo=;
 b=fhzPrEOwbga2pz4PzNSSuqBGoBzoxsrS+pSmfegzv/iwr1Ij5RuyazYEgx/rpjJaJL
 6VXben+U7FEGFUh8sL6WLBr9oHjFAhjcmiDEztKtQ2y4vNIuwM6i1/rgoS23fs/WpWYb
 DybCHfMrvMc8LGchua5+NzefDqR9tMP7rPSMMk2HKVRCFtpEDROC9GpaM0xRn6w+tBrD
 E8uKDi6dPKgm+AfwKHdDrrrB6nErujyhm+k22a+PsQXIWM8D+1g8n99HOP38PGmI/CGw
 fAVH8ZLi/mt/4zS/EDVveJLGuVnbPqR3ldArGM6ljAfvVRqNDD0KjqtAPpIwQUA+oHmA
 w5uA==
X-Gm-Message-State: AOAM532aca16Q+zv+7ohbLCHlEz8c2QVSLW2F9GL9t3X9r/R2XeBPVOu
 7A41/Q5T4rCRtflX733XxAE=
X-Google-Smtp-Source: ABdhPJznixXxd7TIhMalrFNOxaTcW+XdgpSHp/MPzsYMGnqCKSxoAwMSaJ2c1J468jiw6zEI/ykZfA==
X-Received: by 2002:a17:90a:dc0c:b0:1da:125a:ec84 with SMTP id
 i12-20020a17090adc0c00b001da125aec84mr9772336pjv.137.1652346343680; 
 Thu, 12 May 2022 02:05:43 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 x13-20020a62fb0d000000b0050dc762813dsm3199054pfm.23.2022.05.12.02.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 02:05:43 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nick Child <nick.child@ibm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ammar Faizi <ammarfaizi2@gmail.com>, Miaoqian Lin <linmq006@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/xive: Fix refcount leak in xive_spapr_init
Date: Thu, 12 May 2022 13:05:33 +0400
Message-Id: <20220512090535.33397-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_find_compatible_node() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 29456c255f9f..503f544d28e2 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -830,12 +830,12 @@ bool __init xive_spapr_init(void)
 	/* Resource 1 is the OS ring TIMA */
 	if (of_address_to_resource(np, 1, &r)) {
 		pr_err("Failed to get thread mgmnt area resource\n");
-		return false;
+		goto err_put;
 	}
 	tima = ioremap(r.start, resource_size(&r));
 	if (!tima) {
 		pr_err("Failed to map thread mgmnt area\n");
-		return false;
+		goto err_put;
 	}
 
 	if (!xive_get_max_prio(&max_prio))
@@ -871,6 +871,7 @@ bool __init xive_spapr_init(void)
 	if (!xive_core_init(np, &xive_spapr_ops, tima, TM_QW1_OS, max_prio))
 		goto err_mem_free;
 
+	of_node_put(np);
 	pr_info("Using %dkB queues\n", 1 << (xive_queue_shift - 10));
 	return true;
 
@@ -878,6 +879,8 @@ bool __init xive_spapr_init(void)
 	xive_irq_bitmap_remove_all();
 err_unmap:
 	iounmap(tima);
+err_put:
+	of_node_put(np);
 	return false;
 }
 
-- 
2.25.1

