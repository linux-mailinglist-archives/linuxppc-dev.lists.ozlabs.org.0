Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49282628DCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 00:55:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB5mS0cw5z3dvm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 10:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sZQl1shn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sZQl1shn;
	dkim-atps=neutral
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NB5lR5HVBz3bhn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 10:54:54 +1100 (AEDT)
Date: Tue, 15 Nov 2022 00:54:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1668470085;
	bh=Dz7/xSqh2npEbI5YMon1IgZkkovoLxEkmwyrvIsKcfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZQl1shnd/0ONXKAOB995YO/xSeXAuy2n3V0lHSrG000Y3kCEhAO3x5L82dszODRP
	 /4W2589c3L2cBdRz4VkUE2TNSA4zUan4TamKaOu9vtqTsKsP6hL6jRlbjky+X6Y0v/
	 5XvqQKeoIiWUL894SRs3sMVLCofVdfoYOzocjjbo=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] macintosh/mac_hid.c: don't load by default
Message-ID: <9255deb3-6c66-444d-940d-77e721d950e5@t-8ch.de>
References: <20221113033022.2639-1-linux@weissschuh.net>
 <Y3KJ6SOD5PEwj1oe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3KJ6SOD5PEwj1oe@google.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
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
Cc: linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Franz Sirl <Franz.Sirl-kernel@lauterbach.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc Franz who wrote the driver originally.
(I hope I got the correct one)

Hi Dmitry,

On 2022-11-14 10:33-0800, Dmitry Torokhov wrote:
> On Sun, Nov 13, 2022 at 04:30:22AM +0100, Thomas Weißschuh wrote:
>> There should be no need to automatically load this driver on *all*
>> machines with a keyboard.
>> 
>> This driver is of very limited utility and has to be enabled by the user
>> explicitly anyway.
>> Furthermore its own header comment has deprecated it for 17 years.
> 
> I think if someone does not need a driver they can either not enable it
> or blacklist it in /etc/modprobe.d/... There is no need to break
> module loading in the kernel.

But nobody needs the driver as it is autoloaded in its current state.
Without manual configuration after loading the driver does not provide any
functionality.

Furthermore the autoloading should load the driver for a specific
hardware/resource that it can provide additional functionality for.
Right now the driver loads automatically for any system that has an input
device with a key and then just does nothing.

It only wastes memory and confuses users why it is loaded.

If somebody really needs this (fringe) driver it should be on them to load it
it instead of everybody else having to disable it.

Furthermore the file has the following comment since the beginning of the git
history in 2005:

    Copyright (C) 2000 Franz Sirl

    This file will soon be removed in favor of an uinput userspace tool.

>> Fixes: 99b089c3c38a ("Input: Mac button emulation - implement as an input filter")
>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>> ---
>>  drivers/macintosh/mac_hid.c | 2 --
>>  1 file changed, 2 deletions(-)
>> 
>> diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
>> index d8c4d5664145..d01d28890db4 100644
>> --- a/drivers/macintosh/mac_hid.c
>> +++ b/drivers/macintosh/mac_hid.c
>> @@ -149,8 +149,6 @@ static const struct input_device_id mac_hid_emumouse_ids[] = {
>>  	{ },
>>  };
>>  
>> -MODULE_DEVICE_TABLE(input, mac_hid_emumouse_ids);
>> -
>>  static struct input_handler mac_hid_emumouse_handler = {
>>  	.filter		= mac_hid_emumouse_filter,
>>  	.connect	= mac_hid_emumouse_connect,
>> 
>> base-commit: fef7fd48922d11b22620e19f9c9101647bfe943d
>> -- 
>> 2.38.1
