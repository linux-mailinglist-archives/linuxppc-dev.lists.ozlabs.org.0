Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E35382319
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:34:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4WZ3yW8z3c25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:34:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QRxwYqYc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QRxwYqYc; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4VC4wZnz2xv4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:33:39 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d78so3155027pfd.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGhjnXn/C0qTfkhl0tEeiHCLhVCbdYoTtED7Ch6E9ZU=;
 b=QRxwYqYccFqisHxXldQ3an8+rX+dLyjISOiKj/jwIVwRXMcUipZo0M7uxP+yIwysCF
 RhHULhgIpCy7kvYK5mUZ4CGYMzDrtOiV1XFtrzuj8oXLPCwDc7AjVHBLHdxVUP1wL2h0
 N26OhiCmew9onnP0589/nrEw84Pb1E7mm7AhbAzD9Ben4HVpKRN5aJfzeSgpVmVZYlPo
 QvTR+ueUBNNJREzbZr0nUOi40j8y5XuQ1EIMh3Pk4jA0pSMMOjv6mOrSHnKxd44yVgqi
 X5btIT3WaBYb3+qoewOuPZ9yXKt1M34rFx3dZEz2/8nnnvQo7iBYKpeGHfr3IRGy0whP
 mCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGhjnXn/C0qTfkhl0tEeiHCLhVCbdYoTtED7Ch6E9ZU=;
 b=d8cx9h7qgaze/RLVjbNDybTpIcgR0Gk9kpMw7xkek4LvqhDiXysUFWFQN1UOi6/VAh
 MNEJh0YxwtHjozQncuMn5QNqMTVrZU2bxYhOo7MCJL6d45l3bXDYWFHoLqJ9HBD6cK2a
 Ll39dJFAl5pAWUI26S5+P4rfba2+VlH46p7Ys5BAG0wpK3WJEMrF3u1oNYrK6qHRAiYt
 +4SIQcufwNTKvAUrTTLprCyZfa2jJY0mtPqobDX7VFQpGY4JuDZrRERdQNo+GImvL2Eh
 Z0ljWikCmMglzLPt3gjmHik9aCO8/2xqE2QsJdRIE5+phztqTpX37oj3AI8ya/HundvM
 /hrw==
X-Gm-Message-State: AOAM530W5a70SQ9K7HELnLk/gz0t2DRTgoRJc5x1/1aNY1Ujf30B7Opv
 S1f0IpHB4vrydktu4jbzu57pqphJH94=
X-Google-Smtp-Source: ABdhPJwMahADI0pTZ8ubPXdDM1ZZr5j4Mw6VOpVIaS1+GN4sQSwRxmxXmSzySJD2HAFgMYBr6Yl+tw==
X-Received: by 2002:a62:7c46:0:b029:2dc:cb24:b5b1 with SMTP id
 x67-20020a627c460000b02902dccb24b5b1mr998643pfc.77.1621222416885; 
 Sun, 16 May 2021 20:33:36 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:33:36 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 2/9] powerpc/lib/code-patching: Set up Strict RWX patching
 earlier
Date: Mon, 17 May 2021 13:28:03 +1000
Message-Id: <20210517032810.129949-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517032810.129949-1-jniethe5@gmail.com>
References: <20210517032810.129949-1-jniethe5@gmail.com>
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

