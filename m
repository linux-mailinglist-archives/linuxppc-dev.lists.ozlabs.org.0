Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3361CC607
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 03:32:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KRQT5ZmKzDr96
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 11:32:49 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=smtp header.b=M5dA4N/u; 
 dkim-atps=neutral
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 49KRNQ4ppfzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 11:31:01 +1000 (AEST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589074261; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SWmr21JzBeyX3B6jEnsPhNXgkMNcdb2+W8/646mE2VI=;
 b=M5dA4N/u1Vv6MupsSKYESRQt57CVA11twCaRAmkOxJcv7qcXtnpXflDGFlY7MzjqOUjo1uib
 qjkVxXsm4zQ9kvhn3kaZ2grjy7rmI36mcJUSwuGz9vUm+Bf00I3jZ7McLc7S8VUD8IP7dMiU
 yTmkwrYw0gsJ+AqyYiCO+HktAkI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb75952.7f8a49ec37d8-smtp-out-n04;
 Sun, 10 May 2020 01:30:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A7C5C433D2; Sun, 10 May 2020 01:30:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rananta)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 772E0C433F2;
 Sun, 10 May 2020 01:30:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 09 May 2020 18:30:56 -0700
From: rananta@codeaurora.org
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] tty: hvc: Fix data abort due to race in hvc_open
In-Reply-To: <20200506094851.GA2787548@kroah.com>
References: <20200428032601.22127-1-rananta@codeaurora.org>
 <20200506094851.GA2787548@kroah.com>
Message-ID: <98bbe7afabf48d8e8fe839fdc9e836a5@codeaurora.org>
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
Cc: andrew@daynix.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jslaby@suse.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-05-06 02:48, Greg KH wrote:
> On Mon, Apr 27, 2020 at 08:26:01PM -0700, Raghavendra Rao Ananta wrote:
>> Potentially, hvc_open() can be called in parallel when two tasks calls
>> open() on /dev/hvcX. In such a scenario, if the 
>> hp->ops->notifier_add()
>> callback in the function fails, where it sets the tty->driver_data to
>> NULL, the parallel hvc_open() can see this NULL and cause a memory 
>> abort.
>> Hence, serialize hvc_open and check if tty->private_data is NULL 
>> before
>> proceeding ahead.
>> 
>> The issue can be easily reproduced by launching two tasks 
>> simultaneously
>> that does nothing but open() and close() on /dev/hvcX.
>> For example:
>> $ ./simple_open_close /dev/hvc0 & ./simple_open_close /dev/hvc0 &
>> 
>> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
>> ---
>>  drivers/tty/hvc/hvc_console.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/tty/hvc/hvc_console.c 
>> b/drivers/tty/hvc/hvc_console.c
>> index 436cc51c92c3..ebe26fe5ac09 100644
>> --- a/drivers/tty/hvc/hvc_console.c
>> +++ b/drivers/tty/hvc/hvc_console.c
>> @@ -75,6 +75,8 @@ static LIST_HEAD(hvc_structs);
>>   */
>>  static DEFINE_MUTEX(hvc_structs_mutex);
>> 
>> +/* Mutex to serialize hvc_open */
>> +static DEFINE_MUTEX(hvc_open_mutex);
>>  /*
>>   * This value is used to assign a tty->index value to a hvc_struct 
>> based
>>   * upon order of exposure via hvc_probe(), when we can not match it 
>> to
>> @@ -346,16 +348,24 @@ static int hvc_install(struct tty_driver 
>> *driver, struct tty_struct *tty)
>>   */
>>  static int hvc_open(struct tty_struct *tty, struct file * filp)
>>  {
>> -	struct hvc_struct *hp = tty->driver_data;
>> +	struct hvc_struct *hp;
>>  	unsigned long flags;
>>  	int rc = 0;
>> 
>> +	mutex_lock(&hvc_open_mutex);
>> +
>> +	hp = tty->driver_data;
>> +	if (!hp) {
>> +		rc = -EIO;
>> +		goto out;
>> +	}
>> +
>>  	spin_lock_irqsave(&hp->port.lock, flags);
>>  	/* Check and then increment for fast path open. */
>>  	if (hp->port.count++ > 0) {
>>  		spin_unlock_irqrestore(&hp->port.lock, flags);
>>  		hvc_kick();
>> -		return 0;
>> +		goto out;
>>  	} /* else count == 0 */
>>  	spin_unlock_irqrestore(&hp->port.lock, flags);
> 
> Wait, why isn't this driver just calling tty_port_open() instead of
> trying to open-code all of this?
> 
> Keeping a single mutext for open will not protect it from close, it 
> will
> just slow things down a bit.  There should already be a tty lock held 
> by
> the tty core for open() to keep it from racing things, right?
The tty lock should have been held, but not likely across ->install() 
and
->open() callbacks, thus resulting in a race between hvc_install() and 
hvc_open(),
where hvc_install() sets a data and the hvc_open() clears it. hvc_open() 
doesn't
check if the data was set to NULL and proceeds.
> 
> Try just removing all of this logic and replacing it with a call to
> tty_port_open() and see if that fixes this issue.
> 
> As "proof" of this, I don't see other serial drivers needing a single
> mutex for their open calls, do you?
> 
> thanks,
> 
> greg k-h

Thank you.
Raghavendra
