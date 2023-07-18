Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17B758018
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 16:49:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=U+PxApC1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vt/n/+re;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R52054m5qz3bwR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 00:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=U+PxApC1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vt/n/+re;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R51z62mJHz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 00:48:17 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 783FD5801B9;
	Tue, 18 Jul 2023 10:48:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 18 Jul 2023 10:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689691693; x=1689698893; bh=4E
	XBgwGIlgKcIRz7fYYqQngyR1yPZq+r239tLLqrHVk=; b=U+PxApC1c0376TqZuP
	isAD22T8M4zJIjSrvXmVpbp6KhpIotLqk2flmz7s+T06sAtwetZtqAN35oBQM18V
	E9Vd5EknfrCd55/sR9Rg3J+FxpX5GsKEjtQU9AFnUtjkxe7oqBoVQzTNoDP5u5X5
	rSry6e0s/Ht0NKUlu8EZd+aki7CeM1QL9lQ7BuAYb8NIf+q6wneEjcqyAdNAOSKe
	3Q3/Rw4DAondMIM4X45wkoQvE0WYFJubJX2ViPetJGUOtAKwJQY/rNiVnrqi130S
	/Ys2lD9M1NM+lK1VylAriUlkcLzpU6TE/xpWVIXsuJ6Oq43IcCjQXdSEh9Y0zSSg
	cz2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689691693; x=1689698893; bh=4EXBgwGIlgKcI
	Rz7fYYqQngyR1yPZq+r239tLLqrHVk=; b=vt/n/+reICKpoGKCCTL+PKs8fBesX
	bRB0MIXNSbw788baiVok0Iks/FSNTx3qLITMrTkCAbIvshkyyo9MJWsyNbKKs3Uy
	qud4qHjnngBLw0+PwQ07Re6o3QKgK/+v3dwIvNqhul//0hUKKRr6nGmkpdaLExui
	66AQ4sIEYM6WU7ha+ddVGz5eyqyj5wcVeESPo62AwB8GCUXJgKYBPh4Ltx3Lxhzq
	EWTdVTjHxSm6vhtcdlSDxi5e9dMQ0fVJoXkaYJu6CJwtLBsbItpUb+zW9oKkFbMO
	wy0AtBUz7Iqop6y2Wl8lzx4kAiNFUPuXWdo9jc9jUT8tXU0cWmw6lNQQw==
X-ME-Sender: <xms:LKa2ZL9VJEOBxw8oEliC4PNJ4jT_CVSWCm_f5JE7K0Tw5PBqWCeIWw>
    <xme:LKa2ZHs4jDEworQ0UeTqj33pEpAv3TWtuinGhkkOiumIW6T5P6F5-QDM6L3vP0zGS
    TuGhzKBjkxCybTvb-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LKa2ZJDmNsYvmYWf3JnzcWBbZoO5jKTiyTtqE4alr31NKvJCBTj5aw>
    <xmx:LKa2ZHf3KGqesnyHhNEumxnmoezUKbmQR2ScJuBN6eMpWSftCWddxg>
    <xmx:LKa2ZAMMvpHsg5Hc9S56BEMspz1ujpTc1dNFZ8wWYcJ3ItQpHjWkmw>
    <xmx:Laa2ZGuPGNZd1VeqvnHuAjKMw2FYyCL90xx6fqP8Sbak_y136dhR7Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4A372B60086; Tue, 18 Jul 2023 10:48:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <0beb03f8-ba55-439f-8aa5-6da0e85c11d9@app.fastmail.com>
In-Reply-To: <150c0fa2-bff2-0644-d6e5-c4dab7f79048@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-8-tzimmermann@suse.de>
 <80e3a583-805e-4e8f-a67b-ebe2e4b9a7e5@app.fastmail.com>
 <d3de124c-6aa8-e930-e238-7bd6dd7929a6@suse.de>
 <0dbbdfc4-0e91-4be4-9ca0-d8ba6f18453d@app.fastmail.com>
 <ef7b3899-7d18-8018-47fa-aac0efaa61f4@suse.de>
 <dd5aa01e-afad-48d2-bf4c-4a58b74f1644@app.fastmail.com>
 <150c0fa2-bff2-0644-d6e5-c4dab7f79048@suse.de>
