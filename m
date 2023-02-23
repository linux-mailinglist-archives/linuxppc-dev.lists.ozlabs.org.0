Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C81846A0785
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 12:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMrcK5CqPz3cZp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 22:37:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=d/Brj8Co;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=K4CuWUtF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=d/Brj8Co;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=K4CuWUtF;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMrbL0x8rz3blJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 22:37:00 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4F13C3200903;
	Thu, 23 Feb 2023 06:36:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 23 Feb 2023 06:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1677152214; x=1677238614; bh=T8PK2cQRLY5A4FxRWK8i+aaat
	tnc3laKSanQcycFaLk=; b=d/Brj8CoyOxr+FX8rjApAyHLj8+0+L5/R+SFdsgHl
	YNU/mVw/fZAbKmb6HOzQWEXlYO0O/siHHu90N9nna5M7Dh23Y/UWWIoVolKCCTQf
	gQ0+WFr+bbJuMAlllLbygp2Ha5tspYQ3+o5sLSqo/vt8DpcPUjb8GjoDqOgYhUa7
	s26FcE9GflBxxraMzH/MnAWUc4Faqwpina4odmEJZJSPmnecDY3j/BeH88dyOYxA
	k25rpqeQH+Lhi0mL3dv9E2JodaprQyX/gQEhCmbTryFkw+9/oSb9fuK4WEFhpMj/
	5u0yxBbdeGq9xvrPJ4gtgTrmTs9hJsiLGJg4n+gbL0f9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677152214; x=1677238614; bh=T8PK2cQRLY5A4FxRWK8i+aaattnc3laKSan
	QcycFaLk=; b=K4CuWUtFqoffTZpcwTRNJph6ugM/Wlx2m9JxCmfh/EJc+pP2b0a
	H37hoMSzVu6TC23e6sD7KZOhFR5+xVb14xZcXtDgW/bBn7iNh0Yc8r8iCz8SVOm4
	QGIGZculzBn0kr/ujNwu3LxVMxN+YB+rZp4boOkQh05VZm9BTx40J109BqsFsgKY
	hIJTZVZtHjCpJzh2WT5FHzeWHD0kPW5tXrDtttPmxr6pybBMqwUR/cPFj4IXdYuC
	XNeX9Nx313DO9Vj7jHgcWX4OudYbOw8CxVWjowalRH57mXj0BPPtaeWGzVrZtcv5
	Ik6WAy6++wQKjdypKrEpNaGVLmbFNr/HcZg==
X-ME-Sender: <xms:1U_3Y-VwM6tOAt27z_ZWQ4aaIhYaB8PkJEjHvCVWupIv0zsM-2fl4g>
    <xme:1U_3Y6nrZg1JNb983p5QOdW7XUjWlOcTkm-mrZnjECeT384QxYQoRAF6jI2tJ74ac
    tX8J4HdB_a-t_Gt87c>
X-ME-Received: <xmr:1U_3YyaFuPEjnNRrvCgR2_zbyOO8fM3D1bqYWcTextYAsRBYfcTvfVs3WUpGNOSh7hKWLK6oLMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:1U_3Y1VBHKtdGY1xhPJnBF6tJ66MM-ANNNtkzETAnFuwJsjvQp1-gg>
    <xmx:1U_3Y4nzWWpI-snQ807urQ_E8PuPUTyuTs1BHQX-n6T7ezi-uh94mw>
    <xmx:1U_3Y6djTOrM1OBan_sRPcnI2zL3mnty-jwsphOCqSbR-3y52XXBIA>
    <xmx:1k_3YyeubhykCZ8ltxSt1YHSxkIp3PYJSO_4UV-_WL84Y4vZKNfjGw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 06:36:50 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v2 0/5] Use dma_default_coherent for devicetree default coherency
Date: Thu, 23 Feb 2023 11:36:39 +0000
Message-Id: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
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

Jiaxun Yang (5):
  of: address: Fix default coherency for MIPS
  dma-mapping: Provide a fallback dma_default_coherent
  dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
  riscv: Select ARCH_DMA_DEFAULT_COHERENT
  of: address: Always use dma_default_coherent for default coherency

 arch/powerpc/Kconfig        | 1 -
 arch/riscv/Kconfig          | 2 +-
 drivers/of/Kconfig          | 4 ----
 drivers/of/address.c        | 2 +-
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/Kconfig          | 3 +++
 kernel/dma/mapping.c        | 6 +++++-
 7 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

