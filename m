Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FB8C865A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 14:35:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvab/JPm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgmdp5KPSz3fs2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 22:35:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvab/JPm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgkry63LHz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 21:15:14 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H9WUn6011746;
	Fri, 17 May 2024 11:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=2ZnqHX2hKFitdHTwQKH/qQGiuwzKCUaHKqwkFGYaHrI=;
 b=mvab/JPmLzgYhzwExKrOYcUELZvnNiQnOU2cfNI7FLun3HYfYaEcqfdran7qmNN5wvTn
 5KaGhPcPKHOai2mhOUr2kfCzovuv/w1Su9oUcFv/ZvJ5k+YsdpHnUWFSX9X0zU/Kc2do
 Lu20KDQzqJWYAQaKdHJVLaX09vjMJBpVofhszesj0o96coSXJ5X1DTuAroDZ21p4GmCa
 Vv8k67k20KAnLh+iggvwuqQQ4RdtBXWU++I0FcznyEHVjDlffCwkL5kkJJYSXGSFLS5Y
 XBFxxqCkkojzMOnBxBWinBg1wLimlGvUlTUwRgw4yBYBLhypWReCJAocr6IbZgkxZvSI 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y64pj88a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 11:15:02 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44HBF1Mx029345;
	Fri, 17 May 2024 11:15:01 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y64pj88a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 11:15:01 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44H9xsGh018764;
	Fri, 17 May 2024 11:15:00 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tyyp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 11:15:00 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44HBEuuH21824200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 11:14:59 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C380E58063;
	Fri, 17 May 2024 11:14:56 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B25458052;
	Fri, 17 May 2024 11:14:53 +0000 (GMT)
Received: from [9.109.241.85] (unknown [9.109.241.85])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 May 2024 11:14:52 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------w2Abro4c46mvBT9wBxFVKX0a"
Message-ID: <fd0e22ab-5998-4b57-828e-224dda6bf490@linux.ibm.com>
Date: Fri, 17 May 2024 16:44:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] powerpc: hotplug driver bridge support
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20240514135303.176134-1-krishnak@linux.ibm.com>
 <20240514135303.176134-3-krishnak@linux.ibm.com>
 <CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com>
Content-Language: en-US
From: krishna kumar <krishnak@linux.ibm.com>
In-Reply-To: <CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6JDKP9ggUi4ipoGJA5lg2tWTjfiIGEkc
X-Proofpoint-ORIG-GUID: dXfg880jrtrEBUpEfSpMrCgwsRBbJ7Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_03,2024-05-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405170090
X-Mailman-Approved-At: Fri, 17 May 2024 22:30:12 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, mahesh@linux.ibm.com, Gaurav Batra <gbatra@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------w2Abro4c46mvBT9wBxFVKX0a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oliver,

Thanks for review. Please find my response below -


On 5/17/24 08:12, Oliver O'Halloran wrote:
> On Tue, May 14, 2024 at 11:54 PM Krishna Kumar<krishnak@linux.ibm.com>  wrote:
>> There is an issue with the hotplug operation when it's done on the
>> bridge/switch slot. The bridge-port and devices behind the bridge, which
>> become offline by hot-unplug operation, don't get hot-plugged/enabled by
>> doing hot-plug operation on that slot. Only the first port of the bridge
>> gets enabled and the remaining port/devices remain unplugged. The hot
>> plug/unplug operation is done by the hotplug driver
>> (drivers/pci/hotplug/pnv_php.c).
>>
>> Root Cause Analysis: This behavior is due to missing code for the DPC
>> switch/bridge.
> I don't see anything touching DPC in this series?

I apologize for the confusion. When I mentioned DPC, I was referring to 
the downward bridge port (the sibling ones) that were not enabled after 
the hot plug operation. I didn't mean to refer to DPC events. It seems 
that this caused some confusion, and I will remove this word in my next 
version of the patch. Thank you!

