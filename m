Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13969F5D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 14:40:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMHMf6h3fz3cf0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 00:39:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=bEC+HUAW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lDTx8Fqm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=bEC+HUAW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lDTx8Fqm;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMHJh16Hdz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 00:37:24 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3E9195C0114;
	Wed, 22 Feb 2023 08:37:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 22 Feb 2023 08:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677073042; x=1677159442; bh=+/
	4foVkx/AAkjDoTO2qfVYMQOOmzfm5uV10l4tbGnOM=; b=bEC+HUAWsEqXDeJF4X
	MA1wqXCKJ3T2WcwxsnS4elTB0VjWbYBje7oacXsnUgnACmBeeGTB67w8FzAYkqV+
	aXedw+fQrbk6Ch9T0UKEN/g9k8wqPAwrVmUGF6RBg0n1ZCzXlTU322qudJoDORSP
	gQ4KCCvuPkpvkGjZcVxXEQZKXoPedwlWjlt+3P0OBw30xeOQ8NtrDPb27k4vMhbB
	AnKak+Ybarxu4f5rTHMwmzj8cbrKbCd+y3tu2Su51ZDh4AaRLO1XLDK//BcIZmod
	P8vSn6rQzRWQFrph3P0YiywCRCfaLgV4RpxIQXvdpe/oiDwkAaoQdHl/s8uKAUdu
	BL9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677073042; x=1677159442; bh=+/4foVkx/AAkj
	DoTO2qfVYMQOOmzfm5uV10l4tbGnOM=; b=lDTx8Fqm9+4FFLw32LKkKiTLwmjsn
	l0mUUxPCKnaLpsBBiYnHOJHUH0TF7ZblTTeqK6mJ0R2v3St5xbF2tbhe6vXGPjkr
	K3Q0GCn2kau2vIzfTDF/MA8F2CleyTwjfKDBICORHF+kr+373Y0Un07s5/EXt2iP
	sSLw1qR8QIO8ERnP2ikmBv+6d4jBge/anOebCHV+i0oLFB/ftSXv0nS5HftxAtbX
	ni4HtVZDoxtf6OPwBt/wvJF/DW4zkh20/yAbILyE+3KFe4hUMrwA7ZrgjQQ76jH1
	S/sIFdtmfMVTWJGVMWoqV+lwwHsuNMrb68d1F3826n6W1sczGsZW4OnOg==
X-ME-Sender: <xms:kRr2Y9rLXqnHgjN9OiU3Ioj4Iv9MH_FQTuX3iskwPFYgXN6RnrxuNg>
    <xme:kRr2Y_rDcIlUUroaiNON3InQinQ5cZER9GPwubvkOXyqhARRY5o0zYR3M7r-iboZV
    5mESgeohyKZCjsIDnY>
X-ME-Received: <xmr:kRr2Y6Nl7kK3L-9EJbzaWulMM751DAyK-x3EUTMo_TFLgLxQOnUBS4pIiTCd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:khr2Y44k-f8lGvXVpfkiyhTu-K5nUpUo_usZN-Owu2afTvXZjm5Maw>
    <xmx:khr2Y87oF-dy0Qq1uqr0amcdajC_jRA3PhOwbOcVyP4V45QkI55gYw>
    <xmx:khr2YwjQJaOcURNBXeonaXJ3885rq_0kR6lixtyi68AWcZsM707kDQ>
    <xmx:khr2Y8j0bzq9U0BMjug_XQefxGrIxZw6wz1xnuCljQSdSBkOkuUKsQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 08:37:20 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 2/3] riscv: Set dma_default_coherent to true
Date: Wed, 22 Feb 2023 13:37:11 +0000
Message-Id: <20230222133712.8079-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
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

For riscv our assumption is unless a device states it is non-coherent,
we take it to be DMA coherent.

For devicetree probed devices that have been true since very begining
with OF_DMA_DEFAULT_COHERENT selected.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/riscv/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..34b371180976 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+	dma_default_coherent = true;
+#endif
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
-- 
2.37.1 (Apple Git-137.1)

