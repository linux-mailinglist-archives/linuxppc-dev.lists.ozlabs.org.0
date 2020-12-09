Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3672D4109
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 12:25:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrZTw3QVNzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 22:25:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 392 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Dec 2020 22:20:59 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrZNq0Cp5zDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 22:20:57 +1100 (AEDT)
Received: from [192.168.1.155] ([77.2.91.93]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MLA6m-1kVyjB0KSg-00IGWK; Wed, 09 Dec 2020 12:11:39 +0100
Subject: Re: [PATCH] drivers: usb: gadget: prefer pr_*() functions over raw
 printk()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201208144403.22097-1-info@metux.net>
 <X8+howyVRiTR9gv/@pendragon.ideasonboard.com>
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <9aaa06ad-0bd8-486d-b16b-66927d57cf96@metux.net>
Date: Wed, 9 Dec 2020 12:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <X8+howyVRiTR9gv/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TS1+oAY6AdC0UtwhrAetL+tFGsmfL2VfyybwOSaT75VKnrTnQRP
 +IsskL1kzQM9VxvORn/3q+2HI+37v7ZwZzAgdFcCtYyGKF2H12RAOoHm/AnxwZEfQfdTnAG
 riDnR9h5WKx005G0EBL3tnCOrA3A2kDwZoFjNwOeV9e+JMvdFNOPusk61sFmC0Blv/Vh2PP
 j1H0hZddMV8nXVQWrrzyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+eoancWYGu8=:AzbjyFqIWEAC8WfENyjT3P
 6T1b/LnX4TUjzwNc9I6+WOa3htGlNdYpbyBu3D0GDO4n9C8VlJzLA9GwVuwGT27iVZI2zdeHD
 4ZBdJ4kaeLrSt0wsWkMVByMrSwMv/YuWyjyLzW9Hp4B2fP/nfsbiWOKd+Y1dCHeesVq2ejyrg
 C6TRTyhosgH53le3on6eZXkadI1iXSDCWTTQhT867WolrFDoFqAhTSrmYUFfS8YCwX5nTGt1O
 7MivIO2n33zmEdYMGnknd4bU2nGCZ1AIwXYldxiS88EeAaDsQ3UPaG+c4MsN8OKTqUiRRT8NC
 e/+l3a8hdWQ0aAOhSB/WOfnpAkXiOAYexZnmAqKLgCN7KilDzt7JrSx72Pl2Rwrmmhr1+UYMU
 S3ueaEFmKFvz0/o+t/2+PA7Yp23YTNTcftjHqZvdbyQvSmujif7G33I+EZJ/Y
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.12.20 16:54, Laurent Pinchart wrote:

Hi,

>> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
>> index 2b893bceea45..4834fafb3f70 100644
>> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
>> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
>> @@ -1573,7 +1573,7 @@ static void usba_control_irq(struct usba_udc *udc, struct usba_ep *ep)
>>  		 * generate or receive a reply right away. */
>>  		usba_ep_writel(ep, CLR_STA, USBA_RX_SETUP);
>>  
>> -		/* printk(KERN_DEBUG "setup: %d: %02x.%02x\n",
>> +		/* pr_debug("setup: %d: %02x.%02x\n",
>>  			ep->state, crq.crq.bRequestType,
>>  			crq.crq.bRequest); */
> 
> I wonder if this shouldn't be dropped instead, commented-out code isn't
> very useful.

Indeed. Shall I send a separate patch for that ?

> When a pointer to a struct device is available, dev_err() would be much
> better. That's however out of scope for this patch, but it would be nice
> to address it. This would become
> 
> 		dev_err(&pdev->dev, "Check IRQ setup!\n");
> 

You're right. I didn't check for that yet. I'll do it in a separate
patch.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
