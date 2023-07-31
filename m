Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE53476954C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 13:54:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDxVj6Dydz3c1l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 21:54:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDxV72qLPz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 21:54:06 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qQRTH-0004qB-Gx; Mon, 31 Jul 2023 13:53:55 +0200
Message-ID: <edb7c56e-92d2-317e-b11b-caaabd33161b@leemhuis.info>
Date: Mon, 31 Jul 2023 13:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US, de-DE
To: Randy Dunlap <rd.dunlab@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me> <874jm1jv9m.fsf@mail.lhotse>
 <d9616a67-23e8-118f-dc0a-7ed4afd4bffd@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <d9616a67-23e8-118f-dc0a-7ed4afd4bffd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690804447;71b830c6;
X-HE-SMSGID: 1qQRTH-0004qB-Gx
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-fbdev@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>, Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18.07.23 18:15, Randy Dunlap wrote:
> On 7/18/23 04:48, Michael Ellerman wrote:
>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>>> On Thu, Jul 13, 2023 at 09:11:10AM -0700, Randy Dunlap wrote:
>>>> on ppc64:
>>>>
>>>> In file included from ../include/linux/device.h:15,
>>>>                  from ../arch/powerpc/include/asm/io.h:22,
>>>>                  from ../include/linux/io.h:13,
>>>>                  from ../include/linux/irq.h:20,
>>>>                  from ../arch/powerpc/include/asm/hardirq.h:6,
>>>>                  from ../include/linux/hardirq.h:11,
>>>>                  from ../include/linux/interrupt.h:11,
>>>>                  from ../drivers/video/fbdev/ps3fb.c:25:
>>>> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
>>>> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
> [...]
>>
>> Does regzbot track issues in linux-next?

Seems your patch didn't make any progress, at least I can't see it in
-next. Is there a reason why, or did I miss anything?

And yes, sure, I'm aware that it's -next and a driver that people might
not enable regularly. But I noticed it and thought "quickly bring it up,
might be good to fix this rather sooner than later before other people
run into it (and who knows, maybe it'll switch a light in some CI system
from red to green as well)"

Ciao, Thorsten

>> The driver seems to only use info->dev in that one dev_info() line,
>> which seems purely cosmetic, so I think it could just be removed, eg:
>>
>> diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
>> index d4abcf8aff75..a304a39d712b 100644
>> --- a/drivers/video/fbdev/ps3fb.c
>> +++ b/drivers/video/fbdev/ps3fb.c
>> @@ -1168,8 +1168,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
>>  
>>  	ps3_system_bus_set_drvdata(dev, info);
>>  
>> -	dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>> -		 dev_driver_string(info->dev), dev_name(info->dev),
>> +	dev_info(info->device, "using %u KiB of video memory\n",
>>  		 info->fix.smem_len >> 10);
>>  
>>  	task = kthread_run(ps3fbd, info, DEVICE_NAME);
> 
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 
> Thanks.
> 
