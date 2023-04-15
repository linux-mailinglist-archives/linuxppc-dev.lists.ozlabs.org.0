Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F36F171B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 14:03:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7B7m5j4Wz3fWN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 22:03:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=OzkmcOKu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=skinsburskii@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=OzkmcOKu;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6jkT6blrz3cRW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 03:42:57 +1000 (AEST)
Received: from skinsburskii.localdomain (c-67-170-100-148.hsd1.wa.comcast.net [67.170.100.148])
	by linux.microsoft.com (Postfix) with ESMTPSA id BE5D621C33DF;
	Thu, 27 Apr 2023 10:42:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BE5D621C33DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1682617346;
	bh=lbHi5s+Eft8kCcVZxoCtTZ7X0binDj0JHmqe0h+9dEs=;
	h=Subject:From:Cc:Date:In-Reply-To:References:From;
	b=OzkmcOKuax2YnA3bhoej74/6EDZuvfZ0Inv7NG/hTtmTtzHerkqwO1WE2jzjkssq6
	 RFiLLepRAcL1SMfIEGdWinCDvpJfwr2hWfpxojZMTXR6mzZ7ogYovV8C8OeeB1lfQu
	 HyWtbtNrXC+BzfVMUO9Yj8zBeTY/z9GWcsc0nnJI=
Subject: [PATCH 6/7] powerpc: asm/io.h: Expect immutable pointer in
 virt_to_phys prototype
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Date: Sat, 15 Apr 2023 04:17:53 -0700
Message-ID:  <168155747391.13678.10634415747614468991.stgit@skinsburskii.localdomain>
In-Reply-To:  <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
References:  <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Apr 2023 22:01:27 +1000
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>

These helper function - virt_to_phys - doesn't need the address pointer to
be mutable.

In the same time expecting it to be mutable leads to the following build
warning for constant pointers:

  warning: passing argument 1 of ‘virt_to_phys’ discards ‘const’ qualifier from pointer target type

Signed-off-by: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Bjorn Helgaas <bhelgaas@google.com>
CC: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
---
 arch/powerpc/include/asm/io.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index f1e657c9bbe8..c287eeb9536f 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -959,7 +959,7 @@ extern void __iomem *__ioremap_caller(phys_addr_t, unsigned long size,
  *	almost all conceivable cases a device driver should not be using
  *	this function
  */
-static inline unsigned long virt_to_phys(volatile void * address)
+static inline unsigned long virt_to_phys(const volatile void * address)
 {
 	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && !virt_addr_valid(address));
 


