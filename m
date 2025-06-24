Return-Path: <linuxppc-dev+bounces-9680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789DFAE6C7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 18:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRVsc3J6bz2xlK;
	Wed, 25 Jun 2025 02:34:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750782884;
	cv=none; b=XeAIfOy++WZRroGjqguOEEptUC21ddKDHwZ1ZkRLVayI2Xml8Lhb62zzzcUnLCt+3zB74BOYX1YM4g7TT36xLnK0CFHVJe3K+mKrlDj03zzwgaCFmyttlMzTDRuh9w4hay89QhXE3wHJoAwOfgJTeU8qMUut0jbflxDkapSC07LZ0aQYqx5Z2iKrd7wphhePb+46IdoTU5bIKgrS4CfIjfN9MrmzEVxjLMU054czakLGy9+OQRyyxL6zrpJ1Qr0LF0F3M1YYQwOqvicDHuOWJCCJgkmWRYcY1Pw6PU+QMPvCFYqSX6iSDx9tIDMbhPjDDzZfg0gFtxsLNPdluK9k2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750782884; c=relaxed/relaxed;
	bh=amzNAppIr7CphoKbkPeWe0Dr61MnvAb0JnqDfqxQ2Vo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TJmqQIN7fB+T7S2JbsFlUVqEYQ/ucbdomSuYrBoHJTDto8Wr7QVUOMYWv8w3gxdPKjZiSTmUWMEXuWwais/BgIvzdr+5BF3oTqjAtgKLKgIyB1omOAphZSHCyx/hLt8giRap+9wshEHn3NRLg4ffeVKgxhEM9/XPvhHElWq4j0gU4ZMfRwcffZAAzEYOMhkEEWc2RqkhJz2HgOzKBnSIfJXFFMZzckUaIFWT+uMvUChNc+GnKwVsS8FA0CIMGzzrxP31H2Sb25F1F6BZjKfpyvE6lDDymrGvLbRUsbYOOU6plTDp6flSIH6o+16V2Pulc4cxv9CIWeSQdDvi0emN+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=uFlwhfDq; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=uFlwhfDq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRVsY3Dh6z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:34:38 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 821488286F2E;
	Tue, 24 Jun 2025 11:34:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id sPLrPr_vJ3-F; Tue, 24 Jun 2025 11:34:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C4FFA8287148;
	Tue, 24 Jun 2025 11:34:33 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C4FFA8287148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750782873; bh=amzNAppIr7CphoKbkPeWe0Dr61MnvAb0JnqDfqxQ2Vo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=uFlwhfDqfmm1ntFNbyrdybZmgGGETB+91oXVzN2qNB7ar3t4PlmUvfI6cT8DquJo1
	 UZqDD9xiUPrdTwTTYXpQA41tn8i3OJoye0IWQqIXOyaweUfcwCAJPtoP7h0lUTPFEA
	 PZozKbhyj6R2ScuW+ZIbC6v/RSHhPAn2Y7tI+Ifw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9CZvCiq25Gwc; Tue, 24 Jun 2025 11:34:33 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 7B72E8286F2E;
	Tue, 24 Jun 2025 11:34:33 -0500 (CDT)
Date: Tue, 24 Jun 2025 11:34:30 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Krishna Kumar <krishnak@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>
Message-ID: <618050180.1322616.1750782870691.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <06aa6c91-9580-43a6-b63d-e219e9f363aa@linux.ibm.com>
References: <20250618190146.GA1213349@bhelgaas> <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com> <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com> <1675876510.1317449.1750518311479.JavaMail.zimbra@raptorengineeringinc.com> <06aa6c91-9580-43a6-b63d-e219e9f363aa@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: pci/hotplug/pnv_php: Enable third attention indicator
Thread-Index: epA8na1st4b0IArDb6o4fKBjSmsoNw==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Krishna Kumar" <krishnak@linux.ibm.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "Shawn Anastasio" <sa=
nastasio@raptorengineering.com>, "linux-kernel"
> <linux-kernel@vger.kernel.org>, "linux-pci" <linux-pci@vger.kernel.org>, =
"Madhavan Srinivasan" <maddy@linux.ibm.com>,
> "Michael Ellerman" <mpe@ellerman.id.au>, "christophe leroy" <christophe.l=
eroy@csgroup.eu>, "Naveen N Rao"
> <naveen@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>
> Sent: Tuesday, June 24, 2025 2:07:30 AM
> Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention i=
ndicator

