Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE02F84A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:43:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVS41Gm3zDvVB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:43:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=g1gOrpmH; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DHSr80rxLzDqDJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 04:30:25 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2DABC20B6C40;
 Fri, 15 Jan 2021 09:30:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2DABC20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1610731823;
 bh=wqW3xwsp9Cq77lvYiiXd1zv1yJERqbx7C93NSrMrSUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g1gOrpmHFl0EmbB7Z+7bReFZHAYoWUSHhH5VJVISvG+ioeDmuA6FMPsPkMQ1KC65j
 xn5cOFvQfpH1gC+5g2Gw0z2qUMu+Fj2P3AQRBFBIvU/UDwvfAeGIVK6ZXLVHxxzu76
 exzT3gxLy4ioHZNgjfAkX49zWoMcKvkuBZvPOzVw=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v15 01/10] powerpc: Rename kexec elfcorehdr_addr to
 elf_headers_mem
Date: Fri, 15 Jan 2021 09:30:08 -0800
Message-Id: <20210115173017.30617-2-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115173017.30617-1-nramas@linux.microsoft.com>
References: <20210115173017.30617-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rob Herring <robh@kernel.org>

The architecture specific field, elfcorehdr_addr in struct kimage_arch,
that holds the address of the buffer in memory for ELF core header for
powerpc has a different name than the one used for arm64.  This makes
it hard to have a common code for setting up the device tree for
kexec system call.

Rename elfcorehdr_addr to elf_headers_mem to align with arm64 name so
common code can use it.

Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 arch/powerpc/include/asm/kexec.h  | 2 +-
 arch/powerpc/kexec/file_load.c    | 4 ++--
 arch/powerpc/kexec/file_load_64.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 55d6ede30c19..dbf09d2f36d0 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -108,7 +108,7 @@ struct kimage_arch {
 	unsigned long backup_start;
 	void *backup_buf;
 
-	unsigned long elfcorehdr_addr;
+	unsigned long elf_headers_mem;
 	unsigned long elf_headers_sz;
 	void *elf_headers;
 
diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
index 9a232bc36c8f..e452b11df631 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -45,7 +45,7 @@ char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 		return NULL;
 
 	elfcorehdr_strlen = sprintf(cmdline_ptr, "elfcorehdr=0x%lx ",
-				    image->arch.elfcorehdr_addr);
+				    image->arch.elf_headers_mem);
 
 	if (elfcorehdr_strlen + cmdline_len > COMMAND_LINE_SIZE) {
 		pr_err("Appending elfcorehdr=<addr> exceeds cmdline size\n");
@@ -263,7 +263,7 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 		 * Avoid elfcorehdr from being stomped on in kdump kernel by
 		 * setting up memory reserve map.
 		 */
-		ret = fdt_add_mem_rsv(fdt, image->arch.elfcorehdr_addr,
+		ret = fdt_add_mem_rsv(fdt, image->arch.elf_headers_mem,
 				      image->arch.elf_headers_sz);
 		if (ret) {
 			pr_err("Error reserving elfcorehdr memory: %s\n",
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index c69bcf9b547a..a05c19b3cc60 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -815,7 +815,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 		goto out;
 	}
 
-	image->arch.elfcorehdr_addr = kbuf->mem;
+	image->arch.elf_headers_mem = kbuf->mem;
 	image->arch.elf_headers_sz = headers_sz;
 	image->arch.elf_headers = headers;
 out:
@@ -851,7 +851,7 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 		return ret;
 	}
 	pr_debug("Loaded elf core header at 0x%lx, bufsz=0x%lx memsz=0x%lx\n",
-		 image->arch.elfcorehdr_addr, kbuf->bufsz, kbuf->memsz);
+		 image->arch.elf_headers_mem, kbuf->bufsz, kbuf->memsz);
 
 	return 0;
 }
-- 
2.30.0

