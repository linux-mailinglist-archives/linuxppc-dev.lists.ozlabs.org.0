Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191034E057
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cWz2CJVz3bxn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:53:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lo/wuyVo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lo/wuyVo; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cVj4psvz303N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:51:57 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id h25so10857607pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofVIJLuDNpCDAQXYxuZe7VRwD8SPsh7blA9F7hhXWhM=;
 b=lo/wuyVoDWPpOLa2cvlHjSUq4VeLUrDrpb/Ce+dRbjkMFHDnsm6+zMc5xEU4G1WrLP
 gu4uOIkZ6Jtby/fItME792qHU3tDupLgzRWRLNajfssjTSUXjzRy6KYmDbw5vwn0HYtK
 Tc9VIn62BiM2TEIBco89EMY8N/SaX3xRYtmCAaMaoHgGjqrAjwFZZehpkv3Ca9lJx6yD
 6yXsaXVPPM1V7bOwSjZX+CuVpxEzeEwgLURumww8V5QxJquL1ov5xt0NYsKHrP0DWiVz
 vCp47oxCsEhwFaizlSels+Cz/y4uybhILHe9JIx1kClpqrD8NYtQR1VcwXH647RMxl+B
 8LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofVIJLuDNpCDAQXYxuZe7VRwD8SPsh7blA9F7hhXWhM=;
 b=UtiEcVYB7vHWU2bha/9j+8/LkCpT6RQ7ZGAGCZCsLDLpox6dKBJ1ix0hlGtZYxWlX5
 UG3yqylL38fWjr3jiHIp7NJx+IWj4u1A0sOjTzU/Lx0Z1g2Sow8jwF20873MyNn1JjG0
 470v1QhtsTFB7BBXZxyS8+OPIytGpDGZK83ut/DqNM9nPRh3rZo4t1wjAKaljKGrmazb
 gXP1kBYZ88M0T306XlIAo1l5y2gOjtlVhK7+P3kOlWcHqrCeF8ozo/VVr/VkD9wDX33v
 Q2edut6pNGXmECjaO0e4ENwjJaKedotgF2mG9aoAa0oY+leJ3mvQEmG+10HayLJ/HgCu
 zojw==
X-Gm-Message-State: AOAM530/gCIerrYbV2bbL5GebCgM3ig+Qf/hDs7gdUkZfpWNKbHLixBq
 ctYJhmUn3MEM47K09kqDF2vTVC0y4cXdFQ==
X-Google-Smtp-Source: ABdhPJw8ZyrRiSEoHpBrbW7in1rgNy2MTC1ofXZxC1OENGYbQDsXa0tWW4EMTcqQeo1gRcRfgH6uvQ==
X-Received: by 2002:a05:6a00:2345:b029:20b:c007:f9a4 with SMTP id
 j5-20020a056a002345b029020bc007f9a4mr28188818pfj.42.1617079914960; 
 Mon, 29 Mar 2021 21:51:54 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:51:54 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 02/10] powerpc/lib/code-patching: Set up Strict RWX
 patching earlier
Date: Tue, 30 Mar 2021 15:51:24 +1100
Message-Id: <20210330045132.722243-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
 Jordan Niethe <jniethe5@gmail.com>, naveen.n.rao@linux.ibm.com, dja@axtens.net
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

Reviewed-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v9: New to series
---
 arch/powerpc/lib/code-patching.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 2333625b5e31..b28afa1133db 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -65,14 +65,11 @@ static int text_area_cpu_down(unsigned int cpu)
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
@@ -80,7 +77,6 @@ static int __init setup_text_poke_area(void)
 
 	return 0;
 }
-late_initcall(setup_text_poke_area);
 
 /*
  * This can be called for kernel text or a module.
-- 
2.25.1

