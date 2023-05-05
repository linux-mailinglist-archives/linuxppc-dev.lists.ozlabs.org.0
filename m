Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E46F83CA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 15:20:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCWWl5HBDz3ch2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 23:20:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=T7QiYreO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FVvu2kHf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=T7QiYreO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FVvu2kHf;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCWVm4wl8z3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 23:19:27 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1A10F5802A0;
	Fri,  5 May 2023 09:19:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 05 May 2023 09:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683292759; x=1683299959; bh=MFewdMftG+wRD887OcQ41hQs0awPz56T0ru
	yGnj8ABI=; b=T7QiYreOPC+QycowzVZsUb+Flt5SaOjHFxAhKjqZsP+nsbKyqVd
	vQ8eowoEYwNI/GU+ISyjC+jWPEKamuy6X2bmGmXoFQmBFMRt3DPTZF7imVRis0gr
	S0EkyyDbQvtLD7pfZ4AsHyrYk42NDSyf8/wa7V9JGjoeIM+dclks9qkVsfuCYS36
	2bnobzF6Lg7r4sP9JfGrvCZy6bK7TL5qDUup6dDDozkhtlDKoL2JENn8cqmA5ZJ5
	wLu4/Si0kCVvWmQxVaYqYa+bPXXPogECh5ZRpy0s2bQVgjpqCgavDgb5K4Sf79fl
	Z2ACYtb7nNPJlBQY7RKS+i0yrfAvSYbn6sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683292759; x=1683299959; bh=MFewdMftG+wRD887OcQ41hQs0awPz56T0ru
	yGnj8ABI=; b=FVvu2kHfPB+goofUSO7GBQXw9iAuEK1luvy6mN9DIT3CnY67Gls
	0KZVLaa6ELu1958ejxqPitibsxtjnQdtVNl7Z4DIo/7t6vSCqKnMSbKFtiZxUfg8
	SuTynEk2oMcUtF9nJJbJg0GYURVCU7bPEPfG8kEUYCku0K859h+BHBVlobnzbNVb
	9jCOuQHGR9JdwHKNFMPcOBCnbMbqE970CGlmaHJPbDGFzyO5if6gbd+OUkaHxy+L
	frNzAleO1fKFLe9X7xNq2nNbq2hrGATg6TTB1yBWoA0Wjb4XH3SHavwUomASSa1B
	aF2LKjYsYglP/xYL6ASj4zNf9qShE/HNiUg==
X-ME-Sender: <xms:UwJVZOh9cnZIXMM77LhNvXoz2YNii-arffCBI32Pq_fv4QfUTdVISg>
    <xme:UwJVZPAntNX3cn4OGLtqo2LRLlqkpl7Dvxks5UPOgyYyhnzhUynPY4VJ3y3azSULF
    _Z-HMCpBmE7SFSlVlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:UwJVZGH5NsIuOroPMeDuiba-Tn1p718Jzhmp9sTCmS-1lOWUaiFtVQ>
    <xmx:UwJVZHTAxF0WKn8MsTwRzrxqsy1jTv31MgcN7ZNnDyiETst0t2wtOQ>
    <xmx:UwJVZLzt4fDtGxTef6RbmcqquDaW2xXV0M3lt4aM-O0fppZufkssOQ>
    <xmx:VwJVZHhc7KCJPgnStXUQtZd0bp63LSI-wEqxVbh0vya0G4fcoSCVFw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 110CDB60089; Fri,  5 May 2023 09:19:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
In-Reply-To:  <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-10-arnd@kernel.org>
 <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Date: Fri, 05 May 2023 15:18:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional
 DMA
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 5, 2023, at 07:47, Guo Ren wrote:
> On Mon, Mar 27, 2023 at 8:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:

>>
>> riscv also invalidates the caches before the transfer, which does
>> not appear to serve any purpose.
> Yes, we can't guarantee the CPU pre-load cache lines randomly during
> dma working.
>
> But I've two purposes to keep invalidates before dma transfer:
>  - We clearly tell the CPU these cache lines are invalid. The caching
> algorithm would use these invalid slots first instead of replacing
> valid ones.
>  - Invalidating is very cheap. Actually, flush and clean have the same
> performance in our machine.

The main purpose of the series was to get consistent behavior on
all machines, so I really don't want a custom optimization on
one architecture. You make a good point about cacheline reuse
after invalidation, but if we do that, I'd suggest doing this
across all architectures.

> So, how about:
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-nonco=
herent.c
> index d919efab6eba..2c52fbc15064 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -22,8 +22,6 @@ void arch_sync_dma_for_device(phys_addr_t paddr, siz=
e_t size,
>                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>                 break;
>         case DMA_FROM_DEVICE:
> -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> -               break;
>         case DMA_BIDIRECTIONAL:
>                 ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
>                 break;

This is something we can consider. Unfortunately, this is something
that no architecture (except pa-risc, which has other problems)
does at the moment, so we'd probably need to have a proper debate
about this.

We already have two conflicting ways to handle DMA_FROM_DEVICE,
either invalidate/invalidate, or clean/invalidate. I can see
that flush/invalidate may be a sensible option as well, but I'd
want to have that discussion after the series is complete, so
we can come to a generic solution that has the same documented
behavior across all architectures.

In particular, if we end up moving arm64 and riscv back to the
traditional invalidate/invalidate for DMA_FROM_DEVICE and
document that driver must not rely on buffers getting cleaned
before a partial DMA_FROM_DEVICE, the question between clean
or flush becomes moot as well.

> @@ -42,7 +40,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t=
 size,
>                 break;
>         case DMA_FROM_DEVICE:
>         case DMA_BIDIRECTIONAL:
>                 /* I'm not sure all drivers have guaranteed cacheline
> alignment. If not, this inval would cause problems */
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>                 break;

This is my original patch, and I would not mix it with the other
change. The problem with non-aligned DMA_BIDIRECTIONAL buffers in
is that both flush and inval would be wrong if you get simultaneous
writes from device and cpu to the same cache line, so there is
no way to win this. Using inval instead of flush would at least
work if the CPU data in the cacheline is read-only from the CPU,
so that seems better than something that is always wrong.

The documented API is that sharing the cache line is not allowed
at all, so anything that would observe a difference between the
two is also a bug. One idea that we have considered already is
that we could overwrite the unused bits of the cacheline with
poison values and/or mark them as invalid using KASAN for debugging
purposes, to find drivers that already violate this.

      Arnd
