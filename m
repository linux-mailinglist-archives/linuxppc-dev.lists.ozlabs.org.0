Return-Path: <linuxppc-dev+bounces-7306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D99A6D5BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 09:03:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLlsb0MFdz2yn9;
	Mon, 24 Mar 2025 19:02:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742803378;
	cv=none; b=ITsLmjY9QcqwgIJNbKsXSlOHem5dUsToXu8CDn99/OVeqBNgN7AgDxHLfUfBdPKnPKYHo1Xzd9vGxyBWa/qwX8Mw5ajE12jBbZyYYKnz8w45j7MIAGTv2x409FhmpvmpnIQgt8Qe4CrXbvDwBv9Od/56yUv8Eg68ewCVVkuiHL96uB1UbgIokCsTT8XYKrf8hDgPcfP6uHLOPCtqtDLP4ZSNFqMVG5YC0VhNHbWUgU9sSMNeHL5CHSFPxkdggsWV7s7WWNokMrleC69gvNaEHy23zQx/W7n7RoplP3+tb0ct7flBr9r2GwIQENBsH29+Vj90MLVH3t/BaPiDcSdKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742803378; c=relaxed/relaxed;
	bh=adzYBEKh/yqg4YHIRxasSNX+4SOl9DvVZEEHKyF6Ds8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TIO3m0imM/lAaQ+w1NCYy0g5T9ioMh1v1o0TzwWd6d1UrXIWP4k0p2zVzGjt/thCrOu9Kpo5pHq+n3ImDeSbnY0+yKF+duNxM0sKWwczLTxl485o6FUQDyFyM+TMbdsfeJHejWRdWE3cGDrlnmZMjwPQ/Y6+Nz1/1zCQkyO39Q0wm/9SEmKzIuCiKjrfrDcGHH32JmEJmOKwm/tgl0e+Kh0x3n9hIAV+Gx68g3fma3pUPGSNj5iCd25YPxIb+/SolZU7tAPZ4QPDrP/yUswPrjVkFlzKEip8yX2dlZGULp7OFRA6lwBDxb2TGgvsVwADoV08DieHNGOoTVYHLFxb1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=jQ02LsMk; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JU2xrRaX; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=jQ02LsMk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JU2xrRaX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLlsX1JRRz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 19:02:55 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 3D00E1382CB7;
	Mon, 24 Mar 2025 04:02:52 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Mon, 24 Mar 2025 04:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742803372;
	 x=1742889772; bh=adzYBEKh/yqg4YHIRxasSNX+4SOl9DvVZEEHKyF6Ds8=; b=
	jQ02LsMkYJca5oAbaoAVP9lOqKesMFcf3kY1L6937OmT0RIMP+pgHl3L1dJmtUZ8
	k/oIPSTiyQ63s1qafFQcIgJXOkEbpOEkyaeRaLFkKhMuTpd2ME/ehnGtpsZq2LIa
	lpXEtmbFSyOUzqSiGPeg73gqBUgXtcSonD1R3oxGhMyfFs8reSVN3ADa/cs0UxKe
	hHhGQBg2Q7y9RA+D9FFyTHXaKxZqmWb7X8+bHjpTuBuzrSQXYWUXziOyqusCCB4Y
	/tuOVhPSnytMqzpEhYM0RiZc3Vt/xDu56HS/aG+GjGl7Ri+BfUg8IAszXw8zFtHM
	ZQxdQh4FTxF3iidupy0y6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742803372; x=
	1742889772; bh=adzYBEKh/yqg4YHIRxasSNX+4SOl9DvVZEEHKyF6Ds8=; b=J
	U2xrRaX/2LY9S62Ap4tyti7bpdYWu0788m1xv1Us5AaoSlmFtSZV7NG0KkHcL850
	NSIGgD4FiBjJjEe/JcbULMR/iPeuzj7WF1BpZnjwJQBBibEGIhDfh62ARqhPryuH
	8biIOKbipOqu/tWA6bMysxa/KaMd2yGqyqP/F6XRwI3wY5AUJWE73/mf57kWJQB0
	C7aXariz+LeW6Grl9nOvLiCsU2Wh87i/eFPfl9aJGty1Ln4CPQegQeRwwJZRb5VW
	8bUzUnJJErGClA1KJkUhWhQjENriuRIYIhYOFnNQx9gUX41bwanzHuUfNldnR/+r
	yi93+pyZPYrSlPDFdR1Hw==
