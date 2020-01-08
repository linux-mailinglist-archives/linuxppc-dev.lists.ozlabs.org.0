Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22A134B78
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 20:28:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tK5q2cbZzDqRH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 06:27:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D4d0qrah"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tK3p5b8HzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 06:26:12 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id u2so112395wmc.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 11:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=upxA5s/11t7kE/8tjQa19vbeoRnC0/SXb0K6/mk9nBs=;
 b=D4d0qrahh/gIS06SHDuE714oPxHOZ4ciYaJsw9UW28xrYo0VZBJu5/5ef9mp2f5Udu
 hWEg2/Sb3dp2Fak7ZaBQQKo30OM/QwfmQhjxpmyy6G6nucRZRw52POj/HpAiZOSIe6Us
 J1WpqyOdmIQzS/TndnKcroe0MgX6YGIKE3uwpinptRbREx3QXznUdm57oRSda59i5dBH
 2OyNd0xsWFuBux1bJuHeXIrtKlXyhkpr79QfaM5MIKbAlY2BRsrQ8HTWYy+/Sg3PI2KU
 NOmI0kr4Hlq6xc9DDW5WilSi2AJocsyp4EkE7GiM2D11gmE9AhtrVSK3wF/5xPm3VEKa
 Acbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=upxA5s/11t7kE/8tjQa19vbeoRnC0/SXb0K6/mk9nBs=;
 b=CpjvB/qokoifWd1fVUjpAHmi8dItAZpGPtB4QQ/RQ0Z0DX5dhkSayc9Ph6s4DRzOYS
 zfYQoyCoIFYqDesshKXkdlTIFbwQ2iz9ldAjzQV952u9Q52MFsMcERFj7bjFS+yI6WSw
 QSqNi8nGwR6QFhaaUw84idYQ+X8hHNyLmNUcAHiJmAyC2eAl+KQC+a7BIElwldaXk1/+
 xUEteeqvfU0RJ1dzkhqmzKlKGeUIktnhhBomNwDICOjnOsH/mm1aQfTtLiUv4lTqC5Uo
 L3/VqIfq0XT5WXl91odKuTvVNyYMmzcuy/gXu3ubVfiVaNpNO+49CCRvfmc9+tTi/sZr
 YQJw==
X-Gm-Message-State: APjAAAVIxR8/r14jq6L3WVlFuBrDJEi2bHWDylTUDASpVexE3J40G7CC
 UaeKCX0PJpN1j7XuSUfQmhmix16A
X-Google-Smtp-Source: APXvYqzltjUAeXzLDYs7MOl0WkW9dU2T9dJvPkuk8ErW5zigxj+2W/eOncVrKJbnLGtUHxqZswjrIg==
X-Received: by 2002:a1c:8116:: with SMTP id c22mr181660wmd.27.1578511565084;
 Wed, 08 Jan 2020 11:26:05 -0800 (PST)
Received: from [192.168.178.85] (pD9F901D9.dip0.t-ipconnect.de.
 [217.249.1.217])
 by smtp.googlemail.com with ESMTPSA id c2sm5333998wrp.46.2020.01.08.11.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 11:26:04 -0800 (PST)
Subject: Re: Freescale network device not activated on mpc8360 (kmeter1 board)
To: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>
References: <AM0PR06MB5427E4BDF8FB1BEC5DF3D45FB33F0@AM0PR06MB5427.eurprd06.prod.outlook.com>
 <55f4ba5d-fd05-4a14-6319-d5d76c9675f2@gmail.com>
 <AM0PR06MB5427E1BDB8C23FD09E625BD2B33E0@AM0PR06MB5427.eurprd06.prod.outlook.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <d2ba35fb-4dd1-dc3f-ce77-89d151d09c93@gmail.com>
