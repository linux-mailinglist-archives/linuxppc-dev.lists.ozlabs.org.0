Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E98D6393
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 15:53:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X2+ViGEm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrPjK1dM5z3cdn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:53:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X2+ViGEm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishna.kumar11@ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrPhY1yPrz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 23:53:00 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VDqomU003113;
	Fri, 31 May 2024 13:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=GhaqnbmEynBkCHArJSgqNSBnev5KbWtXD0Vl8QKgvWg=;
 b=X2+ViGEme5sr7suGf2rDnVPkFPIxvsBiC41+mkzE7ljjFsXXTudBItzF5OjS9u+bHk6+
 8vIx8PkbED7Zng7FAA47fokj/q8WVEJIKR6e6gECTuvhBAfiSR61aMNBs1RGbqikU7yN
 4xNwZ1LVjeXnomL7YqLEjczqz4FfvhxJqa9MAMtQ871lCIBJuOly6ZH8YJK2CYjkKCcW
 cWtcSQ7/F7MuT0UuHrmPc+VaZWgG+gkbx4Fs3e5DtGPw7l8FFzmSKlzJOvt4eNHX6ZEI
 PbZ9A+YSvGl0tGA20OYsMHOtqLn3JwUrFVyMXmQ6bVq5osQw5Sd7uenur+ubE2BkZMQo Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfftr000k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 13:52:49 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VDqnW9003092;
	Fri, 31 May 2024 13:52:49 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfftr000e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 13:52:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44VCFCC4029003;
	Fri, 31 May 2024 13:52:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ydpb008aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 13:52:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44VDqgNX50069910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 13:52:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8738E2004B;
	Fri, 31 May 2024 13:52:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0898B20043;
	Fri, 31 May 2024 13:52:40 +0000 (GMT)
Received: from [9.109.241.85] (unknown [9.109.241.85])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 May 2024 13:52:39 +0000 (GMT)
Message-ID: <a8bcbe65-362d-4856-8faa-9a761870bff8@ibm.com>
Date: Fri, 31 May 2024 19:22:39 +0530
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
 <e5db1fdc-166b-441f-a35c-707850b9b43d@ibm.com>
Content-Language: en-US
In-Reply-To: <e5db1fdc-166b-441f-a35c-707850b9b43d@ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x4GmLGeyr6W4LOm5LFhpEYgBmyDnUXCq
X-Proofpoint-GUID: LDN9Ql0jXf0wwHHU2aS6yyhqoST96EgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_10,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405310103
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