>
>> *snip*
>>
>> Command for reproducing the issue :
>>
>> For hot unplug/disable - echo 0 > /sys/bus/pci/slots/C5/power
>> For hot plug/enable -    echo 1 > /sys/bus/pci/slots/C5/power
>>
>> where C5 is slot associated with bridge.
>>
>> Scenario/Tests:
>> Output of lspci -nn before test is given below. This snippet contains
>> devices used for testing on Powernv machine.
>>
>> 0004:02:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:02:01.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:02:02.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:02:03.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
>> 0004:08:00.0 Serial Attached SCSI controller [0107]:
>> Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)
>> 0004:09:00.0 Serial Attached SCSI controller [0107]:
>> Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)
>>
>> Output of lspci -tv before test is as follows:
>>
>> # lspci -tv
>>   +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
>>   |                           |               +-01.0-[08]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
>>   |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
>>   |                           |               \-03.0-[0a-0e]--
>>   |                           \-00.1  PMC-Sierra Inc. Device 4052
>>
>> C5(bridge) and C6(End Point) slot address are as below:
>> # cat /sys/bus/pci/slots/C5/address
>> 0004:02:00
>> # cat /sys/bus/pci/slots/C6/address
>> 0004:09:00
> Uh, if I'm reading this right it looks like your "slot" C5 is actually
> the PCIe switch's internal bus which is definitely not hot pluggable.

It's a hotplug slot. Please see the snippet below:

:~$ sudo lspci -vvv -s 0004:02:00.0 | grep --color HotPlug

          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-

:~$

:~$ sudo lspci -vvv -s 0004:02:01.0 | grep --color HotPlug

         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-

:~$

:~$ sudo lspci -vvv -s 0004:02:02.0 | grep --color HotPlug

         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-

:~$

:~$ sudo lspci -vvv -s 0004:02:03.0 | grep --color HotPlug

         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-

:~$


> I find it helps to look at the PCI topology in terms of where the
> physical PCIe links are. Here we've got:
>
> - A link between the PHB (0004:00:00.0) and the switch upstream port
> (0004:01:00.0)
> - A link from switch downstream port 0 (0004:02:00.0) to nothing
> - A link from switch downstream port 1 (0004:02:01.0) to a SAS card
> - A link from switch downstream port 2 (0004:02:02.0) to a SAS card
> - A link from switch downstream port 2 (0004:02:03.0) to nothing
>
> Note that there's no PCIe link between the switch upstream port
> (0004:01:00.0) and the downstream ports on bus 0004:02. The connection
> between those is invisible to us because it's custom bus logic
> internal to the PCIe switch ASIC. What I think has happened here is
> that system firmware has supplied bad PCIe slot information to OPAL
> which has resulted in pnv_php advertising a slot in the wrong place.
> Assuming this following the usual IBM convention I'd expect the bridge
> device for C5 to be the PHB's root port and the bus should be 0004:01.

It seems like your explanation about the missing 0004:01:00.0 may be 
correct and could be due to a firmware bug. However, the scope of this 
patch does not relate to this issue. Additionally, if it starts with 
0004:01:00.0 to 0004:01:03.0, the behavior of hot-unplug and hot-plug 
operations will remain inconsistent. This patch aims to address the 
inconsistent behavior of hot-unplug and hot-plug.

> It might be worth adding some logic to pnv_php to verify the PCI
> bridge upstream of the slot actually has the PCIe slot capability to
> guard against this problem.

We can have a look at this problem in another patch.

>
>> Hot-unplug operation on slot associated with bridge:
>> # echo 0 > /sys/bus/pci/slots/C5/power
>> # lspci -tv
>>   +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--
>>   |                           \-00.1  PMC-Sierra Inc. Device 4052
> Yep, "powering off" C5 doesn't remove the upstream port device. This
> would create problems if you physically removed the card from C5 since
> the kernel would assume the switch device is still present.

Powering off C5 does removes 0004:02:00.0 to 0004:02:00.3 (all the downstream
sibling bridge ports) and SAS devices behind these bridge ports. But Powering
on does not enable them. The behavior should be in sync. Please see the snippet
in patch.

