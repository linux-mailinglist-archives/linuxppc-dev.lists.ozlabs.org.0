Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E100E36E393
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:17:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW10G6Zp3z3bsL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:17:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uUOMUb1t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uUOMUb1t; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0yy2qbvz2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:16:42 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso4192473pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=firInY1utLEOJgk3tnG7I7HN8k3/o1DnCo9RF5GGjnk=;
 b=uUOMUb1tRlxgQRQ0m+g3qfZZnO3xddPId8U+AWc4PH7Gv9JhZlBgTY0iZTFHWni4qr
 L8pYBN2shqI8WlJfh7InhnHAMZS0583Tcb6LXLR9zAYjW5PiaJaxZ8BePLBVyABkMrUF
 vpdiiQ2ZTZRwS4G/AdOPr3y6xafynL8H5oycBNtPzSbRWDV/csZUXRydKmvmryq/DU3i
 3Qn2QLpujEHYzXFPTBwb+AcHq34sRuJstQoN6wV0XeAdqplvNySFKYKD29vNTM0fnATj
 g5TfgkP6+pYqUIQd9+eHv6T0xQ53pi3B84wo7oVjVzzoVREcDaFTz1ZX3Q0hyEIDoVPR
 wVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=firInY1utLEOJgk3tnG7I7HN8k3/o1DnCo9RF5GGjnk=;
 b=GHfOGiU975SW9vvPYqsVXlvGueXN7U81Mh9dbeyqYiuRnDh6BsJWFv1zkDjI604tGp
 2sy3MkWjZPED2stsKkvC51GxDkm0OFtYb29cFUZqwX43Bn8Pgf/fTm1RjL4vkE82Obz2
 uUuEBG6jXtk6O2PEfgWkwyOOZSWIY56Ng/zNxAjaTx18tm5VbYGvyQKdDk5JIH57YA/c
 15069x4aM17Iyh9ra2awdCw5sCzXLAvJqHjJRWa93/x0eogrR6Gory5rXY7qbMoR+Ek6
 4aNr6KKGo1VsalHdfN+q42suVknGI4OXiiem50S9/ujkeh+3FQKpZVgS3O0LdACShKmw
 uYog==
X-Gm-Message-State: AOAM533wrXJ0vpyxGVL7dO49iHdGUXcfsb8kJWTtpznb7q4xL7FzNVOo
 DXhqMrK9OwNhutqBuO88aknn7ozitpk=
X-Google-Smtp-Source: ABdhPJyeoPjMO5dW27hNz4OzxK3TMQ9Q3yW4FCNPvwSEc5YrSe79adGaCjDNphmUeTxg78hsnYCACg==
X-Received: by 2002:a17:90a:850c:: with SMTP id
 l12mr7112049pjn.224.1619666199897; 
 Wed, 28 Apr 2021 20:16:39 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:16:39 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 2/9] powerpc/lib/code-patching: Set up Strict RWX patching
 earlier
Date: Thu, 29 Apr 2021 13:15:55 +1000
Message-Id: <20210429031602.2606654-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429031602.2606654-1-jniethe5@gmail.com>
References: <20210429031602.2606654-1-jniethe5@gmail.com>
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

