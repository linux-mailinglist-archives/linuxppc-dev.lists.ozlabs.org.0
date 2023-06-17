Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9EF7343B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 22:39:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JKzE4z2t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qk7Dw6g77z306t
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 06:39:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JKzE4z2t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=luto@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qk7D12lytz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 06:38:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C002261259;
	Sat, 17 Jun 2023 20:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E59C433CA;
	Sat, 17 Jun 2023 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687034333;
	bh=WVP/rhexoYDXJAhdCS8+aXf4gLUVAzDkioEZAL3bkuY=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=JKzE4z2tSEoLkc7ndZWnN4X7rPbZEhhlfrZyLWi07NSuE063OnjnC6kfUU9bDE7Q9
	 dYA+ZpDXUBD2TgjoWFjLAe+1VQ5WrMEQP2Oc9RGbVW9Wm4fut1k9el1xGXrGAH5XMV
	 Vnj1FFJmE2x7cDhuvv0urvwR7eE2IJsG6wxHbKmZVXtzDiEbQttYBzKZysC9OE/47n
	 JBkqqNwFgve/J61DF6GlrPrdaUiX2HWbrE8tfOts8C1LTzC7qOduTMdCt7JxlC8PRU
	 FJrqMxXtr7sBOMLN0/Tey+NujGr9peRqjts6e1zOlWFY5KMatDCGIXdhGrkirNWaIE
	 ASCBN9CMJq/6w==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 4D15627C005B;
	Sat, 17 Jun 2023 16:38:51 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Sat, 17 Jun 2023 16:38:51 -0400
X-ME-Sender: <xms:2RmOZAtF4kawe3C5LWsJNWQ25geVFsDB-J3eVTm4naED3U4-j3ZFyA>
    <xme:2RmOZNdjefCtSEpuXyhr3rhTFxcEuYpuIPYT9noXuC5ioHZHbuzE6pY15kbU4Az-n
    KsL6vgRcAh63E8_HrY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvjedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhguhicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeevfffgvefhieetudeuteegvedvveduveetfeevffduieevfedu
    tdeliedtledugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnugihodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdduudeiudekheeifedvqddvieefudeiiedtkedqlh
    huthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuhigrdhluhhtohdruhhs
X-ME-Proxy: <xmx:2hmOZLwE9-bVWo7RnP5AgBJjz5OzMrxujaBVgN9FDA0qATIFW3Zhpw>
    <xmx:2hmOZDNYoe8sH-Qwz4aFz3clai7LpDSTfbbgbACuWdxzEgAb13tbEg>
    <xmx:2hmOZA8kOMIqCUhH3mWr1mKvGVtcde2JYkSEZ4c4kedl90XEPGeTog>
    <xmx:2xmOZO8tHx8Uf0_GzjXidaY35xpRYs0lINfwa1sT1FrfVdAWjlcBDg>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E1AA531A0063; Sat, 17 Jun 2023 16:38:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
In-Reply-To: <20230616085038.4121892-3-rppt@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
Date: Sat, 17 Jun 2023 13:38:29 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
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
Cc: Mark Rutland <mark.rutland@arm.com>, the arch/x86 maintainers <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023, at 1:50 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> module_alloc() is used everywhere as a mean to allocate memory for code.
>
> Beside being semantically wrong, this unnecessarily ties all subsystems
> that need to allocate code, such as ftrace, kprobes and BPF to modules
> and puts the burden of code allocation to the modules code.
>
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
>
> Start splitting code allocation from modules by introducing
> execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs.
>
> Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> module_alloc() and execmem_free() and jit_free() are replacements of
> module_memfree() to allow updating all call sites to use the new APIs.
>
> The intention semantics for new allocation APIs:
>
> * execmem_text_alloc() should be used to allocate memory that must reside
>   close to the kernel image, like loadable kernel modules and generated
>   code that is restricted by relative addressing.
>
> * jit_text_alloc() should be used to allocate memory for generated code
>   when there are no restrictions for the code placement. For
>   architectures that require that any code is within certain distance
>   from the kernel image, jit_text_alloc() will be essentially aliased to
>   execmem_text_alloc().
>

Is there anything in this series to help users do the appropriate synchronization when the actually populate the allocated memory with code?  See here, for example:

https://lore.kernel.org/linux-fsdevel/cb6533c6-cea0-4f04-95cf-b8240c6ab405@app.fastmail.com/T/#u
