Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A26629087
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 04:08:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBB3B4ySMz3cJ7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 14:08:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Xk5L4wmB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Xk5L4wmB;
	dkim-atps=neutral
X-Greylist: delayed 171428 seconds by postgrey-1.36 at boromir; Tue, 15 Nov 2022 14:08:03 AEDT
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBB2C4hRGz2xf6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 14:08:02 +1100 (AEDT)
Date: Tue, 15 Nov 2022 04:07:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1668481676;
	bh=XwukAzEMkrKOLhwHxnYIHJWTurGUZY8bv9JS6huuNUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xk5L4wmBCSU913s1llA/SpI1JY6RdkkltupJrVhUV/2nHrG5Y7Z8uXFiS/f/A/J54
	 wiiF6I6K/UAMNUrU0eDbnzFvOkPVG0XYlWODm+MtETmX96kWTx2avZsrSja3n2PA2w
	 9M2yqXiYm4CD3ru7LLDLaGpDxDoN/5+vS1QjpP3A=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] macintosh/mac_hid.c: don't load by default
Message-ID: <cf4c9402-189f-4ff7-a130-c61ccfc99a08@t-8ch.de>
References: <20221113033022.2639-1-linux@weissschuh.net>
 <Y3KJ6SOD5PEwj1oe@google.com>
 <9255deb3-6c66-444d-940d-77e721d950e5@t-8ch.de>
 <Y3LaTeMxTa/7Rv7H@google.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="t5LQKshz+W68qyxN"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3LaTeMxTa/7Rv7H@google.com>
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


--t5LQKshz+W68qyxN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 2022-11-14 16:16-0800, Dmitry Torokhov wrote:
> On Tue, Nov 15, 2022 at 12:54:41AM +0100, Thomas Weißschuh wrote:
>> Cc Franz who wrote the driver originally.
>> (I hope I got the correct one)
>> 
>> Hi Dmitry,
>> 
>> On 2022-11-14 10:33-0800, Dmitry Torokhov wrote:
>>> On Sun, Nov 13, 2022 at 04:30:22AM +0100, Thomas Weißschuh wrote:
>>>> There should be no need to automatically load this driver on *all*
>>>> machines with a keyboard.
>>>> 
>>>> This driver is of very limited utility and has to be enabled by the user
>>>> explicitly anyway.
>>>> Furthermore its own header comment has deprecated it for 17 years.
>>> 
>>> I think if someone does not need a driver they can either not enable it
>>> or blacklist it in /etc/modprobe.d/... There is no need to break
>>> module loading in the kernel.
>> 
>> But nobody needs the driver as it is autoloaded in its current state.
>> Without manual configuration after loading the driver does not provide any
>> functionality.
>> 
>> Furthermore the autoloading should load the driver for a specific
>> hardware/resource that it can provide additional functionality for.
>> Right now the driver loads automatically for any system that has an input
>> device with a key and then just does nothing.
>> 
>> It only wastes memory and confuses users why it is loaded.
>> 
>> If somebody really needs this (fringe) driver it should be on them to load it
>> it instead of everybody else having to disable it.
> 
> The driver is not enabled by default, so somebody has to enable it in
> the first place. How did you end up with it?

My distro kernel configured it to be enabled as module.
So people who want to use it can do so. It would be nice if the rest of us
wouldn't have to care about it.

>> Furthermore the file has the following comment since the beginning of the git
>> history in 2005:
>> 
>>     Copyright (C) 2000 Franz Sirl
>> 
>>     This file will soon be removed in favor of an uinput userspace tool.
> 
> OK, that is a separate topic, if there are no users we can remove the
> driver. Do we know if this tool ever came into existence?

One interpretation of it is attached as "mac_hid_userspace.c".

> What I do not want is to break the autoload for one single driver
> because somebody enabled it without intending to use and now tries to
> implement a one-off.

Is an autoloaded driver that then does not (ever) automatically provide any
functionality not broken by definition?
It was enabled by the distro. Which seems correct, because maybe somebody will
use it.

Taken to an illogical extreme: If it is fine for modules to load automatically
even if they are not useful, why not just always load all available modules?


Maybe we can take the removal of the autoload as a first step of deprecation
and finally removal of the module.
To quote you:

    "I'd rather we did not promote from drivers/macintosh to other platforms,
     but rather removed it. The same functionality can be done from
     userspace." [0]

