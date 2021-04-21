Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32FB36704B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 18:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQR6T46zbz309k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 02:37:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Yb8oEHyS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=Yb8oEHyS; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FQR616Rr4z2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 02:36:57 +1000 (AEST)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4D40720B8001;
 Wed, 21 Apr 2021 09:36:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4D40720B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1619023015;
 bh=W/WrYxxnKEKrs3E4gMvZTNUBttn6ZQvvtZcnC/gDa8g=;
 h=From:To:Cc:Subject:Date:From;
 b=Yb8oEHySdpd8BsyUBXdOGGUt1kIqBGYostq3b4avONLdDKWvBvB+vNSCuMA2VtPJN
 k11FCr3+szgrv2dQCPzTflc+yHBLgGqJG+kBUsKfq2c5Nk/g9nKrqpet3kQpDxTaO9
 gqd5OdqndNbNHh7x/+bt7SaxqQQpPwEr79lwlU90=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: robh@kernel.org,
	dan.carpenter@oracle.com,
	mpe@ellerman.id.au
Subject: [PATCH v2 1/2] powerpc: Free fdt on error in elf64_load()
Date: Wed, 21 Apr 2021 09:36:09 -0700
Message-Id: <20210421163610.23775-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.31.0
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 nramas@linux.microsoft.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are a few "goto out;" statements before the local variable "fdt"
is initialized through the call to of_kexec_alloc_and_setup_fdt() in
elf64_load().  This will result in an uninitialized "fdt" being passed
to kvfree() in this function if there is an error before the call to
of_kexec_alloc_and_setup_fdt().

If there is any error after fdt is allocated, but before it is
saved in the arch specific kimage struct, free the fdt.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 arch/powerpc/kexec/elf_64.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 5a569bb51349..02662e72c53d 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
 				  initrd_len, cmdline);
 	if (ret)
-		goto out;
+		goto out_free_fdt;
 
 	fdt_pack(fdt);
 
@@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
-		goto out;
+		goto out_free_fdt;
 
 	/* FDT will be freed in arch_kimage_file_post_load_cleanup */
 	image->arch.fdt = fdt;
@@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		pr_err("Error setting up the purgatory.\n");
 
+	goto out;
+
+out_free_fdt:
+	kvfree(fdt);
 out:
 	kfree(modified_cmdline);
 	kexec_free_elf_info(&elf_info);
 
-	/*
-	 * Once FDT buffer has been successfully passed to kexec_add_buffer(),
-	 * the FDT buffer address is saved in image->arch.fdt. In that case,
-	 * the memory cannot be freed here in case of any other error.
-	 */
-	if (ret && !image->arch.fdt)
-		kvfree(fdt);
-
 	return ret ? ERR_PTR(ret) : NULL;
 }
 
-- 
2.31.0

