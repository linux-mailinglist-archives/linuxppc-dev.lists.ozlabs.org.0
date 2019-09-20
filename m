Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CEB9CF7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 09:40:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46b2YW3P3VzDqCK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 17:40:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=ilie.halip@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pj8jIhS3"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZdGw6qMdzF3K2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 01:41:04 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id 5so3027228wmg.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=G9rxy00ZIE0J9oTLHWg18q2mcebTff8MKdbRpMtgQiE=;
 b=pj8jIhS3MfHDWFaGUFRN0DWdCEPx48aiDB3T/KuVJk5bF+IcXQEO/QYOz+DHCfj5wU
 nZnXcBdqoATCpnSRKTiuAJNg247vXe9s4w4rwRUPdO3pYXp0MpwUePpLFlRpcGwzPuHg
 GMYTRrq4+ukC+Fn/jik5sdMRQJ1C8Iuyn0fQUGniCUt0pRFH8Fvub/l60Uhfcy9DigqX
 lUAayDhrDwN+/stHfcbu5mh8CikB0K+XlDa58+NXltWpcR6jW0WksiTn/6ZMYe8ewWQ8
 jTD29XgSPIZj2bxYPJ4rdEFpG43y6bMAGMINN6ZnoP0XNpbFw3Qj9Qr9gE7MweNpBFem
 TUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=G9rxy00ZIE0J9oTLHWg18q2mcebTff8MKdbRpMtgQiE=;
 b=I2Ar3xU5vKs1CpTrbIL4Jems01tzR+FfRJcxQmkKRnWQSCXQ00jh6/NkiUyKddCfEj
 6V28qjaPLt/AfB6ZuAMC2oIVgcCEmHhuJujJktuEgaCc758UyLXve4AJ+IO/hqjxK5Ma
 3gxnO6C7cg7xuJlDL8RWzoXl8ExtBtERMuib7IG3pDIREXntV8ywwTk0z7964Cyurbva
 O7+U55kzBvZXOvzuTQKG3SosI5yeL/sQI94Dhhkgzh/om3lnweMkzNnANUrWjFxFck4L
 CI0aoThOVhS7zIaK+W9QAochcc7/TicD7h54CAHgbR8ksCkAxk/yaqw/7yk4eJjpm/1m
 0aNg==
X-Gm-Message-State: APjAAAWcOxpWub/QR+LSo8yK081CBvoT1v7yWRKaulQilbzp4CypxO8J
 el97ENv/3CHqa1W2fj+VtD8=
X-Google-Smtp-Source: APXvYqyB2XK1sqdhE1BqdnoRFRwpnohUADqLVaHceuij08hty0iZggkbHEgIzc81lHxQ+Tgpkw9YJQ==
X-Received: by 2002:a1c:60c1:: with SMTP id u184mr3871598wmb.32.1568994059713; 
 Fri, 20 Sep 2019 08:40:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a58:8166:7500:adc0:6801:a7c2:8ba2])
 by smtp.gmail.com with ESMTPSA id x129sm3249186wmg.8.2019.09.20.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 08:40:58 -0700 (PDT)
From: Ilie Halip <ilie.halip@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/pmac/smp: avoid unused-variable warnings
Date: Fri, 20 Sep 2019 18:39:51 +0300
Message-Id: <20190920153951.25762-1-ilie.halip@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 21 Sep 2019 17:35:53 +1000
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
Cc: Ilie Halip <ilie.halip@gmail.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building with ppc64_defconfig, the compiler reports
that these 2 variables are not used:
    warning: unused variable 'core99_l2_cache' [-Wunused-variable]
    warning: unused variable 'core99_l3_cache' [-Wunused-variable]

They are only used when CONFIG_PPC64 is not defined. Move
them into a section which does the same macro check.

Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
---
 arch/powerpc/platforms/powermac/smp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index f95fbdee6efe..e44c606f119e 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -648,6 +648,10 @@ static void smp_core99_pfunc_tb_freeze(int freeze)
 
 static unsigned int core99_tb_gpio;	/* Timebase freeze GPIO */
 
+/* L2 and L3 cache settings to pass from CPU0 to CPU1 on G4 cpus */
+volatile static long int core99_l2_cache;
+volatile static long int core99_l3_cache;
+
 static void smp_core99_gpio_tb_freeze(int freeze)
 {
 	if (freeze)
@@ -660,10 +664,6 @@ static void smp_core99_gpio_tb_freeze(int freeze)
 
 #endif /* !CONFIG_PPC64 */
 
-/* L2 and L3 cache settings to pass from CPU0 to CPU1 on G4 cpus */
-volatile static long int core99_l2_cache;
-volatile static long int core99_l3_cache;
-
 static void core99_init_caches(int cpu)
 {
 #ifndef CONFIG_PPC64
-- 
2.17.1

