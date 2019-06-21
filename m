Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5744E018
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:38:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VSCB5nDbzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:38:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.132; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0132.hostedemail.com
 [216.40.44.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VS9L3ClbzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 15:36:37 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 63F0D182CED2A;
 Fri, 21 Jun 2019 05:36:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::,
 RULES_HIT:41:355:379:800:960:968:973:988:989:1260:1277:1311:1313:1314:1345:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2895:3138:3139:3140:3141:3142:3354:3865:3866:3867:3868:3870:4419:4605:5007:6119:7903:8556:8603:9036:10004:10400:10848:11026:11473:11657:11658:11914:12043:12296:12297:12438:12555:12760:13255:13439:14181:14394:14659:14721:21080:21451:21627:30054:30070,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: crow71_38f2c0aecdf16
X-Filterd-Recvd-Size: 3741
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Fri, 21 Jun 2019 05:36:31 +0000 (UTC)
Message-ID: <df3a7ca31d2002ca447ab062f5b5e32ced9bec85.camel@perches.com>
Subject: [PATCH] powerpc/powernv: Rename pe_level_printk to pe_printk and
 embed KERN_LEVEL in format
From: Joe Perches <joe@perches.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 20 Jun 2019 22:36:29 -0700
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the separate KERN_<LEVEL> from each pe_level_printk and
instead add the KERN_<LEVEL> to the format.

pfix in pe_level_printk could also be used uninitialized so
add a new else and set pfx to the hex value of pe->flags.

Rename pe_level_printk to pe_printk and update the pe_<level>
macros.

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 14 ++++++++++++--
 arch/powerpc/platforms/powernv/pci.h      | 11 +++++------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 10cc42b9e541..60fc36ae626a 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -50,15 +50,23 @@
 static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
 					      "NPU_OCAPI" };
 
-void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
-			    const char *fmt, ...)
+void pe_printk(const struct pnv_ioda_pe *pe, const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list args;
 	char pfix[32];
+	char level[PRINTK_MAX_SINGLE_HEADER_LEN + 1] = "\0";
 
 	va_start(args, fmt);
 
+	while (printk_get_level(fmt)) {
+		size_t size = printk_skip_level(fmt) - fmt;
+
+		memcpy(level, fmt,  size);
+		level[size] = '\0';
+		fmt += size;
+	}
+
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
@@ -74,6 +82,8 @@ void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 			(pe->rid & 0xff00) >> 8,
 			PCI_SLOT(pe->rid), PCI_FUNC(pe->rid));
 #endif /* CONFIG_PCI_IOV*/
+	else
+		sprintf(pfix, "(flags: 0x%lx)", pe->flags);
 
 	printk("%spci %s: [PE# %.2x] %pV",
 	       level, pfix, pe->pe_number, &vaf);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index be26ab3d99e0..870b21f55b3f 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -205,15 +205,14 @@ extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
 		__u64 window_size, __u32 levels);
 extern int pnv_eeh_post_init(void);
 
-__printf(3, 4)
-extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
-			    const char *fmt, ...);
+__printf(2, 3)
+extern void pe_printk(const struct pnv_ioda_pe *pe, const char *fmt, ...);
 #define pe_err(pe, fmt, ...)					\
-	pe_level_printk(pe, KERN_ERR, fmt, ##__VA_ARGS__)
+	pe_printk(pe, KERN_ERR fmt, ##__VA_ARGS__)
 #define pe_warn(pe, fmt, ...)					\
-	pe_level_printk(pe, KERN_WARNING, fmt, ##__VA_ARGS__)
+	pe_printk(pe, KERN_WARNING fmt, ##__VA_ARGS__)
 #define pe_info(pe, fmt, ...)					\
-	pe_level_printk(pe, KERN_INFO, fmt, ##__VA_ARGS__)
+	pe_printk(pe, KERN_INFO fmt, ##__VA_ARGS__)
 
 /* Nvlink functions */
 extern void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool bypass);


