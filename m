Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E78AA824
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 07:59:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EQY9hGj5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g0Gglyzl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLP9z0XY4z3cWN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 15:59:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EQY9hGj5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g0Gglyzl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.155; helo=wfhigh4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLP986Xdyz3btk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 15:59:08 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 8DAF71800114;
	Fri, 19 Apr 2024 01:59:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 19 Apr 2024 01:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713506341; x=1713592741; bh=twE9hPw421
	uwlIXvbIk9nVD0d1HoYErN3gfFf2Hfffc=; b=EQY9hGj5l9JyxvZ70GZq9nQETO
	uwLsZOlrUQaSWAgkGZZjvcZQvSZh/nWjlSgZrTS+4Pzzm3SAAAHnUVfmumM6od1K
	sznDivemgKi9uE0Cm/vIFeLQ4KnrRL4u5+4L150cymlcEaRZNOV84grgnPUZT7iW
	QZkwYkVFxtIGBOwuxmeY74eXYVw3Q7dFVawIiZPt4d6Qsc+Tuhk21Th4+x0+ZzHf
	pJykxSI6UZapcVXAjr91z6HEzxnmCtsSIkYSfB61i0GkVJqBzmdQdhOAjc1oplBK
	knLgz9DVU64kLaHoxou1ifG0OUnM9nGFSLASnIETcYxFwablKFBGOMnfd12Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713506341; x=1713592741; bh=twE9hPw421uwlIXvbIk9nVD0d1Ho
	YErN3gfFf2Hfffc=; b=g0GglyzliV8fxL5FMqE/lxwcCXfB21Am5LxcxSeDKHcI
	V6dL8b1j5zQMlsk0YMvc/M6/sWBOOSLNn/0+FW+FPfw0UKRnULFo9TafBOzvIVAx
	tDtF444Xy/QqeDYalPO8qfMj7UYfujmasmbYEyiFVvrDqY8pZ7FlSuJndjQxyh18
	vmwBc/RZlQXNLmZXfLh64HbcxUQQfZSRU7kSj2VXs9uD8HsmFdZ905gOS9yfbkGE
	bIHpFu8LrjIjY/3SYnMosa0oyCS9lx9aEZOXJ39Ny8bNmfZFzfI2kt/mNWTBDB0N
	IDjZZGOtLRyaOQI+U3YEuAuiN5kRvJAfQ0Jj6R8kVw==
X-ME-Sender: <xms:JAgiZjlXf1yM4t9lvpcaOYV_UTSFGa8ciAuGs_AsOFlc1a3gJKagAQ>
    <xme:JAgiZm11F-n_hyUfpz4jctClD7y2gV09oSUsEUrEZHdzZJgQJqtGQp0_Bppzn61nM
    q8rCYwBcbaSkBnoF-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekuddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JAgiZppFWRClZCi9ea3JoXNhZQH6tQUZTzHp18I57y8XfOBQ09bdQw>
    <xmx:JAgiZrlqZiWcBQ-12n62wIHQuvwibd6B0DLyNFY6yyNIm3wPMmkL4w>
    <xmx:JAgiZh1rTf0mrzpX3fy6IuHn4xunCG4VhMiMcZ7uTY3IOQ4L-5jPAQ>
    <xmx:JAgiZqtF1c1p3s5Q2jVvjUo6PIUlJnu8-Dh1MOLuKR-70Iol4SHd_g>
    <xmx:JQgiZu7EeMkqBiw5VB01T2WGOWG8PZOFGM6vDG9uDkZViGr7Ro5bq0mM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C2904B6008D; Fri, 19 Apr 2024 01:59:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <16334340-d409-4be4-a89d-981baa7a4b82@app.fastmail.com>
In-Reply-To: <87wmou9bqd.fsf@mail.lhotse>
References: <20240416153331.1617772-1-arnd@kernel.org>
 <878r1bb2zj.fsf@mail.lhotse>
 <59473eb6-1707-4bbf-85a3-ba4835f3ee7f@app.fastmail.com>
 <8734ribza2.fsf@mail.lhotse> <87wmou9bqd.fsf@mail.lhotse>
Date: Fri, 19 Apr 2024 07:58:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Jeff Xu <jeffxu@chromium.org>, Dan Carpenter <dan.carpenter@linaro.org>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 19, 2024, at 07:12, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> "Arnd Bergmann" <arnd@arndb.de> writes:
>>>
>>> I had included this at first, but then I still ran into
>>> the same warnings because it ends up pulling in the
>>> generic outsb() etc from include/asm-generic/io.h
>>> that relies on setting a non-NULL PCI_IOBASE.
>>
>> Yes you're right. The above fixes the gcc build, but not clang.
>>
>> So I think I'll just cherry pick f0a816fb12da ("/dev/port: don't compile
>> file operations without CONFIG_DEVPORT") into my next and then apply
>> this. But will see if there's any other build failures over night.
>
> That didn't work. Still lots of drivers in my tree (based on rc2) which
> use inb/outb etc, and barf on the empty #define inb.

Right, the patches from Niklas only went into linux-next so far,
and a few are missing (including the 8250 one I think), so -rc2
at the moment regresses, but that doesn't have the warning either.

The idea of my patch was to both fix the current linux-next
build regression and have something that works in the long
run, I didn't expect it to work by itself. Sorry that wasn't
clear from my description.

> So I think this patch needs to wait until all the CONFIG_HAS_IOPORT
> checks have been merged for various drivers.
>
> For now the below fixes the clang warning. AFAICS it's safe because any
> code using inb() etc. with CONFIG_PCI=n is currently just doing a plain
> load from virtual address ~zero which should fault anyway.

If the port number is high enough, the current code might end
up referencing a user space address, depending on mmap_min_addr,
which defaults to 4096.

Using POISON_POINTER_DELTA is clearly an improvement over that.

> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index 08c550ed49be..1cd6eb6c8101 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -37,7 +37,7 @@ extern struct pci_dev *isa_bridge_pcidev;
>   * define properly based on the platform
>   */
>  #ifndef CONFIG_PCI
> -#define _IO_BASE       0
> +#define _IO_BASE       POISON_POINTER_DELTA
>  #define _ISA_MEM_BASE  0
>  #define PCI_DRAM_OFFSET 0
>  #elif defined(CONFIG_PPC32)

You may need to double-check, but I think for ppc64 we
can just unconditionally set _IO_BASE to ISA_IO_BASE
regardless of CONFIG_PCI. 3d5134ee8341 ("[POWERPC]
Rewrite IO allocation & mapping on powerpc64") ensured
that the I/O space is only ever mapped to this virtual
address, and the same method is used with the
asm-generic/io.h implementation on arm/arm64/loongarch/
m68k/riscv/xtensa. Using this would be both safer and
more efficient than the current version.
It should also not cause any regressions ;-)

Unfortunately, ppc32 never got that cleanup, so
POISON_POINTER_DELTA is probably still best until Niklas's
series is merged. You could set _ISA_MEM_BASE to the same 
here for good measure.

[another side note: the non-zero PCI_DRAM_OFFSET looks
unnecessary as well now, apparently this was meant for
ibm cpc710 and ppc440 platforms that are no longer
supported.]

     Arnd
