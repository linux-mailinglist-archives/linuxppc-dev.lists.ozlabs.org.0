Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BADA7EB3E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 16:38:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2hZ4o5g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2hZ4o5g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV9S907Vtz3vn8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 02:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2hZ4o5g;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2hZ4o5g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV9LV1SM8z300v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 02:33:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699976014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddYSvqzlkNogyoNHz/ZYeptUXFMRcqTi26tdLDKHB50=;
	b=E2hZ4o5gt3uVAUH2ewufoRB7WsImy9pPkyDWddZN8EEfXmk5knxqx6+UFFl9RpahxdoNOJ
	g6E1jDZB3wTwhP4NWSwdVTTRH4zgsxyPGPzpbqPjNtjax3GWPv+zZY4eFkV+UAP+TmzwvF
	JTkSiqWO6un9Mr75aWyaEcLCAjgr0ik=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699976014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddYSvqzlkNogyoNHz/ZYeptUXFMRcqTi26tdLDKHB50=;
	b=E2hZ4o5gt3uVAUH2ewufoRB7WsImy9pPkyDWddZN8EEfXmk5knxqx6+UFFl9RpahxdoNOJ
	g6E1jDZB3wTwhP4NWSwdVTTRH4zgsxyPGPzpbqPjNtjax3GWPv+zZY4eFkV+UAP+TmzwvF
	JTkSiqWO6un9Mr75aWyaEcLCAjgr0ik=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-pAIkPdirOI-3O8elS13Yww-1; Tue,
 14 Nov 2023 10:33:30 -0500
X-MC-Unique: pAIkPdirOI-3O8elS13Yww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43FF838143BC;
	Tue, 14 Nov 2023 15:33:22 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0F11C060B5;
	Tue, 14 Nov 2023 15:33:18 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] kexec_file, power: print out debugging message if required
Date: Tue, 14 Nov 2023 23:32:52 +0800
Message-ID: <20231114153253.241262-7-bhe@redhat.com>
In-Reply-To: <20231114153253.241262-1-bhe@redhat.com>
References: <20231114153253.241262-1-bhe@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
loading related codes.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/kexec/elf_64.c       |  8 ++++----
 arch/powerpc/kexec/file_load_64.c | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index eeb258002d1e..904016cf89ea 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -59,7 +59,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 
-	pr_debug("Loaded the kernel at 0x%lx\n", kernel_load_addr);
+	kexec_dprintk("Loaded the kernel at 0x%lx\n", kernel_load_addr);
 
 	ret = kexec_load_purgatory(image, &pbuf);
 	if (ret) {
@@ -67,7 +67,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		goto out;
 	}
 
-	pr_debug("Loaded purgatory at 0x%lx\n", pbuf.mem);
+	kexec_dprintk("Loaded purgatory at 0x%lx\n", pbuf.mem);
 
 	/* Load additional segments needed for panic kernel */
 	if (image->type == KEXEC_TYPE_CRASH) {
@@ -99,7 +99,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 			goto out;
 		initrd_load_addr = kbuf.mem;
 
-		pr_debug("Loaded initrd at 0x%lx\n", initrd_load_addr);
+		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_load_addr);
 	}
 
 	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
@@ -132,7 +132,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	fdt_load_addr = kbuf.mem;
 
-	pr_debug("Loaded device tree at 0x%lx\n", fdt_load_addr);
+	kexec_dprintk("Loaded device tree at 0x%lx\n", fdt_load_addr);
 
 	slave_code = elf_info.buffer + elf_info.proghdrs[0].p_offset;
 	ret = setup_purgatory_ppc64(image, slave_code, fdt, kernel_load_addr,
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 961a6dd67365..45089f53f875 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -577,7 +577,7 @@ static int add_usable_mem_property(void *fdt, struct device_node *dn,
 		       NODE_PATH_LEN, dn);
 		return -EOVERFLOW;
 	}
-	pr_debug("Memory node path: %s\n", path);
+	kexec_dprintk("Memory node path: %s\n", path);
 
 	/* Now that we know the path, find its offset in kdump kernel's fdt */
 	node = fdt_path_offset(fdt, path);
@@ -590,8 +590,8 @@ static int add_usable_mem_property(void *fdt, struct device_node *dn,
 	/* Get the address & size cells */
 	n_mem_addr_cells = of_n_addr_cells(dn);
 	n_mem_size_cells = of_n_size_cells(dn);
-	pr_debug("address cells: %d, size cells: %d\n", n_mem_addr_cells,
-		 n_mem_size_cells);
+	kexec_dprintk("address cells: %d, size cells: %d\n", n_mem_addr_cells,
+		      n_mem_size_cells);
 
 	um_info->idx  = 0;
 	if (!check_realloc_usable_mem(um_info, 2)) {
@@ -664,7 +664,7 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
 
 	node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
 	if (node == -FDT_ERR_NOTFOUND)
-		pr_debug("No dynamic reconfiguration memory found\n");
+		kexec_dprintk("No dynamic reconfiguration memory found\n");
 	else if (node < 0) {
 		pr_err("Malformed device tree: error reading /ibm,dynamic-reconfiguration-memory.\n");
 		return -EINVAL;
@@ -776,7 +776,7 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		if (phdr->p_paddr == BACKUP_SRC_START) {
 			phdr->p_offset = image->arch.backup_start;
-			pr_debug("Backup region offset updated to 0x%lx\n",
+			kexec_dprintk("Backup region offset updated to 0x%lx\n",
 				 image->arch.backup_start);
 			return;
 		}
@@ -850,7 +850,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 		pr_err("Failed to load backup segment\n");
 		return ret;
 	}
-	pr_debug("Loaded the backup region at 0x%lx\n", kbuf->mem);
+	kexec_dprintk("Loaded the backup region at 0x%lx\n", kbuf->mem);
 
 	/* Load elfcorehdr segment - to export crashing kernel's vmcore */
 	ret = load_elfcorehdr_segment(image, kbuf);
@@ -858,7 +858,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 		pr_err("Failed to load elfcorehdr segment\n");
 		return ret;
 	}
-	pr_debug("Loaded elf core header at 0x%lx, bufsz=0x%lx memsz=0x%lx\n",
+	kexec_dprintk("Loaded elf core header at 0x%lx, bufsz=0x%lx memsz=0x%lx\n",
 		 image->elf_load_addr, kbuf->bufsz, kbuf->memsz);
 
 	return 0;
-- 
2.41.0

