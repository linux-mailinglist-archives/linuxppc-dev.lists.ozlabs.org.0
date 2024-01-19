Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA12832C01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 15:59:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZH8R1RwX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZVpSn+Fp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGjSx1Y1yz3vnd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 01:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZH8R1RwX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZVpSn+Fp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGjLD5GZWz3cT9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 01:53:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHQu/Sqm+tr9X7HLq1/ndDCSHyJOTdh5sqBWm6JXi6w=;
	b=ZH8R1RwXIp3w/eBIh8gR/QAW25lsB2msipD23yVYQOIbTTZr9mHkhOsm+0l+8hc4Ez0ked
	utPPHYed/AvrLmt9NQcRFdisv3UpVXs+9aUX4l/iUNf2WDvAM6irO1bg4CUabqNiaQKLM0
	cvX+eSa5MCFKsjwSVOPkaYldQk3Pseg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHQu/Sqm+tr9X7HLq1/ndDCSHyJOTdh5sqBWm6JXi6w=;
	b=ZVpSn+FpvwNRoVbNxQmRf6dLdci9yQBXmwdGexD/vJ/v6lowqtJx6eOrqBFL8kkLND5kyX
	4pn/nVTkXbyOZpymhq37oQzHmvX/Aeh+ydTV9k2QNRZEkGwRQoB2r/zekubPDbJfwsBTZ/
	I8tLShz0M617N/NuCM9BLOrZfI89xAw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-hYqBboYzPpCqmns5RJGCGg-1; Fri, 19 Jan 2024 09:53:47 -0500
X-MC-Unique: hYqBboYzPpCqmns5RJGCGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B37D684FA80;
	Fri, 19 Jan 2024 14:53:46 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95A6D51D5;
	Fri, 19 Jan 2024 14:53:40 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/14] arm64, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:34 +0800
Message-ID: <20240119145241.769622-8-bhe@redhat.com>
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
items on arm64 with some adjustments.

Here wrap up crash dumping codes with CONFIG_CRASH_DUMP ifdeffery.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/arm64/include/asm/kexec.h         |  2 +-
 arch/arm64/kernel/machine_kexec.c      |  2 +-
 arch/arm64/kernel/machine_kexec_file.c | 10 ++++++++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index 9ac9572a3bbe..4d9cc7a76d9c 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -80,7 +80,7 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 	}
 }
 
-#if defined(CONFIG_KEXEC_CORE) && defined(CONFIG_HIBERNATION)
+#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_HIBERNATION)
 extern bool crash_is_nosave(unsigned long pfn);
 extern void crash_prepare_suspend(void);
 extern void crash_post_resume(void);
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index b38aae5b488d..82e2203d86a3 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -255,7 +255,7 @@ void machine_crash_shutdown(struct pt_regs *regs)
 	pr_info("Starting crashdump kernel...\n");
 }
 
-#ifdef CONFIG_HIBERNATION
+#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_HIBERNATION)
 /*
  * To preserve the crash dump kernel image, the relevant memory segments
  * should be mapped again around the hibernation.
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 0e017358f4ba..af1ca875c52c 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -39,6 +39,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
+#ifdef CONFIG_CRASH_DUMP
 static int prepare_elf_headers(void **addr, unsigned long *sz)
 {
 	struct crash_mem *cmem;
@@ -80,6 +81,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	kfree(cmem);
 	return ret;
 }
+#endif
 
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
@@ -93,8 +95,8 @@ int load_other_segments(struct kimage *image,
 			char *cmdline)
 {
 	struct kexec_buf kbuf;
-	void *headers, *dtb = NULL;
-	unsigned long headers_sz, initrd_load_addr = 0, dtb_len,
+	void *dtb = NULL;
+	unsigned long initrd_load_addr = 0, dtb_len,
 		      orig_segments = image->nr_segments;
 	int ret = 0;
 
@@ -102,7 +104,10 @@ int load_other_segments(struct kimage *image,
 	/* not allocate anything below the kernel */
 	kbuf.buf_min = kernel_load_addr + kernel_size;
 
+#ifdef CONFIG_CRASH_DUMP
 	/* load elf core header */
+	void *headers;
+	unsigned long headers_sz;
 	if (image->type == KEXEC_TYPE_CRASH) {
 		ret = prepare_elf_headers(&headers, &headers_sz);
 		if (ret) {
@@ -130,6 +135,7 @@ int load_other_segments(struct kimage *image,
 		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 	}
+#endif
 
 	/* load initrd */
 	if (initrd) {
-- 
2.41.0

