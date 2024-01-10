Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31A82A418
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 23:43:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=arndb.de header.i=@arndb.de header.a=rsa-sha1 header.s=fm2 header.b=myiiLqUC;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm2 header.b=3aLv+tsR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9NBG60f0z3dGt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 09:43:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=myiiLqUC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=3aLv+tsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 329 seconds by postgrey-1.37 at boromir; Wed, 10 Jan 2024 21:26:09 AEDT
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T93qP6lprz30gJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 21:26:09 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 1CEA32B005B1;
	Wed, 10 Jan 2024 05:20:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jan 2024 05:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1704882032;
	 x=1704889232; bh=syE5UlqFQxkc/rlq6eSMNsD1Ft+dm/4kEwr9kygNnZw=; b=
	myiiLqUCaOFNyy0KGz1/79d3HRMOpqenCIcjtVp8MIMXNuuxs7r3pdnpfmWhoqoR
	IQ7N3YbmF9nJffZH4HS8LkIh22Vv3wG2sjpK27f9XTmmoCr2Kc68Xrl4dw5To32W
	7oTNxvKqrQNHtDvW+wa87N9N90pn8A9G+LrTYmcdO105B4Zsmftj7IvnAIh1E8zz
	Q2WU5G/3jk+uFyxgwtiyCxFAwp4RGMAhxKlU9P6WBbVa8LUUGhnX9TdNNUh1DUbx
	zmCG1MYbF7h4hfd2TJzbdJ+Q1Rify5IxLv96YznkO8r5UDdnw/B35FP/X80ijL7V
	BaGn8hEWLg1dYwSkCYndvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704882032; x=
	1704889232; bh=syE5UlqFQxkc/rlq6eSMNsD1Ft+dm/4kEwr9kygNnZw=; b=3
	aLv+tsROFR55+fPEzkAuUR1EYdQ2HX99dqCRlz/JfV2MsJtp0CGFqmB6tAMDy72A
	ZrX+AdDDWBNTrrW7sMzvvfEP8gUJIpMLLtVrp/teui+cU+9KRRCxKXkanMetlfcj
	FBkFKDgNOVxh6ZGz33H1r+Dke653H3inbaS1l5dzm3/T9LKzj/zhFl3mBIhvpN+a
	i/+bZg97tvEz1ahcWMOXb7cxJW8wSehQ2OGnZNijfKOPiOkazb67CX7p6n/QsClV
	xFUVOUH+ktgc0Wsof32P0kt85rwvOomYqUIMGJg3KdbRUBngGNzPJwoAUnUqfuOk
	0otxMsg6CfS2J4mWRF6QA==
X-ME-Sender: <xms:b2-eZfbb8jU7eUbhVM8ptUPbFBsqxwkHmtQmk9r-V5K41TRFTBKjlA>
    <xme:b2-eZebHxIw1Fjp3BqSzuovwQbyqtk2C5hrRG6PAfO8XS-kw0MYGTAjpPxl57hAYq
    -Augo6FuvTHj0uSGNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeiuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:b2-eZR8Zym7T_ixwwEfoUeE2EDbxpF4y1T6da7RnK6yyA1qx7ynaAQ>
    <xmx:b2-eZVr4FQ5uhgAwkslmh14i6fuaYanuuxC2M5Z2QAp-pF9q7WvfTw>
    <xmx:b2-eZapet_e5NSzPInuoxvdn0YzOepAI8Xf2d7B8XgPzF98nJjvgIg>
    <xmx:cG-eZeqOJGWBxdm_kxnLomgMKhRJk3BAFc59xS0XCWHMebF1Iw26jJaiRpM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 64819B6008D; Wed, 10 Jan 2024 05:20:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <fdf707b9-f39d-4f5a-a8bf-1bcb8cc6594f@app.fastmail.com>
In-Reply-To:  <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-9-arnd@kernel.org>
 <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Date: Wed, 10 Jan 2024 11:20:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 08/22] [v2] arch: consolidate arch_irq_work_raise prototypes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 Jan 2024 09:41:33 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Netdev <netdev@vger.kernel.org>, guoren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.ke
 rnel.org>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand
  <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, "David S . Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 10, 2024, at 10:03, Geert Uytterhoeven wrote:
> On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The prototype was hidden in an #ifdef on x86, which causes a warning:
>>
>> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_w=
ork_raise' [-Werror=3Dmissing-prototypes]
>
> This issue is now present upstream.
>
>> Some architectures have a working prototype, while others don't.
>> Fix this by providing it in only one place that is always visible.
>>
>> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Guo Ren <guoren@kernel.org>
>> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

I've sent out the asm-generic pull request now,
that contains the fix. Thanks for the reminder.

      Arnd
