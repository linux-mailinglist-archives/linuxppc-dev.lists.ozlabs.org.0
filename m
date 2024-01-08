Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2C826AD7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 10:37:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fy176uqq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7prf56Nyz3bp1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 20:37:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+3f2618c9c3764df0e0b1+7442+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T7pqk5kPzz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jan 2024 20:37:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nTS1Uj9X0YK5sE131pQWTs2iFDkjMx4GKaOmTl5jpqE=; b=Fy176uqqVZeORczKkanJckGA3E
	rjRR9SFWlqdBWFeQhMUeo2x5lV8XpdYa4GI0iYUzJ6xe4JfoH/ClDNDCMVJub0LPMWEwUwd8I8dr0
	WwH6zcQyiGmBNcE7Fs8axj5Vg+MNCFSetI0lVOGPKPgwxoNDApJeoPP6xe17PMl4YbYUkYENMyduB
	f083OT27kxtEMpbQucthM3SKI66TxkTOiSrMzwOmJqYthGOqjcJQX6LHBVpu97K2Nyn2Uoe2m6xiJ
	DGQPT42ehYs1d42jNISUDZY/OxsBiSJHVw2pJE0uDLbTxsdKq7BFvXx0o48duef+zb5iDUsv9NZhu
	bOOsB0Vw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rMm44-004Uoy-0z;
	Mon, 08 Jan 2024 09:37:00 +0000
Date: Mon, 8 Jan 2024 01:37:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <ZZvCPMcYq6KBs7ND@infradead.org>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-8-samuel.holland@sifive.com>
 <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
 <84389bc3-f2e7-49c5-a820-de60ee00f8a7@sifive.com>
 <CAAhV-H4JxP-j5A7KuNSBncZkHF9i3O1njCtMjVkd3=RNbE5Q7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4JxP-j5A7KuNSBncZkHF9i3O1njCtMjVkd3=RNbE5Q7w@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 07, 2024 at 10:39:07AM +0800, Huacai Chen wrote:
> > Do you mean that LoongArch32 does not support double-precision FP in hardware?
> > At least both of the consumers in this series use double-precision, so my first
> > thought is that LoongArch32 could not select ARCH_HAS_KERNEL_FPU_SUPPORT.
> Then is it possible to introduce CC_FLAGS_SP_FPU and CC_FLAGS_DP_FPU?
> I think there may be some place where SP FP is enough.

Let's defer that until it is actually neeed.
