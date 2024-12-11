Return-Path: <linuxppc-dev+bounces-3979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876589EC64C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 09:01:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7Sj54JhQz306J;
	Wed, 11 Dec 2024 19:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733904073;
	cv=none; b=R5Jxlw7qWZdXyP4GrL0ERMuDspWxnzOdIwd3C7sZl9au2PclyqV3tJggFGvBFh7Lq7x8wqUTmyInWYppFM1kBx1jvZiCQ0hVVx2admdxpRbHnABHPcM+tqha5p37m/E1TSJ+B0Z8IUtTY0kzSiuEwxF5f81KKoAYz32geKSbawomAHrSoIYgX6GqxpwFh4O2Mj8SqzkpjXCzzyro+chBgLPN0Rmxb+Zrjv2KD03stWI5Uv1ZGw/LKJPpWA/8noukG1juhi0Y9sefmAmZOoVv0jR1/FPFnpzL08u5jduS9m53sGjRd5QZEMWP8f7BuzJfvSJbVv13VrY+axr9tsWq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733904073; c=relaxed/relaxed;
	bh=DgWuiN++oS0g7Y5qrW5JydBknNDpOHHVeu1pRG1HVME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlK4XNUl/YVL6HY7qzyhqFFJWM/FBE8AffI9kGBRLArir55doguOClAUKpNkvVAwgVh0ys2CQZlsQJIryuohTaet83S7IvZL0kRZgHSlQ4k/wEruEFkJXiWhaoGs+QQERZFJmnj0aY3He2+KXn1HcEDhQX+QQjBxRF8ALlXw2EiLk1S9VJVaqtieFdX+AaaMJzp+6D6Uoy9pEs88uge64cjDfgNYVDe1Q6Q5YZ+MkPXJ+ionE7kMSH1G5y1bm/2sqCVURykujIj6cZ0QPQae8Zrz3liAX4WA6MswQ61hjfxjoZ7bkXjJR2nUKBFjNP2UKBm17XmUmishgmKwQuV5mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7Sj35q84z305Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 19:01:11 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE0952115D;
	Wed, 11 Dec 2024 08:01:07 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 926DC13983;
	Wed, 11 Dec 2024 08:01:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zT5tIsNGWWePLwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 11 Dec 2024 08:01:07 +0000
Message-ID: <16c09ca8-aa73-4fc2-b693-0bfcc8dcac6d@suse.de>
Date: Wed, 11 Dec 2024 09:01:07 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Helge Deller <deller@gmx.de>, javierm@redhat.com, arnd@arndb.de,
 simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
 <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
 <e7d5fba5-7ecd-4ed3-be7a-56bf82030e67@suse.de>
 <6b543ccd-23dd-474d-9828-1eb0ecec9c5d@gmx.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <6b543ccd-23dd-474d-9828-1eb0ecec9c5d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: DE0952115D
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi


Am 11.12.24 um 00:37 schrieb Helge Deller:
> On 12/10/24 16:41, Thomas Zimmermann wrote:
>> Hi
>>
>>
>> Am 10.12.24 um 15:34 schrieb Helge Deller:
>>> On 12/10/24 15:29, Helge Deller wrote:
>>>> On 12/10/24 15:09, Thomas Zimmermann wrote:
>>>>> diff --git a/drivers/staging/fbtft/Kconfig 
>>>>> b/drivers/staging/fbtft/Kconfig
>>>>> index 77ab44362f16..577e91ff7bf6 100644
>>>>> --- a/drivers/staging/fbtft/Kconfig
>>>>> +++ b/drivers/staging/fbtft/Kconfig
>>>>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>>>>>       tristate "Support for small TFT LCD display modules"
>>>>>       depends on FB && SPI
>>>>>       depends on FB_DEVICE
>>>>> +    depends on BACKLIGHT_DEVICE_CLASS
>>>>
>>>> Typo. Should be BACKLIGHT_CLASS_DEVICE...
>>
>> Ah, thanks. I'll better check the rest of the series for similar 
>> mistakes.
>>
>>>
>>> Beside the typo:
>>> In this case, doesn't it make sense to "select 
>>> BACKLIGHT_DEVICE_CLASS" instead?
>>
>> That causes the dependency error mentioned in the commit message. 
>> This time it's just for fbtft instead of shmobilefb.
>>
>>> If people want the fbtft, backlight support should be enabled too.
>>
>> As a user-visible option, it should not be auto-selected
>> unnecessarily.
>
> Right, it should not be auto-selected.
> Unless if fbtft really needs it enabled to function.
> IMHO all fb/drm drivers have higher priority than some low-level
> background backlight controller code.

By that logic, we'd list always list all drivers and each driver would 
auso-select the subsystems it requires. So each fbdev driver would 
select CONFIG_FB.

That's not how it works, of course. Instead, each subsystem is 
user-selected and Kconfig offers the drivers that have their 
dependencies met. The documentation for Kconfig clearly states that 
select should be used carefully. [1]

[1] 
https://elixir.bootlin.com/linux/v6.12.4/source/Documentation/kbuild/kconfig-language.rst#L137

>
>> The DRM panel drivers already depend on the backlight
>> instead of selecting it. It's the correct approach.
>
> Sounds wrong IMHO.

Generally, it's the right approach. I guess what could be done is to 
make backlight support optional in the driver code, and use the imply 
attribute [2] instead of depends. So the driver would indicate a 
preference for backlight support, but still work without. That could 
also be done for the fbdev drivers, of course.

[2] 
https://elixir.bootlin.com/linux/v6.12.4/source/Documentation/kbuild/kconfig-language.rst#L163

Best regards
Thomas

>
>> As I mentioned
>> in the cover letter, the few remaining driver that select it should
>> probably be updated.
>
> That dependency sounds weird, but maybe I simply misunderstand your 
> logic...?
>
> As a Linux end user I usually know which graphic cards are in my machine
> and which ones I want to enable.
> But as a normal user I think I shouldn't be expected to know
> that I first need to enable the "backlight class device"
> so that I'm then able to afterwards enable the fbtft (or any other 
> drm/fb driver).
>
> Am I wrong?
>
> Helge

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


