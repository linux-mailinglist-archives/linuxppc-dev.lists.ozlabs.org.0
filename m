Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB06A0321
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 08:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMkYW6YXWz3cM1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:05:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E0B4Od0+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E0B4Od0+;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMkTh4rWwz3cMk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 18:01:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=gOBRECxsXsY6lxgL+yYcrF7OI+VSzF/GHUkcveTa3Y4=; b=E0B4Od0+YUf0HMfrRW98qlx/Pm
	bb0bbRFi23gnlkWdNNS2iWUUGZDCUJmZihFuZAgTskDBIJs4+pbqICdR6W7CuIejiUX4LpfBs8ntm
	hnOQpJXi12b86slXUf3V4N6UpnD09KoKmzvmUYgN782NjTfa9wICrkCje6gA+Mwl+RCrJEPR3tcc0
	oJkqTZxrilBCEj5gVaoYksy2v8eBTJsWptkjvwAdrvUAvKZQXQOqQCsm3bLVrrC7qdhYS2l8iS8TC
	on0CPSFOJRJnB0jbO/oQ7+pnbX1nn1juZLlrhLV1Fw09wtcqBVzSmHn0Ihjxd7pDWcZDWdmMXvxr9
	47fFimUw==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5bU-00FMG2-5G; Thu, 23 Feb 2023 07:01:20 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] POWERPC: sysdev/tsi108: fix resource printk format warnings
Date: Wed, 22 Feb 2023 23:01:16 -0800
Message-Id: <20230223070116.660-5-rdunlap@infradead.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Alexandre Bounine <alexandreb@tundra.com>, Roy Zang <tie-fei.zang@freescale.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use "%pa" format specifier for resource_size_t to avoid a compiler
printk format warning.

../arch/powerpc/sysdev/tsi108_pci.c: In function 'tsi108_setup_pci':
../include/linux/kern_levels.h:5:25: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]

Fixes: c4342ff92bed ("[POWERPC] Update mpc7448hpc2 board irq support using device tree")
Fixes: 2b9d7467a6db ("[POWERPC] Add tsi108 pci and platform device data register function")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Roy Zang <tie-fei.zang@freescale.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Alexandre Bounine <alexandreb@tundra.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/sysdev/tsi108_pci.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -217,9 +217,9 @@ int __init tsi108_setup_pci(struct devic
 
 	(hose)->ops = &tsi108_direct_pci_ops;
 
-	printk(KERN_INFO "Found tsi108 PCI host bridge at 0x%08x. "
+	printk(KERN_INFO "Found tsi108 PCI host bridge at 0x%pa. "
 	       "Firmware bus number: %d->%d\n",
-	       rsrc.start, hose->first_busno, hose->last_busno);
+	       &rsrc.start, hose->first_busno, hose->last_busno);
 
 	/* Interpret the "ranges" property */
 	/* This also maps the I/O region and sets isa_io/mem_base */
