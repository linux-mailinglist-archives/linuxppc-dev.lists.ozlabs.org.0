Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA834E058
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cXR71jHz3c6x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:53:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DMo5mmys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DMo5mmys; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cVn2jZkz304H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:01 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id t20so5508426plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrxLlLDZ0an/heUeCZAvmT5gaBDr6v5Eev1L/4hTTdM=;
 b=DMo5mmysisR1AYEapO+vDrkbAA2Zg5MIQzPRGNjhYbicSWxitd+9CMbNpuaOlQYNq6
 K2k4p9KkrjXj/qJp+Z8iB0B1HnQXszirBPupTPa9BkefR2m/6E36T+tMwyrZVL6yiXQp
 ErA9S1KSEkxnpR+596NjChd2EhLiK8EPSv8/x45ECmdzdjZ8hbsAUABy4A+NVDvrSgOV
 mngZ5RqTydeeW1y1BgpPQTQbYZsJItC5v1lZ53/IZH9SJ+5s7NR7zzxY9IfRQ/l4DEQx
 UBHfSMb7x0Lk2eLBF/rVWDP7q9mzHVPnTnUIieViLA+94Fg5DXiLl6Sau5STmoDhej0r
 dmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrxLlLDZ0an/heUeCZAvmT5gaBDr6v5Eev1L/4hTTdM=;
 b=mu/2D5L2AspaOS1yFYum2Sf6QCxc3g/x1NbdYXgdcrhRU3wdcAzHSFU07tKv9JTOcA
 aCgMMPSSCTqA5jVaF2+AcU6oiMZEyjBTzea26v/vSbswzc3EPL/FkRZtK5Qhc5OfMQNJ
 HDCpEF1d7U7FLDt2vct8C9iPIUK0JlQ/1qaWUZQyoQqiNwjowjnUZ4e1Ri1HWnpx33ep
 qX5ecokfG8c0gh3WW+Rid2N1c6nTzokjR/TYRPSsJ5ViOVsjOji2Amn+f070w5PmbRqf
 2KL0KD+Ws3arcdEJ6u+4tWga8hzKIMicFu0vyqsYee2W+HbxQi/ThN16aYKaaN3Bj1Xm
 oh0A==
X-Gm-Message-State: AOAM533+WvRiywD3Y0hSauTFNREmt099IdfX8WzdEnVspBLIV0YHQfIW
 kOjMcn91sjUdmOnP675qJUwLKEViiBwsjA==
X-Google-Smtp-Source: ABdhPJzjyJkhkgD8dXvqVOqRUzRpaVqgd6Uh4w+WIjHkJBLxHaeH5TScDZK26MI3nrTMoWFNGEzgaA==
X-Received: by 2002:a17:90a:5898:: with SMTP id
 j24mr2496966pji.103.1617079919004; 
 Mon, 29 Mar 2021 21:51:59 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:51:58 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 03/10] powerpc: Always define MODULES_{VADDR,END}
Date: Tue, 30 Mar 2021 15:51:25 +1100
Message-Id: <20210330045132.722243-4-jniethe5@gmail.com>
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

If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
VMALLOC_END respectively. This reduces the need for special cases. For
example, powerpc's module_alloc() was previously predicated on
MODULES_VADDR being defined but now is unconditionally defined.

This will be useful reducing conditional code in other places that need
to allocate from the module region (i.e., kprobes).

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: New to series
---
 arch/powerpc/include/asm/pgtable.h | 5 +++++
 arch/powerpc/kernel/module.c       | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 4eed82172e33..014c2921f26a 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -167,6 +167,11 @@ struct seq_file;
 void arch_report_meminfo(struct seq_file *m);
 #endif /* CONFIG_PPC64 */
 
+#ifndef MODULES_VADDR
+#define MODULES_VADDR VMALLOC_START
+#define MODULES_END VMALLOC_END
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index a211b0253cdb..f1fb58389d58 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -14,6 +14,7 @@
 #include <asm/firmware.h>
 #include <linux/sort.h>
 #include <asm/setup.h>
+#include <linux/mm.h>
 
 static LIST_HEAD(module_bug_list);
 
@@ -87,13 +88,9 @@ int module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-#ifdef MODULES_VADDR
 void *module_alloc(unsigned long size)
 {
-	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
-
 	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
 				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
 				    __builtin_return_address(0));
 }
-#endif
-- 
2.25.1

