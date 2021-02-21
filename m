Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A9F320C56
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 18:53:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkCZz3tf3z3dHs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 04:52:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=rfc7uF9s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=rfc7uF9s; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DkCWB2K35z30QG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 04:49:42 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id E597020B57A3;
 Sun, 21 Feb 2021 09:49:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E597020B57A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613929780;
 bh=OunIuY3a6UzaNP21VBx43v+PHDvj8j9lvm4EchyZIGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rfc7uF9szUxAkIoP4QqLgKmwmCnK+aDA1cNKo/LtnMb9I+6tOFLlLQAGZMfB+T84p
 pmOzToQFJfdbIgdrfyiE+VWfSwB7JXosvwKTWX7DVOJyGqvV+xvnTthUKAwgWM7tee
 0Qmb9CMISe2l6HiBrc0YAK/QMCq3NJdtFMkR8sjw=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au,
 sfr@canb.auug.org.au
Subject: [PATCH v19 06/13] arm64: Use common of_kexec_alloc_and_setup_fdt()
Date: Sun, 21 Feb 2021 09:49:23 -0800
Message-Id: <20210221174930.27324-7-nramas@linux.microsoft.com>
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

From: Rob Herring <robh@kernel.org>

The code for setting up the /chosen node in the device tree
and updating the memory reservation for the next kernel has been
moved to of_kexec_alloc_and_setup_fdt() defined in "drivers/of/kexec.c".

Use the common of_kexec_alloc_and_setup_fdt() to setup the device tree
and update the memory reservation for kexec for arm64.

Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 180 ++-----------------------
 1 file changed, 8 insertions(+), 172 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 5553de3d401a..63634b4d72c1 100644
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
@@ -40,7 +29,7 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 
 int arch_kimage_file_post_load_cleanup(struct kimage *image)
 {
-	vfree(image->arch.dtb);
+	kvfree(image->arch.dtb);
 	image->arch.dtb = NULL;
 
 	vfree(image->elf_headers);
@@ -50,162 +39,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
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
-				image->elf_load_addr,
-				image->elf_headers_sz);
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
-/*
- * More space needed so that we can add initrd, bootargs, kaslr-seed,
- * rng-seed, userable-memory-range and elfcorehdr.
- */
-#define DTB_EXTRA_SPACE 0x1000
-
-static int create_dtb(struct kimage *image,
-		      unsigned long initrd_load_addr, unsigned long initrd_len,
-		      char *cmdline, void **dtb)
-{
-	void *buf;
-	size_t buf_size;
-	size_t cmdline_len;
-	int ret;
-
-	cmdline_len = cmdline ? strlen(cmdline) : 0;
-	buf_size = fdt_totalsize(initial_boot_params)
-			+ cmdline_len + DTB_EXTRA_SPACE;
-
-	for (;;) {
-		buf = vmalloc(buf_size);
-		if (!buf)
-			return -ENOMEM;
-
-		/* duplicate a device tree blob */
-		ret = fdt_open_into(initial_boot_params, buf, buf_size);
-		if (ret)
-			return -EINVAL;
-
-		ret = setup_dtb(image, initrd_load_addr, initrd_len,
-				cmdline, buf);
-		if (ret) {
-			vfree(buf);
-			if (ret == -ENOMEM) {
-				/* unlikely, but just in case */
-				buf_size += DTB_EXTRA_SPACE;
-				continue;
-			} else {
-				return ret;
-			}
-		}
-
-		/* trim it */
-		fdt_pack(buf);
-		*dtb = buf;
-
-		return 0;
-	}
-}
-
 static int prepare_elf_headers(void **addr, unsigned long *sz)
 {
 	struct crash_mem *cmem;
@@ -312,12 +145,15 @@ int load_other_segments(struct kimage *image,
 	}
 
 	/* load dtb */
-	ret = create_dtb(image, initrd_load_addr, initrd_len, cmdline, &dtb);
-	if (ret) {
+	dtb = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
+					   initrd_len, cmdline, 0);
+	if (!dtb) {
 		pr_err("Preparing for new dtb failed\n");
 		goto out_err;
 	}
 
+	/* trim it */
+	fdt_pack(dtb);
 	dtb_len = fdt_totalsize(dtb);
 	kbuf.buffer = dtb;
 	kbuf.bufsz = dtb_len;
@@ -341,6 +177,6 @@ int load_other_segments(struct kimage *image,
 
 out_err:
 	image->nr_segments = orig_segments;
-	vfree(dtb);
+	kvfree(dtb);
 	return ret;
 }
-- 
2.30.0

