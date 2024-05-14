Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F58C55C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 14:06:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qL5a7oPg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vdw7q2hv6z3cT3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 22:06:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qL5a7oPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vdw736l9sz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 22:06:07 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EAuiAs021957;
	Tue, 14 May 2024 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=At8TlT4OMrASsFgRS6N2d6IYATyPQ9ZIOtIWuBT42Rs=;
 b=qL5a7oPgnJCWdgsBzGqinBEf5mkYSh0chT/PeqHwVMSnvGOPKHfIJxYL6U7utXzfjb4L
 BNBvBwtv8zMgg2P19k2/r8g8p2UZcJC8eOTpcbCv4SAo30ICbmqABJ9GVCJgDW7VXkWE
 Vo5lr635iqCu9vyjSQYDQixu9LoEd7pgKeC6Tf1RLcmaYEmZZ2Pe7FMEtfh1lmqYKkFt
 Zy2gU4LAfjhf1b+AZDjfi98F1uGc318lPfqqZZ/EX8Nn1M4xzwmGndse6pkgVIy4Ox//
 9d1otvUKJXcl5hmuWMBJiVwDWbrDRVFF5eaUWyz3gocw4oPct0gEoZQXgQwDLtiLhZx9 Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y44aq0gkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 12:05:59 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44EC5xb0030966;
	Tue, 14 May 2024 12:05:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y44aq0gkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 12:05:59 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44E9k34M029591;
	Tue, 14 May 2024 12:05:58 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7kmwvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 12:05:58 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EC5tmd42861306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 12:05:57 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 173905804B;
	Tue, 14 May 2024 12:05:55 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AA0558065;
	Tue, 14 May 2024 12:05:50 +0000 (GMT)
Received: from [9.171.90.14] (unknown [9.171.90.14])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 12:05:50 +0000 (GMT)
Message-ID: <704ab07c-73b2-459e-9cb0-c9e49938454e@linux.ibm.com>
Date: Tue, 14 May 2024 17:35:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arch/powerpc: hotplug driver bridge support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20240509120644.653577-1-krishnak@linux.ibm.com>
 <20240509120644.653577-3-krishnak@linux.ibm.com>
 <Zj8FVva9G9_r6-cZ@surfacebook.localdomain>
Content-Language: en-US
From: krishna kumar <krishnak@linux.ibm.com>
In-Reply-To: <Zj8FVva9G9_r6-cZ@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dQmDWeqnUpBR414GudTMY2ZCGhky3EPc
X-Proofpoint-GUID: qybtREYezSpX0AqQC3KvoyNY078qm91i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140085
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
Cc: nathanl@linux.ibm.com, gbatra@linux.ibm.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, oohall@gmail.com, bhelgaas@google.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Andy for review. I have incorporated your comments and will be 
sending the patch soon.

On 5/11/24 11:12, Andy Shevchenko wrote:
> Thu, May 09, 2024 at 05:35:54PM +0530, Krishna Kumar kirjoitti:
>> There is an issue with the hotplug operation when it's done on the
>> bridge/switch slot. The bridge-port and devices behind the bridge, which
>> become offline by hot-unplug operation, don't get hot-plugged/enabled by
>> doing hot-plug operation on that slot. Only the first port of the bridge
>> gets enabled and the remaining port/devices remain unplugged. The hot
>> plug/unplug operation is done by the hotplug driver
>> (drivers/pci/hotplug/pnv_php.c).
>>
>> Root Cause Analysis: This behavior is due to missing code for the DPC
>> switch/bridge. The existing driver depends on pci_hp_add_devices()
>> function for device enablement. This function calls pci_scan_slot() on
>> only one device-node/port of the bridge, not on all the siblings'
>> device-node/port.
>>
>> The missing code needs to be added which will find all the sibling
>> device-nodes/bridge-ports and will run explicit pci_scan_slot() on
>> those.  A new function has been added for this purpose which gets
>> invoked from pci_hp_add_devices(). This new function
>> pci_traverse_sibling_nodes_and_scan_slot() gets all the sibling
>> bridge-ports by traversal and explicitly invokes pci_scan_slot on them.
>>
>>
> One blank line is enough here.
I have incorporated this.
>
>> Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>
> ...
>
>> +void *pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start, struct pci_bus *bus)
>> +{
>> +	struct device_node *dn;
>> +	struct device_node *parent;
>> +	int slotno;
>> +
>> +	const __be32 *classp1;
>> +	u32 class1 = 0;
>> +	classp1 = of_get_property(start->child, "class-code", NULL);
>> +	if (classp1)
>> +		class1 = of_read_number(classp1, 1);
> What's wrong with of_property_read_u32()?
I have incorporated this.
>
>
>> +	/* Call of pci_scan_slot for non-bridge/EP case */
>> +	if (!((class1 >> 8) == PCI_CLASS_BRIDGE_PCI)) {
>> +		slotno = PCI_SLOT(PCI_DN(start->child)->devfn);
>> +		pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
>> +		return NULL;
>> +	}
>> +
>> +	/* Iterate all siblings */
>> +	parent = start;
>> +	for_each_child_of_node(parent, dn) {
>> +		const __be32 *classp;
>> +		u32 class = 0;
>> +
>> +		classp = of_get_property(dn, "class-code", NULL);
>> +		if (classp)
>> +			class = of_read_number(classp, 1);
> Ditto.
>
>> +		/* Call of pci_scan_slot on each sibling-nodes/bridge-ports */
>> +		if ((class >> 8) == PCI_CLASS_BRIDGE_PCI) {
>> +			slotno = PCI_SLOT(PCI_DN(dn)->devfn);
>> +			pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}

Best Regards,

Krishna

