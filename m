Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F17578E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:07:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4vl80PgZz3bNp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 20:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4vkZ1yVfz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 20:07:00 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qLhbX-0002Vt-7x; Tue, 18 Jul 2023 12:06:51 +0200
Message-ID: <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
Date: Tue, 18 Jul 2023 12:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <ZLYHtVuS7AElXcCb@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689674822;a2b58dee;
X-HE-SMSGID: 1qLhbX-0002Vt-7x
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>, Helge Deller <deller@gmx.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18.07.23 05:32, Bagas Sanjaya wrote:
> On Thu, Jul 13, 2023 at 09:11:10AM -0700, Randy Dunlap wrote:
>> On 7/12/23 19:37, Stephen Rothwell wrote:
>>> Changes since 20230712:
>>
>> on ppc64:
>>
>> In file included from ../include/linux/device.h:15,
>>                  from ../arch/powerpc/include/asm/io.h:22,
>>                  from ../include/linux/io.h:13,
>>                  from ../include/linux/irq.h:20,
>>                  from ../arch/powerpc/include/asm/hardirq.h:6,
>>                  from ../include/linux/hardirq.h:11,
>>                  from ../include/linux/interrupt.h:11,
>>                  from ../drivers/video/fbdev/ps3fb.c:25:
>> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
>> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
>>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>>       |                                        ^~
>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>>       |                                     ^~~~~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>>       |         ^~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
>>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>>       |                                                             ^~
>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>>       |                                     ^~~~~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>>       |         ^~~~~~~~
> 
> Hmm, there is no response from Thomas yet. I guess we should go with
> reverting bdb616479eff419, right?

I'm missing something here:

* What makes you think this is caused by bdb616479eff419? I didn't see
anything in the thread that claims this, but I might be missing something
* related: if I understand Randy right, this is only happening in -next;
so why is bdb616479eff419 the culprit, which is also in mainline since
End of June?

And asking for a revert already is a bit jumping the gun; sure, it would
be good to get this fixed, but remember: developers have a lot on their
plate and thus sometimes are forced to set priorities; they also
sometimes go on vacation or are afk for other reasons; and sometimes
they just miss a mail or two. These are just a few reasons why there
might be good reasons why Thomas didn't look into this yet, hence please
first ask really kindly before asking for a revert.

Ciao, Thorsten
