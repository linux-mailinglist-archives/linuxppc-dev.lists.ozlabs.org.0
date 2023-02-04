Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F2468ABA0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 18:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8K9Q0G8kz3f4w
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 04:23:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d2l1OHMR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d2l1OHMR;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8K8R1ZZTz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 04:22:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=8OAKmxWIEzbaWOmDMgmo8UdlEP+FyQwFTksNrLzmP30=; b=d2l1OHMR3M4pCRMdi/vvI2Gstn
	yjCGH+H5nrhmlUMM5c2mw5g1pk+vhIhM8GXEIQ+A6BTwWjmHMCqeUYii87rnz7KKPTkT1DUiVBzBE
	bn46r8bmml+5bgK865xdihdfEaDElGiANbAam2VC76DXSbIfv1+ZpIFac6bsnDRUrDB6QZMXbok1F
	rdZaM1yRMGz7/Ehc4MPsuOZOOE+MGk0EI8YP5GYNYKUbE8FoWjlm/t+2pem1Rkw6/EwfeGPnSPiMw
	zmoPwW5KYw8EP8ysLNdWDAmfIFsfPl+7TRv5MBp9bwXqIowTnBiejB4G+EkMCGzOHMIJutAdyci1K
	kPxQHKyw==;
Received: from [2601:1c2:d00:6a60::9526] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOMEp-005RDq-OO; Sat, 04 Feb 2023 17:22:07 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/kexec_file: fix implicit decl error
Date: Sat,  4 Feb 2023 09:22:06 -0800
Message-Id: <20230204172206.7662-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kexec (PPC64) code calls memory_hotplug_max(). Add the header declaration
for it from <asm/mmzone.h>. Using <linux/mmzone.h> does not work since
the #include for <asm/mmzone.h> depends on CONFIG_NUMA=y, which is not
set in this kernel config file.

Fixes this build error/warning:

../arch/powerpc/kexec/file_load_64.c: In function 'kexec_extra_fdt_size_ppc64':
../arch/powerpc/kexec/file_load_64.c:993:33: error: implicit declaration of function 'memory_hotplug_max' [-Werror=implicit-function-declaration]
  993 |                 usm_entries = ((memory_hotplug_max() / drmem_lmb_size()) +
      |                                 ^~~~~~~~~~~~~~~~~~

Fixes: fc546faa5595 ("powerpc/kexec_file: Count hot-pluggable memory in FDT estimate")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kexec/file_load_64.c |    1 +
 1 file changed, 1 insertion(+)

diff -- a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -26,6 +26,7 @@
 #include <asm/firmware.h>
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
+#include <asm/mmzone.h>
 #include <asm/prom.h>
 
 struct umem_info {