>>>> Fixes: 99b089c3c38a ("Input: Mac button emulation - implement as an input filter")
>>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>>> ---
>>>>  drivers/macintosh/mac_hid.c | 2 --
>>>>  1 file changed, 2 deletions(-)
>>>> 
>>>> diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
>>>> index d8c4d5664145..d01d28890db4 100644
>>>> --- a/drivers/macintosh/mac_hid.c
>>>> +++ b/drivers/macintosh/mac_hid.c
>>>> @@ -149,8 +149,6 @@ static const struct input_device_id mac_hid_emumouse_ids[] = {
>>>>  	{ },
>>>>  };
>>>>  
>>>> -MODULE_DEVICE_TABLE(input, mac_hid_emumouse_ids);
>>>> -
>>>>  static struct input_handler mac_hid_emumouse_handler = {
>>>>  	.filter		= mac_hid_emumouse_filter,
>>>>  	.connect	= mac_hid_emumouse_connect,
>>>> 
>>>> base-commit: fef7fd48922d11b22620e19f9c9101647bfe943d
>>>> -- 
>>>> 2.38.1

Thanks,
Thomas

[0] https://lore.kernel.org/all/20170510004327.GA32584@dtor-ws/

--t5LQKshz+W68qyxN
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="mac_hid_userspace.c"
Content-Transfer-Encoding: 8bit

// SPDX-License-Identifier: GPL-2.0-only
/*
 * Userspace replacement for mac_hid.c from Linux.
 *
 * Copyright (C) 2022 Thomas Weißschuh
 */

/* cc $(pkg-config --cflags libevdev) $(pkg-config --libs libevdev) mac_hid_userspace.c -o mac_hid_userspace */

#define _GNU_SOURCE

#include <stdio.h>
#include <fcntl.h>
#include <assert.h>
#include <stdlib.h>

#include <libevdev/libevdev.h>
#include <libevdev/libevdev-uinput.h>
#include <linux/input-event-codes.h>

static void update_name(struct libevdev *dev)
{
	char *name;
	int rc = asprintf(&name, "%s (mac_hid)", libevdev_get_name(dev));
	assert(rc > 0);
	libevdev_set_name(dev, name);
	free(name);
}

int main(int argc, char **argv)
{
	int button2 = KEY_RIGHTCTRL;
	int button3 = KEY_RIGHTALT;

	if (argc != 2 && argc != 4) {
		fprintf(stderr, "usage: %s DEVICE [BUTTON2 BUTTON3]\n",
				argv[0]);
		return 1;
	}
	if (argc == 4) {
		char *endptr;
		button2 = strtol(argv[2], &endptr, 0);
		assert(!*endptr);
		button3 = strtol(argv[3], &endptr, 0);
		assert(!*endptr);
	}

	struct libevdev *dev;
	int fd = open(argv[1], O_RDONLY);
	assert(fd != -1);
	int rc = libevdev_new_from_fd(fd, &dev);
	assert(rc == 0);

	libevdev_enable_event_type(dev, EV_KEY);
	libevdev_enable_event_code(dev, EV_KEY, BTN_MIDDLE, NULL);
	libevdev_enable_event_code(dev, EV_KEY, BTN_RIGHT, NULL);

	update_name(dev);

	struct libevdev_uinput *uinput_dev;
	rc = libevdev_uinput_create_from_device(
			dev,
			LIBEVDEV_UINPUT_OPEN_MANAGED,
			&uinput_dev);
	assert(rc == 0);

	rc = libevdev_grab(dev, LIBEVDEV_GRAB);
	assert(rc == 0);

	while (1) {
		struct input_event ev;
		rc = libevdev_next_event(dev, LIBEVDEV_READ_FLAG_NORMAL, &ev);
		assert(rc == 0);
		if (ev.type == EV_KEY) {
			if (ev.code == button2)
				ev.code = BTN_MIDDLE;
			else if (ev.code == button3)
				ev.code = BTN_RIGHT;
		}
		rc = libevdev_uinput_write_event(uinput_dev, ev.type, ev.code, ev.value);
		assert(rc == 0);
	}

	libevdev_uinput_destroy(uinput_dev);
	libevdev_free(dev);
}

--t5LQKshz+W68qyxN--
