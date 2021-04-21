Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066636704C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 18:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQR6w0vPZz3bcq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 02:37:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=F3yvtSkz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=F3yvtSkz; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FQR616NJlz2yhq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 02:36:57 +1000 (AEST)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9D42D20B8002;
 Wed, 21 Apr 2021 09:36:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9D42D20B8002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1619023015;
 bh=NOOpoPZXnSLmDIJujo8R5fO3CgtODufAiSEyJxKNrqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F3yvtSkzFSAEZavQuRXbomdeKOWMiTzhjItvLZeRO6oBC1Id3V4x3nGc26g93JmCX
 w+gHm/irSEGlS2EJJR2xWQb2wBohczO68u9b8xHAj/B3Q0IUwkcdroFH5yPXIOdpUJ
 yzPH1OiZgjeq4RL1Jpl3EPuKVpCWTkei3KJsImtc=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: robh@kernel.org,
	dan.carpenter@oracle.com,
	mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc: If kexec_build_elf_info() fails return
 immediately from elf64_load()
Date: Wed, 21 Apr 2021 09:36:10 -0700
Message-Id: <20210421163610.23775-2-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210421163610.23775-1-nramas@linux.microsoft.com>
References: <20210421163610.23775-1-nramas@linux.microsoft.com>
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

Uninitialized local variable "elf_info" would be passed to
kexec_free_elf_info() if kexec_build_elf_info() returns an error
in elf64_load().

If kexec_build_elf_info() returns an error, return the error
immediately.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kexec/elf_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 02662e72c53d..eeb258002d1e 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -45,7 +45,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
 	if (ret)
-		goto out;
+		return ERR_PTR(ret);
 
 	if (image->type == KEXEC_TYPE_CRASH) {
 		/* min & max buffer values for kdump case */
-- 
2.31.0

