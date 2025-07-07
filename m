Return-Path: <linuxppc-dev+bounces-10139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF4FAFADE9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 10:01:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbGsH3dwQz30Tm;
	Mon,  7 Jul 2025 18:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751875283;
	cv=none; b=Ue0WTRWYzlV+FE1QNMGD/Lq8U0BUJLk1aLGHy0nnNMay48j3eaVBMcaZooODWhDCu/8Ce/e4JTarxSBPwGHBHl+/WiTfAkXGPy62eSzL1d7CDtUpaVB3rCDC1ce/EiBQrgFBgnEGWjyiwN4TvDXFGsFe+9sGaNsVfmiIYUh648QHJbfTYkOeXTLvFjJ47tf4URNgga5jrQwowHeYQoK2hDzqVDOmpzIiLfQwMcrUeSA+biur+eyXFW/yR3BNLYZGj5kNRvIqAMOYZuODDJ4Rj4xtGRf5ZIIsP/mnH9IZ5n5vXDn7NlIYJVoXNvNNB+xQ7pBPzksuikVEpJVrdpz55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751875283; c=relaxed/relaxed;
	bh=EzRUp73z34SHGEivuSu2RUhOIhbeJLqoOp+hOwWfx6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fq38Nzls0giQbZYcFJ3791YQmA+/u5sVEWcaDKHopDdg22fawpHyX6HzZcKX6miwDkXX7v+cA87L/qsF8ePwx+VcZph1aigjJJx3/OS33OQKfajBqJFGsPkBuJZKEE3rMLD+pcMMY+3JJHdRrAPXogaGgSJ5Y1v8XssHkD3SimlStDwUF3iO6h4UimHSay0tAu1SRkR3rVw1zHDBqjqJT1nuOoNtKfznrW5clBvF3B9ze3pYuC7WXhdMB7Vmgh7n00Qd4oaiNXhw7snlnp7CX7/BhC1q5MhSeRFgWUehekTM3VhcFj/nvI0KnWMmjGqBPgLVe4uA7PNlEtAC4d0wig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cuz3otFy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cuz3otFy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbGsG5LgKz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 18:01:22 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566HlJVH012718;
	Mon, 7 Jul 2025 08:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EzRUp7
	3z34SHGEivuSu2RUhOIhbeJLqoOp+hOwWfx6w=; b=cuz3otFyYXKh/nJgcaxlEJ
	Bh53Y3HHJrIjVyDStRb70r1ARVriATavMBbRVwIAVJe1VkjYcJCh6Fb6rvtay1AN
	Vi/Fk/ubc6g7FMb/LItb5N/qq6ZDBLJpNWOqARmQlQDrgPQXPdLDW2IJX3la6u72
	OeuMc5wa7RNj4u2U9gMBsuTV67Gtdl3yTz4TJXUvP7evXm1k0Y9PWmOpliXx2vy4
	lBHKbNB2yhU3qX3uhPUdnTaiHU9GkLoE8LmjF8AIC2jmgajpVLOIYjIn6FccK4JM
	hXMnwbXXHyJ96+THOz2sQFQ7uCicfUmtnf+wXp9BsOonTGhf8IGkr/XdiPOUAT7g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6r7xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:01:08 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5677wdD6029682;
	Mon, 7 Jul 2025 08:01:07 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6r7x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:01:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5673raGg010841;
	Mon, 7 Jul 2025 08:01:06 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qeryw7yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:01:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 567814KE14418336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 08:01:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 389EA2004D;
	Mon,  7 Jul 2025 08:01:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83BA420040;
	Mon,  7 Jul 2025 08:01:01 +0000 (GMT)
Received: from [9.39.28.208] (unknown [9.39.28.208])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 08:01:01 +0000 (GMT)
Message-ID: <3ebe82c1-d9ae-419e-9e49-61fcb71abe34@linux.ibm.com>
Date: Mon, 7 Jul 2025 13:31:00 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
To: Bjorn Helgaas <helgaas@kernel.org>,
        Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        christophe leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Shawn Anastasio <sanastasio@raptorengineering.com>,
        Lukas Wunner <lukas@wunner.de>
