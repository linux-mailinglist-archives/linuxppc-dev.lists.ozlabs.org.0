Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A446A9BF1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 17:42:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSv000CgNz3cgx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 03:42:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Qg18LNgv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=B7rPNJeu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Qg18LNgv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=B7rPNJeu;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PStyy09Vbz3cB1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 03:41:29 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 0DEE9581876;
	Fri,  3 Mar 2023 11:41:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 03 Mar 2023 11:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1677861683; x=1677868883; bh=cq
	QZ3RgaXf1BBbVEeoodJ6F1ZwSPMj6A5MLY/vjXzGA=; b=Qg18LNgvOVfFg7uMPf
	8fRKoa7WlhijGwszu3Ic5SITTKwawR9B4I6XiClcZ6ujIEL9zVzHiioA2EjIov5s
	tRcxg3C97rd5Qh3iqM/nd48Hb9b7a50w/6DZE1MzWvKwa+aOXKgEBbAuFqwTw8IO
	2/zrTU4zUJhWjGOFVyk4cMUxKlr0jFTzBpR0rcRkXCqmlSQg+1mKD1l/rCUxrq7V
	AihMHWGAQq5UOL4IcNCaCr0vFPf0edeb4YgCH1r82QvI+8miMlqwJ9RIy277z2fo
	EYkDNEf8mCiriMB8VOffc0buYRAQEBhVnDohf6yDdBARed4fr/O8O2naCxLKuEJ1
	FmIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677861683; x=1677868883; bh=cqQZ3RgaXf1BB
	bVEeoodJ6F1ZwSPMj6A5MLY/vjXzGA=; b=B7rPNJeusJPtOmHPup8e0wxsJaB14
	FGL6vkrY8GHqsXIc2V5zsu3B4xZEBJOHklvsYTn6cMwmxpEeSnRvlTctzLXXyrXP
	9TrBh5erAm5rnNg9EUeTsf+lY9yT/91mQrCarXvtL1boNYFm9EBkDhTchuKj9wo/
	Vcljkzp6um1LTXdLqg+kNYUapTvAI76XHCPOKqRJAjH8uzC14hkGGbIhqvg9smqE
	9gk7xnhPT94YAL+KeKmqqFj3ep1BV/HHgDskGZEGHTV139D4jm59Krp4ve/+OW5/
	HbWdFOCVWJeLjyz/P08DuMz9uoT2Z1BPftr9Y2L2ohywcFpCIMJxhhtIw==
X-ME-Sender: <xms:MCMCZFL4Vj5B4o3IALIvz6pg60SCJX6TD7RqwuRdJoAXjFHZ0Phf8w>
    <xme:MCMCZBKDr_18-ZCp9fq_mQ4hcfnV3bmMG_AWa-n5fjtp8mZF3Lhw2HF6H3yj4rqId
    bqalm9nA4D9Or8b-2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelledgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:MCMCZNtSdRvlahaw8kkpJg5S_mXaS2NGhMnRJHAOSZVgamhknWW26A>
    <xmx:MCMCZGZ1LKp15mUy0pPlL-EOq16PpXi1zG62wPySDj-SICoXbN6kvg>
    <xmx:MCMCZMZks1DsXpkJ0U23I5CMsMZR0ofN8WaGql7nqVneRcx1e3czpQ>
    <xmx:MyMCZBjiubroXaC0t4anGM3CORVrncxIG1WjD4S72n_xh-uiQS8zyQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9A291B60086; Fri,  3 Mar 2023 11:41:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <c500840b-b57d-47f2-a3d9-41465b10ffae@app.fastmail.com>
In-Reply-To: <674bc31e-e4ed-988f-820d-54213d83f9c7@ghiti.fr>
References: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
 <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
 <674bc31e-e4ed-988f-820d-54213d83f9c7@ghiti.fr>
Date: Fri, 03 Mar 2023 17:40:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Ghiti" <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Heiko Carstens" <hca@linux.ibm.com>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
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
Cc: linux-m68k@vger.kernel.org, ysato@users.osdn.me, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, borntraeger@linux.ibm.com, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.
 berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, gor@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, chris@zankel.net, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 3, 2023, at 12:59, Alexandre Ghiti wrote:
> On 3/2/23 20:50, H. Peter Anvin wrote:
>> On March 1, 2023 7:17:18 PM PST, Palmer Dabbelt <palmer@dabbelt.com> wrote:

>>>>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>>>>> I assume?
>>>> Yes, sorry for that. I got distracted while writing and used the wrong
>>>> branch to look this up.
>>> Alex: Probably worth adding that to the list in the cover letter as it looks like you were planning on a v4 anyway (which I guess you now have to do, given that I just added the issue to RISC-V).
>> The only use that is uapi is the *default* length of the command line if the kernel header doesn't include it (in the case of x86, it is in the bzImage header, but that is atchitecture- or even boot format-specific.)
>
> Is COMMAND_LINE_SIZE what you call the default length? Does that mean 
> that to you the patchset is wrong?

On x86, the COMMAND_LINE_SIZE value is already not part of a uapi header,
but instead (since bzImage format version 2.06) is communicated from
the kernel to the boot loader, which then knows how much data the
kernel will read (at most) from the command line.

Most x86 kernels these days are booted using UEFI, which I think has
no such interface, the firmware just passes the command line and a
length, but has no way of knowing if the kernel will truncate this.
I think that is the same as with any other architecture that passes
the command line through UEFI, DT or ATAGS, all of which use
length/value pairs.

Russell argued on IRC that this can be considered an ABI since a
boot loader may use its knowledge of the kernel's command line size
limit to reject long command lines. On the other hand, I don't
think that any boot loader actually does, they just trust that it
fits and don't have a good way of rejecting invalid configuration
other than truncating and/or warning.

One notable exception I found while looking through is the old
(pre-ATAGS) parameter structure on Arm, which uses COMMAND_LINE_SIZE
as part of the structure definition. Apparently this was deprecated
22 years ago, so hopefully the remaining riscpc and footbridge
users have all upgraded their bootloaders.

The only other case I could find that might go wrong is
m68knommu with a few files copying a COMMAND_LINE_SIZE sized
buffer from flash into a kernel buffer:

arch/m68k/coldfire/m5206.c:void __init config_BSP(char *commandp, int size)
arch/m68k/coldfire/m5206.c-{
arch/m68k/coldfire/m5206.c-#if defined(CONFIG_NETtel)
arch/m68k/coldfire/m5206.c-     /* Copy command line from FLASH to local buffer... */
arch/m68k/coldfire/m5206.c-     memcpy(commandp, (char *) 0xf0004000, size);
arch/m68k/coldfire/m5206.c-     commandp[size-1] = 0;
arch/m68k/coldfire/m5206.c-#endif /* CONFIG_NETtel */

     Arnd
