Return-Path: <linuxppc-dev+bounces-4421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C19FA83D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 22:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGYhM6pQNz2xfR;
	Mon, 23 Dec 2024 08:10:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734901811;
	cv=none; b=jQYm3ccZAarYhM2eX3kO0mMAGk7PbM7azotHLQv4PnavIwLkgP2aWo4mq2KJU3ZoxZU0yNgQpVK6ss/1FIpU7ggGfq1Px+YXsPaMvySE5V1rYnJDCICmzcOnaSNu9lTgU/4qw6o/BmCjZLb96u+fkpJwcgyoVSKq0RpMmv22VUL0C83FO5/ckBDcn/hM77k+ghM8LpH65pz9M9Luo7Bt2UJODyogLef/zhXsjrEU2fuWYXoR+hxGTjf/t/mE5R7faT7kyOJk17jXSo2aqPLRthZXqZKhNww9vgdr1GNvJxmHF1FFK8EznAxShvhcbIo2ET2HreHALqemuSYhHdVeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734901811; c=relaxed/relaxed;
	bh=hulTvbjJTbiMpwmmuDqHExl8kaak2t3tdounhjMSlCc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SNvyZyZrHWAhioGejBAsNBO36NHJrMz8gQ7zoY+6pakoGHAt+QP9zyRGlFvlWEl36+HLTp84AhuZYBPyOWtflzx7IqlU/im2pHuYfj9KGGVKceGPo90JrlzWBXEsy5gcz9bkVzNNizXdFaeZZD4McA1+O6+ELmn+aPlDElbiHlxhP8+iHTSZL4SBKv5vZwpwnJ0WRM+02bX5LfA4cMcagXal9dSEaKgtd1y0Vy7bF7n3gUtNhUmchuofeS0EkWoDZ1xkgoVENm/dWKZKB4fPlxQGMTU3PpzupSxLI0MewVP0mpvG6WzDiCKrTz9gQgxfWWx41rRr1/EkqOOGMltS2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=gVX/P4ik; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cT/39VKf; dkim-atps=neutral; spf=pass (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=gVX/P4ik;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cT/39VKf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGYhL1SqBz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 08:10:09 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CCB13254014C;
	Sun, 22 Dec 2024 16:10:06 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sun, 22 Dec 2024 16:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734901806;
	 x=1734988206; bh=hulTvbjJTbiMpwmmuDqHExl8kaak2t3tdounhjMSlCc=; b=
	gVX/P4ikj9XEI/+cpRAyHo110fjFeMbQdMaRUVUz47rdhluQuKIjLSjWB9AbPXDs
	4Ls1wD3OrCmiYlebxXD9KzWXIIj32by19AEnbpFxJEbOh6qfFAV6YmE37p8V05S1
	yB1LWIOAZdw947Wr/zGLNvvbnUu6K2zWS6k79+CViIkpElJP2g/FycUlMXyXc1LD
	fbvQQuzMLq6odjtfkKUAnUH1PgUJDILigxDreB0sFy1z/gD47TDcJT45czeVvvfM
	/F0kCp8lwqmlYqCiI6LVWG0bziH4ye0/NLrqx2COQ6oCe/myEpEdFpJaUIfw3M64
	ruV9wbeVbewsGl8Nylud9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734901806; x=
	1734988206; bh=hulTvbjJTbiMpwmmuDqHExl8kaak2t3tdounhjMSlCc=; b=c
	T/39VKfmYYGpPFLzEnGljLXRDNOhQVu0uwFo0sm1AuxEvzTR2WJvOYF5bG6x6K3r
	rcJXApCyeGJ+lrBAskGbsIVqZvHHNXy75pAXU3twNx25lonRiWkClBCunLAZmbdA
	9gmqL82hVdygkY1Ggdrtcjrs1orLCmwnI67qfhFThtk7kPCqOdmwSzg34c026/DG
	RbIrC5+l28S9GvQKJUmT+vctE90E/1OoATyJlyNzrlGZ+LPP5sav8ApwWya3+eDh
	r6pyiKZIl6p1MZSAgjdvb/XZ7afZVPKgghCFf3DWgTJZYwkbaRDzW5B7GOpsuNMS
	7ujVDMDCk/bst9xdb9apw==
X-ME-Sender: <xms:KoBoZ6UNMDC2oHWNRW_N2BgYv2O-s87xJMQZ_FVUatfd-xvkOMlJNg>
    <xme:KoBoZ2kpyqI0jV0t138UlngOhCds9yB7ByImCXDeYc2EHlG4_dl_C6HHQEpfsafv4
    lUfozXcipGpkls5Tdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeegueeifffgueduuedtkeeggeffheefleegteeg
    geevgeetleeiieevveeffeduteenucffohhmrghinhepohhpvghnshhouhhrtggvrdhorh
    hgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefhe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhr
    tghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtph
    htthhopehgrhgrfhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoheprghtihhshhhpsegr
    thhishhhphgrthhrrgdrohhrghdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulh
    htrdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhho
    uhhprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtph
    htthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhp
    vgesvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:KoBoZ-ZPdCMm-lShnjs_K52FgIRuio-VuZgSA3b-nt11bSrGqgehdA>
    <xmx:KoBoZxUVOvla7YwN8AwMXqBbbsjCIBNPftikOdIPI4fEbY-V66B_Ug>
    <xmx:KoBoZ0mcSy693-wwD_p3JOrUM4PlpEGv3NEXA_d16f6Y-Hf5q49URw>
    <xmx:KoBoZ2e9zYYd3C9e47i3uKuVTQh-dBzDrJ1pNnStMySFHX31HwW81A>
    <xmx:LoBoZ3GdpY_hoWY0LseweO3la8GJqDdw7KCr7e7zq3aXnz5TRGQNhVuG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C20132220072; Sun, 22 Dec 2024 16:10:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 22:09:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "A. Wilcox" <AWilcox@wilcox-tech.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: kvm@vger.kernel.org, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Alexander Graf" <graf@amazon.com>, "Crystal Wood" <crwood@redhat.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <6253307c-d3d6-485f-9d01-12787b457a99@app.fastmail.com>
In-Reply-To: <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-5-arnd@kernel.org>
 <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 22, 2024, at 03:13, A. Wilcox wrote:
> On Dec 21, 2024, at 3:42=E2=80=AFPM, Arnd Bergmann <arnd@kernel.org> w=
rote:
>>=20
>
>
> I can confirm that running 6.12.5 on a P9 host, trying to boot a 6.6
> 32-bit kernel gave me:
>
> Detected RAM kernel at 400000 (1330c8c bytes)=20
>        Welcome to Open Firmware
>
>   Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>   This program and the accompanying materials are made available
>   under the terms of the BSD License available at
>   http://www.opensource.org/licenses/bsd-license.php
>
> Booting from memory...
>=20
> ( 380 ) Data Segment Exception [ -bfc00000 ]
>
>
>     R0 .. R7           R8 .. R15         R16 .. R23         R24 .. R31
> 00000000014a1124   0000000000000000   000000000135b4ac   0000000000000=
000  =20
> 000000000dc70f30   ffffffffc0000000   000000000dc70fa4   0000000001736=
00c  =20
> 0000000000000000   000000000e477010   0000000000000000   0000000000400=
000  =20
> ffffffff0141be4c   000000000149ab74   00000000ffffffff   0000000000000=
008  =20
> 00000000c0014b6c   0000000020000402   0000000040400000   00000000016f2=
000  =20
> ffffffff40400000   0000000000000000   0000000000000000   000000000dc70=
f60  =20
> 0000000000000000   0000000000000000   000000000e73d490   000000000149f=
000  =20
> 0000000000000000   000000000e756118   000000000dc70fa0   ffffffff40400=
000  =20
>
>     CR / XER           LR / CTR          SRR0 / SRR1        DAR / DSISR
>         80000402   00000000014a1124   00000000014a1128   ffffffff0141b=
e4c  =20
> 0000000020040000   0000000000000000   8000000000003000           00000=
000  =20
>
>
> 2 >=20
>
> Which is the same thing that happens if you boot a 32-bit Linux kernel
> on a physical 64-bit Power machine.  This is probably because KVM is
> so much more accurate than TCG for Power emulation :)

