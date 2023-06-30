Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34D743B2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 13:54:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=10KOp+Cz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VLzmPefo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qstz74D6yz3bw8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 21:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=10KOp+Cz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VLzmPefo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qsty74gL8z3bmm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 21:53:50 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id C8F845842A1;
	Fri, 30 Jun 2023 07:53:45 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 30 Jun 2023 07:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1688126025; x=1688133225; bh=ya
	Hy0NgB4QI7znLtjDpufXmMXzZcSHw23m7h8BkLYBc=; b=10KOp+CzUmojO7ZSQ7
	q9c3tAJBmOd76hg6sonOk40OjKAR6/QOPiz7XUomr8IP6aN19s7N9Q20gnTBA8OU
	H+ET1KWhVc0oqozGAYUdc7B70SAPMdGIyEmEipUjQs98dHfF9mAUgsaeXHru8OlA
	Z6b+3BUsGbAouqrpsuvP8THkbsAzAbWArrjQjssrDfLJHYAxMJ1nD0US1BwUxLpH
	Khsbp9i0wfMK4NjF83UPBZQU2Xe9X8o6q5JmvVGPeBGgXYJSti5i4d4Vr++XzGjN
	1deBUgFU/w8tfA/bjpGKl2V8A3IgBHPWHWftg2j80IDtUUtjFI/5ldbjH9jVYmeY
	G2pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688126025; x=1688133225; bh=yaHy0NgB4QI7z
	nLtjDpufXmMXzZcSHw23m7h8BkLYBc=; b=VLzmPefoROKUnYgyH59xLO28GGD4n
	I4lte/pn3WzX95H4eQRtTSBAb90fH5FqIscW92NizI9x3K9rvYkB4k9q6ajV1EbD
	VxE8AOWeA5gd3Truhe/A9kaDx6LrP7Tl4Y9XFamiioeruNo4WJqflkjaHJ0nsHcv
	J2r4IJGTVqOt1B1dMbybj/sbd/LzIbl5CzvfvEtuw8uPdvo7PAFEKVHhv2+1X9Xd
	qEBjQf6xoQoJmFw77YwpNSZG5Kn1KzEpYegVmCRAHDr3owvr/EeqaPrEmVGD6Gmw
	mfm5v+sxS/9Ml4UMUnNpdnRbqLCJ6zjTnHpvZojc13GhJnUu+kDlq3vDg==
X-ME-Sender: <xms:SMKeZCxMqe5zxyzHHEyo_jowh1NvQkg3HAWm1oxMk5pEwCXuDt8nPQ>
    <xme:SMKeZOQSC2GjFmKEVBEJ34bdcsM63u6r5Bbn1HzIVxPff5ENjvEYekcilieyCztL0
    OOiy6d_8S9V2AG4VWM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeigdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:SMKeZEU7QF7lH3eivuj7P9AQVrp-KepGLUxX15AeZTjz07bNrMm_5Q>
    <xmx:SMKeZIimGJWbUJHe4AXjoJoG2-DRyW8QkepPJWqWF6Y-rgF7svHorw>
    <xmx:SMKeZEDcwFLycbP_cRSrtSET1YHYJvelMIMgwIjYVgEhFWn2ec6cwQ>
    <xmx:ScKeZMj8q19ja7k4QwyGQviRl-VaDcpKWJEn2nnWWhOtIymUXjLwrw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 94900B60093; Fri, 30 Jun 2023 07:53:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <dd5aa01e-afad-48d2-bf4c-4a58b74f1644@app.fastmail.com>
In-Reply-To: <ef7b3899-7d18-8018-47fa-aac0efaa61f4@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-8-tzimmermann@suse.de>
 <80e3a583-805e-4e8f-a67b-ebe2e4b9a7e5@app.fastmail.com>
 <d3de124c-6aa8-e930-e238-7bd6dd7929a6@suse.de>
 <0dbbdfc4-0e91-4be4-9ca0-d8ba6f18453d@app.fastmail.com>
 <ef7b3899-7d18-8018-47fa-aac0efaa61f4@suse.de>
Date: Fri, 30 Jun 2023 13:53:24 +0200
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

On Fri, Jun 30, 2023, at 09:46, Thomas Zimmermann wrote:
> Am 29.06.23 um 15:21 schrieb Arnd Bergmann:
>> On Thu, Jun 29, 2023, at 15:01, Thomas Zimmermann wrote:
>>> Am 29.06.23 um 14:35 schrieb Arnd Bergmann:
>>>> On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
>
>>>
>>> FIRMWARE_EDID is a user-selectable feature, while ARCH_HAS_EDID_INFO
>>> announces an architecture feature. They do different things.
>> 
>> I still have trouble seeing the difference.
>
> The idea here is that ARCH_HAS_ signals the architecture's support for 
> the feature.  Drivers set 'depends on' in their Kconfig.
>
> Another Kconfig token, VIDEO_SCREEN_INFO or FIRMWARE_EDID, would then 
> actually enable the feature.  Drivers select VIDEO_SCREEN_INFO or 
> FIRMWARE_EDID and the architectures contains code like

Fair enough. In that case, I guess FIRMWARE_EDID will just depend on
ARCH_HAS_EDID_INFO, or possibly "depends on FIRMWARE_EDID || EFI"
after it starts calling into an EFI specific function, right?

> #ifdef VIDEO_SCREEN_INFO
> struct screen_info screen_info = {
> 	/* set values here */
> }
> #endif
>
> This allows us to disable code that requires screen_info/edid_info, but 
> also disable screen_info/edid_info unless such code has been enabled in 
> the kernel config.
>
> Some architectures currently mimic this by guarding screen_info with 
> ifdef CONFIG_VT or similar. I'd like to make this more flexible. The 
> cost of a few more internal Kconfig tokens seems negligible.

I definitely get it for the screen_info, which needs the complexity.
For ARCHARCH_HAS_EDID_INFO I would hope that it's never selected by
anything other than x86, so I would still go with just a dependency
on x86 for simplicity, but I don't mind having the extra symbol if that
keeps it more consistent with how the screen_info is handled.

>> I suppose you could use FIRMWARE_EDID on EFI or OF systems without
>> the need for a global edid_info structure, but that would not
>> share any code with the current fb_firmware_edid() function.
>
> The current code is build on top of screen_info and edid_info. I'd 
> preferably not replace that, if possible.

One way I could imagine this looking in the end would be
something like

struct screen_info *fb_screen_info(struct device *dev)
{
      struct screen_info *si = NULL;

      if (IS_ENABLED(CONFIG_EFI))
            si = efi_get_screen_info(dev);

      if (IS_ENABLED(CONFIG_ARCH_HAS_SCREEN_INFO) && !si)
            si = screen_info;

      return si;
}

corresponding to fb_firmware_edid(). With this, any driver
that wants to access screen_info would call this function
instead of using the global pointer, plus either NULL pointer
check or a CONFIG_ARCH_HAS_SCREEN_INFO dependency.

This way we could completely eliminate the global screen_info
on arm64, riscv, and loongarch but still use the efi and
hyperv framebuffer/drm drivers.

    Arnd
