Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CDB8A6947
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 13:02:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HbDKskit;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OgWQBOga;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJh313Fv8z3vfG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:02:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HbDKskit;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OgWQBOga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.156; helo=fhigh5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJh270NYZz3vYs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 21:02:06 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A0623114011E;
	Tue, 16 Apr 2024 07:02:02 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 16 Apr 2024 07:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713265322; x=1713351722; bh=Zk60bWbrel
	joGat0WtfbefJblBLK6E0eub+WvGF0SQM=; b=HbDKskitWj9XmebUrXWe+Yy5eN
	3nGz9gIRgp4xDsxGLdoBktSMz64WxXhyAcZhJ08gU1lXksV2N5VW2JU7ChpqIDIf
	c4GnSeH5jFAPBEVW9vm+Yeqdp6Qynv/uvO7oufK2N11Qsvh+349Sos6KLCOi71Lj
	TLSTyUjXu7yYqS+taHLfhQt5A31XEPvzV0ffixqP7uyszvyEt0+29L3KnQ9IaVlj
	VUDUnRKVJTQxm+Y3Iw7+ZnSo3gNdXdX+i3oI1kn9KH3k1zURvfziI8XgDuVi69Xc
	1U7yAzwKQeJmSCEXWynAFWiASIWS/xoNsou4x0gpjgnUcIFDxyGh6l0b6Lqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713265322; x=1713351722; bh=Zk60bWbreljoGat0WtfbefJblBLK
	6E0eub+WvGF0SQM=; b=OgWQBOgaXnXDm5d6p7LLC2FcZeJdIUUk7D8N/8LAdWzQ
	b2HaAMqdQDEAmNiBuf3nM/WP0cVxsl+3C1a7eFO7ieE8S0TNMlMbJBSaez0okP/+
	X/1G63wOkFllnO9O2UfeaqMb2+dAWxnNAFSfRUfCh/BYWjb4b9bQog9z5O3bM8Np
	lZ0ud3tzLCtDNvQDKzlF8RMCmJbiuoTCEBtYp/ibB6kBKW17hii2hhC65oyjkfJZ
	TKjez9JWLcQ6tR/tJ4sIfJIkPXFhzpmA6wSLOd8WPrXl/G0WUAbw9WkRzhNQ0PTI
	OV3BzdevM7UdaD2C4EEOzoL3g4gX4d8RybJTnxD21g==
X-ME-Sender: <xms:qloeZgevYlSYamvN8FpLEHbJx9OAazGHte8yuhsKb2h4ObsHCnj9nQ>
    <xme:qloeZiPsrku04fHUFUKHMWbigf9b4jNgii9MF_F1ZsrTrjxv3PtAfElVhngcNPydB
    eCGll9HJdZZFEgPz5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejhedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:qloeZhhVRmPJRpPHgYgp81YRLa0Nu2yK8OLZLyZz2kiET15nqMhMXA>
    <xmx:qloeZl83afwa1bkGrYxT60jHi4QHQOGtYwhTA353OxKaVjV4JpwIfw>
    <xmx:qloeZsuxY6rnmjKKjvugyA_ObPxL_vnocWJ9e8XAR3kZb3CSr2FcAQ>
    <xmx:qloeZsGxOZDhT1CxpUzz-EPwMpoYLG29dF8oszhc4uRRpAh_Qo_Jew>
    <xmx:qloeZsFEfjETAS5RZ62CiwM-mzcDHWozQ_gk0DgU-z57iYj7mR6zGrEn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 05DC2B6008F; Tue, 16 Apr 2024 07:02:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <3d139886-9549-4384-918a-2d18480eb758@app.fastmail.com>
In-Reply-To:  <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
References:  <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
Date: Tue, 16 Apr 2024 13:01:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "open list" <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Linux Regressions" <regressions@lists.linux.dev>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on a null
 pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
Content-Type: text/plain
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Kees Cook <keescook@chromium.org>, Niklas Schnelle <schnelle@linux.ibm.com>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Jeff Xu <jeffxu@chromium.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 16, 2024, at 11:32, Naresh Kamboju wrote:
> The Powerpc clang builds failed due to following warnings / errors on the
> Linux next-20240416 tag.
>
> Powerpc:
>  - tqm8xx_defconfig + clang-17 - Failed
>  - allnoconfig + clang-17 - Failed
>  - tinyconfig + clang-17 - Failed
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

I'm not sure why this showed up now, but there is a series from
in progress that will avoid this in the future, as the same
issue is present on a couple of other architectures.

The broken definitions are in the !CONFIG_PCI path of

