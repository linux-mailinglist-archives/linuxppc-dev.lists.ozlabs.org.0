Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2DB74274A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:22:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=4uqnQG/Z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IbgfMem7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsJzH5gWtz3bhL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 23:22:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=4uqnQG/Z;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IbgfMem7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsJyP4LrWz30XX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 23:22:05 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id D62232B00081;
	Thu, 29 Jun 2023 09:22:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 29 Jun 2023 09:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1688044920; x=1688052120; bh=sQ
	O+tpzU86Ruad95sakzckO3PnIV53aaJirVNNGwiuo=; b=4uqnQG/Z1UuyNyyAek
	0XEemltl5YoKfbuyK7idzOfGbk2sj8tW5sPhftwy7vAcMTe/lNT1CqLxPHHTqxXl
	b+N4aIXSme583rtEDLHRQQE5RZfTFsD+lTdYY9RefCbOfAlhciUTlKT5u2JXw4I4
	ztOXsWSrHvNADHnJ68PH1ClsbIkWEIcWMVseJvPUcBCt/bCpX9x+rZSZZO6oAAQb
	x9SWYdHJXxBC2SICSWUYB8JczQyliaPFo8FiWTtVLKrXWw/KnLs9i/+IAnqxZm8k
	yqkPPTEwfMl+/IelpxRjc4jeyf7SfLboZoIPnpuMmrGUGm6Jvxy4MC7RByrwgGdC
	yACQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688044920; x=1688052120; bh=sQO+tpzU86Rua
	d95sakzckO3PnIV53aaJirVNNGwiuo=; b=IbgfMem7uDuQxpPEGhflBncHobvLW
	vpdJgB9HlfrxSWZohr0Jpjmu+TTjCXIaQB0uQ+13MlfVT0itNPNX4vwmIqNieKC6
	gPv4iflQLslU6lXHYDAvAm799+KHkiXlvXfZM777AHY2iwxEls+3U9z2bO1yeOef
	wFpfTxWZmsHuvogMZSyJmnFyjemy8yi74cXqbPUy2ZTBAZ4KqNqWtoYlOjGYmlQy
	PMPbNhtV1XvXdYg2lSN5WBQIEaNfObSZgMdkW8nfVQEunQCLpApHo/cwzRobpAQN
	ZuHALvp9USqwqc7dcNooNTZaYpKwAFukGjJYFDScEYkfK4BGpwxbvs5wA==
X-ME-Sender: <xms:eIWdZK2mhUMZoeD5ScJng_-Mw9sdRxOEu_Lgqc28dk7bZK70NYedTw>
    <xme:eIWdZNGBGclYv6j7-IGwscmhWxPIRk4Bebhe_u_lemBUmyA0MfekuVd4tn5XkkmLX
    tzaa5AupcGn4LfNDF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:eIWdZC5kimzqKYQ1BPs7CvQbOgpGEss3M0RxRwWrIroNsq9V3om0TA>
    <xmx:eIWdZL1nORBRiFJwbEufwbgzn_wdP_V0r9RSWhxWObhMpewEM8zlHA>
    <xmx:eIWdZNG9JECFzRVSW1lGw4WP0yMQisPFaCR0eAsEec1IlVvAdRAh7Q>
    <xmx:eIWdZPlLPgVMB-Zms1gBZ7XMicph5Ie9iaKcHZPRTF7XioY1Fsly84JuoI4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F305FB60086; Thu, 29 Jun 2023 09:21:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <0dbbdfc4-0e91-4be4-9ca0-d8ba6f18453d@app.fastmail.com>
In-Reply-To: <d3de124c-6aa8-e930-e238-7bd6dd7929a6@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-8-tzimmermann@suse.de>
 <80e3a583-805e-4e8f-a67b-ebe2e4b9a7e5@app.fastmail.com>
 <d3de124c-6aa8-e930-e238-7bd6dd7929a6@suse.de>
Date: Thu, 29 Jun 2023 15:21:39 +0200
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, Juerg Haef
 liger <juerg.haefliger@canonical.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 29, 2023, at 15:01, Thomas Zimmermann wrote:
> Am 29.06.23 um 14:35 schrieb Arnd Bergmann:
>> On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
>>> The global variable edid_info contains the firmware's EDID information
>>> as an extension to the regular screen_info on x86. Therefore move it to
>>> <asm/screen_info.h>.
>>>
>>> Add the Kconfig token ARCH_HAS_EDID_INFO to guard against access on
>>> architectures that don't provide edid_info. Select it on x86.
>> 
>> I'm not sure we need another symbol in addition to
>> CONFIG_FIRMWARE_EDID. Since all the code behind that
>> existing symbol is also x86 specific, would it be enough
>> to just add either 'depends on X86' or 'depends on X86 ||
>> COMPILE_TEST' there?
>
> FIRMWARE_EDID is a user-selectable feature, while ARCH_HAS_EDID_INFO 
> announces an architecture feature. They do different things.

I still have trouble seeing the difference.

> Right now, ARCH_HAS_EDID_INFO only works on the old BIOS-based VESA 
> systems. In the future, I want to add support for EDID data from EFI and 
> OF as well. It would be stored in edid_info. I assume that the new 
> symbol will become useful then.

I don't see why an OF based system would have the same limitation
as legacy BIOS with supporting only a single monitor, if we need
to have a generic representation of EDID data in DT, that would
probably be in a per device property anyway.

I suppose you could use FIRMWARE_EDID on EFI or OF systems without
the need for a global edid_info structure, but that would not
share any code with the current fb_firmware_edid() function.

     Arnd