Date: Tue, 18 Jul 2023 16:47:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Subject: Re: [PATCH 07/12] arch/x86: Declare edid_info in <asm/screen_info.h>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mips@vger.kernel.org, Juerg Haef
 liger <juerg.haefliger@canonical.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 5, 2023, at 10:18, Thomas Zimmermann wrote:
> Am 30.06.23 um 13:53 schrieb Arnd Bergmann:
>> On Fri, Jun 30, 2023, at 09:46, Thomas Zimmermann wrote:
>>> Am 29.06.23 um 15:21 schrieb Arnd Bergmann:
>> 
>> I definitely get it for the screen_info, which needs the complexity.
>> For ARCHARCH_HAS_EDID_INFO I would hope that it's never selected by
>> anything other than x86, so I would still go with just a dependency
>> on x86 for simplicity, but I don't mind having the extra symbol if that
>> keeps it more consistent with how the screen_info is handled.
>
> Well, I'd like to add edid_info to platforms with EFI. What would be 
> arm/arm64 and loongarch, I guess. See below for the future plans.

To be clear: I don't mind using a 'struct edid_info' being passed
around between subsystems, that is clearly an improvement over
'struct screen_info'. It's the global variable that seems like
an artifact of linux-2.4 days, and I think we can do better than that.

>>>> I suppose you could use FIRMWARE_EDID on EFI or OF systems without
>>>> the need for a global edid_info structure, but that would not
>>>> share any code with the current fb_firmware_edid() function.
>>>
>>> The current code is build on top of screen_info and edid_info. I'd
>>> preferably not replace that, if possible.
>> 
>> One way I could imagine this looking in the end would be
>> something like
>> 
>> struct screen_info *fb_screen_info(struct device *dev)
>> {
>>        struct screen_info *si = NULL;
>> 
>>        if (IS_ENABLED(CONFIG_EFI))
>>              si = efi_get_screen_info(dev);
>> 
>>        if (IS_ENABLED(CONFIG_ARCH_HAS_SCREEN_INFO) && !si)
>>              si = screen_info;
>> 
>>        return si;
>> }
>> 
>> corresponding to fb_firmware_edid(). With this, any driver
>> that wants to access screen_info would call this function
>> instead of using the global pointer, plus either NULL pointer
>> check or a CONFIG_ARCH_HAS_SCREEN_INFO dependency.
>> 
>> This way we could completely eliminate the global screen_info
>> on arm64, riscv, and loongarch but still use the efi and
>> hyperv framebuffer/drm drivers.
>
> If possible, I'd like to remove global screen_info and edid_info 
> entirely from fbdev and the various consoles.

ok

> We currently use screen_info to set up the generic framebuffer device in 
> drivers/firmware/sysfb.c. I'd like to use edid_info here as well, so 
> that the generic graphics drivers can get EDID information.
>
> For the few fbdev drivers and consoles that require the global 
> screen_info/edid_info, I'd rather provide lookup functions in sysfb 
> (e.g., sysfb_get_screen_info(), sysfb_get_edid_info()). The global 
> screen_info/edid_info state would then become an internal artifact of 
> the sysfb code.
>
> Hopefully that explains some of the decisions made in this patchset.

I spent some more time looking at the screen_info side, after my
first set of patches to refine the #ifdefs, and I think we don't
even need to make screen_info available to non-x86 drivers at all:

- All the vgacon users except for x86 can just register a static
  screen_info (or simplified into a simpler structure) with the
  driver itself. This even includes ia64, which does not support
  EFI framebuffers.

- The VESA, vga16, SIS, Intel and HyperV framebuffer drivers only
  need access to screen_info on x86. HyperV is the only driver that
  can currently access the data from EFI firmware on arm64, but
  that is only used for 'gen 1' guests, which I'm pretty sure
  only exist on x86.

- All the other references to screen_info are specific to EFI
  firmware, so we can move the global definition from arm,
  arm64, loongarch, riscv and ia64 into the EFI firmware
  code itself. It is still accessed by efifb and efi-earlycon
  at this point.

I have uploaded version 2 of my series to
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=screen-info-v2
and will send it out after I get the green light from build
bots. 

       Arnd