>
>> *snip*
>
>> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
>> index 38561d6a2079..bea612759832 100644
>> --- a/arch/powerpc/kernel/pci_dn.c
>> +++ b/arch/powerpc/kernel/pci_dn.c
>> @@ -493,4 +493,36 @@ static void pci_dev_pdn_setup(struct pci_dev *pdev)
>>          pdn = pci_get_pdn(pdev);
>>          pdev->dev.archdata.pci_data = pdn;
>>   }
>> +
>> +void pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start, struct pci_bus *bus)
>> +{
>> +       struct device_node *dn;
>> +       int slotno;
>> +
>> +       u32 class = 0;
>> +
>> +       if (!of_property_read_u32(start->child, "class-code", &class)) {
>> +               /* Call of pci_scan_slot for non-bridge/EP case */
>> +               if (!((class >> 8) == PCI_CLASS_BRIDGE_PCI)) {
>> +                       slotno = PCI_SLOT(PCI_DN(start->child)->devfn);
>> +                       pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
>> +                       return;
>> +               }
>> +       }
>> +
>> +       /* Iterate all siblings */
>> +       for_each_child_of_node(start, dn) {
>> +               class = 0;
>> +
>> +               if (!of_property_read_u32(start->child, "class-code", &class)) {
>> +                       /* Call of pci_scan_slot on each sibling-nodes/bridge-ports */
>> +                       if ((class >> 8) == PCI_CLASS_BRIDGE_PCI) {
>> +                               slotno = PCI_SLOT(PCI_DN(dn)->devfn);
>> +                               pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
>> +                       }
>> +               }
>> +       }
> If you're going to iterate over all the DT nodes why not just scan all
> of them rather than special casing bridges? IIRC current logic is the
> way it is because PowerVM only puts single devices under a PHB and in
> the PowerNV (pnv_php) case the PCIe spec guarantees that only device 0
> will be present on the end of a link. If you want to handle the more
> generic case then feel free, but do it properly.

We wanted to handle the more generic case and did not want to be 
confined to only one device assumption. We want to fix the current 
inconsistent behavior more generically. Regarding the fix, the fix is 
obvious: We have to traverse and find the bridge ports from DT and 
invoke pci_scan_slot() on them. This will discover and create the entry 
for bridge ports (0004:02:00.0 to 0004:02:00.3 on the given bus- 
0004:02). There is already an existing function, pci_scan_bridge() 
which is doing invocation of pci_scan_slot () for the devices behind the 
bridge, in this case for SAS device. So eventually, we are doing a scan 
of all the entities behind the slot. Would you like me to combine the 
non-bridge and bridge cases into one? I can attempt to do this. 
Hopefully, if we incorporate the iterate sibling logic case correctly, 
we may not need to maintain these two separate cases for bridge and 
non-bridge. I will attempt this, and if it works, I will include it in 
the next patch. Thanks. Best Regards, Krishna

--------------w2Abro4c46mvBT9wBxFVKX0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Oliver,</pre>
    <pre>Thanks for review. Please find my response below -
</pre>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/17/24 08:12, Oliver O'Halloran
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, May 14, 2024 at 11:54 PM Krishna Kumar <a class="moz-txt-link-rfc2396E" href="mailto:krishnak@linux.ibm.com">&lt;krishnak@linux.ibm.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
There is an issue with the hotplug operation when it's done on the
bridge/switch slot. The bridge-port and devices behind the bridge, which
become offline by hot-unplug operation, don't get hot-plugged/enabled by
doing hot-plug operation on that slot. Only the first port of the bridge
gets enabled and the remaining port/devices remain unplugged. The hot
plug/unplug operation is done by the hotplug driver
(drivers/pci/hotplug/pnv_php.c).

Root Cause Analysis: This behavior is due to missing code for the DPC
switch/bridge.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't see anything touching DPC in this series?</pre>
    </blockquote>
    <pre><span data-preserver-spaces="true">I apologize for the confusion. When I mentioned DPC, I </span><span
    data-preserver-spaces="true">was referring</span><span
    data-preserver-spaces="true"> to the 
downward bridge port (the sibling ones) that </span><span
    data-preserver-spaces="true">were not enabled</span><span
    data-preserver-spaces="true"> after the hot 
plug operation. I didn't mean to refer to DPC events. </span><span
    data-preserver-spaces="true">It seems </span><span
    data-preserver-spaces="true">that</span><span
    data-preserver-spaces="true"> this 
caused some confusion, and I will remove this word in my next </span><span
    data-preserver-spaces="true">version of the 
patch</span><span data-preserver-spaces="true">.</span><span
    data-preserver-spaces="true"> Thank you!</span></pre>
    <blockquote type="cite"
cite="mid:CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">*snip*

Command for reproducing the issue :

For hot unplug/disable - echo 0 &gt; /sys/bus/pci/slots/C5/power
For hot plug/enable -    echo 1 &gt; /sys/bus/pci/slots/C5/power

where C5 is slot associated with bridge.

Scenario/Tests:
Output of lspci -nn before test is given below. This snippet contains
devices used for testing on Powernv machine.

0004:02:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:02:01.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:02:02.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:02:03.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:08:00.0 Serial Attached SCSI controller [0107]:
Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)
0004:09:00.0 Serial Attached SCSI controller [0107]:
Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)

