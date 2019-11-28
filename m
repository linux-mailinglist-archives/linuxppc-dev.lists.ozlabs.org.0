Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AE310CFB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 23:17:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PBp621jRzDqpq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 09:17:18 +1100 (AEDT)
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
 header.b="tmQp5wnT"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PBm455F1zDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 09:15:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rmRUtPnTkDB7MMMSX+Pg3FQnxoj0xM1T/bjH9Ur7AE0=; b=tmQp5wnTuPbE0UHsfBxTWLp4Q
 bAzRUzj4GhmIa6ew+98NhsHKIx+/3nAb612ar9abSnQ+dFQpTjZNrEAxy84/gn4xDjoFbY5vo2kp7
 ugxqvt0/BVAfhv2DjCRvicdbkXEGwvYGjUbNirWt0veBV2vKw1sq9WRS1Gn/6Lp0RffBjv8G8E9pm
 zVyiLMFoyo6lK1X5zkmfrFUu2AAQtT6LPtZS9DatPwYMFVg+w1+WSer/fgGe7qE8Gy1vBIhsqgGv5
 t/01FTg1HWtOkPHvAiSvIiT4AZE5hqeu52U+BMqWtIRmMxiB4BNcFBHcFxhFCDdYTB19OuCHeLTHJ
 o/kUbB/AQ==;
Received: from [2601:1c0:6280:3f0::5a22]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaS4I-00010g-CK; Thu, 28 Nov 2019 22:15:22 +0000
To: PowerPC <linuxppc-dev@lists.ozlabs.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] powerpc: indent Kconfig depends continuation line
Message-ID: <5a23ee8f-6b26-7d76-c7db-8cbbe4e68102@infradead.org>
Date: Thu, 28 Nov 2019 14:15:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
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

--- lnx-54.orig/arch/powerpc/Kconfig
+++ lnx-54/arch/powerpc/Kconfig
@@ -468,7 +468,7 @@ config MPROFILE_KERNEL
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
 	depends on SMP && (PPC_PSERIES || \
-	PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
+		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
 	help
 	  Say Y here to be able to disable and re-enable individual
 	  CPUs at runtime on SMP machines.

