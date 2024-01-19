Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FC832C05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 16:00:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z9aGmZkC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z9aGmZkC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGjTq72Mcz3vs7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 02:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z9aGmZkC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z9aGmZkC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGjLV45Z5z3cNC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 01:54:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ELQbTPNyx4L6Rjica+79k486cYCM/jEDd+jz77hDLU=;
	b=Z9aGmZkCOvjghITRBUjjZoZoEGssCmcO9lSg47NrXkrPtGAtRYxfJtl6ITVeacENGrKl5f
	OlJ2T/qPyUnVW6xT1ckMih2TUicCwYyg0h1fNmF38+dui0WtYz3gRKJMgjHxdNbsu7h8NZ
	0QHknhjQqVZJWOZ4wOCKjDFipnlusDs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ELQbTPNyx4L6Rjica+79k486cYCM/jEDd+jz77hDLU=;
	b=Z9aGmZkCOvjghITRBUjjZoZoEGssCmcO9lSg47NrXkrPtGAtRYxfJtl6ITVeacENGrKl5f
	OlJ2T/qPyUnVW6xT1ckMih2TUicCwYyg0h1fNmF38+dui0WtYz3gRKJMgjHxdNbsu7h8NZ
	0QHknhjQqVZJWOZ4wOCKjDFipnlusDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-KYkDc-tBOHakDPqfCoeT5g-1; Fri, 19 Jan 2024 09:54:03 -0500
X-MC-Unique: KYkDc-tBOHakDPqfCoeT5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B53284FA80;
	Fri, 19 Jan 2024 14:54:02 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77D8C5012;
	Fri, 19 Jan 2024 14:53:55 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/14] s390, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:36 +0800
Message-ID: <20240119145241.769622-10-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
items on s390 with some adjustments.

Here wrap up crash dumping codes with CONFIG_CRASH_DUMP ifdeffery.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/s390/kernel/kexec_elf.c          |  2 ++
 arch/s390/kernel/kexec_image.c        |  2 ++
 arch/s390/kernel/machine_kexec_file.c | 10 ++++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/s390/kernel/kexec_elf.c b/arch/s390/kernel/kexec_elf.c
index 9da6fa30c447..4d364de43799 100644
--- a/arch/s390/kernel/kexec_elf.c
+++ b/arch/s390/kernel/kexec_elf.c
@@ -40,8 +40,10 @@ static int kexec_file_add_kernel_elf(struct kimage *image,
 		buf.bufsz = phdr->p_filesz;
 
 		buf.mem = ALIGN(phdr->p_paddr, phdr->p_align);
+#ifdef CONFIG_CRASH_DUMP
 		if (image->type == KEXEC_TYPE_CRASH)
 			buf.mem += crashk_res.start;
+#endif
 		buf.memsz = phdr->p_memsz;
 		data->memsz = ALIGN(data->memsz, phdr->p_align) + buf.memsz;
 
diff --git a/arch/s390/kernel/kexec_image.c b/arch/s390/kernel/kexec_image.c
index af23eff5774d..a32ce8bea745 100644
--- a/arch/s390/kernel/kexec_image.c
+++ b/arch/s390/kernel/kexec_image.c
@@ -24,8 +24,10 @@ static int kexec_file_add_kernel_image(struct kimage *image,
 	buf.bufsz = image->kernel_buf_len;
 
 	buf.mem = 0;
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 	buf.memsz = buf.bufsz;
 
 	data->kernel_buf = image->kernel_buf;
diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index 8d207b82d9fe..c2bac14dd668 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -105,6 +105,7 @@ static int kexec_file_update_purgatory(struct kimage *image,
 	if (ret)
 		return ret;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH) {
 		u64 crash_size;
 
@@ -121,6 +122,7 @@ static int kexec_file_update_purgatory(struct kimage *image,
 						     sizeof(crash_size),
 						     false);
 	}
+#endif
 	return ret;
 }
 
@@ -134,8 +136,10 @@ static int kexec_file_add_purgatory(struct kimage *image,
 
 	data->memsz = ALIGN(data->memsz, PAGE_SIZE);
 	buf.mem = data->memsz;
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 
 	ret = kexec_load_purgatory(image, &buf);
 	if (ret)
@@ -158,8 +162,10 @@ static int kexec_file_add_initrd(struct kimage *image,
 
 	data->memsz = ALIGN(data->memsz, PAGE_SIZE);
 	buf.mem = data->memsz;
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 	buf.memsz = buf.bufsz;
 
 	data->parm->initrd_start = data->memsz;
@@ -223,8 +229,10 @@ static int kexec_file_add_ipl_report(struct kimage *image,
 		data->kernel_buf + offsetof(struct lowcore, ipl_parmblock_ptr);
 	*lc_ipl_parmblock_ptr = (__u32)buf.mem;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 
 	ret = kexec_add_buffer(&buf);
 out:
@@ -268,10 +276,12 @@ void *kexec_file_add_components(struct kimage *image,
 	memcpy(data.parm->command_line, image->cmdline_buf,
 	       image->cmdline_buf_len);
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH) {
 		data.parm->oldmem_base = crashk_res.start;
 		data.parm->oldmem_size = crashk_res.end - crashk_res.start + 1;
 	}
+#endif
 
 	if (image->initrd_buf) {
 		ret = kexec_file_add_initrd(image, &data);
-- 
2.41.0

