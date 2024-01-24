Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42B83A14E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 06:23:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WfBvgHns;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WfBvgHns;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKXRZ3M9bz3vs7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 16:23:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WfBvgHns;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WfBvgHns;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKXFS3VHnz3cSn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 16:14:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaWsezpiSi0g7GnmvcBjUWnIT5KvaNjJV46jtxgyD8g=;
	b=WfBvgHnsD9w4wYWb31EtEuk0W+Xj2MOyY7cIDb5f3vYewvSok82bREzCKuLPRvwEIEfdLy
	EI1s6yzs6X5o96WFdICyW+8qVsRKOfzIhGm+9uYOKqFQg1oRuqwDiLYIc3Nm2t+XL3DpxI
	CdynKSLvQKap6Qujnenklrze+7dm/KE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaWsezpiSi0g7GnmvcBjUWnIT5KvaNjJV46jtxgyD8g=;
	b=WfBvgHnsD9w4wYWb31EtEuk0W+Xj2MOyY7cIDb5f3vYewvSok82bREzCKuLPRvwEIEfdLy
	EI1s6yzs6X5o96WFdICyW+8qVsRKOfzIhGm+9uYOKqFQg1oRuqwDiLYIc3Nm2t+XL3DpxI
	CdynKSLvQKap6Qujnenklrze+7dm/KE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-6MSAjmHBNja5UCvfdGGVYQ-1; Wed, 24 Jan 2024 00:14:28 -0500
X-MC-Unique: 6MSAjmHBNja5UCvfdGGVYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 561ED810BB0;
	Wed, 24 Jan 2024 05:14:27 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBD0D1C060AF;
	Wed, 24 Jan 2024 05:14:20 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v3 12/14] riscv, crash: wrap crash dumping code into crash related ifdefs
Date: Wed, 24 Jan 2024 13:12:52 +0800
Message-ID: <20240124051254.67105-13-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-1-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now crash codes under kernel/ folder has been split out from kexec
code, crash dumping can be separated from kexec reboot in config
items on risc-v with some adjustments.

Here wrap up crash dumping codes with CONFIG_CRASH_DUMP ifdeffery, and
use IS_ENABLED(CONFIG_CRASH_RESERVE) check to decide if compiling
in the crashkernel reservation code.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/riscv/kernel/elf_kexec.c | 9 +++++++--
 arch/riscv/mm/init.c          | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 5bd1ec3341fe..54260c16f991 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -117,6 +117,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	return ret;
 }
 
+#ifdef CONFIG_CRASH_DUMP
 static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
 {
 	unsigned int *nr_ranges = arg;
@@ -189,6 +190,7 @@ static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 	cmdline_ptr[COMMAND_LINE_SIZE - 1] = '\0';
 	return cmdline_ptr;
 }
+#endif
 
 static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 			    unsigned long kernel_len, char *initrd,
@@ -196,12 +198,11 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 			    unsigned long cmdline_len)
 {
 	int ret;
+	void *fdt;
 	unsigned long old_kernel_pbase = ULONG_MAX;
 	unsigned long new_kernel_pbase = 0UL;
 	unsigned long initrd_pbase = 0UL;
-	unsigned long headers_sz;
 	unsigned long kernel_start;
-	void *fdt, *headers;
 	struct elfhdr ehdr;
 	struct kexec_buf kbuf;
 	struct kexec_elf_info elf_info;
@@ -227,8 +228,11 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	kbuf.buf_min = new_kernel_pbase + kernel_len;
 	kbuf.buf_max = ULONG_MAX;
 
+#ifdef CONFIG_CRASH_DUMP
 	/* Add elfcorehdr */
 	if (image->type == KEXEC_TYPE_CRASH) {
+		void *headers;
+		unsigned long headers_sz;
 		ret = prepare_elf_headers(&headers, &headers_sz);
 		if (ret) {
 			pr_err("Preparing elf core header failed\n");
@@ -264,6 +268,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 		}
 		cmdline = modified_cmdline;
 	}
+#endif
 
 #ifdef CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY
 	/* Add purgatory to the image */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 32cad6a65ccd..245919dda910 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1358,7 +1358,7 @@ static void __init arch_reserve_crashkernel(void)
 	bool high = false;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
 		return;
 
 	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
-- 
2.41.0

