Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD010675BF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:49:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz6SL4Rrlz3fLN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:49:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=CQcLVRre;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=f3twNx4g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=CQcLVRre;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=f3twNx4g;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz6RR0k7Gz3c8W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:48:17 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id A46F43200A47;
	Fri, 20 Jan 2023 12:48:13 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 12:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1674236892; x=
	1674323292; bh=suuEDmGpMK8nFYB774MavCLSlHZ448gfBuVhNRXP7EU=; b=C
	QcLVRreBsT9rJUB1hoyVgUJ7vWGaM17ha5j9hXxIL5YJmaX14k1LJ4O4SbMkTXy1
	2EAUuqM8XKqhhvsd2L0aLL8LCrKakXLnOJ4EDxHhkVa6MPdzzhgGAzS1Axale0lx
	N1IVM8igM6tDyqZOZmxJ0UcEaogD+K5Gtn3M8iTDM6Xrla1DTsc7K+AZSvmdZTPL
	w5OdBZ4a1MqQlaMaxhUbvAClZJu8DCf+O2DNcIRaFlcAVGz5HXxeqOL7JuTSr2qG
	PAhUDcC2sN3i2/tW4JwwmiCd6K3AgKYr2tHQy5Sr3ztdwW6Y41NEE6vGiyJR747R
	1L2RKqasUqUfGfWTOy9Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674236892; x=
	1674323292; bh=suuEDmGpMK8nFYB774MavCLSlHZ448gfBuVhNRXP7EU=; b=f
	3twNx4gypSuyC82LNunQU3SUx3JQT35yk8KkrZhMH/pkfinaI/2/nBN3IKe0IUAW
	alB/7JBcG4PVMFUFBKYXCEObg7LPiNi4aCB/SXsaTj86L3b/Y+lkKJfyVPTVEzpu
	SzLhTYw+Iutd7v6MfVE1qr+ptyxCAiAZujfyEDDw4hMaffqHqL/spNpyOZlh/09y
	ZysYzJftXVhYmx+dZt8OqpVhZJeuHFNw6velxglhJeNRfovB6DRoCpEfdT2ZKLlI
	YAIiEtRbDevfm3mB9XjVABvjPBXeQmn7VcmkQPDpzrn5hVl1Ie3wBCyRA65RuAZu
	x3PYw5WILmzUoI62CMlLw==
X-ME-Sender: <xms:29PKYylELihtzgeq-nZ34-6DjL0SIqRD4R_4F30uCg--gV3OElBSIw>
    <xme:29PKY533sVhqJAiJoOsQ3iGpDdf-STroR5kv74P7GnBB9ZbiMYYcfZ-xOphlALEPa
    gWEVXBSfU_IiWK0iRs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeu
    feefieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:29PKYwrUWQrbmvHdUIOMnQnqLCxJ4qs4qHotbjlDq5n9mfQJ_dUxqQ>
    <xmx:29PKY2mw24bxrJtxFLn64x-m-I3rMlad9TkCqttHJDbgr2vk6WDNZw>
    <xmx:29PKYw03GLe1PEgTMr5ylaXbbr0GTsYQguNOfKBObPa9OmXGcIkO2g>
    <xmx:3NPKYxLTrWC9SRpdqaGtp_3nNcT-CRaUmTiQ2oKZrQo783C-pCTLtg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B9E9AB60086; Fri, 20 Jan 2023 12:48:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <720a7d19-4b7f-4948-b044-c46a539a4b36@app.fastmail.com>
In-Reply-To: <Y8rMJcX0cqThKj2N@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
 <Y8rMJcX0cqThKj2N@google.com>
Date: Fri, 20 Jan 2023 18:47:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, soc@kernel.org, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023, at 18:15, Lee Jones wrote:
> On Fri, 20 Jan 2023, Arnd Bergmann wrote:

>> > Marek Beh=C3=BAn (3):
>> >   leds: turris-omnia: support HW controlled mode via private trigger
>> >   leds: turris-omnia: initialize multi-intensity to full
>> >   leds: turris-omnia: change max brightness from 255 to 1
>> >
>> > Pali Roh=C3=A1r (5):
>> >   dt-bindings: leds: register-bit-led: Add active-low property
>> >   leds: syscon: Implement support for active-low property
>> >   powerpc/85xx: DTS: Add CPLD definitions for P1021RDB Combo Board =
CPL
>> >     Design
>> >   dt-bindings: leds: Add cznic,turris1x-leds.yaml binding
>> >   leds: Add support for Turris 1.x LEDs
>> >
>> >  .../testing/sysfs-class-led-driver-turris1x   |  31 ++
>> >  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 +++++
>> >  .../bindings/leds/register-bit-led.yaml       |   5 +
>> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    |  92 ++++
>> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |   6 +-
>> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |   6 +-
>> >  arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     |  44 +-
>> >  arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    |  37 ++
>> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |   4 +-
>> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |   4 +-
>> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    |  37 ++
>> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |   5 +-
>> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |   5 +-
>> >  arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    |  33 +-
>
>> >  drivers/leds/Kconfig                          |  10 +
>> >  drivers/leds/Makefile                         |   1 +
>> >  drivers/leds/leds-syscon.c                    |  14 +-
>> >  drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++=
++++
>> >  drivers/leds/leds-turris-omnia.c              |  46 +-
>
> If everyone is convinced that applying these drivers is the correct
> thing to do, I'd be happy to (rather) take them via LEDs.

Ok, thanks. I had not actually looked at the patches until today.
They were in the soc tree backlog but appeared to be misplaced
there until I read the  0/10 message text.

Looking at it now, I see:

- patches 1 and 2 seem obvious and have been reviewed by
  others already

- patch 3 is for arch/powerpc and should get merged through
  there if there are no objections to the binding in patch 4.

- patch 5 is the big driver patch, with a Reviewed-by tag
  from Marek Beh=C3=BAn, who is the author of the last three patches.
  An earlier version of this patch was sent in June and got
  a few Acks and detailed feedback from Andy [1], but he's also
  not on Cc, and I don't know if his comments are all resolved
  in this version.

- Patches 6, 7 and 8 all seem simple LED subsystem patches,
  they just need review from you in order to get applied.
  These are also missing a Signed-off-by from the submitter
  in addition to the author in order to be applied.
 =20
      Arnd

[1] https://lore.kernel.org/all/CAHp75Vcr6o2rm+T6Tr8sS4VXCLVHtmLPWy-njOK=
AvO4AcZoW=3DA@mail.gmail.com/
