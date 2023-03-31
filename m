Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 837866D296F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 22:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PpBhN2dWpz3fXt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 07:28:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ga32HoRE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dW2djYMp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.27; helo=wnew2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ga32HoRE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dW2djYMp;
	dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PpBgP6LD8z3fQk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 07:28:00 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 53B902B0675A;
	Fri, 31 Mar 2023 16:27:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 16:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680294472; x=1680301672; bh=/s
	Pv/U5zGrhU1zcR9PvlFx9Mj6SaMuREGSBaNy/AOF4=; b=ga32HoREWznYqBsSqM
	hn2DgPhI0+UmwSJFnXp6cXUsAyk1RZOXfq4b1WpgTwt3IraMWAxdDHHwFHQwBWRE
	TlsHkLIB3Nc4l8Bq6wSMeqIIyToWRVX/9f0t7rNKj/mDhGRzzkvtwaJ1p5UpYAuF
	Z8rGx9r19iaVplZvj6iIVKmJ3wxEDol/ZCX+kvVRcieGj5+X8Yk4mNrXKl02EzG1
	O78oDXTRdwjh2SHkZPsjwwsywB0J05PUo7W3k2TfteNL/nInrhKIiqrlfLqOpaH2
	gfSyNuJsTvaCC7NaTMNKQDKVNF1f8g489075mkua2DPfSTRqEHVWobPvSnhWQi8c
	vjHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680294472; x=1680301672; bh=/sPv/U5zGrhU1
	zcR9PvlFx9Mj6SaMuREGSBaNy/AOF4=; b=dW2djYMpYmfXAs+yd/mPO4TOJPOfU
	DV9D3TLO5Cwx60AN2ozaZ1sIoj1IN10iqG7fO5heya/Cg3MohERkBeh3ap3w9dhj
	sJFkvHI4fXsy8Q+qeBBqlnPkR+t4SXMIO4JB3c9b1mmQmo31q8RxeeafqW4SIcqP
	fnxTPr7MCW1EmoykWd6eoPr6eF59XoPpd22azkOEW5Mr9WH4A0XXyV8IeEsZIe0k
	85q8QcqlxSt6yntoYMxaNEARIaZqm5Hr0r3F7jiqQoP8/MeIKFBIoHwkM3jUUU9o
	ffdqAx7D0BFQxh01VCVU3tMUBATkOZmczDXHy4vypo6Qq38qKVE2G/xQw==
X-ME-Sender: <xms:R0InZP2mM_jrWmep9R1hMYGS1afrnIVPBm0ykREhzG_PlyR_ZhfVOA>
    <xme:R0InZOGDN7XwS-J5hXnOlgqdR_R6uQosDr5uEehGnwIeoZ4DwsslXeL5s7Xo91zNJ
    7giAHsIobNDzZFvPEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:R0InZP6k67FFoQSeK-rPwxdXX5GSxL1R6Umkg6_gzhijRjjk7V5A-A>
    <xmx:R0InZE3gnBqZ6ZPKwy_FeRDQP9lj8gZgguMivD1IW1Vv3ysgM41tAQ>
    <xmx:R0InZCFzkA8cx1WWrkfB02CceyZH0_s-MOw2UePZSeGhx5AG193e3A>
    <xmx:SEInZCmDOJpTgqXceVn7aabci-LbPxTXfmZUbcZRySBalaI8jnVt7HFkay8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F12FCB60098; Fri, 31 Mar 2023 16:27:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <578fda41-4a69-44f5-8a58-1eacd49e1347@app.fastmail.com>
In-Reply-To: <ZCcQGX/i8xBPiG7T@arm.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <ZCcQGX/i8xBPiG7T@arm.com>
Date: Fri, 31 Mar 2023 22:27:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 00/21] dma-mapping: unify support for cache flushes
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 31, 2023, at 18:53, Catalin Marinas wrote:
> On Mon, Mar 27, 2023 at 02:12:56PM +0200, Arnd Bergmann wrote:
>> Another difference that I do not address here is what cache invalidation
>> does for partical cache lines. On arm32, arm64 and powerpc, a partial
>> cache line always gets written back before invalidation in order to
>> ensure that data before or after the buffer is not discarded. On all
>> other architectures, the assumption is cache lines are never shared
>> between DMA buffer and data that is accessed by the CPU.
>
> I don't think sharing the DMA buffer with other data is safe even with
> this clean+invalidate on the unaligned cache. Mapping the DMA buffer as
> FROM_DEVICE or BIDIRECTIONAL can cause the shared cache line to be
> evicted and override the device written data. This sharing only works if
> the CPU guarantees not to dirty the corresponding cache line.
>
> I'm fine with removing this partial cache line hack from arm64 as it's
> not safe anyway. We'll see if any driver stops working. If there's some
> benign sharing (I wouldn't trust it), the cache cleaning prior to
> mapping and invalidate on unmap would not lose any data.

Ok, I'll add a patch to remove that bit from dcache_inval_poc
then. Do you know if any of the the other callers of this function
rely on on the writeback behavior, or is it safe to remove it for
all of them?

Note that before c50f11c6196f ("arm64: mm: Don't invalidate
FROM_DEVICE buffers at start of DMA transfer"), it made some
sense to write back partial cache lines before a DMA_FROM_DEVICE,
in order to allow sharing read-only data in them the same way as
on arm32 and powerpc. Doing the writeback in the sync_for_cpu
bit is of course always pointless.

       Arnd
