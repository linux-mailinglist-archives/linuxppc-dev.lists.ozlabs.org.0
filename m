Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C810830F869
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 17:49:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWkzR5BtlzDwwc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 03:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=j/7UWShK; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DWkpy4txNzDwlq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 03:42:02 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id C8ADA20B6C43;
 Thu,  4 Feb 2021 08:42:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C8ADA20B6C43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612456921;
 bh=upyUbMa+YTHARax7qWULM32mcWawNyxMU8AwFg21ffs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j/7UWShKI0KyYOkGWzezmSMZaguORDwb9RSFDcFUuDd2nqdxMPoYhb/fWMnJhyowg
 yxFyaUblv1t+LGHiSmOLrKabqtUm2JH1aT/la3/MWjL00ebad5ARVwV+jnQYS6UF94
 HG8k0bK8oGeBVe3d7mlxi1C8ZYX5ZtoOLSfEVJnE=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v16 03/12] arm64: Use common of_kexec_setup_new_fdt()
Date: Thu,  4 Feb 2021 08:41:26 -0800
Message-Id: <20210204164135.29856-4-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204164135.29856-1-nramas@linux.microsoft.com>
References: <20210204164135.29856-1-nramas@linux.microsoft.com>
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

The code for setting up the /chosen node in the device tree
and updating the memory reservation for the next kernel has been
moved to of_kexec_setup_new_fdt() defined in "drivers/of/kexec.c".

Use the common of_kexec_setup_new_fdt() to setup the device tree
and update the memory reservation for kexec for arm64.

Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/machine_kexec_file.c | 123 +------------------------
 1 file changed, 3 insertions(+), 120 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 03210f644790..7da22bb7b9d5 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -15,23 +15,12 @@
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
-#include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
-#include <asm/byteorder.h>
-
-/* relevant device tree properties */
-#define FDT_PROP_KEXEC_ELFHDR	"linux,elfcorehdr"
-#define FDT_PROP_MEM_RANGE	"linux,usable-memory-range"
-#define FDT_PROP_INITRD_START	"linux,initrd-start"
-#define FDT_PROP_INITRD_END	"linux,initrd-end"
-#define FDT_PROP_BOOTARGS	"bootargs"
-#define FDT_PROP_KASLR_SEED	"kaslr-seed"
-#define FDT_PROP_RNG_SEED	"rng-seed"
-#define RNG_SEED_SIZE		128
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&kexec_image_ops,
@@ -50,112 +39,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-static int setup_dtb(struct kimage *image,
-		     unsigned long initrd_load_addr, unsigned long initrd_len,
-		     char *cmdline, void *dtb)
-{
-	int off, ret;
-
-	ret = fdt_path_offset(dtb, "/chosen");
-	if (ret < 0)
-		goto out;
-
-	off = ret;
-
-	ret = fdt_delprop(dtb, off, FDT_PROP_KEXEC_ELFHDR);
-	if (ret && ret != -FDT_ERR_NOTFOUND)
-		goto out;
-	ret = fdt_delprop(dtb, off, FDT_PROP_MEM_RANGE);
-	if (ret && ret != -FDT_ERR_NOTFOUND)
-		goto out;
-
-	if (image->type == KEXEC_TYPE_CRASH) {
-		/* add linux,elfcorehdr */
-		ret = fdt_appendprop_addrrange(dtb, 0, off,
-				FDT_PROP_KEXEC_ELFHDR,
-				image->arch.elf_headers_mem,
-				image->arch.elf_headers_sz);
-		if (ret)
-			return (ret == -FDT_ERR_NOSPACE ? -ENOMEM : -EINVAL);
-
-		/* add linux,usable-memory-range */
-		ret = fdt_appendprop_addrrange(dtb, 0, off,
-				FDT_PROP_MEM_RANGE,
-				crashk_res.start,
-				crashk_res.end - crashk_res.start + 1);
-		if (ret)
-			return (ret == -FDT_ERR_NOSPACE ? -ENOMEM : -EINVAL);
-	}
-
-	/* add bootargs */
-	if (cmdline) {
-		ret = fdt_setprop_string(dtb, off, FDT_PROP_BOOTARGS, cmdline);
-		if (ret)
-			goto out;
-	} else {
-		ret = fdt_delprop(dtb, off, FDT_PROP_BOOTARGS);
-		if (ret && (ret != -FDT_ERR_NOTFOUND))
-			goto out;
-	}
-
-	/* add initrd-* */
-	if (initrd_load_addr) {
-		ret = fdt_setprop_u64(dtb, off, FDT_PROP_INITRD_START,
-				      initrd_load_addr);
-		if (ret)
-			goto out;
-
-		ret = fdt_setprop_u64(dtb, off, FDT_PROP_INITRD_END,
-				      initrd_load_addr + initrd_len);
-		if (ret)
-			goto out;
-	} else {
-		ret = fdt_delprop(dtb, off, FDT_PROP_INITRD_START);
-		if (ret && (ret != -FDT_ERR_NOTFOUND))
-			goto out;
-
-		ret = fdt_delprop(dtb, off, FDT_PROP_INITRD_END);
-		if (ret && (ret != -FDT_ERR_NOTFOUND))
-			goto out;
-	}
-
-	/* add kaslr-seed */
-	ret = fdt_delprop(dtb, off, FDT_PROP_KASLR_SEED);
-	if (ret == -FDT_ERR_NOTFOUND)
-		ret = 0;
-	else if (ret)
-		goto out;
-
-	if (rng_is_initialized()) {
-		u64 seed = get_random_u64();
-		ret = fdt_setprop_u64(dtb, off, FDT_PROP_KASLR_SEED, seed);
-		if (ret)
-			goto out;
-	} else {
-		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
-				FDT_PROP_KASLR_SEED);
-	}
-
-	/* add rng-seed */
-	if (rng_is_initialized()) {
-		void *rng_seed;
-		ret = fdt_setprop_placeholder(dtb, off, FDT_PROP_RNG_SEED,
-				RNG_SEED_SIZE, &rng_seed);
-		if (ret)
-			goto out;
-		get_random_bytes(rng_seed, RNG_SEED_SIZE);
-	} else {
-		pr_notice("RNG is not initialised: omitting \"%s\" property\n",
-				FDT_PROP_RNG_SEED);
-	}
-
-out:
-	if (ret)
-		return (ret == -FDT_ERR_NOSPACE) ? -ENOMEM : -EINVAL;
-
-	return 0;
-}
-
 /*
  * More space needed so that we can add initrd, bootargs, kaslr-seed,
  * rng-seed, userable-memory-range and elfcorehdr.
@@ -185,8 +68,8 @@ static int create_dtb(struct kimage *image,
 		if (ret)
 			return -EINVAL;
 
-		ret = setup_dtb(image, initrd_load_addr, initrd_len,
-				cmdline, buf);
+		ret = of_kexec_setup_new_fdt(image, buf, initrd_load_addr,
+					     initrd_len, cmdline);
 		if (ret) {
 			vfree(buf);
 			if (ret == -ENOMEM) {
-- 
2.30.0

