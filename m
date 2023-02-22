Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA069F5C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 14:38:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMHKb22ywz3cKj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 00:38:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=opYVZpd/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=t8Al4EAn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=opYVZpd/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=t8Al4EAn;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMHJc2PRyz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 00:37:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 406245C012E;
	Wed, 22 Feb 2023 08:37:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 22 Feb 2023 08:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1677073038; x=1677159438; bh=q47+CVQ8qOOPo855ergJq8EIk
	+6dfpBuSgP6iPw22CI=; b=opYVZpd/XF5J/eKbesKxrOtpEWftP+G4hLgGtKgtj
	HcHnwYNu3YC+k5hIC72K73quoO2l+1p2KNmN59U9pvIKFkSTlnTWBag/LesrY5vz
	7t7ryjM71pbSRV/Gwu/ziBpPeDKyHBYiQk0cO/TTfVS8YZmUjdJoBsRk7Cet/mFm
	/A6n/f1UZMcCjk3gs4Ogc8HQ5FPHQRSqjNiuS1O6narB35j+xKdJaZx56JMO/Wag
	3x8fSeNTYJBvMLRv61fl6S9CBTYBxW/+bupn8V1o6C444CQ65lVkK7ecZ0qJoqV2
	lYvSLd/knUOqT+PVxmBaMBNQgAWencw2CuNka3r6K5auQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677073038; x=1677159438; bh=q47+CVQ8qOOPo855ergJq8EIk+6dfpBuSgP
	6iPw22CI=; b=t8Al4EAn4K1+5pIsWvTQP1KCpr07Sn43gwo4L43VhWY97zwuk/Y
	O3rUzQTuOC+s5SMyzu67kTYKJvlgB+6MMUe3G5yf4KNwoY1LyLwRXBOWDdjkJKRm
	1GpY728Zav4aHK1cZ1xIwYgfNidOeapqPW5MYCI3y83MnmS+P1hbQmomDD7M/xQg
	6I/7vDIiNJAUsxyGEsZZwHoE0+91xVM+N1RFKPh/oBV+p3iZr+Jczd2g4Kr56whN
	LGuVfh84frqQLfIhvUWfgh9IAYfBUXWiIsYS5bKH2hGMZAPPcIhJLkmg/PmNI9Dp
	nsUQohL2uuN51ZGPDldHETle9i/6XD6JQGA==
X-ME-Sender: <xms:jRr2Y4gEYHl6JEtJG7gMX2DKvChE_vQTHW6C0yq62jrSOn94aSPfig>
    <xme:jRr2YxA6SlfPH4XT4o_Ql2G3JPJyzq36Jf-bXiiHGQZ99fVhnX-JCVZuqPcwduTGo
    Pdfn9xeHJ-Y8sod_Pw>
X-ME-Received: <xmr:jRr2YwFx5TgFJYPPMo9ZG1Z_o7OPKHCfhBWUVJ39YBPdeVA_l6SStMimWG9J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:jRr2Y5RvB610Is-2kxRvdGjpcxp0QlhByDehDQrwerFEtQBIyshGZw>
    <xmx:jRr2Y1w-Hct9lqqbRUyed-Zshsfgt96p1vlT5K3dD_ARspZ1h9uz5w>
    <xmx:jRr2Y37RMIcOFVluOV1zM6OmfPjsxzwhxGt50H225TPnN3JCi4U3KQ>
    <xmx:jhr2Y74_tiDsOk4So97qWM7it4ZmSEOZlJNx8Y8r9EiByIh_2IbJ0A>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 08:37:15 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 0/3] Use dma_default_coherent for devicetree default coherency
Date: Wed, 22 Feb 2023 13:37:09 +0000
Message-Id: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
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


Jiaxun Yang (3):
  dma-mapping: Provide a fallback dma_default_coherent
  riscv: Set dma_default_coherent to true
  of: address: Use dma_default_coherent to determine default coherency

 arch/powerpc/Kconfig        | 1 -
 arch/riscv/Kconfig          | 1 -
 arch/riscv/kernel/setup.c   | 3 +++
 drivers/of/Kconfig          | 4 ----
 drivers/of/address.c        | 2 +-
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/mapping.c        | 4 ++++
 7 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

