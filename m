Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAEF333125
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 22:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw7ws2D4rz3dJG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 08:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J+IGfQQ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=danielhb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J+IGfQQ0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw1rh1xDQz3cHt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 04:08:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129H4SQO029633; Tue, 9 Mar 2021 12:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C0fDfYqggF6O0TWpq41g6VG0VKKQPEaDC8TEUW8hVHI=;
 b=J+IGfQQ0b6uckEy2aSvKAqlfMZCES3PnVJL253+7sQH+Yq5bnv6aBFsypWA5lf74gqVE
 kn2DYhKa16yIsYouLZPgBHQxS39JnSCmWea+4y1ajqAFDCjbnT8BPMvAIdNNPo8Wo3y7
 JkF32dQlgD+zDIWF83aekDBRzaOllw2MDdrx0iiZ6ty1ZLBJxOogBBIfFLNoABYwYwuI
 rSQaYeomwYgrjPsdZhzLg4eHTsNcHQQJIZu5zhGyckyLywcSMCuLHSKr2g5roXpcYgve
 y2XD0kbauI5/wQlj0kHyFTIq7hbek7UKWWYj+McXQ8f+IDo2JJr7thL8DkSgRk3HaAOt iw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 376d190a8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 12:08:33 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129H54Jh006903;
 Tue, 9 Mar 2021 17:08:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3768n49v9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 17:08:32 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129H8WA826411376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 17:08:32 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27F50AC05B;
 Tue,  9 Mar 2021 17:08:32 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D26DAC06D;
 Tue,  9 Mar 2021 17:08:31 +0000 (GMT)
Received: from [9.85.132.103] (unknown [9.85.132.103])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Mar 2021 17:08:31 +0000 (GMT)
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org> <20210308181359.789c143b@bahia.lan>
 <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
Message-ID: <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
Date: Tue, 9 Mar 2021 14:08:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_14:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103090083
X-Mailman-Approved-At: Wed, 10 Mar 2021 08:42:20 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/9/21 12:33 PM, Cédric Le Goater wrote:
> On 3/8/21 6:13 PM, Greg Kurz wrote:
>> On Wed, 3 Mar 2021 18:48:50 +0100
>> Cédric Le Goater <clg@kaod.org> wrote:
>>
>>> The 'chip_id' field of the XIVE CPU structure is used to choose a
>>> target for a source located on the same chip when possible. This field
>>> is assigned on the PowerNV platform using the "ibm,chip-id" property
>>> on pSeries under KVM when NUMA nodes are defined but it is undefined
>>
>> This sentence seems to have a syntax problem... like it is missing an
>> 'and' before 'on pSeries'.
> 
> ah yes, or simply a comma.
> 
>>> under PowerVM. The XIVE source structure has a similar field
>>> 'src_chip' which is only assigned on the PowerNV platform.
>>>
>>> cpu_to_node() returns a compatible value on all platforms, 0 being the
>>> default node. It will also give us the opportunity to set the affinity
>>> of a source on pSeries when we can localize them.
>>>
>>
>> IIUC this relies on the fact that the NUMA node id is == to chip id
>> on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
>> with this change.
> 
> Linux sets the NUMA node in numa_setup_cpu(). On pseries, the hcall
> H_HOME_NODE_ASSOCIATIVITY returns the node id if I am correct (Daniel
> in Cc:)

That's correct. H_HOME_NODE_ASSOCIATIVITY returns not only the node_id, but
a list with the ibm,associativity domains of the CPU that "proc-no" (processor
identifier) is mapped to inside QEMU.

node_id in this case, considering that we're working with a reference-points
of size 4, is the 4th element of the returned list. The last element is
"procno" itself.


> 
> On PowerNV, Linux uses "ibm,associativity" property of the CPU to find
> the node id. This value is built from the chip id in OPAL, so the
> value returned by cpu_to_node(cpu) and the value of the "ibm,chip-id"
> property are unlikely to be different.
> 
> cpu_to_node(cpu) is used in many places to allocate the structures
> locally to the owning node. XIVE is not an exception (see below in the
> same patch), it is better to be consistent and get the same information
> (node id) using the same routine.
> 
> 
> In Linux, "ibm,chip-id" is only used in low level PowerNV drivers :
> LPC, XSCOM, RNG, VAS, NX. XIVE should be in that list also but skiboot
> unifies the controllers of the system to only expose one the OS. This
> is problematic and should be changed but it's another topic.
> 
> 
>> On the other hand, you have the pSeries case under PowerVM that
>> doesn't xc->chip_id, which isn't passed to any hcall AFAICT.
> 
> yes "ibm,chip-id" is an OPAL concept unfortunately and it has no meaning
> under PAPR. xc->chip_id on pseries (PowerVM) will contains an invalid
> chip id.
> 
> QEMU/KVM exposes "ibm,chip-id" but it's not used. (its value is not
> always correct btw)


If you have a way to reliably reproduce this, let me know and I'll fix it
up in QEMU.



Thanks,


DHB


> 
>> It looks like the chip id is only used for localization purpose in
>> this case, right ?
> 
> Yes and PAPR sources are not localized. So it's not used. MSI sources
> could be if we rewrote the MSI driver.
> 
>> In this case, what about doing this change for pSeries only,
>> somewhere in spapr.c ?
> 
> The IPI code is common to all platforms and all have the same issue.
> I rather not.
> 
> Thanks,
> 
> C.
>   
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   arch/powerpc/sysdev/xive/common.c | 7 +------
>>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>>> index 595310e056f4..b8e456da28aa 100644
>>> --- a/arch/powerpc/sysdev/xive/common.c
>>> +++ b/arch/powerpc/sysdev/xive/common.c
>>> @@ -1335,16 +1335,11 @@ static int xive_prepare_cpu(unsigned int cpu)
>>>   
>>>   	xc = per_cpu(xive_cpu, cpu);
>>>   	if (!xc) {
>>> -		struct device_node *np;
>>> -
>>>   		xc = kzalloc_node(sizeof(struct xive_cpu),
>>>   				  GFP_KERNEL, cpu_to_node(cpu));
>>>   		if (!xc)
>>>   			return -ENOMEM;
>>> -		np = of_get_cpu_node(cpu, NULL);
>>> -		if (np)
>>> -			xc->chip_id = of_get_ibm_chip_id(np);
>>> -		of_node_put(np);
>>> +		xc->chip_id = cpu_to_node(cpu);
>>>   		xc->hw_ipi = XIVE_BAD_IRQ;
>>>   
>>>   		per_cpu(xive_cpu, cpu) = xc;
>>
> 
