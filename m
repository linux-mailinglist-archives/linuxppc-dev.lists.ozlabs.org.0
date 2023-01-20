Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC93675E82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 21:03:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz9RP5bfQz3fKr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 07:03:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LTJmUej4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LTJmUej4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz9QT11M2z3fJB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 07:02:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A5776204F;
	Fri, 20 Jan 2023 20:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE5DC433D2;
	Fri, 20 Jan 2023 20:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674244957;
	bh=GlglYW3c/pib3zrqdUBnkb/zVk+CILGBj0OPOTkq6GY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=LTJmUej4vUhNgH4bmLp+HJHIBL426vrn7mh95SQ6zjj7BMqsk6OHb5YRDdev9TCH7
	 qI5PL494W5x+U4lLYwe9cN5Xd75ff0dUBORA2MybADtOZeEl3xnxQSHz5DhFl0b04m
	 uFFLqFqdNGynin73OtiDKfz+Xh6wd8S+7TQIHf+2un7mwGh6Mi5Jr5bGfkR6oi6KAi
	 i2jw5xRX7qTo//kQ8l97WVdGlPa2RiIltsXesioPXwpAZlCmIbh4qKenxTiRTpBhNO
	 ZaD9gTlm7TwIHOknXl9KnIAHoDq0kozNTDxRdPo09xE7YpcQgFymiJqomXBf19Z1+Z
	 n+yvdmr2oPE2w==
Date: Fri, 20 Jan 2023 20:02:30 +0000
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
Message-ID: <Y8rzVkAC+olX7Kcb@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
 <Y8rMJcX0cqThKj2N@google.com>
 <720a7d19-4b7f-4948-b044-c46a539a4b36@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <720a7d19-4b7f-4948-b044-c46a539a4b36@app.fastmail.com>
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, soc@kernel.org, Pavel Machek <pavel@ucw.cz>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Jan 2023, Arnd Bergmann wrote:

> On Fri, Jan 20, 2023, at 18:15, Lee Jones wrote:
> > On Fri, 20 Jan 2023, Arnd Bergmann wrote:
> 
> >> > Marek Behún (3):
> >> >   leds: turris-omnia: support HW controlled mode via private trigger
> >> >   leds: turris-omnia: initialize multi-intensity to full
> >> >   leds: turris-omnia: change max brightness from 255 to 1
> >> >
> >> > Pali Rohár (5):
> >> >   dt-bindings: leds: register-bit-led: Add active-low property
> >> >   leds: syscon: Implement support for active-low property
> >> >   powerpc/85xx: DTS: Add CPLD definitions for P1021RDB Combo Board CPL
> >> >     Design
> >> >   dt-bindings: leds: Add cznic,turris1x-leds.yaml binding
> >> >   leds: Add support for Turris 1.x LEDs
> >> >
> >> >  .../testing/sysfs-class-led-driver-turris1x   |  31 ++
> >> >  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 +++++
> >> >  .../bindings/leds/register-bit-led.yaml       |   5 +
> >> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    |  92 ++++
> >> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |   6 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |   6 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     |  44 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    |  37 ++
> >> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |   4 +-
> >> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |   4 +-
> >> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    |  37 ++
> >> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |   5 +-
> >> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |   5 +-
> >> >  arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    |  33 +-
> >
> >> >  drivers/leds/Kconfig                          |  10 +
> >> >  drivers/leds/Makefile                         |   1 +
> >> >  drivers/leds/leds-syscon.c                    |  14 +-
> >> >  drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++++++
> >> >  drivers/leds/leds-turris-omnia.c              |  46 +-
> >
> > If everyone is convinced that applying these drivers is the correct
> > thing to do, I'd be happy to (rather) take them via LEDs.
> 
> Ok, thanks. I had not actually looked at the patches until today.
> They were in the soc tree backlog but appeared to be misplaced
> there until I read the  0/10 message text.
> 
> Looking at it now, I see:
> 
> - patches 1 and 2 seem obvious and have been reviewed by
>   others already
> 
> - patch 3 is for arch/powerpc and should get merged through
>   there if there are no objections to the binding in patch 4.
> 
> - patch 5 is the big driver patch, with a Reviewed-by tag
>   from Marek Behún, who is the author of the last three patches.
>   An earlier version of this patch was sent in June and got
>   a few Acks and detailed feedback from Andy [1], but he's also
>   not on Cc, and I don't know if his comments are all resolved
>   in this version.
> 
> - Patches 6, 7 and 8 all seem simple LED subsystem patches,
>   they just need review from you in order to get applied.
>   These are also missing a Signed-off-by from the submitter
>   in addition to the author in order to be applied.

Very well.  Let's have them resent then please (with past reviewers on
Cc:) and we'll go from there.

-- 
Lee Jones [李琼斯]
