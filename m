Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A27E604E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 23:05:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=32beSgpe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kjlV4oVb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQfKB4DSfz3vmQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 09:05:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=32beSgpe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kjlV4oVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQd2m1lFtz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 08:07:43 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 15DEC5808D9;
	Wed,  8 Nov 2023 16:07:40 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 08 Nov 2023 16:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1699477660; x=1699484860; bh=D9PBCL8QJKdjrKS2aPJfuUQXeRbWRMeFHOK
	ckMk8fx4=; b=32beSgpe4JW/41MI9lwE9Ijo4clBZDCZcdz5W29GlXfmeBdloGs
	Pj6zClFpI3rBEASL5bt2BJ0z9kSHXoRmNM9S3ZUV9IpU6H2SlzHeojjwyK38ubdm
	rc5I6AbHQO428z+GTudTpXj84wN1iHyD5B4xrh7Xg9+/lOsXO8mWGmiOw0oEtT95
	59tIeWQXJ0PMlmbTe9oPGJNjvuF2Q00g7Aup3KvWuYCehPghEdVuK62ANt1RCDNX
	P59SJAJQv8a5rR+mmaJ00cjQiQKIVXVSq/NkJ5Ceh2lpGohzfDFoxucwi0IF29D/
	556O8j5asu9BGmdizp+cE+MTUaFBWLNaDZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1699477660; x=1699484860; bh=D9PBCL8QJKdjrKS2aPJfuUQXeRbWRMeFHOK
	ckMk8fx4=; b=kjlV4oVb2NP4EXVJD0KYm4LTALqMkDnrU92/a5IM2DxqbQWjsi+
	IwdXxoSa3WEs4VZrlHH4JbCKkIL0G8Pwij1126xSe7hG/IMqOBcu3RQxvqgsEHsb
	pcFM0Ua1NE3OwtwEsNMc4jlmhSYjBeK+x0Ed/W7Rlf03UIZVqr2B+d0ryicP7Tub
	QSkOlA0efMsPA3XcbslixipIgl/+8P6M15YEgB0c0t6f8ouEUKSI2KL0MYB9RUr3
	hoiEAHdJCFrsG/Y/a3llxHIutnrnDvRz3cIbj7RF5co+2MINYEdgACq/D/uqzlpo
	r0L8iW3NWB7AxkztwyKFHjpLOPBdYiLEhJA==
X-ME-Sender: <xms:m_hLZQw4_GjcfbThT_vbWtFC1jg247Lu0E-xxAcura-dvGHI0kyRtw>
    <xme:m_hLZUTBxKjGHnkabv1F9oTzwRz5Y87A_Eif-kfMyvanmifw9H6wOpvDuy8X5HtkK
    Zp2U-M3JmHcVR-PhU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduledgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:m_hLZSW6ebv1Nls-lv6APr_ihVG7HATMnEZKUQ2lPJN14ImeSnqatA>
    <xmx:m_hLZejrECVMz1a28xI-eZZXTwB4qMex3E04bXgkhXhjxa6Uy3_eWg>
    <xmx:m_hLZSCmSuJkW1zFZoPx2zdR5BRKPmHS1VpT2dl_7ti0xOUBuc0gGw>
    <xmx:nPhLZa5R9gGZF0aG1bP9Mvi7bGv6CIQdVEBpyyHzpDHDqjyICYNx-Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 48539B60089; Wed,  8 Nov 2023 16:07:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
In-Reply-To:  <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-11-arnd@kernel.org>
 <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Date: Wed, 08 Nov 2023 22:07:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Netdev <netdev@vger.kernel.org>, guoren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, V
 ineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Over
 street <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, "David S . Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 8, 2023, at 21:42, Geert Uytterhoeven wrote:
>
> On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Microblaze runs into a single -Wmissing-prototypes warning when that =
is
>> enabled:
>>
>> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype f=
or 'trap_init' [-Wmissing-prototypes]
>>
>> Include the right header to avoid this.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for your patch!
>
>>  arch/alpha/kernel/traps.c      | 1 +
>>  arch/csky/include/asm/traps.h  | 2 --
>>  arch/csky/kernel/traps.c       | 1 +
>>  arch/m68k/coldfire/vectors.c   | 3 +--
>>  arch/m68k/coldfire/vectors.h   | 3 ---
>
> Ah, so this is where the m68k changes listed in the cover letter are
> hiding ;-)
>
>>  arch/microblaze/kernel/traps.c | 1 +
>>  arch/sparc/kernel/traps_32.c   | 1 +
>>  arch/sparc/kernel/traps_64.c   | 1 +
>>  arch/x86/include/asm/traps.h   | 1 -
>>  arch/x86/kernel/traps.c        | 1 +
>>  10 files changed, 7 insertions(+), 8 deletions(-)
>>  delete mode 100644 arch/m68k/coldfire/vectors.h
>
> Obviously the non-microblaze changes should be spun off in separate
> patches.

I messed up one of my rebases here and accidentally sent
the wrong changelog text. My intention was to have the
combined patch but with this text:

    arch: include linux/cpu.h for trap_init() prototype
   =20
    some architectures run into a -Wmissing-prototypes warning
    for trap_init()
   =20
    arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype =
for 'trap_init' [-Wmissing-prototypes]
   =20
    Include the right header to avoid this consistently, removing
    the extra declarations on m68k and x86 that were added as local
    workarounds already.
   =20
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>


I made the same mistake with the "arch: add do_page_fault prototypes"
patch that was missing an explanation.

      Arnd