References: <20250624223413.GA1550003@bhelgaas>
Content-Language: en-US
From: Krishna Kumar <krishnak@linux.ibm.com>
In-Reply-To: <20250624223413.GA1550003@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NCBTYWx0ZWRfX0W8hzeI9bZbu cxoWJIicovCuuPNDDNI+BRVmo5XKqPeu4leTUAv3AjdTGlTwxo3p4fSm+6lxImbfDMOpo1ZQS8m FJzJfzcETxUvim1ToyrVTcdbQW88RENvAVcBjUJ3Poox/dTJyiW9xmP65PsPEKsUrLo9Idhm8tr
 b8Gl/7tezemDQpXXFYZgmf3HK1RdLPi0O/2JvwMr/bMHxwPm0qh6Oev1XTeKJS0m6FyMqmwpHRv pqBuv0I9A5u8SkvTpMIQOay2C6B+ox4S7Sv3hSz8qcOymzxBwKlmNBEYoj4foWPUXddUD2WgBBl GhSNWn4wBtrNYUrXLGNT4fJVp5aFYoY5N5zK7OIaz5L2gCjVfKVQT3uw6H3Zr6eji/bf0Eij2K+
 3S3kzfahcR0tdFaMpoI/gaV6pammmMBbJtoswNrYrLe/ahxkJ16cfuaLPG55aWQCkGh9W9R2
X-Proofpoint-GUID: Ecs3JysoJt8mU_lQtglqJi1hLvMtE8Eu
X-Proofpoint-ORIG-GUID: _wfs4VuPJ9FbReg9dPwfaWA4mI87GAsQ
X-Authority-Analysis: v=2.4 cv=W/M4VQWk c=1 sm=1 tr=0 ts=686b7ec4 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=_AprYWD3AAAA:8 a=voM4FWlXAAAA:8 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8
 a=1XWaLZrsAAAA:8 a=hNuwOlM9Oy3Jar5w7j4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=fKH2wJO7VO9AkD4yHysb:22 a=IC2XNlieTeVoXbcui8wp:22 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070044
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thanks all for the review and Thanks a bunch to Timothy for fixing the PE Freeze issue. The hotplug issues are like you fix N issue and N+1 th issue will come with new HW.

We had a meeting of around 1.5 -2.0 hr with demo, code review and log review and we decided to let these fixes go ahead. I am consolidating what we discussed -


1. Let these fixes go ahead as it solves wider and much needed customer issue and its urgently needed for time being. We have verified in live demo that nothing is broken from legacy flow and 

PE/PHB freeze, race condition, hung, oops etc has been solved correctly. Basically it fixes below issues -

root-port(phb) -> switch(having4 port)--> 2 nvme devices

1st case - only removal of EP-nvme device (surprise hotplug disables msi at root port), soft removal may work
2nd case  - If we remove switch itself (surprise hotplug disable msi at root port) .


Some explanation of problem -

PHB Freeze (Interrupt is not reaching there) - Fence - Need to reset ||
EP device on removal generated msi - goes to cpu (via root port and then apic mmio region to cpu ),
PHB/root port itself got freeze and cpu never get interrupt - No wq/event going to work - driver is noit working


