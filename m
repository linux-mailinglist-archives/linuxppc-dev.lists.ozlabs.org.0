Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B249276E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 15:10:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FWDMpn8J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFH870F9vz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 23:10:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FWDMpn8J;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFH7Q2s0kz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 23:10:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720098610;
	bh=ktD7Ha3VJC6ylAvsp6i9aJB04xtxImlbVah9Wk9oUdk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FWDMpn8Jy2xbMsZMuOl4tkksRAKiM2V9NQfTC2G6ugWEbBpObF74amfCqOGq+ky01
	 jpO9qzpXXOPALsrFHLQLpuUYtkIjoXf4UojeD2S5L6KwGIc9+IGazjYJ1vUgac0p9v
	 vGI5TXZF91Ni6V8KbHKiBep4d51W4DtUT/vq452aRtRH9Lc6LgKXNlJIqgMR9I6ZLb
	 L2ERP6vCxXneBzQmzt0xd4qTmaavkxnyVAev+vRaikx3ELwfKm+rl6eDw50JF6WYhB
	 6x241zDyYcnWpRPX8sEbVkslJ9ioyLWOsQbR3RamU+b+ZdgPcot6hqQ5de5VauJlR3
	 OHtaA+DyxJiIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WFH7Q0Wt4z4w2M;
	Thu,  4 Jul 2024 23:10:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anatolij Gustschin
 <agust@denx.de>
Subject: Re: pdm360ng and touchscreen set up
In-Reply-To: <ZoNHLjmSvCN12vU5@google.com>
References: <ZoNHLjmSvCN12vU5@google.com>
Date: Thu, 04 Jul 2024 23:10:09 +1000
Message-ID: <87r0c9i9qm.fsf@mail.lhotse>
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:
> Hi Anatolij, Michael,
>
> I hope you can shed some light for me: why does pdm360ng have very
> elaborate set up for the "pendown" GPIO of the touchscreen? Can we
> simply fix the DTS in arch/powerpc/boot/dts/pdm360ng.dts and specify
> correct pendown GPIO there, as well as correct interrupt trigger,
> and remove most of arch/powerpc/platforms/512x/pdm360ng.c ?

Sorry, I don't know anything about this platform.

It looks like it's some sort of embedded display device? It's pretty old
and hasn't seen much activity for ~10 years.

> Something like this:
>
> diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/pdm360ng.dts
> index 67c3b9db75d7..5651bd9d9db3 100644
> --- a/arch/powerpc/boot/dts/pdm360ng.dts
> +++ b/arch/powerpc/boot/dts/pdm360ng.dts
> @@ -176,11 +176,12 @@ psc@11900 {
>  
>  			/* ADS7845 touch screen controller */
>  			ts@0 {
> -				compatible = "ti,ads7846";
> +				compatible = "ti,ads7845";
>  				reg = <0x0>;
>  				spi-max-frequency = <3000000>;
>  				/* pen irq is GPIO25 */
> -				interrupts = <78 0x8>;
> +				interrupts = <78 IRQ_TYPE_LEVEL_LOW>;
> +				pendown-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
>  			};
>  		};
>  
>
>
> The reason I'm asking is that I want to remove support for platform
> data in ads7846 driver and pdm360ng is one of the last 3 users of it in
> the kernel.

I think go ahead with the change, and if anyone is still using this
device they can speak up if there's any problems.

cheers
