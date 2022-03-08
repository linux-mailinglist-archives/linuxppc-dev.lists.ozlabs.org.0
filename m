Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 060564D13A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 10:45:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCVmy6N6zz3bYl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 20:45:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=a.fatoum@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCVmX3XF9z2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 20:44:59 +1100 (AEDT)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nRWOF-0004l1-EX; Tue, 08 Mar 2022 10:44:23 +0100
Message-ID: <b23e4089-6431-de26-8666-bae4c3c8df88@pengutronix.de>
Date: Tue, 8 Mar 2022 10:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-mtd@lists.infradead.org, Joakim.Tjernlund@infinera.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
 <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
 <e11b76dc-5539-fb7e-da1c-a5005713d6b0@gmail.com>
 <3dbbcee5-81fc-cdf5-9f8b-b6ccb95beddc@pengutronix.de>
 <0f2cfcac-83ca-51a9-f92c-ff6495dca1d7@gmail.com>
 <b231b498-c8d2-28af-ce66-db8c168047f7@pengutronix.de>
 <66ee55d9-4f20-6722-6097-e53c2108ea07@gmail.com>
 <579eab10-594c-d6b2-0ddb-ea6ab8e02856@pengutronix.de>
 <cedb1604-e024-2738-5b33-15703a653803@gmail.com>
 <117facba-ba33-349d-1085-25315cc1ae92@gmail.com>
 <f9e46b61-37e5-a280-edb0-27f8e81a8680@pengutronix.de>
 <9621c512-06f2-17b2-5c68-943b1f0981eb@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <9621c512-06f2-17b2-5c68-943b1f0981eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, cyrille.pitchen@wedev4u.fr,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Tokunori,

On 06.03.22 16:49, Tokunori Ikegami wrote:
> Hi,
> 
> On 2022/03/04 20:11, Ahmad Fatoum wrote:
>> Hello Tokunori-san,
>>
>> On 20.02.22 13:22, Tokunori Ikegami wrote:
>>> Hi Ahmad-san,
>>>
>>> Could you please try the version 2 patch attached for the error case?
>>> This version is to check the DQ true data 0xFF by chip_good().
>> I had a similar patch locally as well at first. I just tested yours
>> and I can't reproduce the issue.
> Thanks for your support.
> Sorry if possible could you please retest the attached the patch again since this fixed the version 1 patch maintainer review comments?

Works good.

Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

>>> But I am not sure if this works or not since the error is possible to be caused by Hi-Z 0xff on floating bus or etc.
>> That it works for me could be because of Hi-Z 0xff, which is why
>> decided against it.
> I see.
>>
>>>>>>> What seems to work for me is checking if chip_good or chip_ready
>>>>>>> and map_word is equal to 0xFF. I can't justify why this is ok though.
>>>>>>> (Worst case bus is floating at this point of time and Hi-Z is read
>>>>>>> as 0xff on CPU data lines...)
>>>>>> Sorry I am not sure about this.
>>>>>> I thought the chip_ready() itself is correct as implemented as the data sheet in the past.
>>>>>> But it did not work correctly so changed to use chip_good() instead as it is also correct.
>>>>> What exactly in the datasheet makes you believe chip_good is not appropriate?
>>>> I just mentioned about the actual issue behaviors as not worked chip_good() on S29GL964N and not worked chip_ready() on MX29GL512FHT2I-11G before etc.
>>>> Anyway let me recheck the data sheet details as just checked it again quickly but needed more investigation to understand.
>>> As far as I checked still both chip_good() and chip_ready() seem correct but still the root cause is unknown.
>>> If as you mentioned the issue was cased by the DQ true data 0xFF I am not sure why the read work without any error after the write operation.
>>> Also if the error was caused by the Hi-Z 0xff on floating bus as mentioned I am not sure why the read work without any error after the write operation with chip_ready().
>>> Sorry anyway the root cause is also unknown when the write operation was changed to use chip_good() instead of chip_ready().
>> I've be ok with v1 then. Restores working behavior for me and shouldn't break others.
> 
> Noted but still I am thinking the version 2 patch to check 0xff seems better than to use chip_ready() so let me consider this again later.

The original version has less room for surprise as it restores previously
working behavior. Assuming 0xFF to be good without backing from documentation
is more risky IMO.

Thanks for your continued support,
Ahmad

> 
> Regards,
> Ikegami
> 
>>
>> Cheers and thanks again,
>> Ahmad
>>
>>> Regards,
>>> Ikegami
>>>
>>>> Regards,
>>>> Ikegami
>>>>
>>>>> Cheers,
>>>>> Ahmad
>>>>>
>>>>>
>>


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
