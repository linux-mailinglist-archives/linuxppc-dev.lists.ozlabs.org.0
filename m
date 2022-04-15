Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A83502F08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg5VY4fjrz3bft
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 05:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BIaQqTWU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BIaQqTWU; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg5TK08yqz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 05:08:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3722C61BAA;
 Fri, 15 Apr 2022 19:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEFAC385A8;
 Fri, 15 Apr 2022 19:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650049714;
 bh=Il4WOHfjx/Jfo7X5I2JM0pjBeqxepMTlwqwf2vBZu9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BIaQqTWUSmUIyzdX/NKHSU6Az27xEK3K875mXeTynF5kMb6mqDjraYWkSgFexmcwS
 ooKPHsD8YdVIH5ScRxt2oSOLc2QynC69e8ygkGurUcLF1vNe0jGZwP7eZSHZfRHq+Z
 stAGCZb9Dx0jT7dcxefaMgZd4vk/pfJ1OHW5AojnYMNwlA7P2pAA77c+Eicfl2UCjU
 8I+dFmzAXrdJKKfzi3PrAA5iPpYEBRhPxypV56R6KLW5bLAgZomPKpqVzrdHFVbXJ8
 jIKGNm/bIGsE8RQPPT41a9ICdf8YjIcdvGZQj6fzluT4dIkIoEcheJCTKWbNOoCST3
 G4RiggVXkGGAg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 2/7] net: wan: lmc: remove unused DELAY()
Date: Fri, 15 Apr 2022 14:08:12 -0500
Message-Id: <20220415190817.842864-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

lmc_var.h is included only by files in drivers/net/wan/lmc/, and none of
them uses DELAY().  Remove the unused definition and related comments.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/net/wan/lmc/lmc_main.c | 8 --------
 drivers/net/wan/lmc/lmc_var.h  | 8 --------
 2 files changed, 16 deletions(-)

diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_main.c
index 76c6b4f89890..45b2d25782ed 100644
--- a/drivers/net/wan/lmc/lmc_main.c
+++ b/drivers/net/wan/lmc/lmc_main.c
@@ -1669,21 +1669,17 @@ unsigned lmc_mii_readreg (lmc_softc_t * const sc, unsigned devaddr, unsigned reg
 
         LMC_CSR_WRITE (sc, csr_9, dataval);
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
         LMC_CSR_WRITE (sc, csr_9, dataval | 0x10000);
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
     }
 
     for (i = 19; i > 0; i--)
     {
         LMC_CSR_WRITE (sc, csr_9, 0x40000);
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
         retval = (retval << 1) | ((LMC_CSR_READ (sc, csr_9) & 0x80000) ? 1 : 0);
         LMC_CSR_WRITE (sc, csr_9, 0x40000 | 0x10000);
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
     }
 
     return (retval >> 1) & 0xffff;
@@ -1708,10 +1704,8 @@ void lmc_mii_writereg (lmc_softc_t * const sc, unsigned devaddr, unsigned regno,
 
         LMC_CSR_WRITE (sc, csr_9, datav);
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
         LMC_CSR_WRITE (sc, csr_9, (datav | 0x10000));
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
         i--;
     }
 
@@ -1720,10 +1714,8 @@ void lmc_mii_writereg (lmc_softc_t * const sc, unsigned devaddr, unsigned regno,
     {
         LMC_CSR_WRITE (sc, csr_9, 0x40000);
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
         LMC_CSR_WRITE (sc, csr_9, 0x50000);
         lmc_delay ();
-        /* __SLOW_DOWN_IO; */
         i--;
     }
 }
diff --git a/drivers/net/wan/lmc/lmc_var.h b/drivers/net/wan/lmc/lmc_var.h
index 99f0aa787a35..cf824bb1932c 100644
--- a/drivers/net/wan/lmc/lmc_var.h
+++ b/drivers/net/wan/lmc/lmc_var.h
@@ -44,14 +44,6 @@ typedef struct lmc___ctl lmc_ctl_t;
 #define LMC_CSR_WRITE(sc, reg, val) \
 	outl((val), (sc)->lmc_csrs.reg)
 
-//#ifdef _LINUX_DELAY_H
-//	#define SLOW_DOWN_IO udelay(2);
-//	#undef __SLOW_DOWN_IO
-//	#define __SLOW_DOWN_IO udelay(2);
-//#endif
-
-#define DELAY(n) SLOW_DOWN_IO
-
 #define lmc_delay() inl(sc->lmc_csrs.csr_9)
 
 /* This macro sync's up with the mii so that reads and writes can take place */
-- 
2.25.1

