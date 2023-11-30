Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8F7FE753
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 03:44:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1r/sqq2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1r/sqq2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SggWR0kwXz3dX7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1r/sqq2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1r/sqq2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SggR106LSz3cTc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:40:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701312026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4ZlhbB4eVOuDd3XAQP5yEasxof6vyePMpXV5+f1mdM=;
	b=M1r/sqq2UWw47Xv82QLHHDo0bOVLG/zoJTB1OSEGyJpTzeo4MgA/QrWlf0pYyU0WC+ALgS
	WDUWHN4/BzoeTIx1j6d988HAL529l3WeUk7LmuQQxKZr3W7NkiNqK6U59QWGmfPginugEL
	cvlQzNizZMHFL7tkzXjfOKuKU6Jndnw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701312026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4ZlhbB4eVOuDd3XAQP5yEasxof6vyePMpXV5+f1mdM=;
	b=M1r/sqq2UWw47Xv82QLHHDo0bOVLG/zoJTB1OSEGyJpTzeo4MgA/QrWlf0pYyU0WC+ALgS
	WDUWHN4/BzoeTIx1j6d988HAL529l3WeUk7LmuQQxKZr3W7NkiNqK6U59QWGmfPginugEL
	cvlQzNizZMHFL7tkzXjfOKuKU6Jndnw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-3nWnOtmnMPOhg84PRj1Ptg-1; Wed, 29 Nov 2023 21:40:21 -0500
X-MC-Unique: 3nWnOtmnMPOhg84PRj1Ptg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83465813845;
	Thu, 30 Nov 2023 02:40:20 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE382026D4C;
	Thu, 30 Nov 2023 02:40:16 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] kexec_file, arm64: print out debugging message if required
Date: Thu, 30 Nov 2023 10:39:52 +0800
Message-ID: <20231130023955.5257-5-bhe@redhat.com>
In-Reply-To: <20231130023955.5257-1-bhe@redhat.com>
References: <20231130023955.5257-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
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
Cc: Baoquan He <bhe@redhat.com>, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
loading related codes.

And also remove the kimage->segment[] printing because the generic code
has done the printing.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/arm64/kernel/kexec_image.c        |  6 +++---
 arch/arm64/kernel/machine_kexec.c      | 26 ++++++--------------------
 arch/arm64/kernel/machine_kexec_file.c | 12 ++++++------
 3 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index 636be6715155..532d72ea42ee 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -122,9 +122,9 @@ static void *image_load(struct kimage *image,
 	kernel_segment->memsz -= text_offset;
 	image->start = kernel_segment->mem;
 
-	pr_debug("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-				kernel_segment->mem, kbuf.bufsz,
-				kernel_segment->memsz);
+	kexec_dprintk("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+		      kernel_segment->mem, kbuf.bufsz,
+		      kernel_segment->memsz);
 
 	return NULL;
 }
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 078910db77a4..b38aae5b488d 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -32,26 +32,12 @@
 static void _kexec_image_info(const char *func, int line,
 	const struct kimage *kimage)
 {
-	unsigned long i;
-
-	pr_debug("%s:%d:\n", func, line);
-	pr_debug("  kexec kimage info:\n");
-	pr_debug("    type:        %d\n", kimage->type);
-	pr_debug("    start:       %lx\n", kimage->start);
-	pr_debug("    head:        %lx\n", kimage->head);
-	pr_debug("    nr_segments: %lu\n", kimage->nr_segments);
-	pr_debug("    dtb_mem: %pa\n", &kimage->arch.dtb_mem);
-	pr_debug("    kern_reloc: %pa\n", &kimage->arch.kern_reloc);
-	pr_debug("    el2_vectors: %pa\n", &kimage->arch.el2_vectors);
-
-	for (i = 0; i < kimage->nr_segments; i++) {
-		pr_debug("      segment[%lu]: %016lx - %016lx, 0x%lx bytes, %lu pages\n",
-			i,
-			kimage->segment[i].mem,
-			kimage->segment[i].mem + kimage->segment[i].memsz,
-			kimage->segment[i].memsz,
-			kimage->segment[i].memsz /  PAGE_SIZE);
-	}
+	kexec_dprintk("%s:%d:\n", func, line);
+	kexec_dprintk("  kexec kimage info:\n");
+	kexec_dprintk("    type:        %d\n", kimage->type);
+	kexec_dprintk("    head:        %lx\n", kimage->head);
+	kexec_dprintk("    kern_reloc: %pa\n", &kimage->arch.kern_reloc);
+	kexec_dprintk("    el2_vectors: %pa\n", &kimage->arch.el2_vectors);
 }
 
 void machine_kexec_cleanup(struct kimage *kimage)
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index a11a6e14ba89..0e017358f4ba 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -127,8 +127,8 @@ int load_other_segments(struct kimage *image,
 		image->elf_load_addr = kbuf.mem;
 		image->elf_headers_sz = headers_sz;
 
-		pr_debug("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 	}
 
 	/* load initrd */
@@ -148,8 +148,8 @@ int load_other_segments(struct kimage *image,
 			goto out_err;
 		initrd_load_addr = kbuf.mem;
 
-		pr_debug("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-				initrd_load_addr, kbuf.bufsz, kbuf.memsz);
+		kexec_dprintk("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+			      initrd_load_addr, kbuf.bufsz, kbuf.memsz);
 	}
 
 	/* load dtb */
@@ -179,8 +179,8 @@ int load_other_segments(struct kimage *image,
 	image->arch.dtb = dtb;
 	image->arch.dtb_mem = kbuf.mem;
 
-	pr_debug("Loaded dtb at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			kbuf.mem, kbuf.bufsz, kbuf.memsz);
+	kexec_dprintk("Loaded dtb at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+		      kbuf.mem, kbuf.bufsz, kbuf.memsz);
 
 	return 0;
 
-- 
2.41.0