On 5/31/24 16:14, Krishna Kumar wrote:
> On 5/23/24 20:22, Krishna Kumar wrote:
>>
>> Hi Oliver,
>>
>> Thanks for your suggestions. Pls find my response:
>>
>> On 5/20/24 20:29, Oliver O'Halloran wrote:
>>> On Fri, May 17, 2024 at 9:15 PM krishna kumar <krishnak@linux.ibm.com> wrote:
>>>>> Uh, if I'm reading this right it looks like your "slot" C5 is actually
>>>>> the PCIe switch's internal bus which is definitely not hot pluggable.
>>>> It's a hotplug slot. Please see the snippet below:
>>>>
>>>> :~$ sudo lspci -vvv -s 0004:02:00.0 | grep --color HotPlug
>>>>           SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>>> :~$
>>>>
>>>> :~$ sudo lspci -vvv -s 0004:02:01.0 | grep --color HotPlug
>>>>          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>>> :~$
>>>>
>>>> :~$ sudo lspci -vvv -s 0004:02:02.0 | grep --color HotPlug
>>>>          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>>> :~$
>>>>
>>>> :~$ sudo lspci -vvv -s 0004:02:03.0 | grep --color HotPlug
>>>>          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>>>> :~$
>>> All this is showing is that the switch downstream ports on bus 0004:02
>>> have a slot capability. I already know that (see what I said
>>> previously about physical links). The fact the downstream ports have a
>>> slot capability also has absolutely nothing to do with anything I was
>>> saying. Look at the lspci output for 0004:01:00.0 which is the
>>> switch's upstream port. The upstream port device will not have a slot
>>> capability because it's a bridge into the virtual PCI bus that is
>>> internal to the switch.
>> Let me try to understand your suggestion and what needs to be done now:
>>
>> lspci -nn snippet in current scenario:
>>
>> 0004:01:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:01:00.1 Memory controller [0580]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:02:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:02:01.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:02:02.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:02:03.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>>
>> lspci -tv snippet in current scenario:
>>
>> +-[0001:00]---00.0-[01-0a]--+-00.0-[02-0a]--+-00.0-[03-07]--
>>  |                           |               +-01.0-[08]--+-00.0  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>>  |                           |               |            +-00.1  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>>  |                           |               |            +-00.2  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>>  |                           |               |            \-00.3  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>>  |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
>>  |                           |               \-03.0-[0a]----00.0  IBM PCI-E IPR SAS Adapter (ASIC)
>>  |                           \-00.1  PMC-Sierra Inc. Device 4052
>>
>> C5 bus address:
>>
>> [root@ltczzess2-lp1 ~]# cat /sys/bus/pci/slots/C5/address
>> 0004:02:00
>> [root@ltczzess2-lp1 ~]#
>>
>> 0004:01:00.0 doesn't have hotplug capability but 0004:02:00.0 does
>> have this capability. Below snippet tells about this:
>>
>> [root@ltczzess2-lp1 ~]# sudo lspci -vvv -s 0004:01:00.0 | grep --color HotPlug
>> [root@ltczzess2-lp1 ~]#
>> [root@ltczzess2-lp1 ~]# sudo lspci -vvv -s 0004:02:00.0 | grep --color HotPlug
>>         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>> [root@ltczzess2-lp1 ~]#
>>
>> In Function -  pnv_php_register_one() is responsible for slot creation from
>> hotplug capable device node:
>>
>> Below is the current code that does check the device node for hot plug
>> capability and takes the decision
>>
>>  /* Check if it's hotpluggable slot */
>>         ret = of_property_read_u32(dn, "ibm,slot-pluggable", &prop32);
>>         if (ret || !prop32){
>>                 return -ENXIO;
>>         }
>>
>> Its obvious that 0004:01:00.0 does not get above criteria fulfilled but
>> 0004:02:00.0 does, so is the current behavior (Upstream port is not became
>> C5 slot but downstream port became C5 slot).
>>
>> I am summarizing your suggested changes. Please let
>> me know if I've got it right:
>>
>> 1. Do you want me to modify the code so that the C5
>> device-bdf and bus-address become 0004:01:00/0004:01
>> instead of 0004:02:00/0004:01?
>>
>> 2. When performing a hot-unplug operation on C5,
>> should all devices from 0004:01 be removed? And
>> should all devices from 0004:02 also be removed?
>> I think the answer is yes, but please confirm.
>>
>> 3. When performing a hot-plug operation on C5,
>> should all the devices removed earlier from 0004:01
>>  and 0004:02 be re-attached?
>>
>> 4. Will there be any PCIe topology changes in this workflow?
>>
>> Once you confirm the above requirements, we can discuss
>> how to proceed further.
>> I have some follow up questions from your last mail and I am
>> putting these questions in below paragraphs as inline statements.
>> It will confirm me if we should do above things or not.
>>
>>
>>>> It seems like your explanation about the missing 0004:01:00.0 may be
>>>> correct and could be due to a firmware bug. However, the scope of this
>>>> patch does not relate to this issue. Additionally, if it starts with
>>>> 0004:01:00.0 to 0004:01:03.0, the behavior of hot-unplug and hot-plug
>>>> operations will remain inconsistent. This patch aims to address the
>>>> inconsistent behavior of hot-unplug and hot-plug.
>>>>
>>>> *snip*
>>>>
>>>>> It might be worth adding some logic to pnv_php to verify the PCI
>>>>> bridge upstream of the slot actually has the PCIe slot capability to
>>>>> guard against this problem.
>>>> We can have a look at this problem in another patch.
>>> The point of this series is to fix the behaviour of pnv_php, is it
>>> not?
>> Yes and we will do necessary things.
>>
>>> Powering off a PCI(e) slot is supposed to render it safe to
>>> remove the card  in that slot.
>> Do you mean physical-removal of the device after power-off ?
>>
>>>   Currently if you "power off" C5, the
>>> kernel is still going to have active references to the switch's
>>> upstream port device (at 0004:01:00.0) and the switch management
>>> function (at 0004:01:00.1).
>> Yes, since we are only operating on the downstream port of C5,
>> upstream ports' reference to the kernel will remain the same.
>>
>>> If the kernel has active references to PCI
>>> devices physically located in the slot we supposedly powered off, then
>>> the hotplug driver isn't doing its job.
>> We have only powered off the downstream ports, not the upstream port.
>> The upstream port will remain powered on. Do you mean to say that it
>> will cause a problem if we physically remove the device while the
>> upstream port is powered on and the downstream port is powered off?
>> Will it cause a kernel crash? Is this the reason for designating the
>> upstream port as a C5 slot and performing a hot-plug operation on it?
>> Is it correct to select a device port that is not hot-pluggable,
>> designate it as a C5 slot, and perform a hot-plug operation on it?
>>
>>
>>> The asymmetry between hot add
>>> and removal that you're trying to fix here is a side effect of the
>>> fact that pnv_php is advertising the wrong thing as a slot.
>> Pnv-php is displaying the information, what it receives from the
>> device node property. We will attempt to modify the code
>> path that is responsible for this. I am not sure yet what
>> additional code is needed for this, but I will figure it
>> out. Is it okay to change this code?
>>
>>>   I think
>>> you should stop pnv_php from advertising something as a slot when it's
>>> not actually a slot because that's the root of all your problems.
>> Okay, I am aligned but need some more clarification. Currently,
>> we are observing this behavior with the PMC-Sierra bridge.
>> Will this behavior occur with all bridges? In other words,
>> will the upstream port capability not be hot-pluggable for
>> all bridges and switches, and therefore not be considered
>> for slot selection?
>>
>> In a previous email, you mentioned that this problem is due
>> to a firmware bug, causing the driver to behave incorrectly
>> and advertise the wrong port as a slot. Assuming the firmware
>> bug is not present, what will be the behavior? Will there be
>> any expected PCI-topology changes in the above "lspci -tv"
>> command? Also, if the firmware bug is not present, do we still
>> need to make changes to the driver code?
>>
>>
>> Best Regards,
>> Krishna
>
> While I am still waiting for a response on the above points,
> I would like to add a few more points here:
>
> 1. The connection between the upstream and downstream
> ports is vendor-specific, and we cannot control this.
>
> 2. When running "lspci -vvv" on the upstream port, it neither
> shows its a slot nor a hotplug slot. This is the reason pnv_php
> does not advertise the upstream port as a slot. I have observed
> similar behavior for upstream and downstream ports on other
> architectures and with other switches as well.
>
>
> Snippet for Upstream Port, showing it is neither a slot nor a hotplug
> slot.
>
> # lspci -vvv -s 0004:01:00.0 | grep -i slot
>             ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 0.000W
>             TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> [root@ltczzess2-lp1 ~]#
>
> # lspci -vvv -s 0004:01:00.0 | grep -i Upstream
>     Capabilities: [40] Express (v2) Upstream Port, MSI 00
>              Retimer- 2Retimers- CrosslinkRes: Upstream Port
>         ACSCap:    SrcValid- TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans+
>         ACSCtl:    SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
> #
>
> Downstream Port snippet : Its a slot and hotplug slot too.
>
> #
> # lspci -vvv -s 0004:02:00.0 | grep -i slot
>     Physical Slot: C5
>     Capabilities: [40] Express (v2) Downstream Port (Slot+), MSI 00
>             TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>             Slot #1, PowerLimit 0.000W; Interlock- NoCompl+
> #
>
> # lspci -vvv -s 0004:02:00.0 | grep -i hot
>         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-
>         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> #
>
> 3. The devices are connected to the downstream port, and hotplug
> operations should only occur on these ports, not on the upstream port.
>
> 4. The upstream port and downstream port remain on different buses.
> I have observed this behavior with other architectures and switches too.
>
> 5. Performing a poweroff operation on different ports of the bridge
> and the devices behind them does not cause any problems for the
> available upstream port. I have not encountered any tests/scenarios
> where this could create a problem.
>
> Taking all of the above points into consideration, I do not see any need
> for further code changes in the pnv_php driver regarding this matter.
>
>

