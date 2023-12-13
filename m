Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A588109C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 07:00:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B4a06fSe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KPDzaq/J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqlFd2kK4z3cLk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 17:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B4a06fSe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KPDzaq/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqlCB39q6z3c8W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 16:58:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702447091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPOqcDOuxoODL3+Npm5GEBG1XQ606eHvq/icyslsljY=;
	b=B4a06fSeOlIbnPXAmYR2/MapKY+zWZ1DGeVfD17dqu1ocfUsqgkyIndF4j1e7glDSQT0Py
	/RGnU2S14+BSFAwX2lgyBaPnSTUy2TYy7H90TJr3+nG8iLYY7a7+TjFthwY/vMU7bhon+m
	nABVKjj1Mc9tiJJOTUiP6bEmUNUxDaY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702447092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPOqcDOuxoODL3+Npm5GEBG1XQ606eHvq/icyslsljY=;
	b=KPDzaq/JPfGkxG4tJdmgoTQsmi+gnNgAW2aNXd97QqYtZaG0TDdVfDtPvjVWpv9Xe7Tx/F
	9f8Q6JfJOHGkXwdwVLP8G2FK4LabuvTDcO4/6yMUBibl16R+u20ixMXC67NtoevH0/AtPq
	CqFp6aqPBnSxjAnHT0clr0ucrtkE1nU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-EpFdCEBxPSqFGEgPWPjEqQ-1; Wed,
 13 Dec 2023 00:58:08 -0500
X-MC-Unique: EpFdCEBxPSqFGEgPWPjEqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD5203C40B50;
	Wed, 13 Dec 2023 05:58:07 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27E9B1C060AF;
	Wed, 13 Dec 2023 05:58:01 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] kexec_file: print out debugging message if required
Date: Wed, 13 Dec 2023 13:57:42 +0800
Message-ID: <20231213055747.61826-3-bhe@redhat.com>
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

And also print out type/start/head of kimage and flags to help debug.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 kernel/crash_core.c                |  8 +++++---
 kernel/kexec_file.c                | 11 ++++++++---
 security/integrity/ima/ima_kexec.c |  4 ++--
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index efe87d501c8c..380d0d3acc7b 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -551,9 +551,11 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
 		phdr->p_align = 0;
 		ehdr->e_phnum++;
-		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
-			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
-			ehdr->e_phnum, phdr->p_offset);
+#ifdef CONFIG_KEXEC_FILE
+		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
+			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
+			      ehdr->e_phnum, phdr->p_offset);
+#endif
 		phdr++;
 	}
 
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index aca5dac74044..76de1ac7c424 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -204,6 +204,8 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 	if (ret < 0)
 		return ret;
 	image->kernel_buf_len = ret;
+	kexec_dprintk("kernel: %p kernel_size: %#lx\n",
+		      image->kernel_buf, image->kernel_buf_len);
 
 	/* Call arch image probe handlers */
 	ret = arch_kexec_kernel_image_probe(image, image->kernel_buf,
@@ -387,13 +389,14 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 	if (ret)
 		goto out;
 
+	kexec_dprintk("nr_segments = %lu\n", image->nr_segments);
 	for (i = 0; i < image->nr_segments; i++) {
 		struct kexec_segment *ksegment;
 
 		ksegment = &image->segment[i];
-		pr_debug("Loading segment %d: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
-			 i, ksegment->buf, ksegment->bufsz, ksegment->mem,
-			 ksegment->memsz);
+		kexec_dprintk("segment[%d]: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
+			      i, ksegment->buf, ksegment->bufsz, ksegment->mem,
+			      ksegment->memsz);
 
 		ret = kimage_load_segment(image, &image->segment[i]);
 		if (ret)
@@ -406,6 +409,8 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 	if (ret)
 		goto out;
 
+	kexec_dprintk("kexec_file_load: type:%u, start:0x%lx head:0x%lx flags:0x%lx\n",
+		      image->type, image->start, image->head, flags);
 	/*
 	 * Free up any temporary buffers allocated which are not needed
 	 * after image has been loaded
diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index ad133fe120db..dadc1d138118 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -129,8 +129,8 @@ void ima_add_kexec_buffer(struct kimage *image)
 	image->ima_buffer_size = kexec_segment_size;
 	image->ima_buffer = kexec_buffer;
 
-	pr_debug("kexec measurement buffer for the loaded kernel at 0x%lx.\n",
-		 kbuf.mem);
+	kexec_dprintk("kexec measurement buffer for the loaded kernel at 0x%lx.\n",
+		      kbuf.mem);
 }
 #endif /* IMA_KEXEC */
 
-- 
2.41.0

