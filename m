Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73817AE6F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 09:35:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Rkj4/ro9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AUbkuoyp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvs325DPFz3d7x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 17:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Rkj4/ro9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AUbkuoyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvs235wxZz3cPY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 17:34:18 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id C07C03200962;
	Tue, 26 Sep 2023 03:34:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 26 Sep 2023 03:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695713650; x=1695800050; bh=LB
	GMXw95teWGAkpYjMD4yl8r6TRMMDISQAqR/M1cGNQ=; b=Rkj4/ro9taZZHblsOD
	/G8RJaZMr5EoZi3BiBVuPydXcqLBt6JUnEwEBSkbH9zdT7CVUQuwhIR4vjOvrJz7
	RZ3Epil4/1SvO77nFH1rFPyl9t2f+Q3SRKIN5+S4FzuiUdD22wwkSW/OYnjpuALL
	HtrICoJLxOpcEVcHu9AQxv5pZ6n5GVT1uDBGpmDdsYnAQw6s5OIHZilwNqnUGPkm
	4OjsMTRyNEOUw1tZgRF9dlyeKj8s8seL81kM8PIIQFyxX0qyog9Nsf+CDsm3zk8h
	ezgMFSodT5jl9S32PkpOMs3SS0XWcl664oOOjadAHKGA1Ihbl0lrhFruTxPcgfco
	mn5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695713650; x=1695800050; bh=LBGMXw95teWGA
	kpYjMD4yl8r6TRMMDISQAqR/M1cGNQ=; b=AUbkuoypa4Wsdj208B6uCagaZC/Xk
	A1dPx5DaS9T0xX5d79iQJKairrxWJfzJIhsL7KqjrQbLgE5SLde8s6vzO2Sgu7sc
	06ynHhZftaf9a44gz/tuW8lW6ktE/LPxdi/tVwr9o/giNuQS7K9R78duFOULJVvk
	1k2A1E6wKGy90242NbwgZjUpS/iNNlAkmDAYcKfQzd00vuPUSehSxxUFVE1h0t2e
	NLQf14NhEcO8lrG9/A5cKEmPG4gi+I2E+epzgguRRtykOaSiMVKbfBpOOt0GKV+w
	YvfRUboIrciFszM3IJHagkCio2kLoAGar1HvM8dXPFSk3ZdLkcytutiKA==
X-ME-Sender: <xms:cYkSZei1SR5UPNNwQIvWckEurLaebETqRWSoe1SREsrLxTVN2cfUEw>
    <xme:cYkSZfD_pkjEu8dR3QjlqgYUPyj0jlDPXLqqoWtk7WQpD0KW-d24VzNsz6B0lI0R5
    9d7qW7heI_wXZZFBSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegteeihfejvdfhfeffhfdvvddvfffgtedvteeigfehhfehudffleejuedu
    vdelgfenucffohhmrghinhepphgrshhtvggsihhnrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cYkSZWHxrAFODnyh7EhOUS_cy0g3aKZ0eNP-llshn5XGCVAYyWOqqw>
    <xmx:cYkSZXRYz_9Vh0d45QZpmlHlsHUwuFMyElJw8MW88YsJw5F9MbDIGQ>
    <xmx:cYkSZbyl9JOnC5D2_lPQYyAQE2fF3SjTPKuthxvBsWixLxxuu4fNLA>
    <xmx:cokSZRkGE1pp9XZSFYh5zDGevCl3JsMLQPNoMBE3R8EJIWN1PZZ3Aw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4513AB60089; Tue, 26 Sep 2023 03:34:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <44867c60-db1a-4a0c-8973-c8a03e8da0f3@app.fastmail.com>
In-Reply-To: <20230918072955.2507221-11-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-11-rppt@kernel.org>
Date: Tue, 26 Sep 2023 09:33:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/13] arch: make execmem setup available regardless of
 CONFIG_MODULES
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, Netdev <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org
 >, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023, at 09:29, Mike Rapoport wrote:
> index a42e4cd11db2..c0b536e398b4 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> +#ifdef CONFIG_XIP_KERNEL
> +/*
> + * The XIP kernel text is mapped in the module area for modules and
> + * some other stuff to work without any indirect relocations.
> + * MODULES_VADDR is redefined here and not in asm/memory.h to avoid
> + * recompiling the whole kernel when CONFIG_XIP_KERNEL is turned 
> on/off.
> + */
> +#undef MODULES_VADDR
> +#define MODULES_VADDR	(((unsigned long)_exiprom + ~PMD_MASK) & 
> PMD_MASK)
> +#endif
> +
> +#if defined(CONFIG_MMU) && defined(CONFIG_EXECMEM)
> +static struct execmem_params execmem_params __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.start = MODULES_VADDR,
> +			.end = MODULES_END,
> +			.alignment = 1,
> +		},

This causes a randconfig build failure for me on linux-next now:

arch/arm/mm/init.c:499:25: error: initializer element is not constant
  499 | #define MODULES_VADDR   (((unsigned long)_exiprom + ~PMD_MASK) & PMD_MASK)
      |                         ^
arch/arm/mm/init.c:506:34: note: in expansion of macro 'MODULES_VADDR'
  506 |                         .start = MODULES_VADDR,
      |                                  ^~~~~~~~~~~~~
arch/arm/mm/init.c:499:25: note: (near initialization for 'execmem_params.ranges[0].start')
  499 | #define MODULES_VADDR   (((unsigned long)_exiprom + ~PMD_MASK) & PMD_MASK)
      |                         ^
arch/arm/mm/init.c:506:34: note: in expansion of macro 'MODULES_VADDR'
  506 |                         .start = MODULES_VADDR,
      |                                  ^~~~~~~~~~~~~

I have not done any analysis on the issue so far, I hope
you can see the problem directly. See
https://pastebin.com/raw/xVqAyakH for a .config that runs into
this problem with gcc-13.2.0.

      Arnd
