Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6288826378
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jan 2024 09:53:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvSlb/gD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvSlb/gD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T79vc4xRMz3cYt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jan 2024 19:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvSlb/gD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvSlb/gD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T79tn65G9z2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jan 2024 19:52:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704617548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jm4zrLgU02qTNuKz7yvXlAxsX0awHq5pYJjTqaiF7Dk=;
	b=YvSlb/gDVPE+nj63ubqHEWm+hhs35/bw/EG7mv4OjnmbpMNZpX2rS5WKfGxBY6O11DtYMi
	RloDAYqGzc6aZAqcErQ7ZySe7Vh5Gm0+SfT3zmZe5C5wNNP+hbXZ80X/qbQ5PuNzhyd0mW
	szHP036SSTMp33Pkif3k33qNCDjLxhg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704617548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jm4zrLgU02qTNuKz7yvXlAxsX0awHq5pYJjTqaiF7Dk=;
	b=YvSlb/gDVPE+nj63ubqHEWm+hhs35/bw/EG7mv4OjnmbpMNZpX2rS5WKfGxBY6O11DtYMi
	RloDAYqGzc6aZAqcErQ7ZySe7Vh5Gm0+SfT3zmZe5C5wNNP+hbXZ80X/qbQ5PuNzhyd0mW
	szHP036SSTMp33Pkif3k33qNCDjLxhg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-xIoNME9aOIiDikbTzkUdwA-1; Sun, 07 Jan 2024 03:52:25 -0500
X-MC-Unique: xIoNME9aOIiDikbTzkUdwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3263F8350E3;
	Sun,  7 Jan 2024 08:52:24 +0000 (UTC)
Received: from localhost (unknown [10.72.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F7742026D6F;
	Sun,  7 Jan 2024 08:52:22 +0000 (UTC)
Date: Sun, 7 Jan 2024 16:52:15 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/5] kexec_core: move kdump related codes from
 crash_core.c to kexec_core.c
Message-ID: <ZZpmP5QeH+VigqXw@MiWiFi-R3L-srv>
References: <20240105103305.557273-2-bhe@redhat.com>
 <202401062212.LXqinfjE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401062212.LXqinfjE-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, arnd@arndb.de, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, oe-kbuild-all@lists.linux.dev, eric_devolder@yahoo.com, akpm@linux-foundation.org, ignat@cloudflare.com, linux-riscv@lists.infradead.org, hbathini@linux.ibm.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/06/24 at 10:58pm, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.7-rc8]
> [cannot apply to powerpc/next powerpc/fixes tip/x86/core arm64/for-next/core next-20240105]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_core-move-kdump-related-codes-from-crash_core-c-to-kexec_core-c/20240105-223735
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240105103305.557273-2-bhe%40redhat.com
> patch subject: [PATCH 1/5] kexec_core: move kdump related codes from crash_core.c to kexec_core.c
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240106/202401062212.LXqinfjE-lkp@intel.com/config)
> compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401062212.LXqinfjE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401062212.LXqinfjE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/kernel/crash.c:154:17: error: invalid application of 'sizeof' to an incomplete type 'struct crash_mem'
>      154 |         cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
>          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks for reporting.

I mistakenly put the struct crash_mem definition and the two function
delcarations inside CONFIG_KEXEC_FILE ifdeffery scope, so with the lkp's
config as below, the compiling failed. The code change at bottom can fix
it. Will update patch in v2.

#
# Kexec and crash features
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_KEXEC=y
# CONFIG_KEXEC_FILE is not set
CONFIG_CRASH_DUMP=y
CONFIG_CRASH_HOTPLUG=y
CONFIG_CRASH_MAX_MEMORY_RANGES=8192

---
 include/linux/kexec.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index be1e5c2fdbdc..4df6ef72db84 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -228,21 +228,6 @@ static inline int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
 }
 #endif
 
-/* Alignment required for elf header segment */
-#define ELF_CORE_HEADER_ALIGN   4096
-
-struct crash_mem {
-	unsigned int max_nr_ranges;
-	unsigned int nr_ranges;
-	struct range ranges[] __counted_by(max_nr_ranges);
-};
-
-extern int crash_exclude_mem_range(struct crash_mem *mem,
-				   unsigned long long mstart,
-				   unsigned long long mend);
-extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
-				       void **addr, unsigned long *sz);
-
 #ifndef arch_kexec_apply_relocations_add
 /*
  * arch_kexec_apply_relocations_add - apply relocations of type RELA
@@ -525,6 +510,20 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
 #define KEXEC_CRASH_HP_INVALID_CPU		-1U
 #endif
 
+/* Alignment required for elf header segment */
+#define ELF_CORE_HEADER_ALIGN   4096
+
+struct crash_mem {
+	unsigned int max_nr_ranges;
+	unsigned int nr_ranges;
+	struct range ranges[] __counted_by(max_nr_ranges);
+};
+
+extern int crash_exclude_mem_range(struct crash_mem *mem,
+				   unsigned long long mstart,
+				   unsigned long long mend);
+extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
+				       void **addr, unsigned long *sz);
 #else /* !CONFIG_KEXEC_CORE */
 struct pt_regs;
 struct task_struct;
@@ -541,6 +540,7 @@ void set_kexec_sig_enforced(void);
 static inline void set_kexec_sig_enforced(void) {}
 #endif
 
+
 #endif /* !defined(__ASSEBMLY__) */
 
 #endif /* LINUX_KEXEC_H */
-- 
2.41.0

