Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5300A6A031B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 08:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMkWM1xlzz3cfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:03:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eAa/AbRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eAa/AbRr;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMkTP2n8mz3c72
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 18:01:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=RvTZWKKLUKmH7kChhctBVFCNZXalhVpIiuRG6cu695g=; b=eAa/AbRr9OPxEuPgPTZYHiarGI
	4qM+4bn6VEo//HbDovWuJ6uM+xBT2IjD12xaYw6W2X7nfA3RVb11/wPR5pOEI/iQ+xEnIHU6XvByF
	ofGJpRGRY3gZFwPeL2mnv1FF+lJRZoD+Dxky+z2SOEjd2h1E7XQ5wT+jHxRwGmLqp6Wq8SYm8kco8
	bNg3TNb4aDdg9yj8yUi9e3JdXU0v1PRqBg9CioH+AY1ahJFXnwrmPcAFN0KFk1YkoathJ7KCNJID6
	hJDRjfjuIroAFEOt744Mq3kn8NSWduDzaTvXQppXEhgfNdOlJ48mfrpP4Q15bkDyHMdH1McyqyApq
	DiHJw91A==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5bT-00FMG2-CG; Thu, 23 Feb 2023 07:01:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] powerpc: wii: fix resource printk format warnings
Date: Wed, 22 Feb 2023 23:01:14 -0800
Message-Id: <20230223070116.660-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223070116.660-1-rdunlap@infradead.org>
References: <20230223070116.660-1-rdunlap@infradead.org>
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
Cc: Albert Herranz <albert_herranz@yahoo.es>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use "%pa" format specifier for resource_size_t to avoid compiler
printk format warnings.

../arch/powerpc/platforms/embedded6xx/flipper-pic.c: In function 'flipper_pic_init':
../include/linux/kern_levels.h:5:25: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]
../arch/powerpc/platforms/embedded6xx/flipper-pic.c:148:9: note: in expansion of macro 'pr_info'
  148 |         pr_info("controller at 0x%08x mapped to 0x%p\n", res.start, io_base);
      |         ^~~~~~~

../arch/powerpc/platforms/embedded6xx/hlwd-pic.c: In function 'hlwd_pic_init':
../include/linux/kern_levels.h:5:25: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]
../arch/powerpc/platforms/embedded6xx/hlwd-pic.c:174:9: note: in expansion of macro 'pr_info'
  174 |         pr_info("controller at 0x%08x mapped to 0x%p\n", res.start, io_base);
      |         ^~~~~~~

../arch/powerpc/platforms/embedded6xx/wii.c: In function 'wii_ioremap_hw_regs':
../include/linux/kern_levels.h:5:25: error: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]
../arch/powerpc/platforms/embedded6xx/wii.c:77:17: note: in expansion of macro 'pr_info'
   77 |                 pr_info("%s at 0x%08x mapped to 0x%p\n", name,
      |                 ^~~~~~~

Fixes: 028ee972f032 ("powerpc: gamecube/wii: flipper interrupt controller support")
Fixes: 9c21025c7845 ("powerpc: wii: hollywood interrupt controller support")
Fixes: 5a7ee3198dfa ("powerpc: wii: platform support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Herranz <albert_herranz@yahoo.es>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/embedded6xx/flipper-pic.c |    2 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c    |    2 +-
 arch/powerpc/platforms/embedded6xx/wii.c         |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff -- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
--- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
@@ -145,7 +145,7 @@ static struct irq_domain * __init flippe
 	}
 	io_base = ioremap(res.start, resource_size(&res));
 
-	pr_info("controller at 0x%08x mapped to 0x%p\n", res.start, io_base);
+	pr_info("controller at 0x%pa mapped to 0x%p\n", &res.start, io_base);
 
 	__flipper_quiesce(io_base);
 
diff -- a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -74,8 +74,8 @@ static void __iomem *__init wii_ioremap_
 
 	hw_regs = ioremap(res.start, resource_size(&res));
 	if (hw_regs) {
-		pr_info("%s at 0x%08x mapped to 0x%p\n", name,
-			res.start, hw_regs);
+		pr_info("%s at 0x%pa mapped to 0x%p\n", name,
+			&res.start, hw_regs);
 	}
 
 out_put:
diff -- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -171,7 +171,7 @@ static struct irq_domain *__init hlwd_pi
 		return NULL;
 	}
 
-	pr_info("controller at 0x%08x mapped to 0x%p\n", res.start, io_base);
+	pr_info("controller at 0x%pa mapped to 0x%p\n", &res.start, io_base);
 
 	__hlwd_quiesce(io_base);
 
