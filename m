Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684C69E5AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 18:13:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLm8M12Cvz3fSj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 04:13:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=EMJBt3zy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=th8zsIYP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=EMJBt3zy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=th8zsIYP;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLfRh4WBZz3byj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 23:56:16 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 45DF23200929;
	Tue, 21 Feb 2023 07:46:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Feb 2023 07:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1676983580; x=1677069980; bh=o1ZGzAY+2IAq6iM9F+Xf8a1cE
	huTp9TD8y5vFZAwf2Y=; b=EMJBt3zyvDdk72wNVD6Rp0MSRXuNpRO1l4RTro2Bm
	Q68vwd6ylAHTjrNFljCyq/JBIn3lPPXfgc4/6kk8pQgPkHmUfQCfVhmtTjfoAUiq
	E/1Z2y3iMjQZb/AYwTUje2WUwJPnsW8dGeROQUPzZMMapCpNieebulQ6b1s5lOgS
	LsUuGRK/I5d2SJ4y4WrcSJPckasYkpldbLC2L/xjAJasWeEQOnOy2/fv6z6QdazG
	0CV9dHfdja/HMB+EHvRjIXBskQYkKM8Cr3uY3SLxOq0hcNokeOxDrhxM0XZPuvTO
	HuWtbpT/vjLX4Qq5womPSW0644hrxyBElJ44X/bD6TpwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1676983580; x=1677069980; bh=o1ZGzAY+2IAq6iM9F+Xf8a1cEhuTp9TD8y5
	vFZAwf2Y=; b=th8zsIYP60+WQlHRLMTjitDNcmVVDGTJ4WbmTbjgZDhRpdcEwlE
	aCund/RrXSmSkquNlWkBr2iMp0JV5Mm+P3VNM29fo27vJM/A4nzKB4CevyDHad2J
	djFJxRQhZHNRUSRui7eG0RgbSYGhXbPbvdKUr0VjPNaZggFS+fMolbh72aV8uyI0
	hHatvxsKUdaK10Q7JbiQHjloeYstWVihqVySVTiuHHwHxi5ZbeiX8esoglNsHTSp
	A+K0VLkheajhYIwiap8e8HA+U850GivU0NLEI6wpmTCGdBRiQFVW87ycfljjvf9i
	hofR4SCjfv1ATpwx0NjJq6viCycYj/SCpsA==
X-ME-Sender: <xms:G730YyDtoU_NWr-nX8omgYp9iWEj_Cpb88tfMFG7GUF6i_qqaeMpsg>
    <xme:G730Y8jScgS-F_7op8B22ovm68GLn8BL6vO8AryrQRCvto2J2QuiFdFn-oTd1ADFM
    -RIkx4qSaRWuSc4ifk>
X-ME-Received: <xmr:G730Y1nHA8Z1dGd7OMFxUBeSeLbmsED_OBnzecdttXlDAJIOTc0UGAsii8Lx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:G730YwxDpe2tLRi9YpZeLRv_SsYUczt_Urwj0V4BSAXYzA3yHIJG_w>
    <xmx:G730Y3QY7hzjzjJ6ucBUr7Fv_xJmTC1vaxZ7xNPsrtwTXLSaCN9l0A>
    <xmx:G730Y7Y9L98rNX2KaPH3_pmFqXa3yTp3iFs8SR4cGFrKqw-5p3Xx1Q>
    <xmx:HL30Y8Kvm1mRR7-cnzS-00Ff_ZzvPWOsyBWtSIbb2hjIGU1m7Ec61A>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 07:46:17 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 0/7] MIPS DMA coherence fixes
Date: Tue, 21 Feb 2023 12:46:06 +0000
Message-Id: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Feb 2023 04:06:20 +1100
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
Cc: tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Jiaxun Yang (7):
  MIPS: Remove DMA_PERDEV_COHERENT
  MIPS: Always select ARCH_HAS_SYNC_DMA_FOR_CPU for noncoherent
    platforms
  MIPS: c-r4k: Always install dma flush functions
  dma-mapping: Always provide dma_default_coherent
  dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
  riscv: Select ARCH_DMA_DEFAULT_COHERENT
  of: address: Use dma_default_coherent to determine default coherency

 arch/mips/Kconfig           | 16 ++--------------
 arch/mips/mm/c-r4k.c        | 12 +++---------
 arch/powerpc/Kconfig        |  1 -
 arch/riscv/Kconfig          |  2 +-
 drivers/of/Kconfig          |  4 ----
 drivers/of/address.c        |  2 +-
 include/linux/dma-map-ops.h |  1 +
 kernel/dma/Kconfig          |  3 +++
 kernel/dma/mapping.c        |  6 +++++-
 9 files changed, 16 insertions(+), 31 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

