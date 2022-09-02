Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2FF5AAAB4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJsFZ6Ktwz304v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:55:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I1TYmIxO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I1TYmIxO;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsC509QKz2ypH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:53:36 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id mj6so1414247pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=37xFloYRg43Kgcetc6tZnoJElfB3bN5M6Nv7Dh9Hfok=;
        b=I1TYmIxO00Yt0MOoMzj08NBkVU5t0llj6lLyUyEcPIv0Syc2wonJjaSy6Rjztvt26E
         wg/v6XIeucTrOU9855MoNk4PnvbFbvyEjkhoCT7G73+vpqed9x4FzQJ4PS0Lz7JRQE2n
         N00SzZEYMAwrXxIOwu07DjSCJoEF5U08Lr38vwV6/QqX/FCfpluAQQEg6elVJwnlBPbK
         ZcvaMQeaz4QnsbJ6hyl/7yfEv0x7BDf/P4aZHGskJpO6xYAE2HtzmIt+w5uIxxAOAc/R
         CyCKXGfDvvBiXKxwebsQ+hSibVkI298fkk/qBX706TsK+b8OTUswoXd55OtZ2XoLG964
         7bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=37xFloYRg43Kgcetc6tZnoJElfB3bN5M6Nv7Dh9Hfok=;
        b=qgtqaKUD4mDQMWFIojXtQpR0AzilhGoT9UqnGzL6fetaX5FTYLTO8LwTHwAWFYogyS
         0UCGdsCMAkOBarK9awAAO4mhYuh5Jl5LibSpuNtgNfEd6qHxc+iDwyz+KJ1owehF0LCo
         0E/ZWyh34+4SwsbkvOys/oQKXdu0FzLryjoWqWCZY0rJ1ZJp11y4V4Sk6+RVfQY9D5/O
         SjR8N7WY5jstcl3GFJq6NSWGlYUlY0WiWAQNd77S27XQobZ1CvpmiKCguNLAudvR+Vwm
         i7bDTXPzyxnSF3lzsN+9uQY08IECaYyele+DV8Wqy7aP5OrM4TYtf5ge9cFJO8HflIXM
         MP7g==
X-Gm-Message-State: ACgBeo2RA/M67NmqAaSyCbLL8PnPg+eWbSTzgUxAi5NeqbuSP9uKHQQK
	jqMmHti4KpW9Y2tE0Z3/LMszrsC3lv8=
X-Google-Smtp-Source: AA6agR63av5hSaBQWsUdEAEsxiMYCDgHUiOCCUzvNiP/cO/TfhpU7udvIa+7nGqBaO6dRkKtrEdngQ==
X-Received: by 2002:a17:90a:cf8e:b0:1fd:af31:8d0 with SMTP id i14-20020a17090acf8e00b001fdaf3108d0mr3650640pju.16.1662108814203;
        Fri, 02 Sep 2022 01:53:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001750b31faabsm1039130plg.262.2022.09.02.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:53:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/64: Remove PPC64 special case for cputime accounting default
Date: Fri,  2 Sep 2022 18:53:15 +1000
Message-Id: <20220902085316.2071519-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902085316.2071519-1-npiggin@gmail.com>
References: <20220902085316.2071519-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Distro kernels tend to be moving to VIRT_CPU_ACCOUNTING_GEN, and there
is not much reason why PPC64 should be special here. Remove the special
case and make the ppc64 and pseries defconfigs use GEN accounting
(others will use TICK, as-per Kconfig defaults).

VIRT_CPU_ACCOUNTING_NATIVE does provide scaled vtime and stolen time
apportioned between system and user time, and vtime accounting is not
unconditionally enabled, and possibly other things. But it would be
better at this point to extend GEN to cover important missing features
rather than directing users back to a less used option.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/ppc64_defconfig   | 2 ++
 arch/powerpc/configs/pseries_defconfig | 2 ++
 init/Kconfig                           | 3 +--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index c8b0e80d613b..6be0c43397b4 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -1,7 +1,9 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
+# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 CONFIG_IKCONFIG=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index b571d084c148..4723ede5e10d 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -3,8 +3,10 @@ CONFIG_NR_CPUS=2048
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
+# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
diff --git a/init/Kconfig b/init/Kconfig
index 532362fcfe31..94ce5a46a802 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -461,8 +461,7 @@ config VIRT_CPU_ACCOUNTING
 
 choice
 	prompt "Cputime accounting"
-	default TICK_CPU_ACCOUNTING if !PPC64
-	default VIRT_CPU_ACCOUNTING_NATIVE if PPC64
+	default TICK_CPU_ACCOUNTING
 
 # Kind of a stub config for the pure tick based cputime accounting
 config TICK_CPU_ACCOUNTING
-- 
2.37.2

