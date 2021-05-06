Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E39374DA4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:39:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHqD6ym9z3bvv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:39:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=unkYgstp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=unkYgstp; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHnw64Nlz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:38:44 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id i13so4155581pfu.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=firInY1utLEOJgk3tnG7I7HN8k3/o1DnCo9RF5GGjnk=;
 b=unkYgstpynEB4JRYNCojYSnsRXRIMPi5Q4LpsM1Ntxkz657hPVQ7lEFUp7vhuJrqox
 nAEjkIs/qV0d28xDuzvJi8xjMuOoqYW0n8DfEaw/XDbSEiG462oQBB4uk1xZsC6qPeu4
 qkvpJ60vzB/4oDwHMWTIwvgojQZi8dPRXzZjd+go/N9JhJ+pCTBGVTf00fl7w0zqYZK+
 uhft355dW9c1rBUQYR59batxD8TLs+MRu03oH+DBo/ZWdxBV6laY5A8zM5mRMyIQs5Y6
 7K4M2AUPur46tE+Ufg8Gj+rmU4bhvH9+U3rnibTU8hjFUZzwhww2dFvk9dSQjmzpIaoK
 j7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=firInY1utLEOJgk3tnG7I7HN8k3/o1DnCo9RF5GGjnk=;
 b=qGkoO8XsifxxteNagOZV7SClCgpwCDnQ3s+Q62ItSOVJx4bKAAOLzVxmG+GuEAUDWE
 cciRZfLtjTRCK/N0Ljlu532XQ0zrx99F+lU7S5L2tWwmfYPetflvWz2b+1AlkP5BYx2V
 ozWtxBFzgyzFLHfxf9qSBq+/N5zV5sSIEwMfi0f1sWbON8vTkH/TnZ1xO7dBTtLirzyB
 fmmL0Iu0+EP0H1juiUXQn8/uk7H4GIzcdox0smZ3xrfDtVPjaGAhADtTsQVD/p2jyIGd
 WZOCFBIhEPPPcXU6+3k06mam5xs2nuGziTBl1qG5kVSc8dNV6Lqw45C/QGb2LRJrguDG
 Ya2g==
X-Gm-Message-State: AOAM532ctDnG6UJDfG7Yp5OHf7N9doSQuqyYjML07J4UzheXwjSkDbp3
 PArTGz/RNNHxcam3pg7WyMoBVyUySWo=
X-Google-Smtp-Source: ABdhPJxzsGSJte2dTMFoalOXT4xcsLM0KDcVQLYQANaEUZ+36ymlGhvW4LXwdQ0YGe0w9eOQtU7LtQ==
X-Received: by 2002:a05:6a00:ccc:b029:276:93c:6a1d with SMTP id
 b12-20020a056a000cccb0290276093c6a1dmr2160218pfv.58.1620268722084; 
 Wed, 05 May 2021 19:38:42 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id k12sm454490pgh.16.2021.05.05.19.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 19:38:41 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v12 2/8] powerpc/lib/code-patching: Set up Strict RWX patching
 earlier
Date: Thu,  6 May 2021 12:34:43 +1000
Message-Id: <20210506023449.3568630-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506023449.3568630-1-jniethe5@gmail.com>
References: <20210506023449.3568630-1-jniethe5@gmail.com>
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

