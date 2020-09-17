Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3926D0F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 04:09:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsL4S0p0QzDqld
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 12:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.196;
 helo=mail-pg1-f196.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PGSi5P14; dkim-atps=neutral
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsL271SygzDqKP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 12:07:10 +1000 (AEST)
Received: by mail-pg1-f196.google.com with SMTP id 34so417217pgo.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 19:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cgKp6sKb4R7ehdu/HkhrBy2fnPPqAf7WsiG39KHJ9c4=;
 b=PGSi5P14MbY6nDRxJYiEWanW2mnZqJ6PyDYDnFcw1mC14MbtBDJ9oTDuARy6QHOz6u
 Py2A8AM9XxnuaQaoxVO/sJXNfqWfLlam9pQ8aDNfmy85TOrkGY/cXhpm0dP8/j42o0Jp
 gKNN2ZHX1uVzBASd2KKI29/W/vbomiVc4Oth7treHOwC8qeVm23XhPZqICaVmSsoRDN6
 JQF9Bqmkth9sVAVxCguKbENt+AyPbud8AvAhfb4/I1pXz9XFOLGDGuoEefeIfLUNSEEO
 qoR8RR1lfIo5VZj44rNElL7EdBueMbIs+w307ZVDfTJM2gV3ynXGidnw6DAQQiEMhtt0
 mCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cgKp6sKb4R7ehdu/HkhrBy2fnPPqAf7WsiG39KHJ9c4=;
 b=hqTFK6BozfB+0DziyoyyBj+LBpCft8v76S42HjSZOiztnGihHwBRWdR/otu8pGRlPN
 4t4vT09DR6p+Jh3B1nrrcKhBUfmJEh3KkpIx2DHcxYKYp01FB2hpZFvtjjO85KIDM/gf
 H6qvpE7r3p/WWTsoZfdEhQd3uRaGXgtGkTT4c53iYVGqyqF05b0iw2+tLFjyadTGWKdy
 N+OAcdsTgB/QsSbpKpZiI+VdYFLEmISoF118Vco2BIWkuCbT87RLqGXnLYH0ZY7Pyu4V
 wqqWcwEJt/2XmtpezB6op91CicPBC6lJ5RNcWAM3UQ+TaQKThtmVUaFObDaQ69WUlprR
 qNyg==
X-Gm-Message-State: AOAM533V6JWdGKc4Qv7Izo9kS5POkGVmnZmfWNzIwzzsOqsKdXe0ToEF
 UsaPXXkMjIJJC5wz0pdhmdi+1YS0qzg=
X-Google-Smtp-Source: ABdhPJxUnuAjOoPvleC8SSqLcTHwp+ORUCT0PMTYji/peukL6H0hEuEMkQM8n+ojY4A8jkimPZwT4w==
X-Received: by 2002:a63:231a:: with SMTP id j26mr1377976pgj.268.1600308368336; 
 Wed, 16 Sep 2020 19:06:08 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c201sm19540354pfb.216.2020.09.16.19.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 19:06:07 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64: Set up a kernel stack for secondaries before
 cpu_restore()
Date: Thu, 17 Sep 2020 12:05:47 +1000
Message-Id: <20200917020548.20386-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
is called before a stack has been set up in r1. This was previously fine
as the cpu_restore() functions were implemented in assembly and did not
use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
device tree binding for discovering CPU features") used
__restore_cpu_cpufeatures() as the cpu_restore() function for a
device-tree features based cputable entry.  This is a nonleaf C function
and hence requires a stack in r1.

Create the temp kernel stack before calling cpu_restore().

Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
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

