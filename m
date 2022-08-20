Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F159B0F0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 01:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9Frn5M9vz3cdC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 09:56:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ktXC7QeL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=protonmail.com (client-ip=185.70.43.27; helo=mail-4327.protonmail.ch; envelope-from=povik@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ktXC7QeL;
	dkim-atps=neutral
X-Greylist: delayed 431 seconds by postgrey-1.36 at boromir; Sun, 21 Aug 2022 06:24:55 AEST
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M998l3ttNz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 06:24:55 +1000 (AEST)
Date: Sat, 20 Aug 2022 20:17:23 +0000
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ktXC7QeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1661026648; x=1661285848;
	bh=KKmlMdBATxrw1fYuo6BKMHqUBdbBm2ifnz68GwDN770=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
	b=ktXC7QeLApdlEuX8E4i5TioL2jUXuiPm1YNPiqPqZY+vvwFhCi6VCubuGbIrCBCas
	 Szbhy0cwhZzpAimnhkMp88ncd54Mw4dfxZ0pqnarq/0WNsZ4wIhLEJfA70oHfn7fqM
	 Xgnkof8cizyehXgeJ1Kt3Q40igXvNdrl4JfCoIug0lef0sLq7S3JH4oGVUl7ikvee1
	 YWwS2YGiU3huLpUhsnw9Rk35IeGyIQF63xgiH7TVKaj94FWNF3Uwj2KyNzFtg3ne5Q
	 JXb/oKV/iKvlcF9m57Vk/CKJshGcZQ6Eiza2rXDYOWXErmV8SN/7UT9V9oE1ZrHw4h
	 XlTgvInkGZ2NQ==
To: Arminder Singh <arminders208@outlook.com>
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Message-ID: <8387D093-6220-4849-9E09-D856A4362E97@protonmail.com>
Feedback-ID: 6533334:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 21 Aug 2022 09:54:35 +1000
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
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 20. 8. 2022, at 21:45, Arminder Singh <arminders208@outlook.com> wrote=
:
>
> This is the first time I'm interacting with the Linux mailing lists, so
> please don't eviscerate me *too much* if I get the formatting wrong.
> Of course I'm always willing to take criticism and improve my formatting
> in the future.
>
> This patch adds support for IRQs to the PASemi I2C controller driver.
> This will allow for faster performing I2C transactions on Apple Silicon
> hardware, as previously, the driver was forced to poll the SMSTA register
> for a set amount of time.
>
> With this patchset the driver on Apple silicon hardware will instead wait
> for an interrupt which will signal the completion of the I2C transaction.
> The timeout value for this completion will be the same as the current
> amount of time the I2C driver polls for.
>
> This will result in some performance improvement since the driver will be
> waiting for less time than it does right now on Apple Silicon hardware.
>
> The patch right now will only enable IRQs for Apple Silicon I2C chips,
> and only if it's able to successfully request the IRQ from the kernel.
>
> =3D=3D=3D Testing =3D=3D=3D
>
> This patch has been tested on both the mainline Linux kernel tree and
> the Asahi branch (https://github.com/AsahiLinux/linux.git) on both an
> M1 and M2 MacBook Air, and it compiles successfully as both a module and
> built-in to the kernel itself. The patch in both trees successfully boots
> to userspace without any hitch.
>
> I do not have PASemi hardware on hand unfortunately, so I'm unable to tes=
t
> the impact of this patch on old PASemi hardware. This is also why I've
> elected to do the IRQ request and enablement on the Apple platform driver
> and not in the common file, as I'm not sure if PASemi hardware supports
> IRQs.
>
> I also fixed a quick checkpatch warning on line 303. "i ++" is now "i++".
>
> Any and all critiques of the patch would be well appreciated.
>
>
>
>
> Signed-off-by: Arminder Singh <arminders208@outlook.com>

Thanks for the patch!

Tested-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

on Mac mini (2020) with M1, with in-kernel WIP sound drivers.

Some timing comparison on boot logs follows, three runs with
and without the patch.

With:

[    0.631034] ALSA device list:
[    0.631403]   #0: Mac mini J274 integrated audio

[    0.625559] ALSA device list:
[    0.625997]   #0: Mac mini J274 integrated audio

[    0.624561] ALSA device list:
[    0.624913]   #0: Mac mini J274 integrated audio

Without:

[    0.681599] ALSA device list:
[    0.682051]   #0: Mac mini J274 integrated audio

[    0.677538] ALSA device list:
[    0.677968]   #0: Mac mini J274 integrated audio

[    0.686037] ALSA device list:
[    0.686400]   #0: Mac mini J274 integrated audio

(After I collected these I realised I don=E2=80=99t know to what exactly
the timing of the print is anchored, but anyway it still suggests
there is speed-up.)

Best,
Martin