I got one more setup having below configuration. I did some experiment
and here are my observations -

# lspci -tv
 +-[0033:00]---00.0-[01-17]----00.0-[02-17]--+-01.0-[03-07]--
 |                                           +-04.0-[08-0c]--
 |                                           +-05.0-[0d]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller PM173X
 |                                           +-06.0-[0e-12]--
 |                                           \-07.0-[13-17]--
# lspci -vvv -s 0033:01:00.0 | grep -i slot
    Physical Slot: WIO Slot3-1
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 75.000W
            TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
        VC0:    Caps:    PATOffset=03 MaxTimeSlots=1 RejSnoopTrans-
[root@ltc-boston11 ~]#
[root@ltc-boston11 ~]# lspci -vvv -s 0033:01:00.0 | grep -i Upstream
    Capabilities: [68] Express (v2) Upstream Port, MSI 00
[root@ltc-boston11 ~]#
[root@ltc-boston11 ~]#
[root@ltc-boston11 ~]# lspci -vvv -s 0033:01:00.0 | grep -i hot
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
[root@ltc-boston11 ~]#

[root@ltc-boston11 ~]# lspci -nn | grep 0033
0033:00:00.0 PCI bridge [0604]: IBM POWER9 Host Bridge (PHB4) [1014:04c1]
0033:01:00.0 PCI bridge [0604]: PLX Technology, Inc. PEX 9733 33-lane, 9-port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:9733] (rev aa)
0033:02:01.0 PCI bridge [0604]: PLX Technology, Inc. PEX 9733 33-lane, 9-port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:9733] (rev aa)
0033:02:04.0 PCI bridge [0604]: PLX Technology, Inc. PEX 9733 33-lane, 9-port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:9733] (rev aa)
0033:02:05.0 PCI bridge [0604]: PLX Technology, Inc. PEX 9733 33-lane, 9-port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:9733] (rev aa)
0033:02:06.0 PCI bridge [0604]: PLX Technology, Inc. PEX 9733 33-lane, 9-port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:9733] (rev aa)
0033:02:07.0 PCI bridge [0604]: PLX Technology, Inc. PEX 9733 33-lane, 9-port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:9733] (rev aa)
0033:0d:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd NVMe SSD Controller PM173X [144d:a824]

