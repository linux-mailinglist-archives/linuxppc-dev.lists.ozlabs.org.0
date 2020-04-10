Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E14681A4350
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 10:06:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z9Z80nMlzDrNL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 18:06:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=cmss.chinamobile.com (client-ip=221.176.66.80;
 helo=cmccmta2.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cmss.chinamobile.com
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by lists.ozlabs.org (Postfix) with ESMTP id 48z9Wj3zNVzDqVd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 18:03:48 +1000 (AEST)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65e902846ea7-ffeab;
 Fri, 10 Apr 2020 16:03:18 +0800 (CST)
X-RM-TRANSID: 2ee65e902846ea7-ffeab
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.21.224] (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee45e902845dfb-d74bd;
 Fri, 10 Apr 2020 16:03:18 +0800 (CST)
X-RM-TRANSID: 2ee45e902845dfb-d74bd
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To: Markus Elfring <Markus.Elfring@web.de>
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
 <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
Date: Fri, 10 Apr 2020 16:05:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Markus

On 2020/4/10 15:33, Markus Elfring wrote:
>> If the function "platform_get_irq()" failed, the negative value
>> returned will not be detected here, including "-EPROBE_DEFER",
> I suggest to adjust this change description.
>
> Wording alternative:
>    The negative return value (which could eventually be “-EPROBE_DEFER”)
>    will not be detected here from a failed call of the function “platform_get_irq”.
Hardware experiments show that the negative return value is not just 
"-EPROBE_DEFER".
>
>> which causes the application to fail to get the correct error message.
> Will another fine-tuning become relevant also for this wording?
Maybe that's not quite accurate.
>
>
>> Thus it must be fixed.
> Wording alternative:
>    Thus adjust the error detection and corresponding exception handling.
Got it.
>
>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
> How do you think about to add the tags “Fixes”, “Link” and “Reported-by”?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=c0cc271173b2e1c2d8d0ceaef14e4dfa79eefc0d#n584
>
> usb: gadget: fsl_udc_core: Checking for a failed platform_get_irq() call in fsl_udc_probe()
> https://lore.kernel.org/linux-usb/36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de/
> https://lkml.org/lkml/2020/4/8/442
>
> …
>> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
>> @@ -2441,8 +2441,8 @@ static int fsl_udc_probe(struct platform_device *pdev)
>>   	udc_controller->max_ep = (dccparams & DCCPARAMS_DEN_MASK) * 2;
>>
>>   	udc_controller->irq = platform_get_irq(pdev, 0);
>> -	if (!udc_controller->irq) {
>> -		ret = -ENODEV;
>> +	if (udc_controller->irq <= 0) {
> Will such a failure predicate need any more clarification?
>
> How does this check fit to the current software documentation?
Maybe my tags are not suitable.
>
>
>> +		ret = udc_controller->irq ? : -ENODEV;
> Will it be clearer to specify values for all cases in such a conditional operator
> (instead of leaving one case empty)?

I don't know what you mean of "instead of leaving one case empty". But 
by experiment, "ret = udc_controller->irq ? : -ENODEV" or "ret = 
udc_controller->irq < 0 ? udc_controller->irq : -ENODEV" should be 
suitable here.


Thank you for your guidance.

Tang Bin



