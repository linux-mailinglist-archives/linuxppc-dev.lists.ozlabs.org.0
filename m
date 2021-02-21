Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CE320C39
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 18:51:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkCYT3GXMz3d4S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 04:51:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=OxRmZxdl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=OxRmZxdl; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DkCW85qp7z30ND
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 04:49:39 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 316B2209FACE;
 Sun, 21 Feb 2021 09:49:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 316B2209FACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613929777;
 bh=MgAdoofhEsBi9ijWTsxP8/GBNa/+wmI9q0RKTL7qSb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OxRmZxdlfJ/ULDZwTxFlrrVVojo60qJw4/YRlOTsSL/PVPMbrCtAGGTniL6WFwHX3
 Ag8qdgt19bC+IQkxpaimLQcaMDu+bA8hAcONiBXRF7FgTDCyiJaqm8sKBjhNAimVS/
 U+GXo79K8iPkqg84fJ31YOs1ec2T1gI90Fi6A10A=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au,
 sfr@canb.auug.org.au
Subject: [PATCH v19 02/13] arm64: Use ELF fields defined in 'struct kimage'
Date: Sun, 21 Feb 2021 09:49:19 -0800
Message-Id: <20210221174930.27324-3-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210221174930.27324-1-nramas@linux.microsoft.com>
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, paulus@samba.org,
 vincenzo.frascino@arm.com, frowand.list@gmail.com, sashal@kernel.org,
 masahiroy@kernel.org, jmorris@namei.org, allison@lohutok.net, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ELF related fields elf_headers, elf_headers_sz, and elf_headers_mem
have been moved from 'struct kimage_arch' to 'struct kimage' as
elf_headers, elf_headers_sz, and elf_load_addr respectively.

Use the ELF fields defined in 'struct kimage'.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Rob Herring <robh@kernel.org>
Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/arm64/include/asm/kexec.h         |  4 ----
 arch/arm64/kernel/machine_kexec_file.c | 18 +++++++++---------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index d24b527e8c00..12a561a54128 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -96,10 +96,6 @@ static inline void crash_post_resume(void) {}
 struct kimage_arch {
 	void *dtb;
 	unsigned long dtb_mem;
-	/* Core ELF header buffer */
-	void *elf_headers;
-	unsigned long elf_headers_mem;
-	unsigned long elf_headers_sz;
 };
 
 extern const struct kexec_file_ops kexec_image_ops;
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 03210f644790..5553de3d401a 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -43,9 +43,9 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	vfree(image->arch.dtb);
 	image->arch.dtb = NULL;
 
-	vfree(image->arch.elf_headers);
-	image->arch.elf_headers = NULL;
-	image->arch.elf_headers_sz = 0;
+	vfree(image->elf_headers);
+	image->elf_headers = NULL;
+	image->elf_headers_sz = 0;
 
 	return kexec_image_post_load_cleanup_default(image);
 }
@@ -73,8 +73,8 @@ static int setup_dtb(struct kimage *image,
 		/* add linux,elfcorehdr */
 		ret = fdt_appendprop_addrrange(dtb, 0, off,
 				FDT_PROP_KEXEC_ELFHDR,
-				image->arch.elf_headers_mem,
-				image->arch.elf_headers_sz);
+				image->elf_load_addr,
+				image->elf_headers_sz);
 		if (ret)
 			return (ret == -FDT_ERR_NOSPACE ? -ENOMEM : -EINVAL);
 
@@ -282,12 +282,12 @@ int load_other_segments(struct kimage *image,
 			vfree(headers);
 			goto out_err;
 		}
-		image->arch.elf_headers = headers;
-		image->arch.elf_headers_mem = kbuf.mem;
-		image->arch.elf_headers_sz = headers_sz;
+		image->elf_headers = headers;
+		image->elf_load_addr = kbuf.mem;
+		image->elf_headers_sz = headers_sz;
 
 		pr_debug("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			 image->arch.elf_headers_mem, kbuf.bufsz, kbuf.memsz);
+			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 	}
 
 	/* load initrd */
-- 
2.30.0

