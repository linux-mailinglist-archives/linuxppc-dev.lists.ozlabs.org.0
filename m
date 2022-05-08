Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68D51EAB1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 02:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwlGF0Jgfz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 10:16:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=aFd+8vok;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wnew3-smtp.messagingengine.com (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=aFd+8vok; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwlFY13Pcz3bgC
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 10:15:43 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BA7102B01A5E;
 Sat,  7 May 2022 20:15:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 07 May 2022 20:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651968936; x=
 1651976136; bh=hBCmJbIqgEytzYwa8CW7BN7wQ9FjoZGR5Pq0KkOSgR4=; b=a
 Fd+8vokQcvbA4GWW9owApfwSeCCmripmwI1V8BhLeK5KaZNhXYioKWO7gI/i4WS2
 7k47a/ZWVbS9L9Tb94YqvYOtS7N7Odf5y1vj4JNgmK7LNQqCWISAKcO+P4rj0UMi
 q+RtVMiTD2S0odWphzabgNOzrXhZiGf5nIMLf0LKorYXqpXkyhAyhpWHbDYXh7SC
 lIsqVRz6rHiSoRmYVbBPXTr50ooseR0KbMmjBLcBybt5kQU3VX6Uv3BlsayvPX8K
 rT/CABNOI5QNmto+53M1TPT98lstPKrnj3wt67ZKWi2d0IKDKzkcno0YDJCen2gb
 pvOvYx7XyUrz2lynIGXHQ==
X-ME-Sender: <xms:nQt3Yu2EHi4ipuqnh-IQxeR3-pYmafCL0ycLmbVR9jkQSZuwwhMCTw>
 <xme:nQt3YhGj3WbJjLWRninJPo0UdIhOCVOzhNulF-SivW5rfLH6ZZQyRpAgUojPbF8-C
 5lTRDk0I_hwK1GBwHg>
X-ME-Received: <xmr:nQt3Ym4M7PXyIjFTVPJSxyNTs6iYk-KiuVj0c9xbLZnPIwKKKX3pbGagQ0aMJCEstBpD08vkytiENlEH1oJyJPG-juBdv5xk6po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
 ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:ngt3Yv2K9-Zw_Jv6Z_K6SmuSI0Dgy56dsjusRgWQOeGaH_9LVHsGyA>
 <xmx:ngt3YhFAxYHvfpVbkpFftwsm7VPnoe1hEExANO3zwqFSWMnA4ZPxbQ>
 <xmx:ngt3Yo8pHsdl-eEhvlnevon6M7vqHjCeDigA6J9OPD9hPyVH2q_GOw>
 <xmx:qAt3Ym7_mrm_1RQ5vAt6Czfp_u6IruN66F4H7V-seVcfOQQjEYOJyLnz_fE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 May 2022 20:15:23 -0400 (EDT)
Date: Sun, 8 May 2022 10:15:31 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
Message-ID: <e01fac8a-7568-14b6-84-affc4a40c6d@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
 <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
 <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
 <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
 <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
 <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Sun, 8 May 2022, I wrote:

> 
> That suggests to me that we need a "bool CONFIG_WARINGS_INTO_ERRORS" to 
> control -Werror, which could be disabled for .config files (like make 
> allmodconfig) where it is not helping.
> 

I just noticed that we already have CONFIG_WERROR. So perhaps something 
like this would help.

diff --git a/init/Kconfig b/init/Kconfig
index ddcbefe535e9..765d83fb148e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -150,6 +150,8 @@ config WERROR
 
 	  However, if you have a new (or very old) compiler with odd and
 	  unusual warnings, or you have some architecture with problems,
+	  or if you are using a compiler that doesn't happen to interpret
+	  the C standards in quite the same way as some other compilers,
 	  you may need to disable this config option in order to
 	  successfully build the kernel.
 
