Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE756C2FD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgpmN0Jrlz2xHK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 22:10:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=MP2/yNnJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ed3m8O4t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=MP2/yNnJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ed3m8O4t;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgpkM6QDpz303h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 22:08:27 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C02795C00F7;
	Tue, 21 Mar 2023 07:08:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 07:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1679396903; x=1679483303; bh=ucFVl0jvwB
	lsXTpy6dY8aDYX2Et9XXdL45q62ViNUpY=; b=MP2/yNnJwKFYsmKk1GbdT7UVeY
	MnhDuCdn1Kh4b2i30s1NhE/BYCYizfM05wY6thE+2qaGzGZBKp15ThJ7yNCLgSrP
	4iMF/POris7Y8iJS1wWEtFf4qUcMiZ2Pg3FEE4kwDGiKBiDTk639tIFa8UWnfwl9
	nLUl8fExahyFqIHl5kdewXHTpmhqRLhtBRcFa7LGSr1ODNoGYXJlMg38rwPGOxoE
	nKsOfFecPQkdCbULJ72em/Omlw3vHwC6FJIFXpVE2VVLWkhSLpNppCUizeDb/ng3
	RI8kyQuPpCEiHW8r3E+aJrWMWSA461FlDmp8J3aIfh0u/8wyLyVztkNNqa+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679396903; x=1679483303; bh=ucFVl0jvwBlsX
	Tpy6dY8aDYX2Et9XXdL45q62ViNUpY=; b=ed3m8O4t8pDFP9uG31nTqH5E2Fsy6
	/MavdnRrUBaf2UNs1gaPi5dNuwxHhUpgYeRAinYx3J0Nb2FDGfjQqk84WKvGHSJ/
	80zUxHQPox/V9110zRXfbe/xDXS7RjIRikXMliPJnEnFkfNJjV2j49UzUt4wwoKI
	zPbqMw/Z8NT6kb7Epm8CkH0Y4cLyuG4S4LMGBre9rGQMd2Uf1NQicJewK3gCCj4i
	WU0o8/XH0hhrTudrNetEoeEs70Kllwmeb3h6sdxDZXFzHhw043SIMN20RMvgdsR7
	zQm0fePwbqF+Y7NWK8zE4bt2xrQ7xj74+sofkRTjVCIE+gngSi+lBIvbQ==
X-ME-Sender: <xms:J5AZZK03El-5nGoBsBpePoSmLiN92j4n6qoNUt6xz5wSYB-45y2eDw>
    <xme:J5AZZNE-OXpdylxmJ6nKWlW69GpksBi3vUejOPBHcMkBIeuA5Wj4dvD9QKw59KvUH
    xM64MqqfRmsX0NKnuI>
X-ME-Received: <xmr:J5AZZC7d25YEi7AA12sY20Bb0Mw7pJ3yhE-2w-0-doGTkMmIUahSCW4sWzxAxuThxpXrb0EzHUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:J5AZZL3sn9PE5Xr9gRZ2P-Ak79OVg5NFOyIKOyFrtx5erx2k47N70w>
    <xmx:J5AZZNFeSSpL6Q8C-W13zwenlKv9eRCqZEavZqss0oeSjyk9wCm2aA>
    <xmx:J5AZZE_B_xO-_xStaW5k6Qoz_bgBs6pOie5pW3kVP2tqRLAiizs9iw>
    <xmx:J5AZZM_F1InuLsw4qyd4uwdWQLTQt4smF3QZ2OKiZ0Wt05OjtA87Rg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:20 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v3 0/4] Use dma_default_coherent for devicetree default coherency
Date: Tue, 21 Mar 2023 11:08:09 +0000
Message-Id: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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
Cc: tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

This series split out second half of my previous series
"[PATCH 0/4] MIPS DMA coherence fixes".

It intends to use dma_default_coherent to determine the default coherency of
devicetree probed devices instead of hardcoding it with Kconfig options.

For some MIPS systems, dma_default_coherent is determined with either
bootloader or hardware registers in platform initilization code, and devicetree
does not explicility specify the coherency of the device, so we need the ability
to change the default coherency of devicetree probed devices.

For other platforms that supports noncoherent, dma_default_coherent is a fixed
value set by arch code. It's defaulted to false for most archs except RISC-V.

Thanks
- Jiaxun
---
v2:
  - Add PATCH 1 to help with backporting
  - Use Kconfig option to set dma_default_coherent 

v3:
  - Style fixes
  - Squash setting ARCH_DMA_DEFAULT_COHERENT into PATCH 4
  - Setting ARCH_DMA_DEFAULT_COHERENT for PowerPC

Jiaxun Yang (4):
  of: address: Fix default coherency for MIPS
  dma-mapping: Provide a fallback dma_default_coherent
  dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
  of: address: Always use dma_default_coherent for default coherency

 arch/powerpc/Kconfig        | 2 +-
 arch/riscv/Kconfig          | 2 +-
 drivers/of/Kconfig          | 4 ----
 drivers/of/address.c        | 2 +-
 include/linux/dma-map-ops.h | 2 ++
 kernel/dma/Kconfig          | 7 +++++++
 kernel/dma/mapping.c        | 6 +++++-
 7 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

