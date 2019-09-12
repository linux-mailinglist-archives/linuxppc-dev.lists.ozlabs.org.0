Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30454B10C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 16:12:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tggd3g80zF4WP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 00:11:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="aXEScg1F"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TgBC1lNrzF2DY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 23:49:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Tg9z2Nmwz9tyn3;
 Thu, 12 Sep 2019 15:49:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aXEScg1F; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Yf2tTHIzP6K1; Thu, 12 Sep 2019 15:49:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Tg9z1L1Nz9tyn0;
 Thu, 12 Sep 2019 15:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568296183; bh=KU6AEUzEcWurX6mbJ0LIIhHMpx0GSfPDvF/i/o76nqg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=aXEScg1FLqxUKEbEWgWFiv2fc6vmxCKLtKSWvFvLtZc6rlWIeDCgRoqlBGxdpUj/N
 BkDCF1SFxM/9MF9jHAt9XE4dnHhb8fQ9CFE1USfDeHsODwhCPdr8KMAiJ3ayV37M7C
 UoBjoktMUeLie6kOllNR4bIr3THcqvu11L55P7LQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF1BF8B93B;
 Thu, 12 Sep 2019 15:49:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eyoByRudMvqj; Thu, 12 Sep 2019 15:49:44 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C59E8B933;
 Thu, 12 Sep 2019 15:49:44 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5EE826B736; Thu, 12 Sep 2019 13:49:44 +0000 (UTC)
Message-Id: <b4f03a68ee8e68773c8973d74ec35f9c82c72871.1568295907.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1568295907.git.christophe.leroy@c-s.fr>
References: <cover.1568295907.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 4/4] powerpc/ioremap: warn on early use of ioremap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, hch@infradead.org
Date: Thu, 12 Sep 2019 13:49:44 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc now has EARLY_IOREMAP.

Next step is to convert all early users of ioremap() to
early_ioremap().

Add a warning to help locate those users.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/ioremap_32.c | 1 +
 arch/powerpc/mm/ioremap_64.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/powerpc/mm/ioremap_32.c b/arch/powerpc/mm/ioremap_32.c
index f36121f25243..743e11384dea 100644
--- a/arch/powerpc/mm/ioremap_32.c
+++ b/arch/powerpc/mm/ioremap_32.c
@@ -68,6 +68,7 @@ __ioremap_caller(phys_addr_t addr, unsigned long size, pgprot_t prot, void *call
 	/*
 	 * Should check if it is a candidate for a BAT mapping
 	 */
+	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", caller);
 
 	err = early_ioremap_range(ioremap_bot - size, p, size, prot);
 	if (err)
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index fd29e51700cd..50a99d9684f7 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -81,6 +81,8 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 	if (slab_is_available())
 		return do_ioremap(paligned, offset, size, prot, caller);
 
+	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", caller);
+
 	err = early_ioremap_range(ioremap_bot, paligned, size, prot);
 	if (err)
 		return NULL;
-- 
2.13.3

