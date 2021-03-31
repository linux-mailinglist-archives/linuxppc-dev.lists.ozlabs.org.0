Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A734F80C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9D8s6sNrz3c5h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:38:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aMvTwdFw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aMvTwdFw; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9D8T4mJnz3bts
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:38:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9D8S5gHpz9sVq;
 Wed, 31 Mar 2021 15:38:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617165496;
 bh=l/oOLNl5zOhFfRLVjaROlStGcvwV5dIWn0HGghZi4rg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aMvTwdFwqQ6GhzDWlReqAi6FNY45N6Oser2sSglNYretNDkmYrfQxDDL+BK0rfyqR
 TJYfAqEowWfcfdc3rpPuFA+07snZOLS2KV5Fxr1Y6RAkYGrPbEEAyAisvlbHb4ZQtT
 ScaZShtIj7bdPQyYNWWmWWmmDIoLRE8wDlIf6PNFrh1G+SrYwk3Tmp+ZvyjX8mt0nD
 iBFSOz45uatsrpivTfMV81WQvbCrFiDNappkMgwi5bzQqCAmQv8WJwGiqiZxhfyF0I
 K8IFOn3P7YbZ8QeUCJvewh9/qLzRm8pVp3WYfQiSkL0xj5tR4NMBcuvobbdAQeMd55
 2HQ3pHOJ1g2MQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] powerpc/pseries: Only register vio drivers if vio bus
 exists
In-Reply-To: <37664153-c31e-bd20-71b4-9afa049dc60a@molgen.mpg.de>
References: <20210316010938.525657-1-mpe@ellerman.id.au>
 <37664153-c31e-bd20-71b4-9afa049dc60a@molgen.mpg.de>
Date: Wed, 31 Mar 2021 15:38:11 +1100
Message-ID: <87eefwx7ik.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Menzel <pmenzel@molgen.mpg.de> writes:
> Am 16.03.21 um 02:09 schrieb Michael Ellerman:
>> The vio bus is a fake bus, which we use on pseries LPARs (guests) to
>> discover devices provided by the hypervisor. There's no need or sense
>> in creating the vio bus on bare metal systems.
>> 
>> Which is why commit 4336b9337824 ("powerpc/pseries: Make vio and
>> ibmebus initcalls pseries specific") made the initialisation of the
>> vio bus only happen in LPARs.
>> 
>> However as a result of that commit we now see errors at boot on bare
>> metal systems:
>> 
>>    Driver 'hvc_console' was unable to register with bus_type 'vio' because the bus was not initialized.
>>    Driver 'tpm_ibmvtpm' was unable to register with bus_type 'vio' because the bus was not initialized.
>> 
>> This happens because those drivers are built-in, and are calling
>> vio_register_driver(). It in turn calls driver_register() with a
>> reference to vio_bus_type, but we haven't registered vio_bus_type with
>> the driver core.
>> 
>> Fix it by also guarding vio_register_driver() with a check to see if
>> we are on pseries.
>> 
>> Fixes: 4336b9337824 ("powerpc/pseries: Make vio and ibmebus initcalls pseries specific")
>> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/platforms/pseries/vio.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
>> index 9cb4fc839fd5..429053d0402a 100644
>> --- a/arch/powerpc/platforms/pseries/vio.c
>> +++ b/arch/powerpc/platforms/pseries/vio.c
>> @@ -1285,6 +1285,10 @@ static int vio_bus_remove(struct device *dev)
>>   int __vio_register_driver(struct vio_driver *viodrv, struct module *owner,
>>   			  const char *mod_name)
>>   {
>> +	// vio_bus_type is only initialised for pseries
>> +	if (!machine_is(pseries))
>> +		return -ENODEV;
>> +
>>   	pr_debug("%s: driver %s registering\n", __func__, viodrv->name);
>>   
>>   	/* fill in 'struct driver' fields */
>
> Thank you. The errors are gone now.
>
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> # IBM S822L (POWER8)
>
> As it fixes a commit from Linux 5.8, should it be tagged for the stable 
> releases, or is it going to be picked up automatically due to the Fixes tag?

It's not what I'd describe as a bad bug, so I'm not that inclined to
tag it for stable.

But given it has a Fixes tag, and is quite small, the bots will probably
backport it automatically.

cheers
