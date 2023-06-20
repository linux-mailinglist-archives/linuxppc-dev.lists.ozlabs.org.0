Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3147372B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 19:25:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S0nBKMBy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qltnk6KWGz3bYm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 03:25:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S0nBKMBy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=luto@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qltmp0L62z30fx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 03:24:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22F736131C;
	Tue, 20 Jun 2023 17:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB89C433C0;
	Tue, 20 Jun 2023 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687281893;
	bh=Rd2KQT7Sg/jj2vpD/+cypNQq21vO707uBhL4Wt60ONQ=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=S0nBKMBymT7QgN7x8a89rfrJmeCB9n8O7Yfrne22w/1XbfEHmFl1Rqalu8V/ctdwS
	 YreKhbQDy/vrV6XZmrrg4bizue1smNoWLhFBgswQZanSO4Ro92yaaAarg99MPxLbzh
	 yKpDLNdRGTmfjIOljRoFNpPZHwH7wQAxmm3pHmr/BMx7AD4TENI+Rdqs8cBj0HzkcA
	 AtzbtBIHLvIwmOtc7p98zex7yFJwdycS0VkoDAf/l+jTz0QeCFN00hEKQ7OjiUPAvB
	 1clLx9hEwjZPVs40/3CKaXd3OODSbCepYMVDnv8Im1RrAg3NVZTc3mdnFGl41caa5W
	 PQziUw7BgRvUg==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id C920427C005A;
	Tue, 20 Jun 2023 13:24:51 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Tue, 20 Jun 2023 13:24:51 -0400
X-ME-Sender: <xms:4uCRZGPuv7m8KaXFojrVeCbfWrMZ7IJoui-4aoDexdm_V34ZG0-I6g>
    <xme:4uCRZE-OH2xt14uLz-FF7dbdv-gHG5w14JwsdNtUTTBditVKBbvq_q8tXxJx8iDzO
    WaowhDX_m63-nZ50aI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefhedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhguhicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeduveffvdegvdefhfegjeejlefgtdffueekudfgkeduvdetvddu
    ieeluefgjeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedu
    keehieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinh
    hugidrlhhuthhordhush
X-ME-Proxy: <xmx:4uCRZNTpfg2cGu-JZbGK0lauKT6LTXTvSpjwrRQTqsoePCHX_VolEg>
    <xmx:4uCRZGtzcXFiHy54TUV3vETkj3W0NygxpQUty3hSE43wjAfN8bvT-A>
    <xmx:4uCRZOcK6KfTYx9uY7noUEoncUDShNm2IP8FjLgB4nFv3QpkDL6MpA>
    <xmx:4-CRZOAOrENLDeV3AOynkkTJ3wDHPyrZf0jxchqFsnzGmPnTrQoXvQ>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 85C9831A0063; Tue, 20 Jun 2023 13:24:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <6145cabf-d016-4dba-b5d2-0fb793352058@app.fastmail.com>
In-Reply-To: <7F566E60-C371-449B-992B-0C435AD6016B@gmail.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
 <7F566E60-C371-449B-992B-0C435AD6016B@gmail.com>
Date: Tue, 20 Jun 2023 10:24:29 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Nadav Amit" <nadav.amit@gmail.com>, "Song Liu" <song@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, the arch/x86 maintainers <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm <linux-mm@kvack.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf <bpf@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Mon, Jun 19, 2023, at 1:18 PM, Nadav Amit wrote:
>> On Jun 19, 2023, at 10:09 AM, Andy Lutomirski <luto@kernel.org> wrote:
>>=20
>> But jit_text_alloc() can't do this, because the order of operations d=
oesn't match.  With jit_text_alloc(), the executable mapping shows up be=
fore the text is populated, so there is no atomic change from not-there =
to populated-and-executable.  Which means that there is an opportunity f=
or CPUs, speculatively or otherwise, to start filling various caches wit=
h intermediate states of the text, which means that various architecture=
s (even x86!) may need serialization.
>>=20
>> For eBPF- and module- like use cases, where JITting/code gen is quite=
 coarse-grained, perhaps something vaguely like:
>>=20
>> jit_text_alloc() -> returns a handle and an executable virtual addres=
s, but does *not* map it there
>> jit_text_write() -> write to that handle
>> jit_text_map() -> map it and synchronize if needed (no sync needed on=
 x86, I think)
>
> Andy, would you mind explaining why you think a sync is not needed? I=20
> mean I have a =E2=80=9Cfeeling=E2=80=9D that perhaps TSO can guarantee=
 something based=20
> on the order of write and page-table update. Is that the argument?

Sorry, when I say "no sync" I mean no cross-CPU synchronization.  I'm as=
suming the underlying sequence of events is:

allocate physical pages (jit_text_alloc)

write to them (with MOV, memcpy, whatever), via the direct map or via a =
temporary mm

do an appropriate *local* barrier (which, on x86, is probably implied by=
 TSO, as the subsequent pagetable change is at least a release; also, an=
y any previous temporary mm stuff would have done MOV CR3 afterwards, wh=
ich is a full "serializing" barrier)

optionally zap the direct map via IPI, assuming the pages are direct map=
ped (but this could be avoided with a smart enough allocator and tempora=
ry_mm above)

install the final RX PTE (jit_text_map), which does a MOV or maybe a LOC=
K CMPXCHG16B.  Note that the virtual address in question was not readabl=
e or executable before this, and all CPUs have serialized since the last=
 time it was executable.

either jump to the new text locally, or:

1. Do a store-release to tell other CPUs that the text is mapped
2. Other CPU does a load-acquire to detect that the text is mapped and j=
umps to the text

This is all approximately the same thing that plain old mmap(..., PROT_E=
XEC, ...) does.

>
> On this regard, one thing that I clearly do not understand is why=20
> *today* it is ok for users of bpf_arch_text_copy() not to call=20
> text_poke_sync(). Am I missing something?

I cannot explain this, because I suspect the current code is wrong.  But=
 it's only wrong across CPUs, because bpf_arch_text_copy goes through te=
xt_poke_copy, which calls unuse_temporary_mm(), which is serializing.  A=
nd it's plausible that most eBPF use cases don't actually cause the load=
ed program to get used on a different CPU without first serializing on t=
he CPU that ends up using it.  (Context switches and interrupts are seri=
alizing.)

FRED could make interrupts non-serializing. I sincerely hope that FRED d=
oesn't cause this all to fall apart.

--Andy
