Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC31DB40D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:46:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RsvP1ybLzDqlX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 22:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mg.codeaurora.org (client-ip=104.130.122.27;
 helo=mail27.static.mailgun.info;
 envelope-from=bounce+ee6c0f.be9e4a-linuxppc-dev=lists.ozlabs.org@mg.codeaurora.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org
 header.a=rsa-sha256 header.s=smtp header.b=rJvh86Kj; 
 dkim-atps=neutral
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 49RsrB2510zDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 22:43:53 +1000 (AEST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589978634; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nLaK/ohEQ1OzRdH5EY+kSAjwbEK+2E1W0vY/2r749BI=;
 b=rJvh86Kj3bPAtu7iAxsINLeCNnQTif1XVCOARKN/XmIYX5ZhcDpKeC1X2AVaBeUhcP2hiVo6
 pcVVAnxCBpnUfJyMDvu7rIcUWmOHcXickVuq+P4r3wahdbBpesp4NUxFsszwFXPG1uv3dV7A
 Ie8nyBUCJXjYRl1TuE4J36cosD0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec5260440528fe3942e5466 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 12:43:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 23885C433C9; Wed, 20 May 2020 12:43:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rananta)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B5A10C433C8;
 Wed, 20 May 2020 12:43:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 20 May 2020 05:43:46 -0700
From: rananta@codeaurora.org
To: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH v2] tty: hvc: Fix data abort due to race in hvc_open
In-Reply-To: <f84a9da7-bb0f-7538-fa00-968c9625335b@suse.cz>
References: <20200520064708.24278-1-rananta@codeaurora.org>
 <f84a9da7-bb0f-7538-fa00-968c9625335b@suse.cz>
Message-ID: <5895803be5c8fd4c5e7725b57ffe79e4@codeaurora.org>
X-Sender: rananta@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: gregkh@linuxfoundation.org, andrew@daynix.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-05-20 01:59, Jiri Slaby wrote:
> On 20. 05. 20, 8:47, Raghavendra Rao Ananta wrote:
>> Potentially, hvc_open() can be called in parallel when two tasks calls
>> open() on /dev/hvcX. In such a scenario, if the 
>> hp->ops->notifier_add()
>> callback in the function fails, where it sets the tty->driver_data to
>> NULL, the parallel hvc_open() can see this NULL and cause a memory 
>> abort.
>> Hence, do a NULL check at the beginning, before proceeding ahead.
>> 
>> The issue can be easily reproduced by launching two tasks 
>> simultaneously
>> that does an open() call on /dev/hvcX.
>> For example:
>> $ cat /dev/hvc0 & cat /dev/hvc0 &
>> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
>> ---
>>  drivers/tty/hvc/hvc_console.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/tty/hvc/hvc_console.c 
>> b/drivers/tty/hvc/hvc_console.c
>> index 436cc51c92c3..80709f754cc8 100644
>> --- a/drivers/tty/hvc/hvc_console.c
>> +++ b/drivers/tty/hvc/hvc_console.c
>> @@ -350,6 +350,9 @@ static int hvc_open(struct tty_struct *tty, struct 
>> file * filp)
>>  	unsigned long flags;
>>  	int rc = 0;
>> 
>> +	if (!hp)
>> +		return -ENODEV;
>> +
> 
> This is still not fixing the bug properly. See:
> https://lore.kernel.org/linuxppc-dev/0f7791f5-0a53-59f6-7277-247a789f30c2@suse.cz/
> 
> In particular, the paragraph starting "IOW".
> 
You are right. This doesn't fix the problem entirely. There are other 
parts to it which is
not handled in a clean way by the driver. Apart from the things you've 
mentioned, it doesn't
seem to handle the hp->port.count correctly as well.

hvc_open:
   hp->port.count++
   hp->ops->notifier_add(hp, hp->data) fails
   tty->driver_data = NULL

hvc_close:
   returns immediately as tty->driver_data == NULL, without 
hp->port.count--

This would leave the port in a stale state, and the second caller of 
hvc_open doesn't get
a chance to call/retry hp->ops->notifier_add(hp, hp->data);

However, the patch is not trying to address the logical issues with 
hvc_open and hvc_close.
It's only trying to eliminate the potential NULL pointer dereference, 
leading to a panic.
 From what I see, the hvc_open is serialized by tty_lock, and adding a 
NULL check here is
preventing the second caller.
> thanks,

Thank you.
Raghavendra
