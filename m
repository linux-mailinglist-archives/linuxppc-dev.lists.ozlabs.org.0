Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 016EB78D70B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 17:33:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZC0YSJBF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbSxH6Y1Sz3c2H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 01:33:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZC0YSJBF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbSwN2lbmz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 01:32:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OPL8u2tYhafX1T0TmTcgkVAU76Ovegl3zNy3Djwca5g=; b=ZC0YSJBFx2ZYgxj/yw1hxG2s7M
	Wa+o3m4yOf4Ybcc3LdRvMiUPtzGphdtDD/kDFafWTYvkKYXHRxP0rQWPLfLxkqqzLx+aKQ6JnGC/c
	YaeDkQrpLsMzbFKD4hdZT0yAbfdUbbs6dngHIbN0ElBrLCjc1GMvMBEZF1CQtSmjAK247YBgYNWyE
	vfnbvSNM8nT8jBQK0Y8cCRmuOq45l16MjDvgQHQmOzLU9uSMZgt+UmDmmkYAUhuGRYEzgoECGgPfu
	7fzITpIoDui3q/4+EPftilG1uGxh5F6y+NWM/j1VlssXLxfbxmbI0xZqOW+tAOp09/ok+jq5RDE92
	zHkA71sg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qbNBE-00Dlbm-2K;
	Wed, 30 Aug 2023 15:32:28 +0000
Message-ID: <7630bbd0-3296-be21-df90-bb12477b6893@infradead.org>
Date: Wed, 30 Aug 2023 08:32:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] macintosh/ams: linux/platform_device.h is needed
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230829225837.15520-1-rdunlap@infradead.org>
 <bc38dfbb-3f59-103f-598c-eac605b3249d@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <bc38dfbb-3f59-103f-598c-eac605b3249d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Rob Herring <robh@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 8/29/23 22:46, Christophe Leroy wrote:
> 
> 
> Le 30/08/2023 à 00:58, Randy Dunlap a écrit :
>> ams.h uses struct platform_device, so the header should be used
>> to prevent build errors:
>>
>> drivers/macintosh/ams/ams-input.c: In function 'ams_input_enable':
>> drivers/macintosh/ams/ams-input.c:68:45: error: invalid use of undefined type 'struct platform_device'
>>     68 |         input->dev.parent = &ams_info.of_dev->dev;
>> drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
>> drivers/macintosh/ams/ams-input.c:146:51: error: invalid use of undefined type 'struct platform_device'
>>    146 |         return device_create_file(&ams_info.of_dev->dev, &dev_attr_joystick);
>> drivers/macintosh/ams/ams-input.c: In function 'ams_input_exit':
>> drivers/macintosh/ams/ams-input.c:151:44: error: invalid use of undefined type 'struct platform_device'
>>    151 |         device_remove_file(&ams_info.of_dev->dev, &dev_attr_joystick);
>> drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
>> drivers/macintosh/ams/ams-input.c:147:1: error: control reaches end of non-void function [-Werror=return-type]
>>    147 | }
>>
>> Fixes: 233d687d1b78 ("macintosh: Explicitly include correct DT includes")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   drivers/macintosh/ams/ams.h |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff -- a/drivers/macintosh/ams/ams.h b/drivers/macintosh/ams/ams.h
>> --- a/drivers/macintosh/ams/ams.h
>> +++ b/drivers/macintosh/ams/ams.h
>> @@ -6,6 +6,7 @@
>>   #include <linux/input.h>
>>   #include <linux/kthread.h>
>>   #include <linux/mutex.h>
>> +#include <linux/platform_device.h>
> 
> You modify ams.h to fix a problem in ams-input.c
> Is that correct ?
> 

struct platform_device is used in ams.h so I think the change
needs to be there.

> Shouldn't the include be in ams-input.c instead ?
> 
>>   #include <linux/spinlock.h>
>>   #include <linux/types.h>
>>   
> 
> Christophe

-- 
~Randy
