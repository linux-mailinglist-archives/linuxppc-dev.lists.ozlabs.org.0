Return-Path: <linuxppc-dev+bounces-4099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6479F071D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 10:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8jyD4G0Dz3bNs;
	Fri, 13 Dec 2024 20:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734080516;
	cv=none; b=B7u7uV9ruWmSC5O3bJ55aeX1GMnI84aBRkaqu/a+Sz+4WjsgO5vmC2XlAFcS/6mNlHo0T74XDKiJM6tAkYRul+oUkn2WQoNoz0TQu1wHXWZmBB+ruR8ePegDmKSOkASbXQ3I52HC3YZ0JyPWPPTp2X+SF0a1DXetmhUcoWYXVDWJGg86wvqZLl81Ug1DhuiQxBLWhdbNq6AUbRafROvldiR8j5U/nD+VlKs4vNsq3rZXq+DQNYbN/Lp/8iNW2xkCzXzW5eTJG5g60BTczI9qb47GMHt0mW/cWJF4iaOqH4yVzg0WpxekuBQb3v8oq9YY1HafLXUS54ub7J2zFeJomw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734080516; c=relaxed/relaxed;
	bh=KcDskYQHGeNJcKXr8vywUEry2qDL5/kORB9rm8d5fFw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UjDiM2f3UuxJ1iNboX4OWrI7HfMBfoqVSi1WiJCAsvyl/pqK3NvL2p0o+ab4JvMX8AlSeEoqou7MJdGlMPxGYVo6P6TbBbdPoCNH6J0MaOPOJm2uyIkHhBBFf5ZMa5+BzV4qa1R9Kyd340wM0BlEN7HLYqe3HA8wbZYIB2A6vB2g1DoKEIEXHdyGEP0HlTu6SIo4ff5ocfbgfp+pzeCYES9F70czsfh/yyTRo7ec8NtYy8LMfHZJQEdfom9WbGZYOpoy7iPwjDSTrPM3H41uDD0kGIwCn2+6X5JKrg0qK712rnJGTPmkhksfxaB+Na+e+nA6lUUOKGhZvhHpwfZqlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=dK9y/1Fd; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=y9jkp9U1; dkim-atps=neutral; spf=pass (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=dK9y/1Fd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=y9jkp9U1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8jyC4nhjz3bNh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 20:01:55 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 6EFA31140122;
	Fri, 13 Dec 2024 04:01:52 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 04:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734080512;
	 x=1734166912; bh=KcDskYQHGeNJcKXr8vywUEry2qDL5/kORB9rm8d5fFw=; b=
	dK9y/1FdaKVIktwmmYapHHaxHxKc0BP7khWZUu3r7h1f0sQlQa4dZFPSsaSQt+Iu
	B59X/dAUbnp20AR2b786YF8D04YF58T1uzpW4lVTmgKyAEab9Odf3JWSG6PLCL2r
	cIBOAzkixOIZmoUsK62qOojH4jNcAbztjeKbDhOgibIe3Pv/NGMWaHo/551gaUP3
	sYnTI2POMGTHtEOcGVgbt5DO2eYOveMqn918pRMgcp7dbwcqpo9bBJLGMfiMBzQu
	ZgX08C35wFu1QYADEBx+IIquX5cS6Xc25HusMbbwZaSKCdWGJy+GQnHJfrJeMFRA
	ys2/b38Gqv72zFx/0driDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734080512; x=
	1734166912; bh=KcDskYQHGeNJcKXr8vywUEry2qDL5/kORB9rm8d5fFw=; b=y
	9jkp9U1MIwaisuqjg7nK41SoLvyk0NQkR82Usqh9Dw4HGzL7mRtCj1li+xZ9MUoS
	T+iUdxLdpng7pksc/57Tbo2FGZLssQXYXp88cbvtg++tjPJvLhOu9qqwRxe+ZtPw
	4VZcyTgnCWf6+CvTWGxl4WBTXuAHInOohNNk9cigaf/oW9YowizNTnLuvvEYhlw8
	p/NNVd1Mz9oC0oDs7Mqxs4UJ9bMb1r0tT0IE+Z3nMIUpN6/PeX23PxN5DKw6xsXe
	agDUIFGvMUWekQaR3CN8811GJyJW4h1kgALJ95ARgDCRa1aYbbE2asyLTMDV4til
	4uK1t6tSG4opJ6lzQwIvg==
X-ME-Sender: <xms:_vdbZ0qTnQBR86V-26V7PwhiMt6EEOYyMJdQegNWyfIcMUul5BQDMg>
    <xme:_vdbZ6pOmhGV-0SqTm9SVZhXl3Esg36401-Xn-9c04EyxA_rLCt4YIUf7_WGeZQPr
    h7mA5Z75gO13wD9K68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeeigdduvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepghhrrghfsegrmhgriihonhdrtghomhdprhgtphhtthhopegrthhishhhphesrg
    htihhshhhprghtrhgrrdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhl
    thdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhroh
    huphdrvghupdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghp
    thhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmph
    gvsegvlhhlvghrmhgrnhdrihgurdgruh
X-ME-Proxy: <xmx:_vdbZ5OSeAlRqL3zOYYLR1X80rYHtqF6jBXE73wHfeMrnsspuNFT7Q>
    <xmx:_vdbZ77mbTrJNcWXjBhg21C-rqRNfaAmqyeKfarmU1qDt_y02i9PgA>
    <xmx:_vdbZz63hVVtxzP8SiiuBk7PK7jRHjcw-DvalTx04b58_fplYVXqag>
    <xmx:_vdbZ7hVn74LynEuieqMVfKOF46Ga4XVKlg6Bvd6Bg6xYi1WPJklbQ>
    <xmx:APhbZ4YwaWQ6QTbli2kpKoPosiJj5J8RDuON2m1n3uQoKbesPqFgt2Ao>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD88F2220072; Fri, 13 Dec 2024 04:01:50 -0500 (EST)
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
Date: Fri, 13 Dec 2024 10:01:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "A. Wilcox" <AWilcox@wilcox-tech.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, kvm@vger.kernel.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
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
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <1c8ce6c9-6693-4cfb-8e40-3a641734daff@app.fastmail.com>
In-Reply-To: <CE1F96B2-7213-4352-B80F-6E669F5EED97@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
 <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
 <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
 <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
 <CE1F96B2-7213-4352-B80F-6E669F5EED97@Wilcox-Tech.com>
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024, at 09:42, A. Wilcox wrote:
>
> As for Power: I will admit I haven=E2=80=99t tested lately, but well i=
nto
> the 5 series (5.4, at least), you couldn=E2=80=99t boot a ppc32 Linux =
kernel
> on any 64-bit capable hardware.  It would throw what I believe was an
> alignment error while quiescing OpenFirmware and toss you back to an
> =E2=80=98ok >=E2=80=99 prompt.  Unfortunately I can=E2=80=99t find any=
 of the bug reports
> or ML threads from the time - it was a known bug in the 2.6 days - but
> the answer was always =E2=80=9Cwhy are you booting a ppc32 kernel on t=
hat
> hardware anyway?  It=E2=80=99s a ppc64 machine!=E2=80=9D  Is this a ca=
se where
> that would be accepted as a legitimate bug now?  It would be lovely
> to use my largely-SMT 3.0 GHz Power9 box for more of my kernel testing
> (where possible) instead of relying on a 933 MHz single-thread G4.

I'm fairly sure we don't allow booting 32-bit kernels on
the 64-bit IBM CPUs (g5, cell, POWER), but as Christophe
mentioned earlier, you can apparently run a 32-bit e500
kernel 64-bit QorIQ.

What I was thinking of is purely inside of qemu/kvm. I have
not tried this myself, but I saw that there is code to handle
this case in the kernel, at least for PR mode:

static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
{
        u32 host_pvr;

        vcpu->arch.hflags &=3D ~BOOK3S_HFLAG_SLB;
        vcpu->arch.pvr =3D pvr;
        if ((pvr >=3D 0x330000) && (pvr < 0x70330000)) {
                kvmppc_mmu_book3s_64_init(vcpu);
                if (!to_book3s(vcpu)->hior_explicit)
                        to_book3s(vcpu)->hior =3D 0xfff00000;
                to_book3s(vcpu)->msr_mask =3D 0xffffffffffffffffULL;
                vcpu->arch.cpu_type =3D KVM_CPU_3S_64;
        } else
        {
                kvmppc_mmu_book3s_32_init(vcpu);
                if (!to_book3s(vcpu)->hior_explicit)
                        to_book3s(vcpu)->hior =3D 0;
                to_book3s(vcpu)->msr_mask =3D 0xffffffffULL;
                vcpu->arch.cpu_type =3D KVM_CPU_3S_32;
        }
...

So I assumed this would work the same way as on x86 and arm,
where you can use the 32-bit machine emulation from qemu but
still enable KVM mode.

      Arnd