Output of lspci -tv before test is as follows:

# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
 |                           |               +-01.0-[08]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               \-03.0-[0a-0e]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052

C5(bridge) and C6(End Point) slot address are as below:
# cat /sys/bus/pci/slots/C5/address
0004:02:00
# cat /sys/bus/pci/slots/C6/address
0004:09:00
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Uh, if I'm reading this right it looks like your "slot" C5 is actually
the PCIe switch's internal bus which is definitely not hot pluggable.</pre>
    </blockquote>
    <pre><span data-preserver-spaces="true">It's a hotplug slot. Please see the snippet below:</span></pre>
    <pre>:~$ sudo lspci -vvv -s 0004:02:00.0 | grep --color HotPlug 
</pre>
    <pre>         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-</pre>
    <pre>:~$ </pre>
    <pre>:~$ sudo lspci -vvv -s 0004:02:01.0 | grep --color HotPlug</pre>
    <pre>        SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-</pre>
    <pre>:~$ </pre>
    <pre>:~$ sudo lspci -vvv -s 0004:02:02.0 | grep --color HotPlug</pre>
    <pre>        SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-</pre>
    <pre>:~$ </pre>
    <pre>:~$ sudo lspci -vvv -s 0004:02:03.0 | grep --color HotPlug</pre>
    <pre>        SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise-</pre>
    <pre>:~$ </pre>
    <br>
    <blockquote type="cite"
cite="mid:CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
I find it helps to look at the PCI topology in terms of where the
physical PCIe links are. Here we've got:

- A link between the PHB (0004:00:00.0) and the switch upstream port
(0004:01:00.0)
- A link from switch downstream port 0 (0004:02:00.0) to nothing
- A link from switch downstream port 1 (0004:02:01.0) to a SAS card
- A link from switch downstream port 2 (0004:02:02.0) to a SAS card
- A link from switch downstream port 2 (0004:02:03.0) to nothing

Note that there's no PCIe link between the switch upstream port
(0004:01:00.0) and the downstream ports on bus 0004:02. The connection
between those is invisible to us because it's custom bus logic
internal to the PCIe switch ASIC. What I think has happened here is
that system firmware has supplied bad PCIe slot information to OPAL
which has resulted in pnv_php advertising a slot in the wrong place.
Assuming this following the usual IBM convention I'd expect the bridge
device for C5 to be the PHB's root port and the bus should be 0004:01.</pre>
    </blockquote>
    <pre><span data-preserver-spaces="true">It seems like your explanation about the missing 0004:01:00.0 may be 
correct and could be due to a firmware bug. However, the scope of this 
patch does not relate to this issue. Additionally, if it starts with 
0004:01:00.0 to 0004:01:03.0, the behavior of hot-unplug and hot-plug 
operations will remain inconsistent. This patch aims to address the 
inconsistent behavior of hot-unplug and hot-plug.</span></pre>
    <pre></pre>
    <blockquote type="cite"
cite="mid:CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
It might be worth adding some logic to pnv_php to verify the PCI
bridge upstream of the slot actually has the PCIe slot capability to
guard against this problem.</pre>
    </blockquote>
    <pre><span data-preserver-spaces="true">We can have a look at this problem in another patch.</span></pre>
    <blockquote type="cite"
