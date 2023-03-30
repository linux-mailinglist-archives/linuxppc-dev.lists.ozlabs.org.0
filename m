Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0386CFC60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 09:12:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnF3l1GCXz3f7r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 18:12:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=QVEDTKeV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oomTeCD5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=QVEDTKeV;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oomTeCD5;
	dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnF2m0yZBz3cMr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 18:11:26 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 91091581DB4;
	Thu, 30 Mar 2023 03:11:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 30 Mar 2023 03:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680160280; x=1680167480; bh=wG
	Aj9k8TObyqA6xHoUKa8szJrjCAJbphSDFQitQcQQs=; b=QVEDTKeVke/4u7Kg+r
	/f0Ng8qyMJQjA0k7T1uZbzE62G/ueNBnWjpEnArFMDM92zNIXQ0BVhpsTK81gyt0
	xSP5pbZY1IxVpqUBM+h72I4sgGKqPjbLqxNcKo6QCWkB1PzdfOUSKkfxHkuBpgbQ
	cYQ6HqJa3bwV0Vkf7hmy8ejQKyFDSRYDfGJpYSPAochCUC5d86UJcSmtdy6Sxo6B
	Jwxhii7JHhX5S3HrIP0mKrvU6BvYZqwsLNUfy16VYFyQuCPOCAze4qZ6sDRlwyQw
	F08a6VUS4QIWlJ5ptfnwv75T7l2QsYPv/2qWlc1FTlhkx6SDxxZZxa17eJWjG25W
	8QyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680160280; x=1680167480; bh=wGAj9k8TObyqA
	6xHoUKa8szJrjCAJbphSDFQitQcQQs=; b=oomTeCD59PNC83Jndx1U6VLOVE5Dm
	iHmSiz3n1GUnKD2uHg/nJb7LQ4xFS4iggJ6sXq9/uqeoafmTb21qaw3LmGDGWVXs
	zFRwDOtSbIgfSbefSTdQy+SDzfOWXM+Nas8Aqo7qkiw5wE6y4qdG6iwjS4DRWXtn
	XctTZFf5GY9RMg5ciHLqGdffXqZGKOwN45T9El3FCgUi5LSy7a/pQo0750iSwL/f
	RG+pNkv9fRAgzmmzo4HLa1cEOhymbMSIXzYbzI354FYA0THouxwTuuuM0yobQ3gk
	LFgzGrnAkD2cRuN42h7TslpEIGdInF1W2TSA3tfbtXeFABGM7k1iBb/7Q==
X-ME-Sender: <xms:FTYlZOrkzwdxpCxeIZzclV90hxzPUSC3ms8-E11J67_aPSJXJ1BIkg>
    <xme:FTYlZMrP3FZFc1NJSA8GIlQPVO9kl25CsPN1r07QL_dGO5vWTCxWy7o2eATgnKdQ9
    a578gSy3QQoXr1upcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehjedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FjYlZDNNTBCw6HhWBDqV-oUWPDwRI7BTNiBMI3iXI3sHS545zVmJ2w>
    <xmx:FjYlZN4cwCdj47vqSASOc6XR5L2duLCySn6_f-BJZvURW8Sn6XqTzw>
    <xmx:FjYlZN6Cp-M6Z89_Yu31L8qrA-V1bCiPBKi9s_taeLF3yPIrQttNLw>
    <xmx:GDYlZL7CJyRZz1a_FlDEKTyWBaiLrIUUjNVWWchrrS5Jr6hXYCWp0A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E08C7B60086; Thu, 30 Mar 2023 03:11:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <34f3e043-20eb-40b2-a7f5-b1b98a0d452a@app.fastmail.com>
In-Reply-To: <2668e232-ae83-4576-beaa-08e420236996@spud>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
 <2668e232-ae83-4576-beaa-08e420236996@spud>
Date: Thu, 30 Mar 2023 09:10:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Samuel Holland <samuel@sholland.org>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 29, 2023, at 22:48, Conor Dooley wrote:
> On Mon, Mar 27, 2023 at 02:13:04PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> No other architecture intentionally writes back dirty cache lines into
>> a buffer that a device has just finished writing into. If the cache is
>> clean, this has no effect at all, but
>
>> if a cacheline in the buffer has
>> actually been written by the CPU,  there is a drive bug that is likely
>> made worse by overwriting that buffer.
>
> So does this need a
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using 
> zicbom extension")
> then, even if the cacheline really should not have been touched by the
> CPU?
> Also, minor typo, s/drive/driver/.

done

> In the thread we had that sparked this, I went digging for the source of
> the flushes, and it came from a review comment:
> https://lore.kernel.org/linux-riscv/342e3c12-ebb0-badf-7d4c-c444a2b842b2@sholland.org/

Ah, so the comment that led to it was 

"For arch_sync_dma_for_cpu(DMA_BIDIRECTIONAL), we expect the CPU to have
written to the buffer, so this should flush, not invalidate."

which sounds like Samuel just misunderstood what "bidirectional"
means: the comment implies that both the cpu and the device access
the buffer before arch_sync_dma_for_cpu(DMA_BIDIRECTIONAL), but
this is not allowed. Instead, the point is that the device may both
read and write the buffer, requiring that we must do a writeback
at arch_sync_dma_for_device(DMA_BIDIRECTIONAL) and an invalidate
at arch_sync_dma_for_cpu(DMA_BIDIRECTIONAL).

The comment about arch_sync_dma_for_device(DMA_FROM_DEVICE) (in the
same email) seems equally confused. It's of course easy to
misunderstand these, and many others have gotten confused in
similar ways before.

> But *surely* if no other arch needs to do that, then we are safe to also
> not do it... Your logic seems right by me at least, especially given the
> lack of flushes elsewhere.

Right, I remove the extra writeback from powerpc, parisc and microblaze
for the same reason. Those appear to only be there because they used the
same function for _for_device() as for _for_cpu(), not because someone
thought they were required.

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

     Arnd
