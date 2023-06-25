Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D3673D2A3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jun 2023 19:00:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cOWR4r04;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qpy0c4fG4z30GJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 03:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cOWR4r04;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=luto@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qpxzh6RwQz2yV5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 03:00:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9382360B42;
	Sun, 25 Jun 2023 16:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33248C433C8;
	Sun, 25 Jun 2023 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687712398;
	bh=aLCuUdfO6pxcjuIFQrLZGXDWAtq12vZAS1hIVljCMnc=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=cOWR4r045oxtLVetz/9eapfdZNWb4ATF+yfHt+motXh4ZE3I83jOk7XXblg2E4fgL
	 Al0LxzKRQy85dESKdLUZCbByKlhPm+OGYy7gReJ06pqVh+h438RKiak/yZpdhfEZ9I
	 SJiqyStCpEz0OupUQjW5d2NawViNDf6VpRKXr6zzKCtJ5iBVB+h1Ss5kSpVW1QKtI+
	 BR3IBCwnVoSAOa29cfKkS1d0wcRn4bPps29mPq9lMXFfOx8BbDjW0NTFzExr+aYqih
	 7qnk0oYyAxLjmq51SExt+8wUNpHz99SHjuW2i5C14Mo3X1Qh7b2PSIfXAdgRa5deU4
	 sjPVr8jRp0ygQ==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0BE8127C0054;
	Sun, 25 Jun 2023 12:59:56 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Sun, 25 Jun 2023 12:59:56 -0400
X-ME-Sender: <xms:inKYZEjtReBigAD1i_dhXvqwXUgMMI0KIrTJOMMv2rfcayN8IN02Ew>
    <xme:inKYZNDTSsc5W3Ng387BPNeiFzXJjJETX3V_DL8KVAzyO2XpVGfgccTtaq7REhe5K
    C8j22pDYyY4r1GVsgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehtddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehnugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqne
    cuggftrfgrthhtvghrnhepudevffdvgedvfefhgeejjeelgfdtffeukedugfekuddvtedv
    udeileeugfejgefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudei
    udekheeifedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlih
    hnuhigrdhluhhtohdruhhs
X-ME-Proxy: <xmx:inKYZMFnSbDjFesDzdzfCdN7QnRtPXWDI_AlO5M-J2Nv4gORRwApTw>
    <xmx:inKYZFT_R0sRWLiO6AFlxtv669gauGwxqpTMNTHlTngUIDgTAwAZJQ>
    <xmx:inKYZBzzwDJo8YSwxaouPhZKbXIOrC5zPPjMK543eaCis3iZK4jxBA>
    <xmx:i3KYZPnm6gHODaNtvmx5CxhJNHebwbbF95ev6Mro-blkwAzlzHLN4w>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8085731A0063; Sun, 25 Jun 2023 12:59:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <90161ac9-3ca0-4c72-b1c4-ab1293e55445@app.fastmail.com>
In-Reply-To: <20230625161417.GK52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
 <20230625161417.GK52412@kernel.org>
Date: Sun, 25 Jun 2023 09:59:34 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, the arch/x86 maintainers <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing
  List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Sun, Jun 25, 2023, at 9:14 AM, Mike Rapoport wrote:
> On Mon, Jun 19, 2023 at 10:09:02AM -0700, Andy Lutomirski wrote:
>>=20
>> On Sun, Jun 18, 2023, at 1:00 AM, Mike Rapoport wrote:
>> > On Sat, Jun 17, 2023 at 01:38:29PM -0700, Andy Lutomirski wrote:
>> >> On Fri, Jun 16, 2023, at 1:50 AM, Mike Rapoport wrote:
>> >> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>> >> >
>> >> > module_alloc() is used everywhere as a mean to allocate memory f=
or code.
>> >> >
>> >> > Beside being semantically wrong, this unnecessarily ties all sub=
systems
>> >> > that need to allocate code, such as ftrace, kprobes and BPF to m=
odules
>> >> > and puts the burden of code allocation to the modules code.
>> >> >
>> >> > Several architectures override module_alloc() because of various
>> >> > constraints where the executable memory can be located and this =
causes
>> >> > additional obstacles for improvements of code allocation.
>> >> >
>> >> > Start splitting code allocation from modules by introducing
>> >> > execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free=
() APIs.
>> >> >
>> >> > Initially, execmem_text_alloc() and jit_text_alloc() are wrapper=
s for
>> >> > module_alloc() and execmem_free() and jit_free() are replacement=
s of
>> >> > module_memfree() to allow updating all call sites to use the new=
 APIs.
