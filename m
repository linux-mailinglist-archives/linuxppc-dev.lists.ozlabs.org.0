Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9012E494EA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 14:10:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfjY53g79z3cKM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 00:10:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=leemhuis.info (client-ip=2a01:488:42:1000:50ed:8234::;
 helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info;
 receiver=<UNKNOWN>)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfjXc5Tsmz30K4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 00:09:52 +1100 (AEDT)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nAWxb-0007aQ-Q3; Thu, 20 Jan 2022 13:54:39 +0100
Message-ID: <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
Date: Thu, 20 Jan 2022 13:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Content-Language: en-BS
To: Leo Li <leoyang.li@nxp.com>,
 "jocke@infinera.com" <joakim.tjernlund@infinera.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
 <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
 <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
 <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1642684192;
 539cd251; 
X-HE-SMSGID: 1nAWxb-0007aQ-Q3
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
 "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, this is your Linux kernel regression tracker speaking.

On 04.12.21 01:40, Leo Li wrote:
>> -----Original Message-----
>> From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>> Sent: Thursday, December 2, 2021 4:45 PM
>> To: regressions@leemhuis.info; Leo Li <leoyang.li@nxp.com>;
>> Eugene_Bordenkircher@selinc.com; linux-usb@vger.kernel.org; linuxppc-
>> dev@lists.ozlabs.org
>> Cc: gregkh@linuxfoundation.org; balbi@kernel.org
>> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
>> unrecoverable loop.
>>
>> On Thu, 2021-12-02 at 20:35 +0000, Leo Li wrote:
>>>
>>>> -----Original Message-----
>>>> From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>>>> Sent: Wednesday, December 1, 2021 8:19 AM
>>>> To: regressions@leemhuis.info; Leo Li <leoyang.li@nxp.com>;
>>>> Eugene_Bordenkircher@selinc.com; linux-usb@vger.kernel.org;
>>>> linuxppc- dev@lists.ozlabs.org
>>>> Cc: gregkh@linuxfoundation.org; balbi@kernel.org
>>>> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list
>>>> leads to unrecoverable loop.
>>>>
>>>> On Tue, 2021-11-30 at 12:56 +0100, Joakim Tjernlund wrote:
>>>>> On Mon, 2021-11-29 at 23:48 +0000, Eugene Bordenkircher wrote:
>>>>>> Agreed,
>>>>>>
>>>>>> We are happy pick up the torch on this, but I'd like to try and
>>>>>> hear from
>>>> Joakim first before we do.  The patch set is his, so I'd like to
>>>> give him the opportunity.  I think he's the only one that can add a
>>>> truly proper description as well because he mentioned that this
>>>> includes a "few more fixes" than just the one we ran into.  I'd
>>>> rather hear from him than try to reverse engineer what was being
>> addressed.
>>>>>>
>>>>>> Joakim, if you are still watching the thread, would you like to
>>>>>> take a stab
>>>> at it?  If I don't hear from you in a couple days, we'll pick up the
>>>> torch and do what we can.

Did anything happen? Sure, it's a old regression from the v3.4-rc4 days,
but there iirc was already a tested proto-patch in that thread that
fixes the issue. Or was progress made and I just missed it?

Ciao, Thorsten

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply, that's in everyone's interest.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

#regzbot ignore-activity

>>>>> I am far away from this now and still on 4.19. I don't mind if you
>>>>> tweak
>>>> tweak the patches for better "upstreamability"
>>>>
>>>> Even better would be to migrate to the chipidea driver, I am told
>>>> just a few tweaks are needed but this is probably something NXP
>>>> should do as they have access to other SOC's using chipidea.
>>>
>>> I agree with this direction but the problem was with bandwidth.  As this
>> controller was only used on legacy platforms, it is harder to justify new effort
>> on it now.
>>
>> Legacy? All PPC is legacy and not supported now?
> 
> I'm not saying that they are not supported, but they are in maintenance only mode.
