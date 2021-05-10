Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE73779B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdjsS0H0rz3c1Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:20:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DmezKq78;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DmezKq78; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdjqx5xh5z2yjJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 11:18:53 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id md17so8806521pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 18:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGhjnXn/C0qTfkhl0tEeiHCLhVCbdYoTtED7Ch6E9ZU=;
 b=DmezKq788wp7yFFnXKq/q3twGi//MZ4tPWmHLGek4++1nAF55OwGP9UauCkkIrP6dD
 EI1mArYZck2kGcOk1fENb5qpUMphZcwUz6Kg+GRsbsfKNghaZ7MWmTSAFlhn0FL6gcYU
 JBH2MYN/fVDAIfcVtDSJC6uGQOIhD8fXnbBku5cxM8NHjznaNnR3AWxfc5pBTDzT9SMF
 +0joMHFCRF9TYXHjwNVHSp1zOVUoL4sx6fVfKwUgVPqhyb9ca90X46rg56rDKQze9yfw
 ipX17sEa434qOD2D73wM99Jh9uu/QrPMsKqNNXMqFIg3A99f4lTvG7z+HCA0lkkJ9FC4
 e4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGhjnXn/C0qTfkhl0tEeiHCLhVCbdYoTtED7Ch6E9ZU=;
 b=Yb/oEMyjOyEyFjN4bEfGbfU/Ygkue6NdOiyoIT+twC6gIqSu7nlPj3UR8hnj4M7fEo
 FxLsvDLYfMzs4dWbPEk2n/Cj9gth3czcDm9yFBl4PMzdUk7mk8zGLXhbjHsBER3OkQlP
 UVg6j2mIc0Jq+x2pwtwU9l1HvFyXNs5Vsf7RzC4DpbqnrZOF/uvloj5ATSYG4J7rQZYB
 WW0odnGnAXLiKQIUwnTb6Aaid54QBK0OQDDagwudBfanFxNzvoLnhXhp7wasHcrhAIvK
 /8Ajt5aBBoqP5HSni1sPaGoZfg8rjLyNlCcdxuWh1/the5O4+POtf9vY5fGMetZlHJXG
 D5Qg==
X-Gm-Message-State: AOAM533FKhKKpY8SZsFvYZAqR4lacQ8zJZBgLFmRiMDjDWmtdBXcfQA7
 ke3qpKDGOAqV61O32vFukDG6N26ross=
X-Google-Smtp-Source: ABdhPJz/QFsVLt4dqN50LXP14Lru1rZSBlL3FvBYJwsiut4l0hpvQbXcWxFXgQNffFVbOC70D5m+/Q==
X-Received: by 2002:a17:90a:1a43:: with SMTP id
 3mr5414307pjl.154.1620609530718; 
 Sun, 09 May 2021 18:18:50 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id n129sm9887649pfn.54.2021.05.09.18.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 18:18:50 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v13 2/8] powerpc/lib/code-patching: Set up Strict RWX patching
 earlier
Date: Mon, 10 May 2021 11:18:22 +1000
Message-Id: <20210510011828.4006623-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510011828.4006623-1-jniethe5@gmail.com>
References: <20210510011828.4006623-1-jniethe5@gmail.com>
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