>> >> >
>> >> > The intention semantics for new allocation APIs:
>> >> >
>> >> > * execmem_text_alloc() should be used to allocate memory that mu=
st reside
>> >> >   close to the kernel image, like loadable kernel modules and ge=
nerated
>> >> >   code that is restricted by relative addressing.
>> >> >
>> >> > * jit_text_alloc() should be used to allocate memory for generat=
ed code
>> >> >   when there are no restrictions for the code placement. For
>> >> >   architectures that require that any code is within certain dis=
tance
>> >> >   from the kernel image, jit_text_alloc() will be essentially al=
iased to
>> >> >   execmem_text_alloc().
>> >> >
>> >>=20
>> >> Is there anything in this series to help users do the appropriate
>> >> synchronization when the actually populate the allocated memory wi=
th
>> >> code?  See here, for example:
>> >
>> > This series only factors out the executable allocations from module=
s and
>> > puts them in a central place.
>> > Anything else would go on top after this lands.
>>=20
>> Hmm.
>>=20
>> On the one hand, there's nothing wrong with factoring out common code=
. On
>> the other hand, this is probably the right time to at least start
>> thinking about synchronization, at least to the extent that it might =
make
>> us want to change this API.  (I'm not at all saying that this series
>> should require changes -- I'm just saying that this is a good time to
>> think about how this should work.)
>>=20
>> The current APIs, *and* the proposed jit_text_alloc() API, don't actu=
ally
>> look like the one think in the Linux ecosystem that actually
>> intelligently and efficiently maps new text into an address space:
>> mmap().
>>=20
>> On x86, you can mmap() an existing file full of executable code PROT_=
EXEC
>> and jump to it with minimal synchronization (just the standard implic=
it
>> ordering in the kernel that populates the pages before setting up the
>> PTEs and whatever user synchronization is needed to avoid jumping into
>> the mapping before mmap() finishes).  It works across CPUs, and the o=
nly
>> possible way userspace can screw it up (for a read-only mapping of
>> read-only text, anyway) is to jump to the mapping too early, in which
>> case userspace gets a page fault.  Incoherence is impossible, and no =
one
>> needs to "serialize" (in the SDM sense).
>>=20
>> I think the same sequence (from userspace's perspective) works on oth=
er
>> architectures, too, although I think more cache management is needed =
on
>> the kernel's end.  As far as I know, no Linux SMP architecture needs =
an
>> IPI to map executable text into usermode, but I could easily be wrong.
>> (IIRC RISC-V has very developer-unfriendly icache management, but I d=
on't
>> remember the details.)
>>=20
>> Of course, using ptrace or any other FOLL_FORCE to modify text on x86=
 is
>> rather fraught, and I bet many things do it wrong when userspace is
>> multithreaded.  But not in production because it's mostly not used in
>> production.)
>>=20
>> But jit_text_alloc() can't do this, because the order of operations
>> doesn't match.  With jit_text_alloc(), the executable mapping shows up
>> before the text is populated, so there is no atomic change from not-t=
here
>> to populated-and-executable.  Which means that there is an opportunity
>> for CPUs, speculatively or otherwise, to start filling various caches
>> with intermediate states of the text, which means that various
>> architectures (even x86!) may need serialization.
>>=20
>> For eBPF- and module- like use cases, where JITting/code gen is quite
>> coarse-grained, perhaps something vaguely like:
>>=20
>> jit_text_alloc() -> returns a handle and an executable virtual addres=
s,
>> but does *not* map it there
>> jit_text_write() -> write to that handle
>> jit_text_map() -> map it and synchronize if needed (no sync needed on
>> x86, I think)
>>=20
>> could be more efficient and/or safer.
>>=20
>> (Modules could use this too.  Getting alternatives right might take s=
ome
>> fiddling, because off the top of my head, this doesn't match how it w=
orks
>> now.)
>>=20
>> To make alternatives easier, this could work, maybe (haven't fully
>> thought it through):
>>=20
>> jit_text_alloc()
>> jit_text_map_rw_inplace() -> map at the target address, but RW, !X
>>=20
>> write the text and apply alternatives
>>=20
>> jit_text_finalize() -> change from RW to RX *and synchronize*
>>=20
>> jit_text_finalize() would either need to wait for RCU (possibly extra
>> heavy weight RCU to get "serialization") or send an IPI.
>
> This essentially how modules work now. The memory is allocated RW, wri=
tten
> and updated with alternatives and then made ROX in the end with set_me=
mory
> APIs.
>
> The issue with not having the memory mapped X when it's written is tha=
t we
> cannot use large pages to map it. One of the goals is to have executab=
le
> memory mapped with large pages and make code allocator able to divide =
that
> page among several callers.
>
> So the idea was that jit_text_alloc() will have a cache of large pages
> mapped ROX, will allocate memory from those caches and there will be
> jit_update() that uses text poking for writing to that memory.
>
> Upon allocation of a large page to increase the cache, that large page=
 will
> be "invalidated" by filling it with breakpoint instructions (e.g int3 =
on
> x86)

Is this actually valid?  In between int3 and real code, there=E2=80=99s =
a potential torn read of real code mixed up with 0xcc.

>
> To improve the performance of this process, we can write to !X copy and
> then text_poke it to the actual address in one go. This will require s=
ome
> changes to get the alternatives right.
>
> --=20
> Sincerely yours,
> Mike.
