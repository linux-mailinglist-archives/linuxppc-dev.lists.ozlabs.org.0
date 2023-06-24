Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159B73CA3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 11:36:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=2fzrhKF9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ss12EnHU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qp8Bs3BGDz3by8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 19:36:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=2fzrhKF9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ss12EnHU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 463 seconds by postgrey-1.37 at boromir; Sat, 24 Jun 2023 19:35:54 AEST
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qp89k2FZNz30JF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 19:35:54 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 3DD9B5842D1;
	Sat, 24 Jun 2023 05:28:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 24 Jun 2023 05:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687598885; x=1687606085; bh=qY
	ntvL1gKhXrmWH0tTXfCuX8ddCTc/3rP2W4LxyKhm0=; b=2fzrhKF90cpXdCJJhX
	LNQ5t74+BoUFAWu2Z9oVvwfRP+G2j+kHetfXDo7jXuv6MZjlVNDYMOe5uMBuCdrY
	tfPOeSOrdnMHi5ExY6XX7AWMG7KA6nVtCTrwrLskcwomUPvEud6GLH7At6wunV8T
	1xjw8VbSHv+R4fEe2U3K0VAbm+xpbPHip2N4n+Wjl5qhwQ5ZCL9UOgj1O/Ev3fUz
	wFoNMcX1DQqOGh3VF3wDQoCuthyjHY5xOlhizC1sa5RpiNIFDzQpiYdpxDZoyaus
	Jb8lK1gCGSw8zq5XV56wA5i2aAdBsF5Nj6taOY18hsohd5+dcepsDuWV8vsh6/Bp
	FnCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687598885; x=1687606085; bh=qYntvL1gKhXrm
	WH0tTXfCuX8ddCTc/3rP2W4LxyKhm0=; b=Ss12EnHU4AcwmUdUHarRTM5S6SQng
	s1jzkZTwt45UxEwaoXOe27PqNaIoImQzAcGstwg5plJ41roH3XuppaxR7+klgqAT
	t2qTaZahs2nvwu7r3H1VhEDI35lYik3jAGEsIHR2BPHNrkn6lrob8XsuLvH5a0nS
	3PctpKkR+/0CA0SYvMYr+Yi8zJioA3pDKC07QmhNdD7FSzOplFMmbgKTCxZsf7qJ
	UiCtm5Hf06e/mrw5KEp0RhzySvecvFKrkEIZ3jIqTxjSlYxkPmMjRGDkZYisUHdp
	Ltzzz1MP7nRj6pHsmgact/qcePRWHX8qnnokQvpv2K8E68y0F1jWwV5xw==
X-ME-Sender: <xms:JLeWZFOBFglxl1i5bI3l1p0oN8XlQzdcdm1l_G7s8_E-sM0HZytL4g>
    <xme:JLeWZH--P5FdBTJ_umdmBwIQ3BaF9UxuoF5B2lSO_XD_aJ1GsWYULUTZ9P4U_i4Wt
    0CGKV6DR5IBfrDLmGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JLeWZESOvtN3WRtL4qcbs1TxlvwwnmscUJ664LO5SZIsEeCM99_NTw>
    <xmx:JLeWZBsXh796y04w6P0GVP04uwY_zKhNkC-ozsUZCaW2YmXR9CpM-Q>
    <xmx:JLeWZNfcbt5O64mkJb1sR3C8x8YFQCpWT18ij9tkQXIoWlLXKJHfnQ>
    <xmx:JbeWZOBhhQ4yvPgqPpUS3E42vsWe4WTrrcu1uDU2wkIyXn5yBFMoWw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 03220B60086; Sat, 24 Jun 2023 05:28:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
In-Reply-To: <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
Date: Sat, 24 Jun 2023 11:27:42 +0200
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

On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>
> On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
>> Other architectures implment fb_is_primary_device() in a source
>> file. Do the same on sparc. No functional changes, but allows to
>> remove several include statement from <asm/fb.h>.
>> 
>> v2:
>> 	* don't include <asm/prom.h> in header file
>> 
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: "David S. Miller" <davem@davemloft.net>
>
> This patch results (or appears to result) in the following build error
> when trying to build sparc64:allmodconfig.
>
> Error log:
> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch 
> in reference: cpufreq_us2e_driver+0x20 (section: .data) -> 
> us2e_freq_cpu_init (section: .init.text)
> WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch 
> in reference: cpufreq_us3_driver+0x20 (section: .data) -> 
> us3_freq_cpu_init (section: .init.text)
> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko] 
> undefined!

These all look like old bugs that would be trivially fixed if
anyone cared about sparc.

> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o

I checked that there are no callers of fb_is_primary_device()
in built-in code when CONFIG_FB is =m, so adding the MODULE_LICENSE()
and MODULE_DESCRIPTION() tags to the file is the correct fix.

    Arnd
