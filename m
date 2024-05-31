Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6F8D5FDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 12:45:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IHDAyar2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrKX73CWsz3cf7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 20:45:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IHDAyar2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishna.kumar11@ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrKWN2RWYz30W1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 20:44:47 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VAf8o4004209;
	Fri, 31 May 2024 10:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=hq7gYO45nay0AdXL8vn4EYPw2rnwSb+oMYkezoEp6Vo=;
 b=IHDAyar2HnDfAj/PA5SSD34sv8NawAOmRVh9ej6AxUIfSTCWdvFIY4dnHOGz7gbpJjBa
 EBAdX7j70b6L3HPUCHhwRvWGvCEY8qc3iQmwlAVeAQ0rJyvQ6Pxik8c7wazcNpiAfPVm
 CmU9brKqHQv9uGTpTQYIMLXwOgr4k7aXylVJe8Hr/so6J0fDnedgE0jAKtyna19QvI3t
 xDD+GEe9K+RgUxNEB7Vi5bMsvHJvVOHcrCptolp27mi6g3UmxbzwVnvRm98E9CpilvPs
 Vwnc+OMRly32eEclVPaNAQ4y5UkhMX53o12Xbr+veh8P0pZiZ6YfdZCoMDgkWWjEJmfN Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfcr0r1g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:44:41 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VAieMN009269;
	Fri, 31 May 2024 10:44:40 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfcr0r1fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:44:40 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44V9AdMf002322;
	Fri, 31 May 2024 10:44:39 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpb0yeca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:44:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44VAiYFp27525502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 10:44:36 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DABF20043;
	Fri, 31 May 2024 10:44:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AF4D20040;
	Fri, 31 May 2024 10:44:31 +0000 (GMT)
Received: from [9.109.241.85] (unknown [9.109.241.85])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 May 2024 10:44:31 +0000 (GMT)
Message-ID: <e5db1fdc-166b-441f-a35c-707850b9b43d@ibm.com>
Date: Fri, 31 May 2024 16:14:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] powerpc: hotplug driver bridge support
From: Krishna Kumar <krishna.kumar11@ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>,
        krishna kumar <krishnak@linux.ibm.com>
References: <20240514135303.176134-1-krishnak@linux.ibm.com>
 <20240514135303.176134-3-krishnak@linux.ibm.com>
 <CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com>
 <fd0e22ab-5998-4b57-828e-224dda6bf490@linux.ibm.com>
 <CAOSf1CE2r4Gju-BkGVzuAyWoiFZ+9csNMj=v+KkQMmixUAHH6w@mail.gmail.com>
 <66572ca5-88aa-4495-b926-5a3bfe6ae1da@ibm.com>
