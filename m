Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77A88FFA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 13:53:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lJeza5yy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Bb0RNIiz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V53Ny41hdz3vd5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:53:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lJeza5yy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Bb0RNIiz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.155; helo=fhigh4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V53N70d3Vz3cy4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 23:52:22 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 521AA11400CB;
	Thu, 28 Mar 2024 08:52:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 28 Mar 2024 08:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711630339; x=1711716739; bh=Lh4MuWdYpt
	nETV0Wdnx8P7s+c4JMcLpkbpgMh56pLFU=; b=lJeza5yyYcri2tqJXpeirr9IYD
	QgEwfGN2RlgSUZc2rPDvxJhYxVV/089I5H8oqHMLkN1+FSFdvimIGpzJdybXiVd5
	2Hh7M3Fpr5K+u/YoqlSgteczcWUPaZe5PebEFQhsn8cz06VmU1/BTqmSG88UpbbW
	IRDHUvWeKM93m9tnIVFqW9PGvlFsvxcia5odqwnh/sOipC53vjPC915vrwXdf3ah
	NQDPw1x0KM/1Z6i113r4SH/r8f13MvPNNpADkwyEjH+JePCvmsqUsdRpbb4ui8li
	J45J5/3Dd68gaDOg4hUkS0HOa1RLi7A6iqh9EgTFdOh7UQ2jAtXzjQh8oNKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711630339; x=1711716739; bh=Lh4MuWdYptnETV0Wdnx8P7s+c4JM
	cLpkbpgMh56pLFU=; b=Bb0RNIizRq1jBDXW2lq5jH171BDUGdtZOBg2yhJaGCQ5
	MBUTySW+5j/DdyxglMRP3qw/rYCu0oiLgYsbKnKkbNOTFRIfXop0TJU5J9/Nuwht
	IH+tgwf4DUiVeonklvbKjpPszY0PLMdnEchwigznQZzcjH99EbmiLLpg1qf34krT
	iJghoc6WkCjfz5VazuLrz8Gy/4B3LuUTJh7DtGLExpprxflXUKQ5u16km0VO9gz/
	/xIY+MDt7wkkOiFfd34Gcgjv5bdHKl97f1ijnvyK1q2AxPNwwE/+Te5MSHhM3YvC
	/1bTpCSbgPPNegyP+O+CzYBZP3dLsoFPbxV98O3B/Q==
X-ME-Sender: <xms:AWgFZudGwHi-Z_ipu-DAtsUL6gJmM5eGp3QTYrVOimzirRINehkvoQ>
    <xme:AWgFZoPWeyCXm0gz801Wq1t5hhpzKklxaM1TLa1qtwhXC7iwXRxMyw3onJxip2eAj
    WWQT6wPeOdpsid83Ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:AWgFZvhfmGntOEERrkeD9wQxbG3BBl0ymkFJFs1vm6jkXMFebhBQyQ>
    <xmx:AWgFZr8YnamA7dSxSPnNPmMKwDGtXJdBScUKn5dZp1VpBND1nJVyTQ>
    <xmx:AWgFZqvndgo1Vk3LX14Uj8eNF0kPqgRQgY7FmHK6m8-J_1U1eqBvWg>
    <xmx:AWgFZiHiTqUPJIypCNK7EW6Z8ridICdLObLwSNabIfJrzpIA_ulyaA>
    <xmx:A2gFZq2IF3v0r4kisD05XZs3sJZhIlR4o-eCVWP-cdF5aXis-a6QEw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 69BC9B6008D; Thu, 28 Mar 2024 08:52:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <72e8aa58-c732-4a96-bcb1-32310ee041b3@app.fastmail.com>
In-Reply-To: <140d6bb3-5f44-49cb-846b-7141e551eedd@gmx.de>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-4-tzimmermann@suse.de>
 <140d6bb3-5f44-49cb-846b-7141e551eedd@gmx.de>
Date: Thu, 28 Mar 2024 13:51:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Helge Deller" <deller@gmx.de>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>, sui.jingfeng@linux.dev
Subject: Re: [PATCH v2 3/3] arch: Rename fbdev header and source files
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
Cc: Andreas Larsson <andreas@gaisler.com>, linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@l
 ists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 28, 2024, at 13:46, Helge Deller wrote:
> On 3/27/24 21:41, Thomas Zimmermann wrote:

>> +++ b/arch/arc/include/asm/video.h
>> @@ -0,0 +1,8 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef _ASM_VIDEO_H_
>> +#define _ASM_VIDEO_H_
>> +
>> +#include <asm-generic/video.h>
>> +
>> +#endif /* _ASM_VIDEO_H_ */
>
> I wonder, since that file simply #includes the generic version,
> wasn't there a possibility that kbuild could symlink
> the generic version for us?
> Does it need to be mandatory in include/asm-generic/Kbuild ?
> Same applies to a few other files below.

It should be enough to just remove the files entirely,
as kbuild will generate the same wrappers for mandatory files.

     Arnd
