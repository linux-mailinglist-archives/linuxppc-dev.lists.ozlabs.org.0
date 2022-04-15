Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBCA502F27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg5Zc4nLPz3bpB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 05:13:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vo9SN5UB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vo9SN5UB; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg5TV3DmRz3bdK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 05:08:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C329461BB8;
 Fri, 15 Apr 2022 19:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DE7C385A5;
 Fri, 15 Apr 2022 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650049724;
 bh=dvZpqVTi0jdBV+n0QdZhgd89O8shNTR194n0OIslFEI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vo9SN5UB5HN+TQ8PDoWan0KcngRkeZPACjXnATfZw2QPo8YV8IFEsKTgTqaUHb4Wq
 buYSTHLuV8dWUQ+yssZu4Cu0uOcBv0mjwVsDVHIh1maofvqLvYAAAy1RVEFK9yCXo+
 dPGdBtMn+DALp8LeFcJxFbSsAfDVa+Yze68PW2g0l28eXMzTI2kK5VoUBifIrHOtwZ
 1WOf86Z5OYIWDhVv4bhoKtsirQ9OaUxjNMN4e/90dC6L7vUMwinM6ndR4799Tqlo2s
 Geiv9PhbOsZgFOoijb1U7+dWqsYEaovac2mSFv5v7ZmqCiWLmIaVi+7wvIiA7CI4f6
 lLjJ23uF8IhFQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 7/7] alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO
 definitions
Date: Fri, 15 Apr 2022 14:08:17 -0500
Message-Id: <20220415190817.842864-8-helgaas@kernel.org>
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

Remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/alpha/include/asm/io.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index c9cb554fbe54..338dd24400bd 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -14,10 +14,6 @@
    the implementation we have here matches that interface.  */
 #include <asm-generic/iomap.h>
 
-/* We don't use IO slowdowns on the Alpha, but.. */
-#define __SLOW_DOWN_IO	do { } while (0)
-#define SLOW_DOWN_IO	do { } while (0)
-
 /*
  * Virtual -> physical identity mapping starts at this offset
  */
-- 
2.25.1