Content-Language: en-US
In-Reply-To: <66572ca5-88aa-4495-b926-5a3bfe6ae1da@ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fbLCRSyjOZypEgQKsT7XYFlFTqK0zvtq
X-Proofpoint-ORIG-GUID: 12Nt6OIwI24x0kWkbD9z5mFHen5yBLFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405310079
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Gaurav Batra <gbatra@linux.ibm.com>, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Brian King <brking@linux.vnet.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/23/24 20:22, Krishna Kumar wrote:
>
>
> Hi Oliver,
>
> Thanks for your suggestions. Pls find my response:
>
> On 5/20/24 20:29, Oliver O'Halloran wrote:
>> On Fri, May 17, 2024 at 9:15 PM krishna kumar <krishnak@linux.ibm.com> wrote:
>>>> Uh, if I'm reading this right it looks like your "slot" C5 is actually
>>>> the PCIe switch's internal bus which is definitely not hot pluggable.
>>> It's a hotplug slot. Please see the snippet below:
>>>
>>> :~$ sudo lspci -vvv -s 0004:02:00.0 | grep --color HotPlug
>>>           SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>> :~$
>>>
>>> :~$ sudo lspci -vvv -s 0004:02:01.0 | grep --color HotPlug
>>>          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>> :~$
>>>
>>> :~$ sudo lspci -vvv -s 0004:02:02.0 | grep --color HotPlug
>>>          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>> :~$
>>>
>>> :~$ sudo lspci -vvv -s 0004:02:03.0 | grep --color HotPlug
>>>          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>> :~$
>> All this is showing is that the switch downstream ports on bus 0004:02
>> have a slot capability. I already know that (see what I said
>> previously about physical links). The fact the downstream ports have a
>> slot capability also has absolutely nothing to do with anything I was
>> saying. Look at the lspci output for 0004:01:00.0 which is the
>> switch's upstream port. The upstream port device will not have a slot
>> capability because it's a bridge into the virtual PCI bus that is
>> internal to the switch.
>
> Let me try to understand your suggestion and what needs to be done now:
>
> lspci -nn snippet in current scenario:
>
> 0004:01:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:01:00.1 Memory controller [0580]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:02:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:02:01.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:02:02.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:02:03.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>
> lspci -tv snippet in current scenario:
>
> +-[0001:00]---00.0-[01-0a]--+-00.0-[02-0a]--+-00.0-[03-07]--
>  |                           |               +-01.0-[08]--+-00.0  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               |            +-00.1  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               |            +-00.2  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               |            \-00.3  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
>  |                           |               \-03.0-[0a]----00.0  IBM PCI-E IPR SAS Adapter (ASIC)
>  |                           \-00.1  PMC-Sierra Inc. Device 4052
>
> C5 bus address:
>
> [root@ltczzess2-lp1 ~]# cat /sys/bus/pci/slots/C5/address
> 0004:02:00
> [root@ltczzess2-lp1 ~]#
>
> 0004:01:00.0 doesn't have hotplug capability but 0004:02:00.0 does
> have this capability. Below snippet tells about this:
>
> [root@ltczzess2-lp1 ~]# sudo lspci -vvv -s 0004:01:00.0 | grep --color HotPlug
> [root@ltczzess2-lp1 ~]#
> [root@ltczzess2-lp1 ~]# sudo lspci -vvv -s 0004:02:00.0 | grep --color HotPlug
>         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
> [root@ltczzess2-lp1 ~]#
>
> In Function -  pnv_php_register_one() is responsible for slot creation from
> hotplug capable device node:
>
> Below is the current code that does check the device node for hot plug
> capability and takes the decision
>
>  /* Check if it's hotpluggable slot */
>         ret = of_property_read_u32(dn, "ibm,slot-pluggable", &prop32);
>         if (ret || !prop32){
>                 return -ENXIO;
>         }
>
> Its obvious that 0004:01:00.0 does not get above criteria fulfilled but
> 0004:02:00.0 does, so is the current behavior (Upstream port is not became
> C5 slot but downstream port became C5 slot).
>
> I am summarizing your suggested changes. Please let
> me know if I've got it right:
>
> 1. Do you want me to modify the code so that the C5
> device-bdf and bus-address become 0004:01:00/0004:01
> instead of 0004:02:00/0004:01?
>
> 2. When performing a hot-unplug operation on C5,
> should all devices from 0004:01 be removed? And
> should all devices from 0004:02 also be removed?
> I think the answer is yes, but please confirm.
>
> 3. When performing a hot-plug operation on C5,
> should all the devices removed earlier from 0004:01
>  and 0004:02 be re-attached?
>
> 4. Will there be any PCIe topology changes in this workflow?
>
> Once you confirm the above requirements, we can discuss
> how to proceed further.
> I have some follow up questions from your last mail and I am
> putting these questions in below paragraphs as inline statements.
> It will confirm me if we should do above things or not.
>
>
>>> It seems like your explanation about the missing 0004:01:00.0 may be
>>> correct and could be due to a firmware bug. However, the scope of this
>>> patch does not relate to this issue. Additionally, if it starts with
>>> 0004:01:00.0 to 0004:01:03.0, the behavior of hot-unplug and hot-plug
>>> operations will remain inconsistent. This patch aims to address the
>>> inconsistent behavior of hot-unplug and hot-plug.
>>>
>>> *snip*
>>>
>>>> It might be worth adding some logic to pnv_php to verify the PCI
>>>> bridge upstream of the slot actually has the PCIe slot capability to
>>>> guard against this problem.
>>> We can have a look at this problem in another patch.
>> The point of this series is to fix the behaviour of pnv_php, is it
>> not?
>
> Yes and we will do necessary things.
>
>> Powering off a PCI(e) slot is supposed to render it safe to
>> remove the card  in that slot.
>
> Do you mean physical-removal of the device after power-off ?
>
>>   Currently if you "power off" C5, the
>> kernel is still going to have active references to the switch's
>> upstream port device (at 0004:01:00.0) and the switch management
>> function (at 0004:01:00.1).
>
> Yes, since we are only operating on the downstream port of C5,
> upstream ports' reference to the kernel will remain the same.
>
>> If the kernel has active references to PCI
>> devices physically located in the slot we supposedly powered off, then
>> the hotplug driver isn't doing its job.
>
> We have only powered off the downstream ports, not the upstream port.
> The upstream port will remain powered on. Do you mean to say that it
> will cause a problem if we physically remove the device while the
> upstream port is powered on and the downstream port is powered off?
> Will it cause a kernel crash? Is this the reason for designating the
> upstream port as a C5 slot and performing a hot-plug operation on it?
> Is it correct to select a device port that is not hot-pluggable,
> designate it as a C5 slot, and perform a hot-plug operation on it?
>
>
>> The asymmetry between hot add
>> and removal that you're trying to fix here is a side effect of the
>> fact that pnv_php is advertising the wrong thing as a slot.
>
> Pnv-php is displaying the information, what it receives from the
> device node property. We will attempt to modify the code
> path that is responsible for this. I am not sure yet what
> additional code is needed for this, but I will figure it
> out. Is it okay to change this code?
>
>>   I think
>> you should stop pnv_php from advertising something as a slot when it's
>> not actually a slot because that's the root of all your problems.
>
> Okay, I am aligned but need some more clarification. Currently,
> we are observing this behavior with the PMC-Sierra bridge.
> Will this behavior occur with all bridges? In other words,
> will the upstream port capability not be hot-pluggable for
> all bridges and switches, and therefore not be considered
> for slot selection?
>
> In a previous email, you mentioned that this problem is due
> to a firmware bug, causing the driver to behave incorrectly
> and advertise the wrong port as a slot. Assuming the firmware
> bug is not present, what will be the behavior? Will there be
> any expected PCI-topology changes in the above "lspci -tv"
> command? Also, if the firmware bug is not present, do we still
> need to make changes to the driver code?
>
>
> Best Regards,
> Krishna


