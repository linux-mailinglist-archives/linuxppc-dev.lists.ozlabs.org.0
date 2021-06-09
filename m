Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 808703A097C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08p16xPTz3c7m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:36:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=upZfGEhE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=upZfGEhE; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08mX51L1z308T
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:34:52 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id e1so267223plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGhjnXn/C0qTfkhl0tEeiHCLhVCbdYoTtED7Ch6E9ZU=;
 b=upZfGEhENNUSkQU8KxyFkJHh5ki32PXkyUvAbPL4TAFEZv07gFUI46lme0vfq4SaDJ
 CGpNdEaKOr/f6BJWOn1Rw6Jar6qOO0LqZCzLknsjn2omCxuY9pM5iC2Ea99UQ/wQfXhX
 z4bCK+HxNr9RhUxOoucN1r16ENINpTP0XnlxG2tbJpJvWCgTLIf/CyFRNx/BDBhv8crq
 zp0Ff4pjcFxfWEftiDA+TLpZg2xisirY9aBmSYxqLYQx2E4EPQZtTBUIQLN8kLbFbPSU
 4jQXes7hKWlLKOpCXI8aqTwcizq+v8FS3HCqYPulAkWE6FP83mh1QcsU0HorVhd7mOMU
 l6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGhjnXn/C0qTfkhl0tEeiHCLhVCbdYoTtED7Ch6E9ZU=;
 b=G9QrtXwnv2BecgJHBwvDt2e5X9D7CZExJ5vn0goJgN6ZwNBlV8md/iUH0AnrxfDW1Q
 Ft0lc/uu9ivkwp2tjKTU8qqEIjDEJBcu4Nv6SEG+2GMAEz4HtYTUqlzxDWxnnxYDlwm8
 dOhkUJuvpRpRsAlnn9b9wBnJ9XBuhuwalZ95CRv6WlgbYtAWdVWCRoI8MRoIs3bzBCTW
 p7BHxgG567M2rGxnAMh+48Bw84S7116P8hLGvK51pdewZhYkfQkv/1CrC6hF2AF6J5CQ
 twQ9U44XpmvTlEA5pNobwwml1oUtpY6z0lmO27ls7BkXDlynddzuK1+DGzhIk1hVLrJK
 0mYw==
X-Gm-Message-State: AOAM5337rpr5x4e//CpWBhgabusV/xo4Daj9ctroQeEcVW6txT0FfBRJ
 MqTOS5/D5uq75vvhhC9By9IzNVvr/VI=
X-Google-Smtp-Source: ABdhPJxIde1fACAJHl5VOo7l9VID6ioWaqKfsJens5Ur0+lbFMnEqP7mWTW2wOcpG6uovtT1p2lykA==
X-Received: by 2002:a17:902:d284:b029:106:64e4:6bed with SMTP id
 t4-20020a170902d284b029010664e46bedmr2629155plc.73.1623202489153; 
 Tue, 08 Jun 2021 18:34:49 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:34:48 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 2/9] powerpc/lib/code-patching: Set up Strict RWX patching
 earlier
Date: Wed,  9 Jun 2021 11:34:24 +1000
Message-Id: <20210609013431.9805-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609013431.9805-1-jniethe5@gmail.com>
References: <20210609013431.9805-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

setup_text_poke_area() is a late init call so it runs before
mark_rodata_ro() and after the init calls. This lets all the init code
patching simply write to their locations. In the future, kprobes is
going to allocate its instruction pages RO which means they will need
setup_text__poke_area() to have been already called for their code
patching. However, init_kprobes() (which allocates and patches some
instruction pages) is an early init call so it happens before
setup_text__poke_area().

start_kernel() calls poking_init() before any of the init calls. On
powerpc, poking_init() is currently a nop. setup_text_poke_area() relies
on kernel virtual memory, cpu hotplug and per_cpu_areas being setup.
setup_per_cpu_areas(), boot_cpu_hotplug_init() and mm_init() are called
before poking_init().

Turn setup_text_poke_area() into poking_init().

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v9: New to series
---
 arch/powerpc/lib/code-patching.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 870b30d9be2f..15296207e1ba 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -70,14 +70,11 @@ static int text_area_cpu_down(unsigned int cpu)
 }
 
 /*
- * Run as a late init call. This allows all the boot time patching to be done
- * simply by patching the code, and then we're called here prior to
- * mark_rodata_ro(), which happens after all init calls are run. Although
- * BUG_ON() is rude, in this case it should only happen if ENOMEM, and we judge
- * it as being preferable to a kernel that will crash later when someone tries
- * to use patch_instruction().
+ * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
+ * we judge it as being preferable to a kernel that will crash later when
+ * someone tries to use patch_instruction().
  */
-static int __init setup_text_poke_area(void)
+int __init poking_init(void)
 {
 	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
@@ -85,7 +82,6 @@ static int __init setup_text_poke_area(void)
 
 	return 0;
 }
-late_initcall(setup_text_poke_area);
 
 /*
  * This can be called for kernel text or a module.
-- 
2.25.1