Did you ask kvm to emulate a 32-bit platform though? Since the
register dump shows 64-bit registers, my guess is that this is the
result of trying to load a 32-bit kernel on "-machine pseries
-cpu native", which is not supported by the guest kernel. I would
expect that you need at least a 32-bit machine type (mac99,
pegasos2) and likely also a 32-bit CPU (7447a, e600).

According to what Paolo said, that may require PR state instead
of HV mode:
https://lore.kernel.org/lkml/79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat=
.com/

I am not familiar enough with the details, but from the source code
I see that this is not usually enabled, and you may have to turn
off CONFIG_VIRT_CPU_ACCOUNTING_GEN and CONFIG_CONTEXT_TRACKING_USER
in order to enable CONFIG_KVM_BOOK3S_64_PR, as well as possibly
turning off CONFIG_KVM_BOOK3S_64_HV (it looks like it should
be possible to have both HV and PR coexist, but there may be bugs).
You also need to ensure that you have loaded kvm_pr.ko instead
of kvm_hv.ko, and that CONFIG_PPC_RADIX_MMU is turned off if
you are running on a power9 host, otherwise kvm_pr.ko fails to load,
see kvmppc_core_check_processor_compat_pr().

> That said, I would like to keep the support alive for more than just
> ppc32 kernel testing.  There are plenty of Power Macs with enough
> memory to run some environments within KVM.  Ad=C3=A9lie=E2=80=99s new=
 release
> boots a full XFCE desktop in under 300 MB RAM, so even a 1 GB machine
> has enough memory to run AmigaOS, Mac OS 9, or another XFCE in KVM.
>
> I have found a few bugs in testing newer kernels, and one of them
> affects all targets lower than Power7, which means 32-bit and 64-bit B=
E.
> I am preparing to send those patches in.  I will continue shaking out
> any remaining bugs on my 32-bit host.  I hope that these patches can
> be useful, and possibly stimulate more interest so 32-bit support can
> be maintained again.

Do you mean 32-bit host KVM support specifically, or more generally
powerpc32 kernels? As far as I can tell, powerpc32 kernel support
itself remains actively maintained, though almost all of the work
is on the embedded freescale parts rather than on desktop.
PowerMac and KVM on book3s32 were marked as orphaned last year,
but hadn't seen much activity for a while before that.

> In fairness, I do agree that there is very little value in keeping 32-=
bit
> MIPS or RISC-V support since the chips that support it are so limited.
> 32-bit Power however serves actual purposes.  32-bit x86 could be usef=
ul
> to make sure =E2=80=9CKVM on 32-bit in general=E2=80=9D is easier to k=
eep going,
> but if it is causing maintenance issues then I suppose it can go.

I think it comes down to how much of a hassle the book3s32 KVM support
is for both the continued book3s32 architecture support and the KVM
book3s64 codebase. I think both of these benefit from no longer
having to worry about the orphaned book3s32 kvm code, but I can't
tell how that should be weighed against how useful it is for you
and other users that occasionally use KVM on that hardware.

      Arnd

