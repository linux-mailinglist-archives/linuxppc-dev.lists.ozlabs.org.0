Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B26D6F1717
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 14:02:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7B6r70sHz3fDd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 22:02:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=koFTR0U8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=skinsburskii@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=koFTR0U8;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6jjt0ZsJz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 03:42:26 +1000 (AEST)
Received: from skinsburskii.localdomain (c-67-170-100-148.hsd1.wa.comcast.net [67.170.100.148])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2EDFA21C33DF;
	Thu, 27 Apr 2023 10:41:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2EDFA21C33DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1682617312;
	bh=tQBmtbcpqnp+RILjBR0oqwhW0pMzwxDvx3m4tXPmSeg=;
	h=Subject:From:Cc:Date:From;
	b=koFTR0U8zfUvb5Uc+C+Hbp/AJH8F6PVoyRgqvwqagczF7i9s34sgxAtQuetm20+XS
	 5Qm+28Pt+pSiCHLtISTWzADXqXkirskMRFVFEdzGl5W3ecGwC3+rdF73jW6Ou0nhTs
	 O5MdjQWqF4ihM7lRjxSdq9BjhqMcNktql7ZPF+I0=
Subject: [PATCH 0/7] Expect immutable pointer in virt_to_phys/isa_virt_to_bus
 prototypes
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Date: Sat, 15 Apr 2023 04:17:19 -0700
Message-ID:  <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
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
Cc: linux-ia64@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-hexagon@vger.kernel.org, Omar Sandoval <osandov@fb.com>, linux-arch@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Chris Down <chris@chrisdown.name>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Iva
 n Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is aimed to address compilation warnings when a constant pointer
is passed to virt_to_phys and isa_virt_to_bus functions:

  warning: passing argument 1 of ‘virt_to_phys’ discards ‘const’ qualifier from pointer target type
  warning: passing argument 1 of ‘isa_virt_to_bus’ discards ‘const’ qualifier from pointer target type

The change(s) is the same for all architectures, but it's split into a series on
per-arch basis to simplify applying and testing on the maintainers side.

The following series implements...

---

Stanislav Kinsburskii (7):
      x86: asm/io.h: Expect immutable pointer in virt_to_phys/isa_virt_to_bus prototypes
      alpha: asm/io.h: Expect immutable pointer in virt_to_phys/isa_virt_to_bus prototypes
      mips: asm/io.h: Expect immutable pointer in isa_virt_to_bus prototype
      hexagon: asm/io.h: Expect immutable pointer in virt_to_phys prototype
      ia64: asm/io.h: Expect immutable pointer in virt_to_phys prototype
      powerpc: asm/io.h: Expect immutable pointer in virt_to_phys prototype
      asm-generic/io.h: Expect immutable pointer in virt_to_phys


 arch/alpha/include/asm/io.h   |    6 +++---
 arch/hexagon/include/asm/io.h |    2 +-
 arch/ia64/include/asm/io.h    |    2 +-
 arch/mips/include/asm/io.h    |    2 +-
 arch/powerpc/include/asm/io.h |    2 +-
 arch/x86/include/asm/io.h     |    4 ++--
 include/asm-generic/io.h      |    2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)


