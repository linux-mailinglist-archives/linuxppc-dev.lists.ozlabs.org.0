Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B258109CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 07:01:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gKdyagIF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8P3xjlm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqlGW4yZYz3dLg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 17:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gKdyagIF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8P3xjlm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqlCG2xGqz3c4P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 16:58:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702447095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyIpUCoke21Fh9u4XVKPlBkpu2Ylo9Oo/U9H7G6iIE4=;
	b=gKdyagIFJHM8v9ySz60vGPx7libbq118b8DUx2+MbFzMwS84PWKuyGjReAgaZ6LRkpMVCe
	+H6yk3T9CzmdnypI7KZlhD3XBnvFFWIfhRRU9d04yGadS76ZTxgL0XYxL108tZXwU0iE7u
	TRqjJq0iuoSIyAly8wTTBUsWT4L8KXE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702447096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyIpUCoke21Fh9u4XVKPlBkpu2Ylo9Oo/U9H7G6iIE4=;
	b=X8P3xjlmaCbxRS9RGq/NTMMo6W8SjyhYdEGjTRaAVqE6fk8KGHicPYzveFdgi9GIkbjkVj
	5JdKRLJHD58ECqcl3n1E+xdlp8kxWazJXjOHtRFFTiS2hvaBrsGbng7oeP2tSQTh7fkG8q
	REWevqOMNVc+ZvB4ke1sSbJdUx4cJIg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-322HU_a3M7eeuAKLBuouCA-1; Wed,
 13 Dec 2023 00:58:13 -0500
X-MC-Unique: 322HU_a3M7eeuAKLBuouCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CFBF3C40B52;
	Wed, 13 Dec 2023 05:58:13 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79EE21C060AF;
	Wed, 13 Dec 2023 05:58:08 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] kexec_file, x86: print out debugging message if required
Date: Wed, 13 Dec 2023 13:57:43 +0800
Message-ID: <20231213055747.61826-4-bhe@redhat.com>
In-Reply-To: <20231213055747.61826-1-bhe@redhat.com>
References: <20231213055747.61826-1-bhe@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, conor@kernel.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Then when specifying '-d' for kexec_file_load interface, loaded
locations of kernel/initrd/cmdline etc can be printed out to help
debug.

Here replace pr_debug() with the newly added kexec_dprintk() in
kexec_file loading related codes.

And also print out e820 memmap passed to 2nd kernel just as kexec_load
interface has been doing.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/kernel/crash.c           |  4 ++--
 arch/x86/kernel/kexec-bzimage64.c | 23 ++++++++++++++---------
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index c92d88680dbf..1715e5f06a59 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -386,8 +386,8 @@ int crash_load_segments(struct kimage *image)
 	if (ret)
 		return ret;
 	image->elf_load_addr = kbuf.mem;
-	pr_debug("Loaded ELF headers at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-		 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+	kexec_dprintk("Loaded ELF headers at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+		      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 
 	return ret;
 }
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index a61c12c01270..e9ae0eac6bf9 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -82,7 +82,7 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
 
 	cmdline_ptr[cmdline_len - 1] = '\0';
 
-	pr_debug("Final command line is: %s\n", cmdline_ptr);
+	kexec_dprintk("Final command line is: %s\n", cmdline_ptr);
 	cmdline_ptr_phys = bootparams_load_addr + cmdline_offset;
 	cmdline_low_32 = cmdline_ptr_phys & 0xffffffffUL;
 	cmdline_ext_32 = cmdline_ptr_phys >> 32;
@@ -272,7 +272,12 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
 
 	nr_e820_entries = params->e820_entries;
 
+	kexec_dprintk("E820 memmap:\n");
 	for (i = 0; i < nr_e820_entries; i++) {
+		kexec_dprintk("%016llx-%016llx (%d)\n",
+			      params->e820_table[i].addr,
+			      params->e820_table[i].addr + params->e820_table[i].size - 1,
+			      params->e820_table[i].type);
 		if (params->e820_table[i].type != E820_TYPE_RAM)
 			continue;
 		start = params->e820_table[i].addr;
@@ -424,7 +429,7 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 	 * command line. Make sure it does not overflow
 	 */
 	if (cmdline_len + MAX_ELFCOREHDR_STR_LEN > header->cmdline_size) {
-		pr_debug("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
+		kexec_dprintk("Appending elfcorehdr=<addr> to command line exceeds maximum allowed length\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -445,7 +450,7 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		return ERR_PTR(ret);
 	}
 
-	pr_debug("Loaded purgatory at 0x%lx\n", pbuf.mem);
+	kexec_dprintk("Loaded purgatory at 0x%lx\n", pbuf.mem);
 
 
 	/*
@@ -490,8 +495,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 	if (ret)
 		goto out_free_params;
 	bootparam_load_addr = kbuf.mem;
-	pr_debug("Loaded boot_param, command line and misc at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-		 bootparam_load_addr, kbuf.bufsz, kbuf.bufsz);
+	kexec_dprintk("Loaded boot_param, command line and misc at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+		      bootparam_load_addr, kbuf.bufsz, kbuf.bufsz);
 
 	/* Load kernel */
 	kbuf.buffer = kernel + kern16_size;
@@ -505,8 +510,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		goto out_free_params;
 	kernel_load_addr = kbuf.mem;
 
-	pr_debug("Loaded 64bit kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-		 kernel_load_addr, kbuf.bufsz, kbuf.memsz);
+	kexec_dprintk("Loaded 64bit kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+		      kernel_load_addr, kbuf.bufsz, kbuf.memsz);
 
 	/* Load initrd high */
 	if (initrd) {
@@ -520,8 +525,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 			goto out_free_params;
 		initrd_load_addr = kbuf.mem;
 
-		pr_debug("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-				initrd_load_addr, initrd_len, initrd_len);
+		kexec_dprintk("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+			      initrd_load_addr, initrd_len, initrd_len);
 
 		setup_initrd(params, initrd_load_addr, initrd_len);
 	}
-- 
2.41.0

