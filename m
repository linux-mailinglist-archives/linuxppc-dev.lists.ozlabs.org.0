Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567426D77B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 11:19:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsWcL2J6ZzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 19:18:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aOlQ8sCO; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsWZd1FkczDqVp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 19:17:27 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id s14so2582285pju.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 02:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TZu2KgS0OhsBlB9VoqGjWOR7H8Etih43DtddCBmChm4=;
 b=aOlQ8sCOBpmmZkhqrpa/swGeQ9AmIBZvGgsejRgEb+5h6JZrNG5cmN3jzrPb2PX1IV
 SOqJlljgNJKZuKFTxiHAtkfxsKXaluZgv3xSGzyOww3uDL/bsybMLuZNiaJkVfDRr9kx
 XVriewZRgDZc+gC/D6YuMORC82y0JyGYZqKafvJgX8EfUPTGqB1HICjhZWeJvylLFVGM
 cuQUnaHfM+H3W33nK3lXgs0KQDb2KPSHDhlUI1An5X5nF1rqvqT2bW7X7zerrqTafLUb
 O0YLSEa4fSjXQFL9+mWHSbRZhUhAD+9Ig8+Annb7qscO/L4pPAbiCvSTc2M49gwfQ/r1
 iBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TZu2KgS0OhsBlB9VoqGjWOR7H8Etih43DtddCBmChm4=;
 b=ragJV9G3XYzzlnGerEKfYIDTjut5/MNpcFmI4+ZKtoIgDVhEuvkLJK/bHnhKe6elM0
 YLjBJ51/hBdST8tyGdiFdrrpU1QevjkmLLkvi7LfqscbLEKB/Iyu9C5FyAZTIgORTPG4
 5MgZQNrK3pCsQHlklQ0Zz9irruJicERWP5vm2dY1dttHoXf34nJUiY8/J5fryXTLHIJG
 RweiJCEsvaBxeB/4/glc/4vZvtcqVo4icge6HHJ0O/CFOmS70ptC7Ml/frvdFOIicH7i
 fQUKMGntvaXR8AZSxNaN8JTgujzZHeW41sOE0bTJUNIHVR7kdIxvi4jPQxNOuZqPdqRX
 Dvsw==
X-Gm-Message-State: AOAM530+MJDy1reCYIBC42pF2DfDa1Nycun7NUedZwqFtOxaifjMHZvu
 +4bsWnRrtxJSn7npuG1X9ZzIBV7uN0M=
X-Google-Smtp-Source: ABdhPJx2snLj2daD3r3aYhWwkdUmerl7331yM1IrMPwdG4FX4HVRFWzK4TcSIxssq2/rLrZ2IsDx+A==
X-Received: by 2002:a17:90b:e90:: with SMTP id
 fv16mr7543945pjb.69.1600334244366; 
 Thu, 17 Sep 2020 02:17:24 -0700 (PDT)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id y195sm19916643pfc.137.2020.09.17.02.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 02:17:23 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
Date: Thu, 17 Sep 2020 19:17:15 +1000
Message-Id: <20200917091716.4631-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: oohall@gmail.com, npiggin@gmail.com, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
is called before a stack has been set up in r1. This was previously fine
as the cpu_restore() functions were implemented in assembly and did not
use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
device tree binding for discovering CPU features") used
__restore_cpu_cpufeatures() as the cpu_restore() function for a
device-tree features based cputable entry. This is a C function and
hence uses a stack in r1.

generic_secondary_smp_init() is entered on the secondary cpus via the
primary cpu using the OPAL call opal_start_cpu(). In OPAL, each hardware
thread has its own stack. The OPAL call is ran in the primary's hardware
thread. During the call, a job is scheduled on a secondary cpu that will
start executing at the address of generic_secondary_smp_init().  Hence
the value that will be left in r1 when the secondary cpu enters the
kernel is part of that secondary cpu's individual OPAL stack. This means
that __restore_cpu_cpufeatures() will write to that OPAL stack. This is
not horribly bad as each hardware thread has its own stack and the call
that enters the kernel from OPAL never returns, but it is still wrong
and should be corrected.

Create the temp kernel stack before calling cpu_restore().

Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Add more detail to the commit message
---
 arch/powerpc/kernel/head_64.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 0e05a9a47a4b..4b7f4c6c2600 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -420,6 +420,10 @@ generic_secondary_common_init:
 	/* From now on, r24 is expected to be logical cpuid */
 	mr	r24,r5
 
+	/* Create a temp kernel stack for use before relocation is on.	*/
+	ld	r1,PACAEMERGSP(r13)
+	subi	r1,r1,STACK_FRAME_OVERHEAD
+
 	/* See if we need to call a cpu state restore handler */
 	LOAD_REG_ADDR(r23, cur_cpu_spec)
 	ld	r23,0(r23)
@@ -448,10 +452,6 @@ generic_secondary_common_init:
 	sync				/* order paca.run and cur_cpu_spec */
 	isync				/* In case code patching happened */
 
-	/* Create a temp kernel stack for use before relocation is on.	*/
-	ld	r1,PACAEMERGSP(r13)
-	subi	r1,r1,STACK_FRAME_OVERHEAD
-
 	b	__secondary_start
 #endif /* SMP */
 
-- 
2.17.1