Date: Wed, 8 Jan 2020 20:25:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <AM0PR06MB5427E1BDB8C23FD09E625BD2B33E0@AM0PR06MB5427.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sux@loplof.de" <sux@loplof.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.01.2020 12:53, Matteo Ghidoni wrote:
> Hi Heiner, thank you for the quick answer.
> 
>>>  Hi all,
>>>
>>> With the introduction of the following patch, we are facing an issue with
>> the activation of the Freescale network device (ucc_geth driver) on our
>> kmeter1 board based on a MPC8360:
>>
>> +Li as ucc_geth maintainer
>>
>> Can you describe the symptoms of the issue?
> 
> I am trying to boot in NFS, but as soon as the boot process is finished there is no network connections between the board and the host.
> 
>>>
>>> commit 124eee3f6955f7aa19b9e6ff5c9b6d37cb3d1e2c
>>> Author: Heiner Kallweit <hkallweit1@gmail.com>
>>> Date:   Tue Sep 18 21:55:36 2018 +0200
>>>
>>>     net: linkwatch: add check for netdevice being present to
>>> linkwatch_do_dev
>>>
>>> Based on my observations, just before trying to activate the device through
>> linkwatch_event, the controller wants to adjust the MAC configuration and in
>> order to achieve this it detaches the device. This avoids the activation of the
>> net device.
>>>
>> It sounds a little bit odd to rely on an asynchronous linkwatch event here.
>> Can you give a call trace?
> 
> Here is a call trace form the adjust_link function in the if condition at line 1644 (ucc_geth.c file):
> 
> CPU: 0 PID: 35 Comm: kworker/0:1 Not tainted 5.4.8-dirty #19
> Workqueue: events_power_efficient phy_state_machine
> Call Trace:
> [cf88bde8] [c02ddca8] adjust_link+0x304/0x320 (unreliable)
> [cf88be28] [c02cbf3c] phy_check_link_status+0xe4/0xfc
> [cf88be48] [c02cccdc] phy_state_machine+0x44/0x170
> [cf88be78] [c00361a0] process_one_work+0x264/0x408
> [cf88bea8] [c00370f8] worker_thread+0x140/0x53c
> [cf88bef8] [c003d818] kthread+0xdc/0x108
> [cf88bf38] [c0010274] ret_from_kernel_thread+0x14/0x1c
> 
> Here the call trace from the netif_carrier_on function just before the call to the linkwatch_fire_event function (line 498, sch_generic.c file):
> 
> CPU: 0 PID: 35 Comm: kworker/0:1 Not tainted 5.4.8-dirty #20
> Workqueue: events_power_efficient phy_state_machine
> Call Trace:
> [cf88bde8] [c0352064] netif_carrier_on+0xc4/0xc8 (unreliable)
> [cf88be08] [c02cf4ec] phy_link_change+0x84/0xb4
> [cf88be28] [c02cbf3c] phy_check_link_status+0xe4/0xfc
> [cf88be48] [c02cccdc] phy_state_machine+0x44/0x170
> [cf88be78] [c00361a0] process_one_work+0x264/0x408
> [cf88bea8] [c00370f8] worker_thread+0x140/0x53c
> [cf88bef8] [c003d818] kthread+0xdc/0x108
> [cf88bf38] [c0010274] ret_from_kernel_thread+0x14/0x1c
> 
> Moreover, I noticed that by adding the dump directly in the linkwatch_do_dev function (link_watch.c) the interface comes up correctly, because of the delay introduced by the dump_stack function.
> 
> Here another log with some prints that maybe can help to understand the situation. The prints are placed just before calling the function mentioned in the second part of the message (hopefully this will not bring more confusion):
> 
> <...>
> ubi0: available PEBs: 235, total reserved PEBs: 269, PEBs reserved for bad PEB handling: 0
> ubi0: background thread "ubi_bgt0d" started, PID 45
> ################# [phy_device.c] phy_link_change - calling netif_carrier_on (eth2)
> ################# [sched_generic.c] netif_carrier_on - calling linkwatch_fire_event (eth2)
> ################# [phy_device.c] phy_link_change - calling adjust_link (eth2)
> ################# [ucc_geth.c] adjust_link - calling ugeth_quiesce (detaching device) (eth2)
> ################# [link_watch.c] linkwatch_do_dev - checking for netif_device_present(eth2) => 0
> IP-Config: Guessing netmask 255.255.255.0
> IP-Config: Complete:
>      device=eth2, hwaddr=00:e0:df:56:54:07, ipaddr=192.168.1.20, mask=255.255.255.0, gw=255.255.255.255
>      host=kmeter1, domain=, nis-domain=(none)
>      bootserver=192.168.1.100, rootserver=192.168.1.100, rootpath=
> ################# [ucc_geth.c] adjust_link - calling ugeth_activate (attaching device) (eth2)
> ucc_geth e0103200.ucc eth2: Link is Up - 100Mbps/Full - flow control off
> rpcbind: server 192.168.1.100 not responding, timed out
> rpcbind: server 192.168.1.100 not responding, timed out
> 
> As mentioned, just before that the linkwatch checks for the net_device presence, this one is detached by the ucc_geth driver and reattached later.
> 

Detaching the netdev was introduced with 08b5e1c91ce9
("ucc_geth: Fix netdev watchdog triggering on link changes").
Most likely detaching the netdev isn't the best way to fix the original issue.
If it's just about switching the watchdog off temporarily, then maybe
calling dev_watchdog_down() is sufficient.
Relying on an asynchronous linkwatch event to active a netdev that is
marked as not present is at least questionable.

>> The driver is quite old and maybe some parts need to be improved. The
>> referenced change is more than a year old and I'm not aware of any other
>> problem with it. So it seems the change isn't wrong.
> 
> I agree. I pointed out the commit by bisecting. This gave me the direction to where the problem could be. 
> 
>>> This is already happening with older versions (I checked with the v4.14.162)
>> and also there the situation is the same, but without the additional check in
>> the if condition the device is activated.
>>>
>>> I am currently working with the v5.4.8 kernel version, but the behavior
>> remains the same also with the latest v5.5-rc4.
>>>
>>> Any idea how to solve this? Any help is appreciated.
>>>
>>> Regards,
>>> Matteo
>>>
>> Heiner
> 
> Matteo
> 

