Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846075C19A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 10:28:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=b9mWPVKT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=unYn7VUf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6jPM08Pxz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 18:28:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=b9mWPVKT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=unYn7VUf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6jNN0fPPz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 18:27:30 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id CDE4D58026A;
	Fri, 21 Jul 2023 04:27:21 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 21 Jul 2023 04:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689928041; x=1689935241; bh=V8
	kkxioRFPjR/pcGqI7bYcicee1af9QaKC3pDwPABSg=; b=b9mWPVKTa+C0qxGJVm
	gVTKr5SnuCufxByEgtuEiTC/HjonV9yPvhgncSRQ0wUrLNE7orD78Rw7ohjT0q3C
	c0X7wLA5W1uO4gHBmiwybGJLQQ7SrEMtBGvFZKQaT/Y0wzIbtxoIfYUgm9pO+XSJ
	6I08Fx8oDJAOPBCXHuGFZFeWb1RYZSXq09xFAfH85OnLe5l+htjQL+F/B4Y6gUvs
	ut/AOfdKRpwcHg/s2ox2GO/l5Ce/RBfBcnmaRO/F69sTDvSKTTvAQwHRFh24O6bw
	V6xDq+6cg4uZot5gbimNNmCu9SHpdf5MFTDtGh/g5OFBKMn02cs7TznQk+C9/i4Y
	dRwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689928041; x=1689935241; bh=V8kkxioRFPjR/
	pcGqI7bYcicee1af9QaKC3pDwPABSg=; b=unYn7VUfp/o2gT07nbqvQ5lIW9kBd
	mBnKota720DDPc/oG1aRttW/D+crNdOAUEl9St9nonOTjtR5EHZ/ERbVU6RS/8a9
	h60zyLUrHFHJTeNLWeadDvND/TVlwE64W4ER4jaFI7yfcqQcM9JFFXLEQa8gKTAm
	2NneyWtfI14HUK6C7gElYEN39Z+C3ZEMkQn2ZM6gax2xS8UlImkh100FKtZaGPhv
	lQk5OR6Mr17MQHWJ9UIPy7fklXcZo7AkC1hU9D8FRcT0DoHGZ1ht5evHlxZxLnfx
	AEw3wiOX0qizHBpHqwTM2HVi93NRv6iA2yioBToovm3YnDAmy38mo5uCg==
X-ME-Sender: <xms:Z0G6ZPfhyAhlj173FbFhonwA5KlUmCGO5J9kcywp3cozm27OsbAtLw>
    <xme:Z0G6ZFM8NgJAA5o18IVcSBdDXzUfupTyVLyoGRWKf5AMnD9G8DAPvvhIosyFM_Fej
    ixYPDY94XlYrOC-EQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedvgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Z0G6ZIiZLjl3BUt93nzxV1cAQo4CS1KP6FaAGJXgj4g5DNvVpNZydQ>
    <xmx:Z0G6ZA_7CvV2s3gdLefuPIP0mdWvT9_hDkmlpVhsn9Y5247aBbErLw>
    <xmx:Z0G6ZLsjVOM0mZftdLzFVNIO9YmEUfPLUQYjwEJhvs0yikPIce9HbQ>
    <xmx:aUG6ZDnhPzImHPxpYpY9KW7ioRMX4qP1VaFRlm_1LSESQRplTz4wfQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AB365B60089; Fri, 21 Jul 2023 04:27:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
In-Reply-To: <87pm4lj1w3.fsf@mail.lhotse>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-2-arnd@kernel.org> <87pm4lj1w3.fsf@mail.lhotse>
Date: Fri, 21 Jul 2023 10:26:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-efi@vger.kernel.org, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, Dave Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Boris
 lav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 21, 2023, at 06:59, Michael Ellerman wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The list of dependencies here is phrased as an opt-out, but this is missing
>> a lot of architectures that don't actually support VGA consoles, and some
>> of the entries are stale:
>>
>>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>>    the merged arch/powerpc never did
>
> Not disputing this, but how did you come to that conclusion? I grepped
> around and couldn't convince myself whether it can work on powerpc or
> not. ie. currently it's possible to enable CONFIG_VGA_CONSOLE and
> powerpc does have a struct screen_info defined which seems like it would
> allow vgacon_startup() to complete.

The VGA console needs both screen_info and vga_con to work. In arch/ppc
we had both, but in arch/powerpc we only retained the screen_info:

$ git grep vga_con v2.6.26 -- arch/ppc arch/ppc64 arch/powerpc
v2.6.26:arch/ppc/platforms/pplus.c:     conswitchp = &vga_con;
v2.6.26:arch/ppc/platforms/prep_setup.c:        conswitchp = &vga_con;

so after arch/ppc was removed, this became impossible to use on both
pplus and prep. These two platforms were also (as far as I can tell)
the only ones to support vga16fb as an alternative to vgacon, but
both platforms were removed later on.

> My only concern is that someone could be using it with Qemu?

I have not yet ruled out anyone using vga16fb on qemu before
commit 0db5b61e0dc07 ("fbdev/vga16fb: Create EGA/VGA devices
in sysfb code"), but I can see that this has been broken for
12 months without anyone complaining about it, since vga16fb
no longer works with the "orig_video_isVGA == 1" setting
in arch/powerpc (the device is not created).

In the qemu sources, I see five powerpc machines that intialize
VGA support: mac_newworld, mac_oldworld, pegasos2, prep, and spapr.
I think we can exclude prep (which was removed from the kernel)
and spapr (64-bit VGA_MAP_MEM() looks broken). I think the
macs always come up in graphical mode and only use
offb/atifb/rivafb/matroxfb but not vga16fb that would require
running the x86 VGA BIOS initialization.

I suppose it's possible to use vga16fb (not vgacon) with
"qemu-system-ppc -M pegasos2 -vga std" if that still boots
at all. Support for pegasos2 hardware appears to have been
removed with commit 04debf21fa174 ("powerpc: Remove core
support for Marvell mv64x60 hostbridges"), but it's possible
that this did not break qemu support if that only uses
devices under arch/powerpc/platforms/chrp/pci.c. I could
not get it to boot, but did not try very hard.

      Arnd
