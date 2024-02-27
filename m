Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5C869B0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 16:49:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Uj8nTtuX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=hY1txy5S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkhkK3vG0z3vXv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 02:49:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Uj8nTtuX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=hY1txy5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.140; helo=flow5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkhjd1M5Qz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 02:48:53 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 0E22F200094;
	Tue, 27 Feb 2024 10:48:51 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 10:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709048931;
	 x=1709056131; bh=ybbnN0+SobfyxbHHH4ZELWrRQvYBzt/PThTgohkZVK8=; b=
	Uj8nTtuXWeEi/jXfJb5n+JbsF1HSR0x3KgfCm6wqbBwTdbvkhRqJ3Yq98CMAeG5r
	D/GO+gsxXcyWzUSYVXbRGbhBL/Z62QpHxQL4Nwm51CeelVfQrM0VsRmYU5oQiksk
	K0/XMoHjN3ofZ1Z5lt03aTV2rHIKloqb+z/hoNnTFtklsNNfr3RZjbgENs0es2gb
	IDGbBSGW0xc7Je2i9GyV0TikqeTQ8ZIH5rJ4x5Zc8k491PIy0z0afqdlN46J0Dyh
	GwV1UL/IypRhnck5jK4xrsxLBGUV4OhZP+DMMw5EqYb3GTEee00bKrSNOVOQW2Of
	C/8GqY9nA4ZbWGv/r1HmIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709048931; x=
	1709056131; bh=ybbnN0+SobfyxbHHH4ZELWrRQvYBzt/PThTgohkZVK8=; b=h
	Y1txy5S4iu4CgzO1d33RQRTVdIFEUhjhCu5bud7oeKr3YK+aS49Q7U3ClfbHqdDi
	1Qn/NXLKPd6IvD9u+mdo6jUi/KerXGwKqXU19Z54fEINfjHSApkWghFTcS4W/D9z
	bsuvJAFYYdOULYWSgsXdENf8NuVwaZV5nSsSdhul8qQvwBokhTpI/C4zH6thcdJh
	bnr/GHXwlUup2+3kPL1y1HI4RcBsijL0XYOj/FHZT6izdSVL9jmjE+Sv7hDo4FzA
	ReVIikHX+Zzdb6tpZ5dMHS/HBnj9HUKp1GKOSPqZGRRmEAJNIjOaV9BN4ViQqd2y
	/UEth2/MdcbGXPG2wRf0g==
X-ME-Sender: <xms:YgTeZTjQ2h_cNZ8jalaG9yLuQqXC07isf9GGcrOmBfNOKOEulyuU8A>
    <xme:YgTeZQAU0_LLiTKPpNYMDEOZ3KF4sj8-pyoo1S0mcZ4WuXW9vxRtrWSOshLIwEkGN
    rSu-Vae63C6tVsVR-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YgTeZTHcN2-Yez8UX5mfvZ1mSJnr_0tSCCXpqVxUG-IHqIPIoNvmcg>
    <xmx:YgTeZQQzrErr268F2CxBpd9lwv9mwfSPdqVRsNCxYMDirZwuyZpTug>
    <xmx:YgTeZQwVGz3Yu09b5df-6afMzKl0E5RnQicJLgSLEI6srfnAno_efg>
    <xmx:YwTeZaeeqww0pq-Uj1Spmu0Q0w5FIsyXzvjrxIQzMA-5KGL3vLMjzLwEdE0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 407DCB6008F; Tue, 27 Feb 2024 10:48:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <1b857914-bc1d-4b9a-b3f1-4eabd8db9810@app.fastmail.com>
In-Reply-To: <b737a088-c811-45eb-b143-d24e6cdf7eea@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
 <764fafb0-2206-4ab1-84ea-ebb7848c8ff2@sifive.com>
 <83450530-c908-4abc-bab7-88c50a3143ff@app.fastmail.com>
 <b737a088-c811-45eb-b143-d24e6cdf7eea@csgroup.eu>
Date: Tue, 27 Feb 2024 16:48:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
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
Cc: "x86@kernel.org" <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.ke
 rnel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, Kieran Bingham <kbingham@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 27, 2024, at 16:44, Christophe Leroy wrote:
> Le 27/02/2024 =C3=A0 16:40, Arnd Bergmann a =C3=A9crit=C2=A0:
>> On Mon, Feb 26, 2024, at 17:55, Samuel Holland wrote:
>
>
> For 256K pages, powerpc has the following help. I think you should hav=
e=20
> it too:
>
> 	  The kernel will only be able to run applications that have been
> 	  compiled with '-zmax-page-size' set to 256K (the default is 64K) us=
ing
> 	  binutils later than 2.17.50.0.3, or by patching the ELF_MAXPAGESIZE
> 	  definition from 0x10000 to 0x40000 in older versions.

I don't think we need to mention pre-2.18 binutils any more, but the
rest seems useful, changed the text now to

config PAGE_SIZE_256KB
        bool "256KiB pages"
        depends on HAVE_PAGE_SIZE_256KB
        help
          256KiB pages have little practical value due to their extreme
          memory usage.  The kernel will only be able to run applications
          that have been compiled with '-zmax-page-size' set to 256KiB
          (the default is 64KiB or 4KiB on most architectures).

      Arnd