One area what I thought to fix it with OPAL call is below piece of code-

ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
+    if (ret) {
+        SLOT_WARN(php_slot, "PCI slot activation failed with error code %d, possible frozen PHB", ret);
+        SLOT_WARN(php_slot, "Attempting complete PHB reset before retrying slot activation\n");
+        for (i = 0; i < 3; i++) {
+            /* Slot activation failed, PHB may be fenced from a prior device failure
+             * Use the OPAL fundamental reset call to both try a device reset and clear
+             * any potentially active PHB fence / freeze
+             */
+            SLOT_WARN(php_slot, "Try %d...\n", i + 1);
+            pci_set_pcie_reset_state(php_slot->pdev, pcie_warm_reset);
+            msleep(250);
+            pci_set_pcie_reset_state(php_slot->pdev, pcie_deassert_reset);
+
+            ret = pnv_php_set_slot_power_state(slot, OPAL_PCI_SLOT_POWER_ON);
+            if (!ret)
+                break;
+        }


I would like to see this fix in skiboot, the opal call should reset it and it should work. Normally opal call is responsible for  link training and reset, so ideally it should  happens from there. As if now, Timothy has some explanation for it, so its fine for now. He can add his points for record.


2. In future we have decided to work on items like - removal of Work-queue with threaded irq, addition of dpc support in this driver.

3. We have also discussed if we want to move pciehpc.c driver in future, we have to keep below things in mind, Timothy can add some more points for record.

Device Node (DTB) & its relationship with slot, Can we decouple it and will pciehpc.c going to work correctly for this ?
Driver binding and unbinding based on hotplug event and its relationship with slot. Role of DTB in this. Our driver  also depends on OPAL call for link reset etc, can we decouple from it ? If we add some PPC specific code in pciehpc.c, how will it gets handled (by VFT/Function-Pointer or #ifdef or by seperate files ?)


Lukas has some points for above and I am somewhat aligned with below points, but it needs to be tested to see conceptually it fixes above issues, I am consolidating his points and he can add more  if needed-

Only the host bridge
has to be enumerated in the devicetree or DSDT.

pnv_php.c seems to search the devicetree for hotplug slots and
instantiates them.

We've traditionally dealt with such issues by inserting pcibios_*()
hooks in generic code, with a __weak implementation (which is usually
an empty stub) and a custom implementation in arch/powerpc/.

The linker then chooses the custom implementation over the __weak one.

You can find the existing hooks with:

git grep "__weak .*pcibios" -- drivers/pci
git grep pcibios -- arch/powerpc

An alternative method is to add a callback to struct pci_host_bridge.

pciehp is used on all kinds of arches, it's just an implementation of the PCIe Base Spec.



Best Regards,

Krishna




On 6/25/25 4:04 AM, Bjorn Helgaas wrote:
> On Wed, Jun 18, 2025 at 07:37:54PM -0500, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Bjorn Helgaas" <helgaas@kernel.org>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
>>> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
>>> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
>>> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
>>> Sent: Wednesday, June 18, 2025 2:01:46 PM
>>> Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention indicator
>>> On Wed, Jun 18, 2025 at 11:58:59AM -0500, Timothy Pearson wrote:
>>>>  state
>>> Weird wrapping of last word of subject to here.
>> I'll need to see what's up with my git format-patch setup. Apologies
>> for that across the multiple series.
> No worries.  If you can figure out how to make your mailer use the
> normal "On xxx, somebody wrote:" attribution instead of duplicating
> all those headers, that would be far more useful :)
>
>>>> +static int pnv_php_get_raw_indicator_status(struct hotplug_slot *slot, u8
>>>> *state)
>>>> +{
>>>> +	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>>>> +	struct pci_dev *bridge = php_slot->pdev;
>>>> +	u16 status;
>>>> +
>>>> +	pcie_capability_read_word(bridge, PCI_EXP_SLTCTL, &status);
>>>> +	*state = (status & (PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC)) >> 6;
>>> Should be able to do this with FIELD_GET().
>> I used the same overall structure as the pciehp_hpc driver here.  Do
>> you want me to also fix up that driver with FIELD_GET()?
> Nope, I think it's fine to keep this looking like pciehp for now.
> If somebody wants to use FIELD_GET() in pciehp, I'd probably be OK
> with that, but no need for you to open that can of worms.
>
>>> Is the PCI_EXP_SLTCTL_PIC part needed?  It wasn't there before, commit
>>> log doesn't mention it, and as far as I can tell, this would be the
>>> only driver to do that.  Most expose only the attention status (0=off,
>>> 1=on, 2=identify/blink).
>>>
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +
>>>>  static int pnv_php_get_attention_state(struct hotplug_slot *slot, u8 *state)
>>>>  {
>>>>  	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>>>>  
>>>> +	pnv_php_get_raw_indicator_status(slot, &php_slot->attention_state);
>>> This is a change worth noting.  Previously we didn't read the AIC
>>> state from PCI_EXP_SLTCTL at all; we used php_slot->attention_state to
>>> keep track of whatever had been previously set via
>>> pnv_php_set_attention_state().
>>>
>>> Now we read the current state from PCI_EXP_SLTCTL.  It's not clear
>>> that php_slot->attention_state is still needed at all.
>> It probably isn't.  It's unclear why IBM took this path at all,
>> given pciehp's attention handlers predate pnv-php's by many years.
>>
>>> Previously, the user could write any value at all to the sysfs
>>> "attention" file and then read that same value back.  After this
>>> patch, the user can still write anything, but reads will only return
>>> values with PCI_EXP_SLTCTL_AIC and PCI_EXP_SLTCTL_PIC.
>>>
>>>>  	*state = php_slot->attention_state;
>>>>  	return 0;
>>>>  }
>>>> @@ -461,7 +474,7 @@ static int pnv_php_set_attention_state(struct hotplug_slot
>>>> *slot, u8 state)
>>>>  	mask = PCI_EXP_SLTCTL_AIC;
>>>>  
>>>>  	if (state)
>>>> -		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
>>>> +		new = FIELD_PREP(PCI_EXP_SLTCTL_AIC, state);
>>> This changes the behavior in some cases:
>>>
>>>  write 0: previously turned indicator off, now writes reserved value
>>>  write 2: previously turned indicator on, now sets to blink
>>>  write 3: previously turned indicator on, now turns it off
>> If we're looking at normalizing with pciehp with an eye toward
>> eventually deprecating / removing pnv-php, I can't think of a better
>> time to change this behavior.  I suspect we're the only major user
>> of this code path at the moment, with most software expecting to see
>> pciehp-style handling.  Thoughts?
> I'm OK with changing this, but I do think it would be worth calling
> out the different behavior in the commit log.
>
> Bjorn
>