> On 6/21/25 8:35 PM, Timothy Pearson wrote:
>>
>> ----- Original Message -----
>>> From: "Krishna Kumar" <krishnak@linux.ibm.com>
>>> To: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "Timothy Pearson"
>>> <tpearson@raptorengineering.com>, "Shawn
>>> Anastasio" <sanastasio@raptorengineering.com>
>>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel"
>>> <linux-kernel@vger.kernel.org>, "linux-pci"
>>> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com=
>,
>>> "Michael Ellerman" <mpe@ellerman.id.au>,
>>> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao"
>>> <naveen@kernel.org>, "Bjorn Helgaas"
>>> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.=
com>
>>> Sent: Friday, June 20, 2025 4:26:51 AM
>>> Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
>>> indicator
>>> Shawn, Timothy:
>>>
>>> Thanks for posting the series of patch. Few things I wanted to do bette=
r
>>> understand Raptor problem -
>>>
>>>
>>> 1. Last time my two patches solved all the hotunplug operation and Kern=
el crash
>>> issue except nvme case. It did not work with
>>>
>>> =C2=A0 =C2=A0 NVME since dpc support was not there. I was not able to d=
o that due to being
>>> =C2=A0 =C2=A0 =C2=A0 occupied in some other work.
>> With the current series all hotplug is working correctly, including not =
only
>> NVMe on root port and bridge ports, but also suprise plug of the entire =
PCIe
>> switch at the root port.  The lack of DPC support *might* be related to =
the PE
>> freeze, but in any case we prefer the hotplug driver to be able to recov=
er from
>> a PE freeze (e.g. if a bridge card is faulty and needs to be replaced) w=
ithout
>> also requiring a reboot, so I would consider DPC implementation orthogon=
al to
>> this patch set.
> Sounds Good !!
>>
>>> 2. I want to understand the delta from last yr problem to this problem.=
 Is the
>>> PHB freeze or hotunplug failure happens
>>>
>>> =C2=A0=C2=A0=C2=A0 only for particular Microsemi switch or it happens w=
ith all the switches. When
>>> =C2=A0=C2=A0=C2=A0 did this problem started coming ? Till last yr
>> Hotplug has never worked reliably for us, if it worked at all it was alw=
ays
>> rolling the dice on whether the kernel would oops and take down the host=
.  Even
>> if the kernel didn't oops, suprise plug and auto-add / auto-remove never=
 worked
>> beyond one remove operation.
> I would like to see this problem may be during our zoom/teams meeting. Th=
ough I
> have not tested surprise plug/unplug and only tested via sysfs, you may b=
e
> correct but I want to have a look of this problem.
>>
>>> =C2=A0=C2=A0=C2=A0 it was not there. Is it specific to particular Hardw=
are ? Can I get your setup
>>> =C2=A0=C2=A0=C2=A0 to test this problem and your patch ?
>> Because you will need to be able to physically plug and unplug cards and=
 drives
>> this may be a bit tricky.  Do you have access to a POWER9 host system wi=
th a
>> x16 PCIe slot?  If so, all you need is a Supermicro SLC-AO3G-8E2P card a=
nd some
>> random U.2 NVMe drives -- these cards are readily available and provide
>> relatively standardized OCuLink access to a Switchtec bridge.
>>
>> If you don't have access to a POWER9 host, we can set you up with remote=
 access,
>> but it won't show all of the crashing and problems that occur with surpr=
ise
>> plug unless we set up a live debug session (video call or similar).
>=20
>=20
> Video Call should be fine. During the call I will have a look of existing
> problem and fix along with driver/kernel logs.

Sounds good.  We'll set up a machine in the DMZ for this session so you can=
 also have access.  For anyone interested in logging on to the box for logs=
, can you send over an SSH public key to my Email address directly?  Will g=
et everyone added with root access to the test box prior to the call start.

>>
>>> 3. To me, hot unplug opertaion=C2=A0 --> AER triggering --> DPC support=
, this flow
>>> should mask the error to reach root port/cpu and it
>>>
>>> =C2=A0=C2=A0=C2=A0 should solve the PHB freeze/ hot unplug failure oper=
ation. If there are AER/EEH
>>> =C2=A0=C2=A0=C2=A0 related synchronization issue we need to solve them.
>>>
>>> =C2=A0=C2=A0=C2=A0 Can you pls list the issue, I will pass it to EEH/AE=
R team. But yeah, to me if
>>> =C2=A0=C2=A0=C2=A0 AER implementation is correct and we add DPC support=
,
>>>
>>> =C2=A0=C2=A0=C2=A0 all the error will be contained by switch itself. Th=
e PHB/root port/cpu will not
>>> =C2=A0=C2=A0=C2=A0 be impacted by this and there should not be any free=
ze.
>> While this is a good goal to work toward, it only solves one possible fa=
ult
>> mode.  The patch series posted here will handle the general case of a PE=
 freeze
