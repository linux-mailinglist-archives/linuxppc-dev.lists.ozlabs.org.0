Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B69A1CEDF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 09:24:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Lq7B32BCzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 17:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=jslaby@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Lq515DrqzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 17:22:22 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4916B1A2;
 Tue, 12 May 2020 07:22:19 +0000 (UTC)
Subject: Re: [PATCH] tty: hvc: Fix data abort due to race in hvc_open
To: Greg KH <gregkh@linuxfoundation.org>, rananta@codeaurora.org
References: <20200428032601.22127-1-rananta@codeaurora.org>
 <20200506094851.GA2787548@kroah.com>
 <98bbe7afabf48d8e8fe839fdc9e836a5@codeaurora.org>
 <20200510064819.GB3400311@kroah.com>
 <77d889be4e0cb0e6e30f96199e2d843d@codeaurora.org>
 <20200511073913.GA1347819@kroah.com>
From: Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0f7791f5-0a53-59f6-7277-247a789f30c2@suse.cz>
Date: Tue, 12 May 2020 09:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511073913.GA1347819@kroah.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11. 05. 20, 9:39, Greg KH wrote:
> On Mon, May 11, 2020 at 12:23:58AM -0700, rananta@codeaurora.org wrote:
>> On 2020-05-09 23:48, Greg KH wrote:
>>> On Sat, May 09, 2020 at 06:30:56PM -0700, rananta@codeaurora.org wrote:
>>>> On 2020-05-06 02:48, Greg KH wrote:
>>>>> On Mon, Apr 27, 2020 at 08:26:01PM -0700, Raghavendra Rao Ananta wrote:
>>>>>> Potentially, hvc_open() can be called in parallel when two tasks calls
>>>>>> open() on /dev/hvcX. In such a scenario, if the
>>>>>> hp->ops->notifier_add()
>>>>>> callback in the function fails, where it sets the tty->driver_data to
>>>>>> NULL, the parallel hvc_open() can see this NULL and cause a memory
>>>>>> abort.
>>>>>> Hence, serialize hvc_open and check if tty->private_data is NULL
>>>>>> before
>>>>>> proceeding ahead.
>>>>>>
>>>>>> The issue can be easily reproduced by launching two tasks
>>>>>> simultaneously
>>>>>> that does nothing but open() and close() on /dev/hvcX.
>>>>>> For example:
>>>>>> $ ./simple_open_close /dev/hvc0 & ./simple_open_close /dev/hvc0 &
>>>>>>
>>>>>> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
>>>>>> ---
>>>>>>  drivers/tty/hvc/hvc_console.c | 16 ++++++++++++++--
>>>>>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/tty/hvc/hvc_console.c
>>>>>> b/drivers/tty/hvc/hvc_console.c
>>>>>> index 436cc51c92c3..ebe26fe5ac09 100644
>>>>>> --- a/drivers/tty/hvc/hvc_console.c
>>>>>> +++ b/drivers/tty/hvc/hvc_console.c
>>>>>> @@ -75,6 +75,8 @@ static LIST_HEAD(hvc_structs);
>>>>>>   */
>>>>>>  static DEFINE_MUTEX(hvc_structs_mutex);
>>>>>>
>>>>>> +/* Mutex to serialize hvc_open */
>>>>>> +static DEFINE_MUTEX(hvc_open_mutex);
>>>>>>  /*
>>>>>>   * This value is used to assign a tty->index value to a hvc_struct
>>>>>> based
>>>>>>   * upon order of exposure via hvc_probe(), when we can not match it
>>>>>> to
>>>>>> @@ -346,16 +348,24 @@ static int hvc_install(struct tty_driver
>>>>>> *driver, struct tty_struct *tty)
>>>>>>   */
>>>>>>  static int hvc_open(struct tty_struct *tty, struct file * filp)
>>>>>>  {
>>>>>> -	struct hvc_struct *hp = tty->driver_data;
>>>>>> +	struct hvc_struct *hp;
>>>>>>  	unsigned long flags;
>>>>>>  	int rc = 0;
>>>>>>
>>>>>> +	mutex_lock(&hvc_open_mutex);
>>>>>> +
>>>>>> +	hp = tty->driver_data;
>>>>>> +	if (!hp) {
>>>>>> +		rc = -EIO;
>>>>>> +		goto out;
>>>>>> +	}
>>>>>> +
>>>>>>  	spin_lock_irqsave(&hp->port.lock, flags);
>>>>>>  	/* Check and then increment for fast path open. */
>>>>>>  	if (hp->port.count++ > 0) {
>>>>>>  		spin_unlock_irqrestore(&hp->port.lock, flags);
>>>>>>  		hvc_kick();
>>>>>> -		return 0;
>>>>>> +		goto out;
>>>>>>  	} /* else count == 0 */
>>>>>>  	spin_unlock_irqrestore(&hp->port.lock, flags);
>>>>>
>>>>> Wait, why isn't this driver just calling tty_port_open() instead of
>>>>> trying to open-code all of this?
>>>>>
>>>>> Keeping a single mutext for open will not protect it from close, it will
>>>>> just slow things down a bit.  There should already be a tty lock held by
>>>>> the tty core for open() to keep it from racing things, right?
>>>> The tty lock should have been held, but not likely across
>>>> ->install() and
>>>> ->open() callbacks, thus resulting in a race between hvc_install() and
>>>> hvc_open(),
>>>
>>> How?  The tty lock is held in install, and should not conflict with
>>> open(), otherwise, we would be seeing this happen in all tty drivers,
>>> right?
>>>
>> Well, I was expecting the same, but IIRC, I see that the open() was being
>> called in parallel for the same device node.
> 
> So open and install are happening at the same time?  And the tty_lock()
> does not protect the needed fields from being protected properly?  If
> not, what fields are being touched without the lock?
> 
>> Is it expected that the tty core would allow only one thread to
>> access the dev-node, while blocking the other, or is it the client
>> driver's responsibility to handle the exclusiveness?
> 
> The tty core should handle this correctly, for things that can mess
> stuff up (like install and open at the same time).  A driver should not
> have to worry about that.
> 
>>>> where hvc_install() sets a data and the hvc_open() clears it.
>>>> hvc_open()
>>>> doesn't
>>>> check if the data was set to NULL and proceeds.
>>>
>>> What data is being set that hvc_open is checking?
>> hvc_install sets tty->private_data to hp, while hvc_open sets it to NULL (in
>> one of the paths).
> 
> I see no use of private_data in drivers/tty/hvc/ so what exactly are you
> referring to?

He likely means tty->driver_data. And there exactly lays the issue.

commit bdb498c20040616e94b05c31a0ceb3e134b7e829
Author: Jiri Slaby <jslaby@suse.cz>
Date:   Tue Aug 7 21:48:04 2012 +0200

    TTY: hvc_console, add tty install

added hvc_install but did not move 'tty->driver_data = NULL;' from
hvc_open's fail path to hvc_cleanup.

IOW hvc_open now NULLs tty->driver_data even for another task which
opened the tty earlier. The same holds for "tty_port_tty_set(&hp->port,
NULL);" there. And actually "tty_port_put(&hp->port);" is also incorrect
for the 2nd task opening the tty.

So, a mutex with tty->driver_data check in open is not definitely the
way to go. This mess needs to be sorted out properly. Sure, a good start
would be a conversion to tty_port_open. Right after dropping "tty: hvc:
Fix data abort due to race in hvc_open" from tty/tty-next :).

What I *don't* understand is why hp->ops->notifier_add fails, given the
open does not allow multiple opens anyway?

thanks,
-- 
js
suse labs
