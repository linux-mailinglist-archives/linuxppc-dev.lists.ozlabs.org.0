Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E291C2958CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 09:09:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGz4R0qT0zDr1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 18:09:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k92UaeFh; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyrR50mmzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:58:46 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t18so458734plo.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 23:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NMFp6cutAQHXXD3MfiyE9KVwOwQS3wVmlQPIzYor1Ck=;
 b=k92UaeFhMXLidkk5/gKFBD3h4IozfGLciaTUU0aK7zsAyaXqL0PPcE97aydyHgyt7M
 j9ZbfIRwhpgP7KNwz9radktpgEuUdpYL5GpKI9lA5P9l8vS10JTUX1JKUHQHF5XDwSZ9
 PdxDodeIScx/YR7yNCVFuVGBNoHbM6rcP5/Idz8ZVH1pghREOy+b3/ERUX3sTgBInoo3
 qZ7MlbxnZI0QmugFs2uCFHqak85gsWnr3MNUv8d42L1tYiboT8Rliy8nnl2oPPjyJgfn
 +nYcZ+t662TsLSqjnMfZya7xy3TGFkA7+i+b0JBrGsA00U7fhLPwqdshSy/eVVgitQ1C
 L7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NMFp6cutAQHXXD3MfiyE9KVwOwQS3wVmlQPIzYor1Ck=;
 b=gZJdOZC+Tfg/XC0su9pIlq7+Ww9HBtYCPlz+Upiai4fgCYEA6auQ3Naz9ndJmVnEmN
 ZvpBNnQuAmTndxU2XVoAmJNM/I7ucl7DlbVx3Wk4H3tA/9z+v0+IAmi0Gxv2C31vxuHT
 lssnjEZZfiXruG0ZE45pig0ZatqFbQMgXKuYoC+QDI1kbfIPZLOl+lqxPXPvDHeUbYLC
 9qbG4NUniKARdAwHvWqydDdXfXQdauLRiW8ayIQPXD96aGoXTWAyG1MQROq700oXww3J
 AVHARRqSzA7IjQxUiiAoOw59m4X9uANlE3FEVnxjvvEE29W7e9XXxk7PzWE6+fI6fWbK
 YnLg==
X-Gm-Message-State: AOAM5321LZ7XApdc4xT4dYkxntRETKTcKJpCLvhkgWUWh2L8eOZS7uDT
 SLfJrurGRftEsp/G9XRGjL4ssdUOXw==
X-Google-Smtp-Source: ABdhPJy9X6sT3cuQIYrb2TL5YRO8fMGLZ9IsUrltuAUn7QUkcPGv+JcJSJvRRTEUpVilUUhBt5nqYg==
X-Received: by 2002:a62:25c7:0:b029:156:72a3:b0c0 with SMTP id
 l190-20020a6225c70000b029015672a3b0c0mr1283443pfl.59.1603349491677; 
 Wed, 21 Oct 2020 23:51:31 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 186sm841300pff.95.2020.10.21.23.51.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 23:51:30 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/time: enable sched clock for irqtime
Date: Thu, 22 Oct 2020 14:51:19 +0800
Message-Id: <1603349479-26185-1-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicholas Piggin <npiggin@gmail.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_IRQ_TIME_ACCOUNTING and CONFIG_VIRT_CPU_ACCOUNTING_GEN, powerpc
does not enable "sched_clock_irqtime" and can not utilize irq time
accounting.

Like x86, powerpc does not use the sched_clock_register() interface. So it
needs an dedicated call to enable_sched_clock_irqtime() to enable irq time
accounting.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/time.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index f85539e..4083b59e 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -53,6 +53,7 @@
 #include <linux/of_clk.h>
 #include <linux/suspend.h>
 #include <linux/sched/cputime.h>
+#include <linux/sched/clock.h>
 #include <linux/processor.h>
 #include <asm/trace.h>
 
@@ -1134,6 +1135,7 @@ void __init time_init(void)
 	tick_setup_hrtimer_broadcast();
 
 	of_clk_init(NULL);
+	enable_sched_clock_irqtime();
 }
 
 /*
-- 
2.7.5