X-ME-Sender: <xms:qhHhZ5nZTPn4CkOVtKO4if16jD0npIjwWI7yBFV-Iz-38wrU7BOfPQ>
    <xme:qhHhZ004OsA2BUHO9qMmzdirvPjc7MWwko5173S1rvweRDQsG4L5GO_itGAGnl9_R
    q9SSvL7-OXbP3s4E0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlph
    hhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghr
    ohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrih
    gurdgruhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomhdprhgtphht
    thhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrse
    hgmhigrdguvgdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrh
    hshhhiphdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qhHhZ_p-u8s5pl3YM_1-PsEN9wBfKfwXvrHdL61Q-nhZDSolr_K7Mw>
    <xmx:qhHhZ5kYRVJdV1MObn5MTFlxn9WLq1qINYV8-8l2m2E4SAKKl83-Ww>
    <xmx:qhHhZ32z1LJiorBkFoyg-aZNO0xESpHo-jDwSf5gWXDLEZ3-2Qp6VA>
    <xmx:qhHhZ4tW9ZugFEiuVqPqdmmqi1kNe-aZmABnfDMdIQSnpAO8aZjmsw>
    <xmx:rBHhZwffwYjZf1CcOqvx81hevZ9WxdyiSnJ2x_cAQyFRDDuaiwyi10Yb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E60322220073; Mon, 24 Mar 2025 04:02:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-ThreadId: T53f4a10e7512c522
Date: Mon, 24 Mar 2025 09:02:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Ungerer" <gerg@linux-m68k.org>, "Arnd Bergmann" <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Julian Vetter" <julian@outer-limits.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Message-Id: <4a31c6a8-7c99-4d8f-8248-92e0e52b8db6@app.fastmail.com>
In-Reply-To: <64f226e5-7931-40ba-878a-a28688da82fd@linux-m68k.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-7-arnd@kernel.org>
 <64f226e5-7931-40ba-878a-a28688da82fd@linux-m68k.org>
Subject: Re: [PATCH 6/6] m68k/nommu: stop using GENERIC_IOMAP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Mar 24, 2025, at 02:33, Greg Ungerer wrote:
> Hi Arnd,
>
> On 15/3/25 20:59, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> There is no need to go through the GENERIC_IOMAP wrapper for PIO on
>> nommu platforms, since these always come from PCI I/O space that is
>> itself memory mapped.
>> 
>> Instead, the generic ioport_map() can just return the MMIO location
>> of the ports directly by applying the PCI_IO_PA offset, while
>> ioread32/iowrite32 trivially turn into readl/writel as they do
>> on most other architectures.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> With this applied this fails to build for me:
>
>    UPD     include/generated/utsversion.h
>    CC      init/version-timestamp.o
>    LD      vmlinux
> m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function 
> `quirk_switchtec_ntb_dma_alias':
> quirks.c:(.text+0x23e4): undefined reference to `pci_iomap'
> m68k-linux-uclibc-ld: quirks.c:(.text+0x24fe): undefined reference to 
> `pci_iounmap'
> m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function 
> `disable_igfx_irq':
> quirks.c:(.text+0x32f4): undefined reference to `pci_iomap'
> m68k-linux-uclibc-ld: quirks.c:(.text+0x3348): undefined reference to 
> `pci_iounmap'

Thanks for the report, I was able to reproduce the problem now
and applied the fixup below. I had tested m5475evb_defconfig earlier,
and that built cleanly with PCI enabled, but I had missed how
that still used GENERIC_IOMAP because it has CONFIG_MMU enabled.

Does this fixup work for you?

On a related note, I'm curious about how the MCF54xx chips are
used in practice, as I see that they are the only coldfire chips
with PCI and they all have an MMU. Are there actual users of these
chips that have PCI but choose not to use the MMU? 

      Arnd

8<-----
From a36995e2a64711556c6773797367d165828f6705 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 24 Mar 2025 07:53:47 +0100
Subject: [PATCH] m68k: coldfire: select PCI_IOMAP for PCI

After I dropped CONFIG_GENERIC_IOMAP, some PCI drivers started failing
to link when CONFIG_MMU is disabled:

ERROR: modpost: "pci_iounmap" [drivers/video/fbdev/i740fb.ko] undefined!
ERROR: modpost: "pci_iounmap" [drivers/video/fbdev/vt8623fb.ko] undefined!
ERROR: modpost: "pci_iomap_wc" [drivers/video/fbdev/vt8623fb.ko] undefined!
ERROR: modpost: "pci_iomap" [drivers/video/fbdev/vt8623fb.ko] undefined!
ERROR: modpost: "pci_iounmap" [drivers/video/fbdev/s3fb.ko] undefined!
...

It turns out that there were two mistakes in my patch: on !MMU I forgot
to enable CONFIG_GENERIC_PCI_IOMAP, and for Coldfire with MMU enabled,
teh GENERIC_IOMAP was left in place but incorrectly configured.

Fixes: 9d48cc07d0d7 ("m68k/nommu: stop using GENERIC_IOMAP")
Reported-by: Greg Ungerer <gerg@linux-m68k.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index b50c275fa94d..eb5bb6d36899 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -18,12 +18,13 @@ config M68K
 	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
 	select GENERIC_ATOMIC64
 	select GENERIC_CPU_DEVICES
-	select GENERIC_IOMAP if HAS_IOPORT && MMU
+	select GENERIC_IOMAP if HAS_IOPORT && MMU && !COLDFIRE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_MULDI3
+	select GENERIC_PCI_IOMAP if PCI
 	select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
 	select HAVE_ARCH_LIBGCC_H
 	select HAVE_ARCH_SECCOMP

