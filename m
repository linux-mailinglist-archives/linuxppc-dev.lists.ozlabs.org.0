Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9F78FF27
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 16:27:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tTb6ATZY;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=r9L0JRZV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcgNq1XWrz3cBr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 00:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tTb6ATZY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=r9L0JRZV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcgMt6dhPz300C
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 00:27:06 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D36AA1F86C;
	Fri,  1 Sep 2023 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693578422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QETxACuLG117Ppkadvcn1KtVg/Yq0288OgnzhzA/ULk=;
	b=tTb6ATZYkM5FNNeKaXMkOL4QJI48iFJt1y+xae4e6Sni0Qo27M2NlefCoxXCM+ZPwuj5tY
	r6xiCRU9xE1ETGEIZu5/kgrkooxMs/C9oh6EIsNPIXVUeTWz4BFtm8DB8Ne72nR4yY5uHC
	CKnY5HhPDRktVXU0PL1grEur0ikDxHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693578422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QETxACuLG117Ppkadvcn1KtVg/Yq0288OgnzhzA/ULk=;
	b=r9L0JRZVYTtkWaU2SguMwkS3pjaoQE7s9J2buuvT1wa6t0fpg65RTcSNZfXNjZynX0yed+
	2ppvNK3qFb4vS+CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E69913A12;
	Fri,  1 Sep 2023 14:27:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WKLZIbb08WQGYAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 01 Sep 2023 14:27:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	arnd@arndb.de,
	deller@gmx.de
Subject: [PATCH 1/4] arch/powerpc: Remove trailing whitespaces
Date: Fri,  1 Sep 2023 16:16:33 +0200
Message-ID: <20230901142659.31787-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901142659.31787-1-tzimmermann@suse.de>
References: <20230901142659.31787-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/powerpc/include/asm/machdep.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 4f6e7d7ee388..933465ed4c43 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -10,7 +10,7 @@
 #include <linux/export.h>
 
 struct pt_regs;
-struct pci_bus;	
+struct pci_bus;
 struct device_node;
 struct iommu_table;
 struct rtc_time;
@@ -78,8 +78,8 @@ struct machdep_calls {
 	unsigned char 	(*nvram_read_val)(int addr);
 	void		(*nvram_write_val)(int addr, unsigned char val);
 	ssize_t		(*nvram_write)(char *buf, size_t count, loff_t *index);
-	ssize_t		(*nvram_read)(char *buf, size_t count, loff_t *index);	
-	ssize_t		(*nvram_size)(void);		
+	ssize_t		(*nvram_read)(char *buf, size_t count, loff_t *index);
+	ssize_t		(*nvram_size)(void);
 	void		(*nvram_sync)(void);
 
 	/* Exception handlers */
@@ -102,9 +102,9 @@ struct machdep_calls {
 	 */
 	long	 	(*feature_call)(unsigned int feature, ...);
 
-	/* Get legacy PCI/IDE interrupt mapping */ 
+	/* Get legacy PCI/IDE interrupt mapping */
 	int		(*pci_get_legacy_ide_irq)(struct pci_dev *dev, int channel);
-	
+
 	/* Get access protection for /dev/mem */
 	pgprot_t	(*phys_mem_access_prot)(struct file *file,
 						unsigned long pfn,
-- 
2.41.0