#ifndef CONFIG_PCI
#define _IO_BASE        0
#define _ISA_MEM_BASE   0
#define PCI_DRAM_OFFSET 0
#elif defined(CONFIG_PPC32)
#define _IO_BASE        isa_io_base
#define _ISA_MEM_BASE   isa_mem_base
#define PCI_DRAM_OFFSET pci_dram_offset
#else
#define _IO_BASE        pci_io_base
#define _ISA_MEM_BASE   isa_mem_base
#define PCI_DRAM_OFFSET 0
#endif

Once the series is merged, the !PCI case can disable
CONFIG_HAS_IOPORT and move all references to it into #ifdef
sections, something like the (incomplete) patch below.

It looks like regardless of this, powerpc can also just set
_IO_BASE to ISA_IO_BASE unconditionally, but I could be missing
something there.

     Arnd

---
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 08c550ed49be..29e002b9316c 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -36,11 +36,8 @@ extern struct pci_dev *isa_bridge_pcidev;
  * bases. Most of this file only uses _IO_BASE though which we
  * define properly based on the platform
  */
-#ifndef CONFIG_PCI
-#define _IO_BASE	0
-#define _ISA_MEM_BASE	0
-#define PCI_DRAM_OFFSET 0
-#elif defined(CONFIG_PPC32)
+#ifdef CONFIG_HAS_IOPORT
+#ifdef CONFIG_PPC32
 #define _IO_BASE	isa_io_base
 #define _ISA_MEM_BASE	isa_mem_base
 #define PCI_DRAM_OFFSET	pci_dram_offset
@@ -486,8 +483,7 @@ static inline u64 __raw_rm_readq(volatile void __iomem *paddr)
  * to port it over
  */
 
-#ifdef CONFIG_PPC32
-
+#if defined(CONFIG_PPC32) && defined(CONFIG_HAS_IOPORT)
 #define __do_in_asm(name, op)				\
 static inline unsigned int name(unsigned int port)	\
 {							\
@@ -534,7 +530,7 @@ __do_out_asm(_rec_outb, "stbx")
 __do_out_asm(_rec_outw, "sthbrx")
 __do_out_asm(_rec_outl, "stwbrx")
 
-#endif /* CONFIG_PPC32 */
+#endif /* CONFIG_PPC32 && CONFIG_HAS_IOPORT */
 
 /* The "__do_*" operations below provide the actual "base" implementation
  * for each of the defined accessors. Some of them use the out_* functions
@@ -577,6 +573,7 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define __do_readq_be(addr)	in_be64(PCI_FIX_ADDR(addr))
 #endif /* !defined(CONFIG_EEH) */
 
+#ifdef CONFIG_HAS_IOPORT
 #ifdef CONFIG_PPC32
 #define __do_outb(val, port)	_rec_outb(val, port)
 #define __do_outw(val, port)	_rec_outw(val, port)
@@ -592,6 +589,7 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define __do_inw(port)		readw((PCI_IO_ADDR)_IO_BASE + port);
 #define __do_inl(port)		readl((PCI_IO_ADDR)_IO_BASE + port);
 #endif /* !CONFIG_PPC32 */
+#endif
 
 #ifdef CONFIG_EEH
 #define __do_readsb(a, b, n)	eeh_readsb(PCI_FIX_ADDR(a), (b), (n))
@@ -606,12 +604,14 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define __do_writesw(a, b, n)	_outsw(PCI_FIX_ADDR(a),(b),(n))
 #define __do_writesl(a, b, n)	_outsl(PCI_FIX_ADDR(a),(b),(n))
 
+#ifdef CONFIG_HAS_IOPORT
 #define __do_insb(p, b, n)	readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
 #define __do_insw(p, b, n)	readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
 #define __do_insl(p, b, n)	readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
 #define __do_outsb(p, b, n)	writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
 #define __do_outsw(p, b, n)	writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
 #define __do_outsl(p, b, n)	writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
+#endif
 
 #define __do_memset_io(addr, c, n)	\
 				_memset_io(PCI_FIX_ADDR(addr), c, n)
@@ -689,6 +689,8 @@ static inline void name at					\
 #define writesb writesb
 #define writesw writesw
 #define writesl writesl
+
+#ifdef CONFIG_HAS_IOPORT
 #define inb inb
 #define inw inw
 #define inl inl
@@ -701,6 +703,8 @@ static inline void name at					\
 #define outsb outsb
 #define outsw outsw
 #define outsl outsl
+#endif
+
 #ifdef __powerpc64__
 #define readq	readq
 #define writeq	writeq
