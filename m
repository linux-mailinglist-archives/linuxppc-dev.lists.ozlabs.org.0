Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 732CB19D5BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 13:23:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tyHG42FYzDsM2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 22:23:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.48.182; helo=7.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 7.mo2.mail-out.ovh.net (7.mo2.mail-out.ovh.net [188.165.48.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tyBt1yp0zDrg0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 22:19:46 +1100 (AEDT)
Received: from player718.ha.ovh.net (unknown [10.110.103.177])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 6C13F1D00F0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 13:19:41 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 396C310FE6259;
 Fri,  3 Apr 2020 11:19:30 +0000 (UTC)
Subject: Re: [PATCH 1/4] scsi: cxlflash: Access interrupt trigger page from
 xive directly
To: "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
 <20200402154352.586166-2-fbarrat@linux.ibm.com>
 <20200402231949.GA5469@p8tul1-build.aus.stglabs.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <831be9d2-5639-bdfe-ebc8-e4c10d9b7669@kaod.org>
Date: Fri, 3 Apr 2020 13:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402231949.GA5469@p8tul1-build.aus.stglabs.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2002975937169034137
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedukedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: ukrishn@linux.ibm.com, ajd@linux.ibm.com, haren@linux.ibm.com,
 groug@kaod.org, linuxppc-dev@lists.ozlabs.org, christophe_lombard@fr.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/3/20 1:19 AM, Matthew R. Ochs wrote:
> On Thu, Apr 02, 2020 at 05:43:49PM +0200, Frederic Barrat wrote:
>> xive is already mapping the trigger page in kernel space and it can be
>> accessed through standard APIs, so let's reuse it and simplify the code.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>  drivers/scsi/cxlflash/ocxl_hw.c | 17 +++++++----------
>>  drivers/scsi/cxlflash/ocxl_hw.h |  1 -
>>  2 files changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
>> index 7018cd802569..59452850f71c 100644
>> --- a/drivers/scsi/cxlflash/ocxl_hw.c
>> +++ b/drivers/scsi/cxlflash/ocxl_hw.c
>> @@ -15,7 +15,8 @@
>>  #include <linux/pseudo_fs.h>
>>  #include <linux/poll.h>
>>  #include <linux/sched/signal.h>
>> -
>> +#include <linux/interrupt.h>
>> +#include <asm/xive.h>
>>  #include <misc/ocxl.h>
>>  
>>  #include <uapi/misc/cxl.h>
>> @@ -180,7 +181,7 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
>>  	struct ocxl_hw_afu *afu = ctx->hw_afu;
>>  	struct device *dev = afu->dev;
>>  	struct ocxlflash_irqs *irq;
>> -	void __iomem *vtrig;
>> +	struct xive_irq_data *xd;
>>  	u32 virq;
>>  	int rc = 0;
>>  
>> @@ -204,15 +205,14 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
>>  		goto err1;
>>  	}
>>  
>> -	vtrig = ioremap(irq->ptrig, PAGE_SIZE);
>> -	if (unlikely(!vtrig)) {
>> -		dev_err(dev, "%s: Trigger page mapping failed\n", __func__);
>> -		rc = -ENOMEM;
>> +	xd = irq_get_handler_data(virq);
>> +	if (unlikely(!xd)) {
>> +		dev_err(dev, "%s: Can't get interrupt data\n", __func__);
> 
> The removal of setting the return code injects a bug should this error leg
> ever be encountered. So we should either keep the rc statement e.g. -EINVAL,
> -ENXIO, -ENODEV, etc., or remove this error leg. I lean towards keeping the
> statement.

I like ENXIO for XIVE matters. 

C. 

>>  		goto err2;
>>  	}
>>  
>>  	irq->virq = virq;
>> -	irq->vtrig = vtrig;
>> +	irq->vtrig = xd->trig_mmio;
>>  out:
>>

