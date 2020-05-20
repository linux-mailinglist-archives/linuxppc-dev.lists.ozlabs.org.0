Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E91DB59F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 15:52:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RvMM5CFWzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 23:52:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mg.codeaurora.org (client-ip=104.130.122.26;
 helo=mail26.static.mailgun.info;
 envelope-from=bounce+ee6c0f.be9e4a-linuxppc-dev=lists.ozlabs.org@mg.codeaurora.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org
 header.a=rsa-sha256 header.s=smtp header.b=P3CcsO3j; 
 dkim-atps=neutral
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 49RvHc1sgrzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 23:49:15 +1000 (AEST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589982559; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bdYxlleaBZjdmGcxkdFhFiwkox4BqXbXIZrOHd6Ou20=;
 b=P3CcsO3jLDj0KF3hyX1oq/2AKbwmsRD11k1mmaw3BZ2APvAbUBLGXv+ydrHwBpxIM+d5CObF
 /TcoB27o4SNFNGMYFC0YObawdyW1OTjXpN3wuVpMG7NKwb4S+S0XK/YAuWpHYi+WulWVeeR6
 lBdPHK7DfI60vTE+XRY+16EaiGc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec53550.7fa9b2ef5618-smtp-out-n02;
 Wed, 20 May 2020 13:49:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D2869C43387; Wed, 20 May 2020 13:49:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rananta)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 432AFC433C8;
 Wed, 20 May 2020 13:49:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 20 May 2020 06:49:04 -0700
From: rananta@codeaurora.org
To: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] tty: hvc: Fix data abort due to race in hvc_open
In-Reply-To: <cb5bd2b2-f33a-b541-ed3c-70da14c7252d@suse.cz>
References: <20200428032601.22127-1-rananta@codeaurora.org>
 <20200506094851.GA2787548@kroah.com>
 <98bbe7afabf48d8e8fe839fdc9e836a5@codeaurora.org>
 <20200510064819.GB3400311@kroah.com>
 <77d889be4e0cb0e6e30f96199e2d843d@codeaurora.org>
 <20200511073913.GA1347819@kroah.com>
 <0f7791f5-0a53-59f6-7277-247a789f30c2@suse.cz>
 <20200512082551.GA3526567@kroah.com>
 <417b1d320bda37410788430979dd708d@codeaurora.org>
 <20200513070403.GB764901@kroah.com>
 <0ab0b49f19b824ac1c4db4c4937ed388@codeaurora.org>
 <cb5bd2b2-f33a-b541-ed3c-70da14c7252d@suse.cz>
Message-ID: <bf168752b8808182f07764fb6194775e@codeaurora.org>
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
Cc: Greg KH <gregkh@linuxfoundation.org>, andrew@daynix.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-05-20 02:38, Jiri Slaby wrote:
> On 15. 05. 20, 1:22, rananta@codeaurora.org wrote:
>> On 2020-05-13 00:04, Greg KH wrote:
>>> On Tue, May 12, 2020 at 02:39:50PM -0700, rananta@codeaurora.org 
>>> wrote:
>>>> On 2020-05-12 01:25, Greg KH wrote:
>>>> > On Tue, May 12, 2020 at 09:22:15AM +0200, Jiri Slaby wrote:
>>>> > > commit bdb498c20040616e94b05c31a0ceb3e134b7e829
>>>> > > Author: Jiri Slaby <jslaby@suse.cz>
>>>> > > Date:   Tue Aug 7 21:48:04 2012 +0200
>>>> > >
>>>> > >     TTY: hvc_console, add tty install
>>>> > >
>>>> > > added hvc_install but did not move 'tty->driver_data = NULL;' from
>>>> > > hvc_open's fail path to hvc_cleanup.
>>>> > >
>>>> > > IOW hvc_open now NULLs tty->driver_data even for another task which
>>>> > > opened the tty earlier. The same holds for
>>>> > > "tty_port_tty_set(&hp->port,
>>>> > > NULL);" there. And actually "tty_port_put(&hp->port);" is also
>>>> > > incorrect
>>>> > > for the 2nd task opening the tty.
>>>> > >
> 
> ...
> 
>> These are the traces you get when the issue happens:
>> [  154.212291] hvc_install called for pid: 666
>> [  154.216705] hvc_open called for pid: 666
>> [  154.233657] hvc_open: request_irq failed with rc -22.
>> [  154.238934] hvc_open called for pid: 678
>> [  154.243012] Unable to handle kernel NULL pointer dereference at
>> virtual address 00000000000000c4
>> # hvc_install isn't called for pid: 678 as the file wasn't closed yet.
> 
> Nice. Does the attached help?
Yeah, it looks good. I think it also eliminates the port.count reference
issue discussed on the v2 patch. Are you planning to mainline this?
> 
> I wonder how comes the tty_port_put in hvc_open does not cause a UAF? I
> would say hvc_open fails, tty_port_put is called. It decrements the
> reference taken in hvc_install. So far so good.
> 
> Now, this should happen IMO:
> tty_open
>   -> hvc_open (fails)
>     -> tty_port_put
hvc_console driver defines port->ops->destruct(). Upon tty_port_put(), 
the
tty_port_destructor() calls port->ops->destruct(), rather than 
kfree(port).
>   -> tty_release
>     -> tty_release_struct
>       -> tty_kref_put
>         -> queue_release_one_tty
> SCHEDULED WORKQUEUE
> release_one_tty
>   -> hvc_cleanup
>     -> tty_port_put (should die terrible death now)
Since port is not free'd, I think we should be good.
> 
> What am I missing?
> 
> thanks,

Thank you.
Raghavendra