[root@ltc-boston11 ~]#  cat /sys/bus/pci/slots/WIO\ Slot3-1/address
0033:01:00

Hot-Unplug from above upstream port :

# echo 0 > /sys/bus/pci/slots/WIO\ Slot3-1/power
# lspci -tv
 +-[0033:00]---00.0-[01-17]--
 

Hot-plug from above upstream port :

[root@ltc-boston11 ~]# echo 1 > /sys/bus/pci/slots/WIO\ Slot3-1/power
[root@ltc-boston11 ~]#
[root@ltc-boston11 ~]#
[root@ltc-boston11 ~]#
[root@ltc-boston11 ~]# lspci -tv
 +-[0033:00]---00.0-[01-17]----00.0-[02-17]--+-01.0-[03-07]--
 |                                           +-04.0-[08-0c]--
 |                                           +-05.0-[0d]----00.0  Samsung Electronics Co Ltd NVMe SSD Controller PM173X
 |                                           +-06.0-[0e-12]--
 |                                           \-07.0-[13-17]--


What I want to say from above experiment is - if the upstream port is
having the slot capability, pnv_php driver is able to do hot-plug/unplug
operation on this.

In our older case the upstream-port doesn't have slot capability, so there
is no point of having hot-plug operation on this.

Do you want to change the code logic to consider upstream-port always a slot? Is it even possible
if lspci doesn't advertise it as a slot ?


Best Regards,

Krishna


>>>> We wanted to handle the more generic case and did not want to be confined to
>>>> only one device assumption. We want to fix the current inconsistent behavior
>>>> more generically.
>>> Right, as I said above I don't think handing the more generic case is
>>> actually required if pnv_php is doing its job properly. It doesn't
>>> hurt though.
>>>
>>>> Regarding the fix, the fix is obvious:
>>> really?
>>>
>>>> We have to traverse
>>>> and find the bridge ports from DT and invoke  pci_scan_slot() on them. This will
>>>> discover and create the entry for bridge ports (0004:02:00.0 to 0004:02:00.3 on
>>>> the given bus- 0004:02). There is already an existing function, pci_scan_bridge()
>>>> which is doing invocation of pci_scan_slot () for the devices behind the bridge,
>>>> in this case for  SAS device. So eventually, we are doing a scan of all the entities
>>>> behind the slot.
>>> I already read your patch so I'm not sure why you feel the need to
>>> re-describe it in tedious detail.
>>>
>>>> Would you like me to combine the non-bridge and bridge cases into one? I can attempt
>>>> to do this. Hopefully, if we incorporate the iterate sibling logic case correctly,
>>>> we may not need to maintain these two separate cases for bridge and non-bridge. I
>>>> will attempt this, and if it works, I will include it in the next patch. Thanks.
>>> Yes, do that.
> A single call of pci_scan_slot is sufficient to power on the devices in the scenario
> with multiple ports on the same card. However, it is not enough for a switch
> containing multiple ports. If the check is removed and we rely on the logic to
> traverse all the sibling device nodes and invoke pci_scan_slot() on each, in
> this case, device initialization of NIC ports (represented below) in terms of bar region
> and so will occur multiple times. Although this is not a problem and it works fine, we
> have to make a choice whether to proceed with or without the check.
>
>
> Snippet showing multiple port from a single card. This is not on bridge but on same
> card.
>
> +-[0001:00]---00.0-[01-0a]--+-00.0-[02-0a]--+-00.0-[03-07]--
>  |                           |               +-01.0-[08]--+-00.0  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               |                    +-00.1  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               |                    +-00.2  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               |                     \-00.3  Broadcom Inc. and subsidiaries NetXtreme BCM5719 Gigabit Ethernet PCIe
>  |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
>  |                           |               \-03.0-[0a]----00.0  IBM PCI-E IPR SAS Adapter (ASIC)
>  |                           \-00.1  PMC-Sierra Inc. Device 4052
>
>
> Best regards,
> Krishna
>
>
>>> Also, do not post HTML emails to linux development lists. It breaks
>>> plain text inline quoting which makes your messages annoying to reply
>>> to. Some linux development lists will also silently drop HTML emails.
>>> Please talk to the other LTC engineers about how to set up your mail
>>> client to send plain text emails to avoid these problems in the
>>> future.
>>>
>>> Oliver
