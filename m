Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E638231A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:35:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4XF0zH2z3c5d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:35:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nJyBV0aC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nJyBV0aC; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4VJ0xNQz300C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:33:43 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id k15so3689511pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ep7kGAzWpureAahQzZ9T0pD7WKuXMlOu9Vr8VpDzdo=;
 b=nJyBV0aChqVl8ko04YGBeUBErt531PHsDb0PGgz5nlMRImzH5E5y5On3dga6vNcyd1
 eKlHpvgk+WeRXI38TbkYyJpr/36/H95xoWf8DwIKRKDG96H6OB84mazC1dmvOGqpm+1s
 5x2qnzRdDe2OqRQwIAwGstKedHOeF+gZmMiOMMGqz1t9xJs7DUsaT5WuhxR814AqgRzA
 AUSRk+VyJ91Xusy00au9do4qsknKVTvcGXARrVxV2gCWYPrFjwMqFFiW4rUNVTFfm69Q
 7IJb2A5LtwcTUzE9RCZTDVjtWcaPS0Qh+hu+Ry2aNAUBlHRej2LztHQGSPeGH7QUhDEq
 yPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ep7kGAzWpureAahQzZ9T0pD7WKuXMlOu9Vr8VpDzdo=;
 b=Dcqa2LnTwCXr/rl3ap/ORProD/a1WkiyJXhKdyzkHyf1TcO6ZKwp3GcTYgeBKpzoJT
 GBrpe1gDdQdLWupAL8tHU59LsPEV6IrGZax07sYNNXSjJ9oNj5akBqsfk0lNVBv7eWaI
 83vOI4LmYRfoOhivm2D4dsAua8rggrsDZ6DNTlZfxj+MfHlePeS1pMG02dnjYObCbVjt
 JEj8sMpZgOAbT2UdNMNPXDKWMCEIjLk9kL0La1CfEuCWco4FaS/pTp+knQUijqy5Qv2g
 xvI4y+p21/pklLo1uuXYYtCInD0Kv9HDaqxffA50N7bYMjsBn1BBS3/v6H6lPI5lHheb
 W+7g==
X-Gm-Message-State: AOAM532+ONuLNV+QjQfCF2xy0/UgPlpDIvqLXwVCjDllG2Lf/rEdQ54D
 SxDWwkNNVr3JdqjfPyXIdCEBF4CROFk=
X-Google-Smtp-Source: ABdhPJxc+3SSWBowQ2h+sxNGdLZHtTJK6dBor6o/1YxhpZ0xVEJuVcA01+msSBSHhC51XgpF5/u7XQ==
X-Received: by 2002:a05:6a00:1384:b029:2c7:fcda:8d83 with SMTP id
 t4-20020a056a001384b02902c7fcda8d83mr32759412pfg.0.1621222421442; 
 Sun, 16 May 2021 20:33:41 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:33:41 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 3/9] powerpc/modules: Make module_alloc() Strict Module
 RWX aware
Date: Mon, 17 May 2021 13:28:04 +1000
Message-Id: <20210517032810.129949-4-jniethe5@gmail.com>
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

Make module_alloc() use PAGE_KERNEL protections instead of
PAGE_KERNEL_EXEX if Strict Module RWX is enabled.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v14: - Split out from powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
     - Add and use strict_module_rwx_enabled() helper
---
 arch/powerpc/include/asm/mmu.h | 5 +++++
 arch/powerpc/kernel/module.c   | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 607168b1aef4..7710bf0cbf8a 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -357,6 +357,11 @@ static inline bool strict_kernel_rwx_enabled(void)
 	return false;
 }
 #endif
+
+static inline bool strict_module_rwx_enabled(void)
+{
+	return IS_ENABLED(CONFIG_STRICT_MODULE_RWX) && strict_kernel_rwx_enabled();
+}
 #endif /* !__ASSEMBLY__ */
 
 /* The kernel use the constants below to index in the page sizes array.
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index 3f35c8d20be7..ed04a3ba66fe 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
 static __always_inline void *
 __module_alloc(unsigned long size, unsigned long start, unsigned long end)
 {
+	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
+
 	/*
 	 * Don't do huge page allocations for modules yet until more testing
 	 * is done. STRICT_MODULE_RWX may require extra work to support this
 	 * too.
 	 */
-	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, PAGE_KERNEL_EXEC,
+	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, prot,
 				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
 				    NUMA_NO_NODE, __builtin_return_address(0));
 }
-- 
2.25.1

