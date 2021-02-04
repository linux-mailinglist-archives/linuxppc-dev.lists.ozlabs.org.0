Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56830F8E7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 18:02:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWlH41FMqzDwqN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 04:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=lCYMWduI; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DWkq32Fs6zDwqF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 03:42:07 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id C73E620B6C4A;
 Thu,  4 Feb 2021 08:42:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C73E620B6C4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612456926;
 bh=eteQoM8TsJLZTpLH4UcJUMfvK8vuu3EMwdBLJt4y9+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lCYMWduI56a6WnVybP/MH51bcFWObfPHsX3LqZ74EnxNMZrULXgh05QMEZYrNkcS5
 FwpXUdTmapdyezPwl1/M0kJpgnLz6juQecFOl7RdGUJ19OHiUL3z3XfeV+2RCTqjU2
 06x0mMRFKkbicN4XYXDoU0l5PspNBtA0z5lT+KGA=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v16 10/12] arm64: Use OF alloc and free functions for FDT
Date: Thu,  4 Feb 2021 08:41:33 -0800
Message-Id: <20210204164135.29856-11-nramas@linux.microsoft.com>
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

of_alloc_and_init_fdt() and of_free_fdt() have been defined in
drivers/of/kexec.c to allocate and free memory for FDT.

Use of_alloc_and_init_fdt() and of_free_fdt() to allocate and
initialize the FDT, and to free the FDT respectively.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/kernel/machine_kexec_file.c | 37 +++++++-------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 7da22bb7b9d5..7d6cc478f73c 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -29,7 +29,7 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 
 int arch_kimage_file_post_load_cleanup(struct kimage *image)
 {
-	vfree(image->arch.dtb);
+	of_free_fdt(image->arch.dtb);
 	image->arch.dtb = NULL;
 
 	vfree(image->arch.elf_headers);
@@ -57,36 +57,19 @@ static int create_dtb(struct kimage *image,
 	cmdline_len = cmdline ? strlen(cmdline) : 0;
 	buf_size = fdt_totalsize(initial_boot_params)
 			+ cmdline_len + DTB_EXTRA_SPACE;
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
-		ret = of_kexec_setup_new_fdt(image, buf, initrd_load_addr,
+	buf = of_alloc_and_init_fdt(buf_size);
+	if (!buf)
+		return -ENOMEM;
+	ret = of_kexec_setup_new_fdt(image, buf, initrd_load_addr,
 					     initrd_len, cmdline);
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
+	if (!ret) {
 		/* trim it */
 		fdt_pack(buf);
 		*dtb = buf;
+	} else
+		of_free_fdt(buf);
 
-		return 0;
-	}
+	return ret;
 }
 
 static int prepare_elf_headers(void **addr, unsigned long *sz)
@@ -224,6 +207,6 @@ int load_other_segments(struct kimage *image,
 
 out_err:
 	image->nr_segments = orig_segments;
-	vfree(dtb);
+	of_free_fdt(dtb);
 	return ret;
 }
-- 
2.30.0

