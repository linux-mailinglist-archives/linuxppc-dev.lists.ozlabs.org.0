Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E68AB0E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 16:42:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AlbAP220;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLcmV4Lh6z3d8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 00:42:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AlbAP220;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLclm4Thmz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 00:41:24 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43JERarb023395;
	Fri, 19 Apr 2024 14:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IGQunH6y5oW9JfqYjkfJtbi4g2Q3NWYrVzdSeW7DcLo=;
 b=AlbAP2205dl+CqpwZKfiVmuLZwmBsljmTOMgoGM9ZkrxNB/PrvLVL2LhSIKZ9fURXjNA
 1vgy3LP7e5ed4mZX2qwevo68z9NcLGFzxqnEqoD3mttn2DazHKLcU+KAUyVLzhsj0mi1
 tOciM+gIYlZQJuYrw1QbtKXDeGeYBp7U+8FDlX/EZa8JEPHk5K7FL3afbloeTDZAWJDq
 VAV3Z04BygN+kI0ZpomUGMoswZIs5EzX4uzh0QmiUL/Lseic1fnDgUg38THTUHKjOTLL
 4F/7hXnYBKx7waoVTIFd60KoW0XErnqEAriYaCD3w5EVCcg9C156MvrlsF0KQ+7Z3hHv 9w== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xktcu817w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:41:18 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43JCOGE7010653;
	Fri, 19 Apr 2024 14:41:17 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xkbmm461x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:41:17 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43JEfEuX62849378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Apr 2024 14:41:16 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A283358065;
	Fri, 19 Apr 2024 14:41:12 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E02658073;
	Fri, 19 Apr 2024 14:41:12 +0000 (GMT)
Received: from [9.67.5.227] (unknown [9.67.5.227])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 Apr 2024 14:41:12 +0000 (GMT)
Message-ID: <3064baac-4727-4b9b-ab86-fc9476c937e0@linux.ibm.com>
Date: Fri, 19 Apr 2024 09:41:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries/iommu: LPAR panics when rebooted with a
 frozen PE
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20240416205810.28754-1-gbatra@linux.ibm.com>
 <87ttjxanj5.fsf@mail.lhotse> <20240419111127.GZ20665@kitsune.suse.cz>
Content-Language: en-US
From: Gaurav Batra <gbatra@linux.ibm.com>
In-Reply-To: <20240419111127.GZ20665@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0bN4x3XK1gsGMHxro-2OWKztAJzvdxJa
X-Proofpoint-ORIG-GUID: 0bN4x3XK1gsGMHxro-2OWKztAJzvdxJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_09,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 spamscore=0 clxscore=1011 phishscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404190110
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

You are right. I think, the "reboot" should be replaced with just "boot 
up". If there are no other comments, or code changes, I can re-word the 
commit message and submit for review.

Thanks,

Gaurav

On 4/19/24 6:11 AM, Michal Suchánek wrote:
> Hello,
>
> On Fri, Apr 19, 2024 at 04:12:46PM +1000, Michael Ellerman wrote:
>> Gaurav Batra <gbatra@linux.ibm.com> writes:
>>> At the time of LPAR reboot, partition firmware provides Open Firmware
>>> property ibm,dma-window for the PE. This property is provided on the PCI
>>> bus the PE is attached to.
>> AFAICS you're actually describing a bug that happens during boot *up*?
>>
>> Describing it as "reboot" makes me think you're talking about the
>> shutdown path. I think that will confuse people, me at least :)
> there is probably an assumption that it must have been running
> previously for the errors to happen in the first place but given the
> error state persists for a day it may be a very long 'reboot'.
>
> Thanks
>
> Michal
>> cheers
>>
>>> There are execptions where the partition firmware might not provide this
>>> property for the PE at the time of LPAR reboot. One of the scenario is
>>> where the firmware has frozen the PE due to some error conditions. This
>>> PE is frozen for 24 hours or unless the whole system is reinitialized.
>>>
>>> Within this time frame, if the LPAR is rebooted, the frozen PE will be
>>> presented to the LPAR but ibm,dma-window property could be missing.
>>>
>>> Today, under these circumstances, the LPAR oopses with NULL pointer
>>> dereference, when configuring the PCI bus the PE is attached to.
>>>
>>> BUG: Kernel NULL pointer dereference on read at 0x000000c8
>>> Faulting instruction address: 0xc0000000001024c0
>>> Oops: Kernel access of bad area, sig: 7 [#1]
>>> LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>> Modules linked in:
>>> Supported: Yes
>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.4.0-150600.9-default #1
>>> Hardware name: IBM,9043-MRX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NM1060_023) hv:phyp pSeries
>>> NIP:  c0000000001024c0 LR: c0000000001024b0 CTR: c000000000102450
>>> REGS: c0000000037db5c0 TRAP: 0300   Not tainted  (6.4.0-150600.9-default)
>>> MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000822  XER: 00000000
>>> CFAR: c00000000010254c DAR: 00000000000000c8 DSISR: 00080000 IRQMASK: 0
>>> ...
>>> NIP [c0000000001024c0] pci_dma_bus_setup_pSeriesLP+0x70/0x2a0
>>> LR [c0000000001024b0] pci_dma_bus_setup_pSeriesLP+0x60/0x2a0
>>> Call Trace:
>>> 	pci_dma_bus_setup_pSeriesLP+0x60/0x2a0 (unreliable)
>>> 	pcibios_setup_bus_self+0x1c0/0x370
>>> 	__of_scan_bus+0x2f8/0x330
>>> 	pcibios_scan_phb+0x280/0x3d0
>>> 	pcibios_init+0x88/0x12c
>>> 	do_one_initcall+0x60/0x320
>>> 	kernel_init_freeable+0x344/0x3e4
>>> 	kernel_init+0x34/0x1d0
>>> 	ret_from_kernel_user_thread+0x14/0x1c
>>>
>>> Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
>>> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
>>> ---
>>>   arch/powerpc/platforms/pseries/iommu.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index e8c4129697b1..e808d5b1fa49 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -786,8 +786,16 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
>>>   	 * parent bus. During reboot, there will be ibm,dma-window property to
>>>   	 * define DMA window. For kdump, there will at least be default window or DDW
>>>   	 * or both.
>>> +	 * There is an exception to the above. In case the PE goes into frozen
>>> +	 * state, firmware may not provide ibm,dma-window property at the time
>>> +	 * of LPAR reboot.
>>>   	 */
>>>   
>>> +	if (!pdn) {
>>> +		pr_debug("  no ibm,dma-window property !\n");
>>> +		return;
>>> +	}
>>> +
>>>   	ppci = PCI_DN(pdn);
>>>   
>>>   	pr_debug("  parent is %pOF, iommu_table: 0x%p\n",
>>>
>>> base-commit: 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
>>> -- 
>>> 2.39.3 (Apple Git-146)
