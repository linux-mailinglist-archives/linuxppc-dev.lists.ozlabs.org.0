Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B84500DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 10:07:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht3Ht57v5z2yb3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 20:07:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leemhuis.info (client-ip=2a01:488:42:1000:50ed:8234::;
 helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1857 seconds by postgrey-1.36 at boromir;
 Mon, 15 Nov 2021 20:07:30 AEDT
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht3HQ1BhFz2xCc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 20:07:27 +1100 (AEDT)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mmXTQ-0005F5-Gz; Mon, 15 Nov 2021 09:36:20 +0100
Message-ID: <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
Date: Mon, 15 Nov 2021 09:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Content-Language: en-BS
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1636967250;
 3c99804b; 
X-HE-SMSGID: 1mmXTQ-0005F5-Gz
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, this is your Linux kernel regression tracker speaking.

This looks stalled, as afaics nothing to get this regression fixed
happened since below mail. How can we things rolling again?

Eugene, were you able to look into the patch from Joakim?

Or did I miss anything and some progress to fix this was made elsewhere?
Please let me know if that's the case.

Ciao, Thorsten (carrying his Linux kernel regression tracker hat)

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave they thus might sent someone reading this down the
wrong rabbit hole, which none of us wants.

P.P.S.: Feel free to ignore the following lines, they are only meant for
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/):

#regzbot poke

On 02.11.21 22:15, Joakim Tjernlund wrote:
> On Sat, 2021-10-30 at 14:20 +0000, Joakim Tjernlund wrote:
>> On Fri, 2021-10-29 at 17:14 +0000, Eugene Bordenkircher wrote:
>
>>> We've discovered a situation where the FSL udc driver (drivers/usb/gadget/udc/fsl_udc_core.c) will enter a loop iterating over the request queue, but the queue has been corrupted at some point so it loops infinitely.  I believe we have narrowed into the offending code, but we are in need of assistance trying to find an appropriate fix for the problem.  The identified code appears to be in all versions of the Linux kernel the driver exists in.
>>>
>>> The problem appears to be when handling a USB_REQ_GET_STATUS request.  The driver gets this request and then calls the ch9getstatus() function.  In this function, it starts a request by "borrowing" the per device status_req, filling it in, and then queuing it with a call to list_add_tail() to add the request to the endpoint queue.  Right before it exits the function however, it's calling ep0_prime_status(), which is filling out that same status_req structure and then queuing it with another call to list_add_tail() to add the request to the endpoint queue.  This adds two instances of the exact same LIST_HEAD to the endpoint queue, which breaks the list since the prev and next pointers end up pointing to the wrong things.  This ends up causing a hard loop the next time nuke() gets called, which happens on the next setup IRQ.
>>>
>>> I'm not sure what the appropriate fix to this problem is, mostly due to my lack of expertise in USB and this driver stack.  The code has been this way in the kernel for a very long time, which suggests that it has been working, unless USB_REQ_GET_STATUS requests are never made.  This further suggests that there is something else going on that I don't understand.  Deleting the call to ep0_prime_status() and the following ep0stall() call appears, on the surface, to get the device working again, but may have side effects that I'm not seeing.
>>>
>>> I'm hopeful someone in the community can help provide some information on what I may be missing or help come up with a solution to the problem.  A big thank you to anyone who would like to help out.
>>>
>>> Eugene
>>
>> Run into this to a while ago. Found the bug and a few more fixes.
>> This is against 4.19 so you may have to tweak them a bit.
>> Feel free to upstream them.
>>
>>  Jocke 
> 
> Curious, did my patches help? Good to known once we upgrade as well.
> 
>  Jocke