>> without requiring a host reboot, which is great for high-reliability sys=
tems
>> where there might be a desire to replace the entire switch card (this ha=
s been
>> tested with the patch series and works perfectly).
>=20
>=20
> You may be correct on this and this is possible. If the driver and AER/EE=
H
> errors/events are properly
>=20
> handled then we may not need DPC in all cases. The point of DPC was to ab=
sorb
> the error at switch port
>=20
> itself so that it will not reach to PHB/Root-port/Cpu and will avoid furt=
her
> corruption. I was hoping that if
>=20
> DPC gets enabled, we may not need explicit reboot for drives to come up i=
n case
> of surprise hot unplug.

I do understand the logic here, and it would theoretically work, but again =
it's a bit more fragile than the solution we're presenting here in that it =
relies on another chunk of device logic to work correctly in all cases, wit=
h the consequence of a failure being a forced reboot.

With our patch series here we can hot plug and hot unplug NVMe drives all d=
ay without requiring any reboots, including surprise plug.  DPC would simpl=
y make this process a little bit faster, in that we don't have to wait a fe=
w hundred milliseconds for the PE to unfreeze and the EEH driver to give up=
.

> But yeah, we can compare this with current result when this support will =
be
> enabled.
>=20
>>
>>> 4. Ofcourse we can pick some of the fixes from pciehp driver if its mis=
sing in
>>> pnv_php.c. Also at the same time you have done
>>>
>>> =C2=A0=C2=A0=C2=A0 some cleanup in hot unplug path and fixed the attenu=
ation button related code.
>>> =C2=A0=C2=A0=C2=A0 If these works fine, we can pick it. But I want to t=
est it.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Pls provide me setup.
>>>
>>> 5. If point 3 and 4 does not solve the problem, then only we should mov=
e to
>>> pciehp.c. But AFAIK, PPC/Powernv is DT based while pciehp.c
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 may be only supporting acpi (I have to check i=
t on this).=C2=A0 We need to provide
>>> =C2=A0=C2=A0=C2=A0=C2=A0 PHB related information via DTB and maintain t=
he related
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 topology information via dtb and then it can b=
e doable. Also , we need to do
>>> =C2=A0=C2=A0=C2=A0=C2=A0 thorough planning/testing if we think to choos=
e pciehp.c.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 But yeah, lets not jump here and lets try to f=
ix the current issues via point 3
>>> =C2=A0=C2=A0=C2=A0=C2=A0 & 4. Point 5 will be our last option.
>> If possible I would like to see this series merged vs. being blocked on =
DPC.
>> Again, from where I sit DPC is orthogonal; many events can cause a PE fr=
eeze
>> and implementing DPC only solves one.  We do *not* want to require a hos=
t
>> reboot in any situation whatsoever short of a complete failure of a crit=
ical
>> element (e.g. the PHB itself or a CPU package); our use case as deployed=
 is
>> five nines critical infrastructure, and the broken hotplug has already b=
een the
>> sole reason we have not maintained 100% uptime on a key system.
>=20
> If you are in hurry and want to defer DPC for some time, I am fine with i=
t since
> it serves larger purpose like PE freeze and NVME drives working
>=20
> along with surprise hotplug fixes.=C2=A0 I have gone through your pnv_php=
.c changes
> and I am mostly fine with it. But, I would like to review it again
>=20
> from larger prespective w.r.t to EEH & pciehp.c, so give me some time.

Sure, please let me know if anything is concerning.  My goal would be to ha=
ve this reviewed from a code quality perspective and a v2 posted at least a=
 couple of days before the video call.

Also, if
> possible you can show me
>=20
> the problem/fix along with log=C2=A0 during video call. it would be great=
 if we can
> meet sometimes next month in early first week may be on 5th of July.

Let's plan for that -- this is somewhat urgent with Debian Trixie being rel=
eased soon, and I want to see this repair backported.  We already ship Book=
worm Debian kernels with completely broken VFIO and hotplug, our goal is to=
 get that all fixed for Trixie and enable the functionality our customers a=
re paying for.

> I will request few of the EEH/AER developer to have a look into the patch=
 and to
> join the meeting if they have bandwidth. Please shoot the
>=20
> mail/invite on krishna.kumar11@ibm.com along with this email id. I am bas=
ed in
> Bangalore but can be available till night 10:00 pm.

Will do, thanks!

