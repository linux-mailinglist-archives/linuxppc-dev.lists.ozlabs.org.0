Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E207E5F96D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 04:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm3084G0rz3c87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 13:34:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Up0OWIpn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Up0OWIpn;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm2z94q51z2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 13:33:39 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id f193so9293910pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Oct 2022 19:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqNHFO+wnYU3tQ/zlSnRMD0uRUbJO7Cs4TB5ZEpNv3w=;
        b=Up0OWIpnNumgltMC4JxjBfkp61fbritNxYuU3KT1yMQQE8xemaB4vGSN5iEpp/PaZS
         AtBJVbIY56HIeXWlowwJR44lVaDNsWi866oUJgFpXvNXpDZBXL3hp/G1/0xMbeV4E8N0
         JNBPAq/cLI6nicGre1FCEUHNgqQ00NEUXk1MELRzH7fj3fD+2m181PH2G+C1FWfGtvXZ
         yJjLbQGMTA9ZuZw+w3gYWkKLYfk/DoUmX3ctoVlNxpXNuRKYrgu5svRxjX8LcaKKDhvk
         b52DleueWhaS9fezhsJjDUJSsn8gQTaLkv3OdcC9wNd2wN5pUf2jhIDSX/QGTN6+3jZi
         RWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqNHFO+wnYU3tQ/zlSnRMD0uRUbJO7Cs4TB5ZEpNv3w=;
        b=d1aIiZaRQD03YXYkvbr5hJJHGKLyuaq8wifhKVxisZwXIdRSPNZ37iGXu/If/hPP8l
         bF3GXrSRFWmvtZHeh1aQyeG8j+viAwV/+TRvWo9YRaYjY4Zm2wIXpSDCSlaBT71DfiaH
         sicu/3kfBfLBcWTaW/PHFz3mI42znbvfdUnYfg0CAuz3+g30efYGgifEHy5+wrqRLBuZ
         4s0LBm5ccpj/ctx2FaMVUKY0krg9USb0bEovIsfbepqYUDFXtLtYDmyWZ29lsblrI8ld
         DXPNyHBI08kmRLmooUNgioxsxlZeKtpbvkTwav3IVqJUiW1FHon42TXHKyV59xc7GIOI
         fNFQ==
X-Gm-Message-State: ACrzQf301tyj54Ls+g4cIK7hc/hEkcPLkURktIxvlty5tg0fGrISylvb
	JDvfitJrkcUkR6zoavxrebM=
X-Google-Smtp-Source: AMsMyM5JdNHma1WJKgHUKa8vOZplr/d5/dNWYX750tyf+34p/0N26QYC8Fvbs+s55/Gomlx56HP4hw==
X-Received: by 2002:a63:455e:0:b0:439:9496:ddd8 with SMTP id u30-20020a63455e000000b004399496ddd8mr14573002pgk.261.1665369214974;
        Sun, 09 Oct 2022 19:33:34 -0700 (PDT)
Received: from localhost.localdomain ([191.101.132.215])
        by smtp.gmail.com with ESMTPSA id i20-20020a63e914000000b00434272fe870sm5278816pgh.88.2022.10.09.19.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 19:33:34 -0700 (PDT)
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
Subject: [PATCH linux-next][RFC] powerpc: fix HOTPLUG error in rcutorture
Date: Mon, 10 Oct 2022 10:33:15 +0800
Message-Id: <20221010023315.98396-1-zhouzhouyi@gmail.com>
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

I think we should avoid torture offline the cpu who do tick timer
when nohz full is running.

Tested on PPC VM of Open Source Lab of Oregon State University.
The test results show that after the fix, the success rate of
rcutorture is improved.
After:
Successes: 40 Failures: 9
Before:
Successes: 38 Failures: 11

I examined the console.log and Make.out files one by one, no new
compile error or test error is introduced by above fix.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear PPC developers

I found this bug when trying to do rcutorture tests in ppc VM of
Open Source Lab of Oregon State University:

ubuntu@ubuntu:~/linux-next/tools/testing/selftests/rcutorture/res/2022.09.30-01.06.22-torture$ find . -name "console.log.diags"|xargs grep HOTPLUG
./results-scftorture/NOPREEMPT/console.log.diags:WARNING: HOTPLUG FAILURES NOPREEMPT
./results-rcutorture/TASKS03/console.log.diags:WARNING: HOTPLUG FAILURES TASKS03
./results-rcutorture/TREE04/console.log.diags:WARNING: HOTPLUG FAILURES TREE04
./results-scftorture-kasan/NOPREEMPT/console.log.diags:WARNING: HOTPLUG FAILURES NOPREEMPT
./results-rcutorture-kasan/TASKS03/console.log.diags:WARNING: HOTPLUG FAILURES TASKS03
./results-rcutorture-kasan/TREE04/console.log.diags:WARNING: HOTPLUG FAILURES TREE04

I tried to fix this bug.

Thanks for your patience and guidance ;-)

Thanks 
Zhouyi
--
 arch/powerpc/kernel/sysfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index ef9a61718940..be9c0e45337e 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -4,6 +4,7 @@
 #include <linux/smp.h>
 #include <linux/percpu.h>
 #include <linux/init.h>
+#include <linux/tick.h>
 #include <linux/sched.h>
 #include <linux/export.h>
 #include <linux/nodemask.h>
@@ -21,6 +22,7 @@
 #include <asm/firmware.h>
 #include <asm/idle.h>
 #include <asm/svm.h>
+#include "../../../kernel/time/tick-internal.h"
 
 #include "cacheinfo.h"
 #include "setup.h"
@@ -1151,7 +1153,11 @@ static int __init topology_init(void)
 		 * CPU.  For instance, the boot cpu might never be valid
 		 * for hotplugging.
 		 */
-		if (smp_ops && smp_ops->cpu_offline_self)
+		if (smp_ops && smp_ops->cpu_offline_self
+#ifdef CONFIG_NO_HZ_FULL
+		    && !(tick_nohz_full_running && tick_do_timer_cpu == cpu)
+#endif
+		    )
 			c->hotpluggable = 1;
 #endif
 
-- 
2.25.1

