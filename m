Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA74756A32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 19:25:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U55TcGyi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4TVb6V9xz2ygV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 03:25:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U55TcGyi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=luto@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4TTl6NsYz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 03:24:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 196686118F;
	Mon, 17 Jul 2023 17:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249E2C433C8;
	Mon, 17 Jul 2023 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689614665;
	bh=o+WgjDKzf9AD9b+kUzQGRClRYLlDB82OkTDYfv6a3Yk=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=U55TcGyi7YmJyhzLOTZnjrFVWw0H3+af918Yjk8mPHfHD/clSDnn9R44JznF10IRH
	 Z8KK+n6r0jSrVIOFXY3K9zEUwgWJJmDl6U+xcWuKBgzWtStxy8DJ8vdgvW6lkDoW7B
	 HjBUxuU9UxtzkC9l5ApN5DKkzBCr1VsqK7wmYWuXqa2OawFE6M2Oq9WP6fcTzeqAS1
	 oQr1aLD/6waYS1NoUdY5C7XFt1xXn2X7vRDexou/Ye3pmNVTURfyjeGdd/9YrFIH9l
	 MqvAuz5uF3yGQhNR2S/bV8TY4Zn4vPj0wIo0nVHW6MMTPN4UGDgaMVOo3Hl1Lknk4t
	 QarZtUu8s3ucw==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0594A27C0054;
	Mon, 17 Jul 2023 13:24:22 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Mon, 17 Jul 2023 13:24:23 -0400
X-ME-Sender: <xms:RXm1ZG1tVKd235OTAKjb7YgspTMPR-qImOZNagZiOwv_r996Wpl_EA>
    <xme:RXm1ZJGhtMeEyJx0NHmpmxK7orhG2xuLUV7eaWrGF_5mvemHNiGzAxoeoH8wHPKOx
    Be-_jfsguKQ7NGLhQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhguhicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeduveffvdegvdefhfegjeejlefgtdffueekudfgkeduvdetvddu
    ieeluefgjeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedu
    keehieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinh
    hugidrlhhuthhordhush
X-ME-Proxy: <xmx:RXm1ZO5oHfgOl5d-JsrWsEmT0wZ8c7lpn-wGY1Pk1MKOwuxnVn3prQ>
    <xmx:RXm1ZH3tFnXsbSmPTR9ONplP-mkjz9Tn9-KQt1DQXW36vSF4M5jnmA>
    <xmx:RXm1ZJEwoQUXW2HC-hvtBktlwQpPz6VjPtqSmOfmC010d9JGpLVfQw>
    <xmx:Rnm1ZFKtTGUhG1K7QB02N33IARC_1h22efMRZVMJvVFaIkzEJg1UPw>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D060531A0064; Mon, 17 Jul 2023 13:24:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <d305b437-9eef-42da-821e-67365aad520b@app.fastmail.com>
In-Reply-To:  <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
 <20230625161417.GK52412@kernel.org> <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
 <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Date: Mon, 17 Jul 2023 10:23:56 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Song Liu" <song@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
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
Cc: the arch/x86 maintainers <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kerne
 l.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Mon, Jun 26, 2023, at 10:48 AM, Song Liu wrote:
> On Mon, Jun 26, 2023 at 5:31=E2=80=AFAM Mark Rutland <mark.rutland@arm=
.com> wrote:
>>
> [...]
>> >
>> > So the idea was that jit_text_alloc() will have a cache of large pa=
ges
>> > mapped ROX, will allocate memory from those caches and there will be
>> > jit_update() that uses text poking for writing to that memory.
>> >
>> > Upon allocation of a large page to increase the cache, that large p=
age will
>> > be "invalidated" by filling it with breakpoint instructions (e.g in=
t3 on
>> > x86)
>>
>> Does that work on x86?
>>
>> That is in no way gauranteed for other architectures; on arm64 you ne=
ed
>> explicit cache maintenance (with I-cache maintenance at the VA to be =
executed
>> from) followed by context-synchronization-events (e.g. via ISB instru=
ctions, or
>> IPIs).
>
> I guess we need:
> 1) Invalidate unused part of the huge ROX pages;
> 2) Do not put two jit users (including module text, bpf, etc.) in the
> same cache line;
> 3) Explicit cache maintenance;
> 4) context-synchronization-events.
>
> Would these (or a subset of them) be sufficient to protect us from tor=
n read?

Maybe?  #4 is sufficiently vague that I can't really interpret it.

I have a half-drafted email asking for official clarification on the rul=
es that might help shed light on this.  I find that this type of request=
 works best when it's really well written :)

>
> Thanks,
> Song
