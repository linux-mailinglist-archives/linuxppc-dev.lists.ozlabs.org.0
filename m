Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2673CB59
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 16:23:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Owr1gNHl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VK5TgDjV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QpGYG5k5Hz3bvB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jun 2023 00:23:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Owr1gNHl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VK5TgDjV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QpGXF6ch6z30BY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 00:22:20 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 9D1445801DE;
	Sat, 24 Jun 2023 10:22:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 24 Jun 2023 10:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687616537; x=1687623737; bh=Ih
	z6/bi511oP4d526TPPtM1blBZt4arV1NypQDvLup8=; b=Owr1gNHl98uY/LqghJ
	ew6TAsiUgTWjuGMsxDEW7dPPnLV3e7dQ48EjTdP5xHC8mtn8gOYupnCSHk4hfivP
	2548A0+ELQQlya9a+Jj0JkYOlxNPXvbMtrvZE4ZYuMEg0oeEVRQxH3fZk7dq7fcR
	K2FnnRvxLC2ctHogIIPsu5AzKYi/b1l8LHXlg+nhxQKDQbQ2GgNgOE7o0SLx/lJl
	ZJl/F2RHs+ZN1HfuzBUUYja0J54XdNJ5XYphhB2SZMV3SOmTcHA6JZT0U9/SAmVC
	9c8VJBDM16nnBrphov+n9ifuK0VIrDEcUy1gZSuUHvkasNoYZlMz0wEqqeUYovQg
	985w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687616537; x=1687623737; bh=Ihz6/bi511oP4
	d526TPPtM1blBZt4arV1NypQDvLup8=; b=VK5TgDjVEpiEaunZZwRRAQPsTnjFp
	zkoDEEdhdFioqudleRGZjNuek0JsRnk3YrU4OgaJsTS63QgF8QOtf7vg2z1azqmX
	zbJgS5KJT8RVEJGWIcWXoccJV7DsEUPIM7fQrw314Non4B0AcKCTS2tiu4ftIj8G
	sBy+JyOj8lBXvLnjyDAYLzzz21cS9Rw6GZ1k8qjXXnVcAj+7YV4car/+OJ2Hz1Vy
	XzKWDBO3QquHdDPcc9ZnIK0trCu+0GLImpYfYIOCCwLguVtAkJf4TryNcTfPhMob
	qjIlOfgux2mxV3SnTy++07Z7K6tSNSgFgk6q7BXZ1w+17nZskwCf6fCwA==
X-ME-Sender: <xms:GPyWZCp4xCyzgIT7Kv57_S9Fj_YrOyXXtQi7KxbKTITt5sPxujuEgA>
    <xme:GPyWZAoCSw5-QOKYgYL1kqq0dPmclQVYtInH9cHAwaW4i2eRqwCURn45oRtWD_RQc
    xQUs-Q4Qr9LCBw-SYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegjedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:GPyWZHMyXf5Kvsllp2a13R-ZdsUa5Eyn9zm8e_TevTvdOPqjcW5nlQ>
    <xmx:GPyWZB456YmIlexKtameEvfzxT6jb_S5LP8U4ZZ8x8ftCJgDf8Imbw>
    <xmx:GPyWZB4KiilRGFPdEeCPRk6Xvib-UQo3Rc6SHJIcWlgnWs25oEFPvQ>
    <xmx:GfyWZDvcJNvUjndis2HwHYCG9wl31VYvNLjRzs3Fi5XOZJ7a0ROd8w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8029B60086; Sat, 24 Jun 2023 10:22:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <d9ffc44c-c4ae-4f01-bc0b-ee5359a24a0a@app.fastmail.com>
In-Reply-To: <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
 <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
 <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
Date: Sat, 24 Jun 2023 16:21:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [v3,17/19] arch/sparc: Implement fb_is_primary_device() in source file
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>, x86@kernel.org, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 24, 2023, at 15:26, Guenter Roeck wrote:
> On 6/24/23 02:27, Arnd Bergmann wrote:
>> On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>>>
>>> On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
>>>> Other architectures implment fb_is_primary_device() in a source
>>>> file. Do the same on sparc. No functional changes, but allows to
>>>> remove several include statement from <asm/fb.h>.
>>>>
>>>> v2:
>>>> 	* don't include <asm/prom.h> in header file
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: "David S. Miller" <davem@davemloft.net>
>>>
>>> This patch results (or appears to result) in the following build error
>>> when trying to build sparc64:allmodconfig.
>>>
>>> Error log:
>>> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>> WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch
>>> in reference: cpufreq_us2e_driver+0x20 (section: .data) ->
>>> us2e_freq_cpu_init (section: .init.text)
>>> WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch
>>> in reference: cpufreq_us3_driver+0x20 (section: .data) ->
>>> us3_freq_cpu_init (section: .init.text)
>>> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko]
>>> undefined!
>> 
>> These all look like old bugs that would be trivially fixed if
>> anyone cared about sparc.
>> 
>
> Odd argument, given that this _is_ a sparc patch. Those may be old
> bugs, but at least in 6.4-rc7 sparc64:allmodconfig does at least compile.

The first three are non-fatal warnings even with CONFIG_WERROR=y, I'm
sure they have been there for years. I don't immediately see what
caused the __xchg_called_with_bad_pointer error, but it does not
look related to the fbdev patch. I would guess that this is a second
regression that happened to come in at the same time.

> Sure, I can stop build testing it if that is where things are going.

I think we clearly want to fix the fbdev regression you found, and
maybe bisect the atomic64_test as well to see if that was caused by
a recent patch to get it into a working state again.

Regarding whether to continue build testing: if every kernel build
warns about a missing syscall for almost four years (clone3 was
added in 5.3 and requires a minimal review to hook it up to asm
code), it shows that the architecture is seriously neglected
already.

     Arnd