cite="mid:CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hot-unplug operation on slot associated with bridge:
# echo 0 &gt; /sys/bus/pci/slots/C5/power
# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yep, "powering off" C5 doesn't remove the upstream port device. This
would create problems if you physically removed the card from C5 since
the kernel would assume the switch device is still present.</pre>
    </blockquote>
    <pre>Powering off C5 does removes 0004:02:00.0 to 0004:02:00.3 (all the downstream 
sibling bridge ports) and SAS devices behind these bridge ports. But Powering 
on does not enable them. The behavior should be in sync. Please see the snippet 
in patch.</pre>
    <blockquote type="cite"
cite="mid:CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">*snip*
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 38561d6a2079..bea612759832 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -493,4 +493,36 @@ static void pci_dev_pdn_setup(struct pci_dev *pdev)
        pdn = pci_get_pdn(pdev);
        pdev-&gt;dev.archdata.pci_data = pdn;
 }
+
+void pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start, struct pci_bus *bus)
+{
+       struct device_node *dn;
+       int slotno;
+
+       u32 class = 0;
+
+       if (!of_property_read_u32(start-&gt;child, "class-code", &amp;class)) {
+               /* Call of pci_scan_slot for non-bridge/EP case */
+               if (!((class &gt;&gt; 8) == PCI_CLASS_BRIDGE_PCI)) {
+                       slotno = PCI_SLOT(PCI_DN(start-&gt;child)-&gt;devfn);
+                       pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+                       return;
+               }
+       }
+
+       /* Iterate all siblings */
+       for_each_child_of_node(start, dn) {
+               class = 0;
+
+               if (!of_property_read_u32(start-&gt;child, "class-code", &amp;class)) {
+                       /* Call of pci_scan_slot on each sibling-nodes/bridge-ports */
+                       if ((class &gt;&gt; 8) == PCI_CLASS_BRIDGE_PCI) {
+                               slotno = PCI_SLOT(PCI_DN(dn)-&gt;devfn);
+                               pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+                       }
+               }
+       }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you're going to iterate over all the DT nodes why not just scan all
of them rather than special casing bridges? IIRC current logic is the
way it is because PowerVM only puts single devices under a PHB and in
the PowerNV (pnv_php) case the PCIe spec guarantees that only device 0
will be present on the end of a link. If you want to handle the more
generic case then feel free, but do it properly.</pre>
    </blockquote>
    <pre><span data-preserver-spaces="true">We wanted to handle the more generic case and did not want to </span><span
    data-preserver-spaces="true">be confined</span><span
    data-preserver-spaces="true"> to 
only one device assumption. We want to fix the current inconsistent behavior 
more generically. Regarding the fix, the fix is obvious:  We have to traverse 
and find the bridge ports from DT and invoke  pci_scan_slot() on them. </span><span
    data-preserver-spaces="true">This</span><span
    data-preserver-spaces="true"> will 
discover and create the entry for bridge ports (0004:02:00.0 to 0004:02:00.3 on 
the given bus- 0004:02). There is already an existing function, pci_scan_bridge() </span><span
    data-preserver-spaces="true">
which</span><span data-preserver-spaces="true"> is doing invocation of pci_scan_slot () for the devices behind the bridge, 
in this case for  SAS device. So eventually, we are doing a scan of all the entities 
behind the slot.

</span><span data-preserver-spaces="true">Would you like me to combine the non-bridge and bridge cases into one? I can attempt 
to do this. </span><span data-preserver-spaces="true">Hopefully, if we incorporate the iterate sibling logic case </span><span
    data-preserver-spaces="true">correctly</span><span
    data-preserver-spaces="true">, 
we may not need to maintain these </span><span
    data-preserver-spaces="true">two</span><span
    data-preserver-spaces="true"> separate cases for bridge and non-bridge.</span><span
    data-preserver-spaces="true"> I 
will attempt this, and if it works, I will include it in the next patch. Thanks.

Best Regards,
Krishna
</span></pre>
    <blockquote type="cite"
cite="mid:CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------w2Abro4c46mvBT9wBxFVKX0a--

