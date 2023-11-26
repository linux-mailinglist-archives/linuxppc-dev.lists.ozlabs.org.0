Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 232EE7F9288
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 12:56:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8MUqnmT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8MUqnmT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdRyj0Kj1z3cYG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 22:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8MUqnmT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8MUqnmT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdRxr3QQXz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 22:55:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700999751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=10f/Bul9KbIaMsjeanbNOmm62BHIxQH0eftSF3zeoHA=;
	b=c8MUqnmTfCOHwkPIUKBh+egfyi18zYSE9uFskxNonyuWpAbDfnn6TxnZPaJeWEnb66f0ZA
	xww/QP8WG74uVN+Yss7nI0cyqwsAMkWrN3bwNgunpbG877VLcQ2TK+FKn5u0JWgU1oKr5f
	ng+R4J+QduwC2i5234RqmYdYRqpBnNw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700999751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=10f/Bul9KbIaMsjeanbNOmm62BHIxQH0eftSF3zeoHA=;
	b=c8MUqnmTfCOHwkPIUKBh+egfyi18zYSE9uFskxNonyuWpAbDfnn6TxnZPaJeWEnb66f0ZA
	xww/QP8WG74uVN+Yss7nI0cyqwsAMkWrN3bwNgunpbG877VLcQ2TK+FKn5u0JWgU1oKr5f
	ng+R4J+QduwC2i5234RqmYdYRqpBnNw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-n79wBA5hOnSAQHO1OAsXyg-1; Sun,
 26 Nov 2023 06:55:45 -0500
X-MC-Unique: n79wBA5hOnSAQHO1OAsXyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90DF23C0C88A;
	Sun, 26 Nov 2023 11:55:44 +0000 (UTC)
Received: from localhost (unknown [10.72.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8B1340C6EB9;
	Sun, 26 Nov 2023 11:55:43 +0000 (UTC)
Date: Sun, 26 Nov 2023 19:55:40 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/7] kexec_file, arm64: print out debugging message if
 required
Message-ID: <ZWMyPB6HjxAczLzZ@MiWiFi-R3L-srv>
References: <20231124033642.520686-5-bhe@redhat.com>
 <202311260548.1HaxcDnE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311260548.1HaxcDnE-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: llvm@lists.linux.dev, yujie.liu@intel.com, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, oe-kbuild-all@lists.linux.dev, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/26/23 at 05:26am, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc2 next-20231124]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231124-113942
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20231124033642.520686-5-bhe%40redhat.com
> patch subject: [PATCH v2 4/7] kexec_file, arm64: print out debugging message if required
> config: arm64-randconfig-001-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260548.1HaxcDnE-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260548.1HaxcDnE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311260548.1HaxcDnE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/arm64/kernel/machine_kexec.c:35:2: error: implicit declaration of function 'kexec_dprintk' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            kexec_dprintk("%s:%d:\n", func, line);
>            ^
>    1 error generated.

Thanks for reporting. It has below kexec related config items, whereas
the kexec_drpintk() is only defined in CONFIG_KEXEC_FILE ifdeffery
scope, moving it to CONFIG_KEXEC_CORE iddeffery scope in <linux/kexec.h>
can fix it as below draft code. Will update patch 1 to include the code
change.

===
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_KEXEC=y
# CONFIG_KEXEC_FILE is not set
CONFIG_CRASH_DUMP=y
===

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 66997efe36f1..b457b0d70f3f 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -265,13 +265,6 @@ arch_kexec_apply_relocations(struct purgatory_info *pi, Elf_Shdr *section,
 }
 #endif
 
-extern bool kexec_file_dbg_print;
-
-#define kexec_dprintk(fmt, ...)					\
-	printk("%s" fmt,					\
-	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
-	       ##__VA_ARGS__)
-
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_KEXEC_ELF
@@ -508,6 +501,13 @@ static inline int crash_hotplug_memory_support(void) { return 0; }
 static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
 #endif
 
+extern bool kexec_file_dbg_print;
+
+#define kexec_dprintk(fmt, ...)					\
+	printk("%s" fmt,					\
+	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
+	       ##__VA_ARGS__)
+
 #else /* !CONFIG_KEXEC_CORE */
 struct pt_regs;
 struct task_struct;
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index be5642a4ec49..bddba29a1557 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -52,6 +52,8 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
 /* Flag to indicate we are going to kexec a new kernel */
 bool kexec_in_progress = false;
 
+bool kexec_file_dbg_print;
+
 int kexec_should_crash(struct task_struct *p)
 {
 	/*
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 7ae1b0901aa4..8f87644b4eec 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -38,8 +38,6 @@ void set_kexec_sig_enforced(void)
 }
 #endif
 
-bool kexec_file_dbg_print;
-
 static int kexec_calculate_store_digests(struct kimage *image);
 
 /* Maximum size in bytes for kernel/initrd files. */

