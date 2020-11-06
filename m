Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516B2A8C50
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 02:52:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS3LG75l0zDrBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 12:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dJSDIAQ4; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS3JS408rzDr9K
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 12:51:00 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id z24so2717997pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 17:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bj6mkx33Lq/FHGsQAOAgb5U1Gocj2AWp9p/LUe5BWp8=;
 b=dJSDIAQ4jjGcjcwaGzD4ZlAgYa8IwO3UwpSqFuY5q1tqQ8YRaMwCROu6Z1Fi/kSKWZ
 kh5MDjJCfnikopT+pSVxRZ3lKpXCRX2qct8rM7z28kMJQjReAIjgBQTyT3QqiLZhD/XS
 m3jDBk611UGuEwdMjMTbPRB4DrujBFJp1reelkTeOSqLS0l0aFYuFBAZgRhYWjhVO7/x
 GPD9q6yOyriLPW70UHANSIxeF2KNx7HFXcRrNfGBKZZCX7GjjElp3zk4ZRGW9zr6hiLw
 3EzeuWvXWtCB1szarGWa2rtkTqoXroG2SymZzt4DooAVwIGgH05sm5cR2WLt1WGLmdeI
 hZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bj6mkx33Lq/FHGsQAOAgb5U1Gocj2AWp9p/LUe5BWp8=;
 b=mm/mqk6XPeBQuiSXthYlH5nYj5VbeJ2MEig+0FYcQmkv0ELGL4OS4+72EM8s9882Vf
 yZRE80/4b2IV0tRA0JvtohRINDs5HMmK04a8CU2w4Ps8OG6vGGc+SLKWU+9DBqUAtOlP
 MxhWdLk+vs4X3PYieKsV2aBIavp6jPHpFjrw3LEx2paVmgVIEV7on56+wYpb3HqyitjH
 QHfd2UlG7EVEOzLAWF4HKTgHxDLni/df4S7XCdTlHtcJVEv4lH5wH2j7i38YFKhJNrvb
 MQahml20Q1Onof2PtHxqQudoSF/kflgattBMyFbA8efu+9QCFdaXRK4H6Tv4RpSiFfls
 96ig==
X-Gm-Message-State: AOAM532ALOmj1dIMOcLfVQ+Yk26xYhclvSHgOUAdkjnnBM2zixRoFwud
 iEgwo/Tfgb4EcFBreMnyHiWgbw==
X-Google-Smtp-Source: ABdhPJxFllSk+4bISm4qJozdEm6dyBslXlrnbGUbz/i9CXI3UfQKVNdIX6iL6/tDtNeNJMYIYT7Epg==
X-Received: by 2002:a62:5e06:0:b029:164:a9ca:b07e with SMTP id
 s6-20020a625e060000b0290164a9cab07emr4710392pfb.36.1604627456277; 
 Thu, 05 Nov 2020 17:50:56 -0800 (PST)
Received: from santosiv.in.ibm.com.com ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id v3sm3357050pju.38.2020.11.05.17.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 17:50:55 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: Linux Kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2] kernel/watchdog: Fix watchdog_allowed_mask not used warning
Date: Fri,  6 Nov 2020 07:20:25 +0530
Message-Id: <20201106015025.1281561-1-santosh@fossix.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 Santosh Sivaraj <santosh@fossix.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define watchdog_allowed_mask only when SOFTLOCKUP_DETECTOR is enabled.

Fixes: 7feeb9cd4f5b ("watchdog/sysctl: Clean up sysctl variable name space")
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
v2:
Added Petr's reviewed-by from [1] and add fixes tag as suggested by Christophe.

[1]: https://lkml.org/lkml/2020/8/20/1030

 kernel/watchdog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 5abb5b22ad13..71109065bd8e 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -44,8 +44,6 @@ int __read_mostly soft_watchdog_user_enabled = 1;
 int __read_mostly watchdog_thresh = 10;
 static int __read_mostly nmi_watchdog_available;
 
-static struct cpumask watchdog_allowed_mask __read_mostly;
-
 struct cpumask watchdog_cpumask __read_mostly;
 unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
 
@@ -162,6 +160,8 @@ static void lockup_detector_update_enable(void)
 int __read_mostly sysctl_softlockup_all_cpu_backtrace;
 #endif
 
+static struct cpumask watchdog_allowed_mask __read_mostly;
+
 /* Global variables, exported for sysctl */
 unsigned int __read_mostly softlockup_panic =
 			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE;
-- 
2.26.2