While I am still waiting for a response on the above points,
I would like to add a few more points here:

1. The connection between the upstream and downstream
ports is vendor-specific, and we cannot control this.

2. When running "lspci -vvv" on the upstream port, it neither
shows its a slot nor a hotplug slot. This is the reason pnv_php
does not advertise the upstream port as a slot. I have observed
similar behavior for upstream and downstream ports on other
architectures and with other switches as well.


Snippet for Upstream Port, showing it is neither a slot nor a hotplug
slot.

# lspci -vvv -s 0004:01:00.0 | grep -i slot
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 0.000W
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
[root@ltczzess2-lp1 ~]#

# lspci -vvv -s 0004:01:00.0 | grep -i Upstream
    Capabilities: [40] Express (v2) Upstream Port, MSI 00
             Retimer- 2Retimers- CrosslinkRes: Upstream Port
        ACSCap:    SrcValid- TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans+
        ACSCtl:    SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
#

Downstream Port snippet : Its a slot and hotplug slot too.

#
# lspci -vvv -s 0004:02:00.0 | grep -i slot
    Physical Slot: C5
    Capabilities: [40] Express (v2) Downstream Port (Slot+), MSI 00
            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
            Slot #1, PowerLimit 0.000W; Interlock- NoCompl+
#

# lspci -vvv -s 0004:02:00.0 | grep -i hot
        SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
#

3. The devices are connected to the downstream port, and hotplug
operations should only occur on these ports, not on the upstream port.

4. The upstream port and downstream port remain on different buses.
I have observed this behavior with other architectures and switches too.

5. Performing a poweroff operation on different ports of the bridge
and the devices behind them does not cause any problems for the
available upstream port. I have not encountered any tests/scenarios
where this could create a problem.

Taking all of the above points into consideration, I do not see any need
for further code changes in the pnv_php driver regarding this matter.



>
>>> We wanted to handle the more generic case and did not want to be confined to
>>> only one device assumption. We want to fix the current inconsistent behavior
>>> more generically.
>> Right, as I said above I don't think handing the more generic case is
>> actually required if pnv_php is doing its job properly. It doesn't
>> hurt though.
>>
>>> Regarding the fix, the fix is obvious:
>> really?
>>
>>> We have to traverse
>>> and find the bridge ports from DT and invoke  pci_scan_slot() on them. This will
>>> discover and create the entry for bridge ports (0004:02:00.0 to 0004:02:00.3 on
>>> the given bus- 0004:02). There is already an existing function, pci_scan_bridge()
>>> which is doing invocation of pci_scan_slot () for the devices behind the bridge,
>>> in this case for  SAS device. So eventually, we are doing a scan of all the entities
>>> behind the slot.
>> I already read your patch so I'm not sure why you feel the need to
>> re-describe it in tedious detail.
>>
>>> Would you like me to combine the non-bridge and bridge cases into one? I can attempt
>>> to do this. Hopefully, if we incorporate the iterate sibling logic case correctly,
>>> we may not need to maintain these two separate cases for bridge and non-bridge. I
>>> will attempt this, and if it works, I will include it in the next patch. Thanks.
>> Yes, do that.

A single call of pci_scan_slot is sufficient to power on the devices in the scenario
with multiple ports on the same card. However, it is not enough for a switch
containing multiple ports. If the check is removed and we rely on the logic to
traverse all the sibling device nodes and invoke pci_scan_slot() on each, in
this case, device initialization of NIC ports (represented below) in terms of bar region
and so will occur multiple times. Although this is not a problem and it works fine, we
have to make a choice whether to proceed with or without the check.


Snippet showing multiple port from a single card. This is not on bridge but on same
card.

+-[0001:00]---00.0-[01-0a]--+-00.0-[02-0a]--+-00.0-[03-07]--
 |                           |               +-01.0-[08]--+-00.0  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
 |                           |               |                    +-00.1  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
 |                           |               |                    +-00.2  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
 |                           |               |                     \-00.3  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
 |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               \-03.0-[0a]----00.0  IBM PCI-E IPR SAS Adapter (ASIC)
 |                           \-00.1  PMC-Sierra Inc. Device 4052


Best regards,
Krishna


>> Also, do not post HTML emails to linux development lists. It breaks
>> plain text inline quoting which makes your messages annoying to reply
>> to. Some linux development lists will also silently drop HTML emails.
>> Please talk to the other LTC engineers about how to set up your mail
>> client to send plain text emails to avoid these problems in the
>> future.
>>
>> Oliver
