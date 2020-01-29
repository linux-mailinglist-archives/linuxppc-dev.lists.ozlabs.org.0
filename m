Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852714C498
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 03:24:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486nP05G36zDqNF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 13:24:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=HiK2hrsv; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486nM10HGxzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 13:22:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+CE8mp2Rr5HeMLluWpwO7UyXkNtMzBCYrgXY0PLcaLQ=; b=HiK2hrsv+ajN983SGqegYUvif
 7t3rc3r0IXDuAj61ADNTag71hYH2ZyKOC7kimfKjquhBjDyOFoQuH5ljcaf0UiWkIyLTr/RmRtOo4
 j35UhSOKPYWn0ZgzQz2t8RfCpw35SS+4yeRQfdJ/JJdXhwb97nmooZzbqRxS+K/Lt2xSy45uK9RBI
 noZ8gNX2H0rYR7T2bbmDanCgITdyVAaEIXtBdtAjRT5qfqDBeQ06yrUu7Ui6lzrogBI7zwgttlO24
 VnWAbS+l7MNrChWTRPHRQjiotTuJbifFn96REmyzp2Xjx2ncp6EUjz/MpH7L0k8N5S1SeS4FZUOJl
 6FpBMWqBQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwczr-000759-KG; Wed, 29 Jan 2020 02:22:27 +0000
To: PowerPC <linuxppc-dev@lists.ozlabs.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH RESEND] powerpc: indent to improve Kconfig readability
Message-ID: <ff8729c1-3a4b-c720-48ba-a1a42b0ef892@infradead.org>
Date: Tue, 28 Jan 2020 18:22:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Randy Dunlap <rdunlap@infradead.org>

Indent a Kconfig continuation line to improve readability.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200128.orig/arch/powerpc/Kconfig
+++ linux-next-20200128/arch/powerpc/Kconfig
@@ -478,7 +478,7 @@ config MPROFILE_KERNEL
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
 	depends on SMP && (PPC_PSERIES || \
-	PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
+		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
 	help
 	  Say Y here to be able to disable and re-enable individual
 	  CPUs at runtime on SMP machines.

