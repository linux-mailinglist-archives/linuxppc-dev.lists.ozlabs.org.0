Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C93033CBEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzz6H42dBz30gW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:19:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=D6PXcaqu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D6PXcaqu; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzz5Q4WBjz2yhq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:18:34 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso576097pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmdzNu0EEZ/2UBS1TwxzuVfctzsk8OvLrPvT5wa64/s=;
 b=D6PXcaquEIYcoAVoxNgHokaoRBSjnyR7CSdtp+lg9fASyh0vpTH9tnLvrOqVt7qupQ
 yA5lEOo6HbJbqwnMFIN8Eoeiz7oTgect/DLZO10g5RQS/6riIiMotZ8F7M6wnmd8a9aR
 GQwmfZUMZXK4l5UyholGkq42+BWYUmaQlTG5eoPmADZXh4WQwr/KXUO3XLphlj1/wjCB
 5iW69l/7Q75NshjFj3C0wNcYNJN6Sjr+wLZTefCM7ONoEn6kT29GipB7C82I34gya2Fc
 1KolxYf3bcPJR8vShBCtIKaI9isoNOm6W/jJ2Fa27jps7QU+Ya040ktjIvONCIwuPFkM
 hXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wmdzNu0EEZ/2UBS1TwxzuVfctzsk8OvLrPvT5wa64/s=;
 b=i5q99KQjN5ENy1tGqOZnuWtEHH9fIR60/2yNPFFEnJVrOK1OoJo5790PnmnCbV2zxI
 EZZxfKKJ7OrG/JKdDyuKTt7PeK9wTbHaxRxRQpQWHYv/BTvwMlsKiw+YhaOJmF5eneKq
 CA28P3DhMhyVresXeLo9V8rpuE7mGFAEmUf4zS4Su6pmACpkB6uPU0jRrQD2S6QQqCYV
 j42P4s5oVEcH/gRW7uR30jirD2u7T6N1k5/rLDLlaSlOruBh/p++jyap+2LzdgpcKTmb
 OJm/E9OhNaPnNBLS31WQIVhrW9rhLD2EYr8+QXfPAbAldO3uZK0/BLn1FIVmL76sLafI
 xcqQ==
X-Gm-Message-State: AOAM531o0rY5Ze5OZlpzZ57oU3h/FtZgUB+I8apoBSE5N3epLQN0VtSE
 jVj/q384rroUOIMaTNXjVifWe7E7c9S9QQ==
X-Google-Smtp-Source: ABdhPJxou//XLuI64i36JBqOj12kGJU91AVjUECDAZDD3RrH1FZl1FryMi4ttQ1kTFqPTaT1Pb4rKA==
X-Received: by 2002:a17:902:d64a:b029:e6:30a6:64e3 with SMTP id
 y10-20020a170902d64ab02900e630a664e3mr14753234plh.28.1615864711584; 
 Mon, 15 Mar 2021 20:18:31 -0700 (PDT)
Received: from localhost.localdomain
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id o13sm15098809pgv.40.2021.03.15.20.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:18:31 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 2/8] powerpc/lib/code-patching: Set up Strict RWX patching
 earlier
Date: Tue, 16 Mar 2021 14:17:35 +1100
Message-Id: <20210316031741.1004850-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316031741.1004850-1-jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, npiggin@gmail.com,
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

