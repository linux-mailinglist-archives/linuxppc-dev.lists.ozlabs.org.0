Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DB97131BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:46:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl4t6dZ2z3fK5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:46:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gGebBDgS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gGebBDgS;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0K4n5Cz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:25 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64d2a613ec4so1177666b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151743; x=1687743743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYlDoP4hBUi1FEPJVk5SoicXju51KfuvgdrLi507k6g=;
        b=gGebBDgShZ+uN8dr+HtKBh/CQRIJdRl3JqouzIec7Inm884gWhnWsPBrktTgLBZqXK
         0Vn2L9wyjn0IxKnQRYUzz2PDRwxJ3dxbO49ReX7U7tQFaXawnlPxAsmZ8tisnLvHt2wy
         vVnzj/jVyWUESXQN92jj0oJ3Exaj1AaFGtAnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151743; x=1687743743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYlDoP4hBUi1FEPJVk5SoicXju51KfuvgdrLi507k6g=;
        b=gD5N1REbr9mG95LX8kYkekx8uW3IQpcQ5CCdDhUO4OIGwjUGwYozdlU2ksaLeqX2pd
         ZoEIMF2jfpOPsYlHTn83Q4t43tp0utVQzb4Q4PFlfT9VaibXwB54T9TFtz7Ff/07PI8E
         KF0xhuBUip1ND5wQYiLtfzGBcyTZQBnPJ4v1A0+9DY17hcDdE1bRuMm9YL1wF56MMpZJ
         zDAhWOA/iI0L5YR0OmNcniVNgbXxenVE6pUMS0f9DKf79SSgxJcOhp+plgPBC5gt/Vqj
         IqqSgYEPF03R7TYD+x+54JE7ERxCkegxo+MHdicOomYcXELQO4Fh/mqxefG94vVXDk2t
         QGFQ==
X-Gm-Message-State: AC+VfDzmduicfTMbD8i0Wz4QkHWyJqijWXmZOZ3zq3dGnNxM6oFkg9gu
	yb8GktzajZAz50asnl7Zvk4Vxg==
X-Google-Smtp-Source: ACHHUZ6PdCEKx9zc9UIjD6M27djXcRY5u4ncxaUOpt/n6iXeRwmVg57h5L9TsPisjROyLLUKXE2Imw==
X-Received: by 2002:a05:6a21:9985:b0:101:2ad0:1347 with SMTP id ve5-20020a056a21998500b001012ad01347mr1527991pzb.23.1685151743331;
        Fri, 26 May 2023 18:42:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/10] watchdog/hardlockup: In watchdog_hardlockup_check() use cpumask_copy()
Date: Fri, 26 May 2023 18:41:34 -0700
Message-ID: <20230526184139.4.Iccee2d1ea19114dafb6553a854ea4d8ab2a3f25b@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the patch ("watchdog/hardlockup: add a "cpu" param to
watchdog_hardlockup_check()") we started using a cpumask to keep track
of which CPUs to backtrace. When setting up this cpumask, it's better
to use cpumask_copy() than to just copy the structure directly. Fix this.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 32dac8028753..85f4839b6faf 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -154,7 +154,9 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 	 */
 	if (is_hardlockup(cpu)) {
 		unsigned int this_cpu = smp_processor_id();
-		struct cpumask backtrace_mask = *cpu_online_mask;
+		struct cpumask backtrace_mask;
+
+		cpumask_copy(&backtrace_mask, cpu_online_mask);
 
 		/* Only print hardlockups once. */
 		if (per_cpu(watchdog_hardlockup_warned, cpu))
-- 
2.41.0.rc0.172.g3f132b7071-goog

