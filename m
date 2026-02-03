Return-Path: <linuxppc-dev+bounces-16553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAGVJN0ZgmmZPAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 16:53:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E312DB8BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 16:52:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f57L01ghHz30T8;
	Wed, 04 Feb 2026 02:52:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770133976;
	cv=none; b=AmkE7VM7Gk6zMohLuDUWoXCOg8EE5Y3YUz8hoT8picJNCIlRwUR8rVJkNOv5F6HoWxftsivV0rZn6EaTpf1+538GDlG+xm10EwyYD0zyqjvwhmSGwsB7CuIa7C9webqzujHTTUtYvuiSlc4ZAHoYudegzEJ3qcbpmoJ+wM00OKVCcoR/229syEoTGU8JhobZfLsd9TAvZxfIao3uA6ZH0Gyv9LVSoHZ0NERboorTW7bdMxs+80Tj/2m5XuUP6kqQaUyBeuUC85vXC3IXfpZZfRuk//K0RM6s7FMX2/DlwmpJKUqr+NoOsiE4czvOlY5B0g8fr1OsjrzOo0dP6TdkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770133976; c=relaxed/relaxed;
	bh=+IN/rZS09RmqSJcz3mq9tilgotyCw9gelQNf+laH/bg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QmM5+hQ7NydFRIkOc6A4YrylS+WRz+y2NYJwjCOjViYCggZWcZj1StIbItDS5iZlQNLfLmr2wmUkCnLlNx73qlIlIZbNNfuaSFnV02Mm6G0kDFd1+zcTnT7+vF4q26G8EjhK/q2KyJxgbF3DqEV6APiPGd0tb+DfJkBVxXGk62Hh7SHHCfChx5qR8CLbvN5Z4tWsEo+2qdAHQXmTc7gK+fG4tq4o1tQEh4qm3foL3NuVRPi0RwpAm2D9x/ndsUWa1fkEnr7pokfNH8rEOJMkoChyIKLhv8phCF9iSmTFKEKRVNqdienb/J5q3xDqZfPTgM0VFi04SssJp1SMudkPxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lF/e/bwL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lF/e/bwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f57Ky3zxtz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 02:52:53 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6138iuEk007530;
	Tue, 3 Feb 2026 15:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+IN/rZ
	S09RmqSJcz3mq9tilgotyCw9gelQNf+laH/bg=; b=lF/e/bwLVDpBaBIxq5Z2WT
	OJQu1UhMylC8zjsI5XF3dVOp3jlVhvu9c2Qw9vAlFUQMstadl1j7mW3I6Plr+wJJ
	ofZ9XWpRlvOm3ADpZpdbdt4cHXsuN6jihSBd/a3Jt4wRMR1YlMp/nKQv6K2YAaVe
	wXG92UUZkyOfG4MtmKmwwMo2kvNzJstdVKZBUWq7fQwwSp7dCmL6ptTmVygpsVJ1
	vIRV+SeHLBEA0pEYuKSBFAr2sr9sn62GZE5Vh0VEKQE07rbFsIZvVDDaUk+SENFx
	o81BcpOkE3CV48P2eHw5c58mklQrRww5AdGtlt6Uc5Xo0teAHExCNSyMSTc0Qdaw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175mv106-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 15:52:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 613FqO3v028480;
	Tue, 3 Feb 2026 15:52:24 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175mv104-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 15:52:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 613FMTfX025706;
	Tue, 3 Feb 2026 15:52:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c1w2msqka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 15:52:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 613FqI9e50463178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Feb 2026 15:52:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F5ED20043;
	Tue,  3 Feb 2026 15:52:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFDCA20040;
	Tue,  3 Feb 2026 15:52:14 +0000 (GMT)
Received: from [9.39.23.245] (unknown [9.39.23.245])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Feb 2026 15:52:14 +0000 (GMT)
Message-ID: <2127b181-2c3a-4470-9b79-b508a18275c9@linux.ibm.com>
Date: Tue, 3 Feb 2026 21:22:13 +0530
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
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, iommu@lists.linux.dev, chleroy@kernel.org,
        mpe@ellerman.id.au, maddy@linux.ibm.com, npiggin@gmail.com,
        alex@shazbot.org, joerg.roedel@amd.com, kevin.tian@intel.com,
        gbatra@linux.ibm.com, clg@kaod.org, vaibhav@linux.ibm.com,
        brking@linux.vnet.ibm.com, nnmlinux@linux.ibm.com,
        amachhiw@linux.ibm.com, tpearson@raptorengineering.com
References: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
 <20260127191643.GQ1134360@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260127191643.GQ1134360@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pWb_DcVWnKcehlEza_1Eg7EunqW9zHFk
X-Authority-Analysis: v=2.4 cv=VcX6/Vp9 c=1 sm=1 tr=0 ts=698219b8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QKzg-OcEkSzzUhcykKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WqHfrzIaLJB0eb712i9ZnJpDaRgynrjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEyMyBTYWx0ZWRfX8hSWMsUf6TZA
 cJA/2Ti1RfFBzsi2+8VKb9ioe4oBfl6/3kmn8TkWIzIIWvRYbqxSQAxbSfHca4quSPe672aCZwS
 +/ZCPOjf/r0NzHC+PtEYs7PHi2Fw8icoFXD4GX+jJtGH5sxmKs3R5dRo2f7V+U5zibHRO2TGJMy
 PCaARCFiNpvoEPRAtimrOZnfXjJju52Lcj/nT2edErYOJ+bRANYL3/fpPj15JiyWyq9TTPxuvMe
 YprzV2er9pLSx+04UPaO0lKyMD1ywJ2Mo3ZiiKslUtQIeXHXrsRun6eRCXipafHnQI+RWOJx3UB
 qNd2YYO5B9O7ERkzEOFAMehFCbrrFm0v/cj58t7wGJds8Xhixfr5H6+TM3U0J404Oz/DOdYHKP7
 iZXv5h5qXsuQxQ8Zkw4EOkTdijtejFHrHrQw6Gmh091uNOLr7euureQXcJho5CfPvJhyWqOq00w
 0gS9Lm7w2T34tgGAY1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2602030123
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16553-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:iommu@lists.linux.dev,m:chleroy@kernel.org,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:alex@shazbot.org,m:joerg.roedel@amd.com,m:kevin.tian@intel.com,m:gbatra@linux.ibm.com,m:clg@kaod.org,m:vaibhav@linux.ibm.com,m:brking@linux.vnet.ibm.com,m:nnmlinux@linux.ibm.com,m:amachhiw@linux.ibm.com,m:tpearson@raptorengineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sbhat@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,lists.linux.dev,kernel.org,ellerman.id.au,linux.ibm.com,gmail.com,shazbot.org,amd.com,intel.com,kaod.org,linux.vnet.ibm.com,raptorengineering.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sbhat@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: 1E312DB8BF
X-Rspamd-Action: no action

Hi Jason,


Thanks for reviewing this patch.


On 1/28/26 12:46 AM, Jason Gunthorpe wrote:
> On Tue, Jan 27, 2026 at 06:35:56PM +0000, Shivaprasad G Bhat wrote:
>> The RFC attempts to implement the IOMMUFD support on PPC64 by
>> adding new iommu_ops for paging domain. The existing platform
>> domain continues to be the default domain for in-kernel use.
> It would be nice to see the platform domain go away and ppc use the
> normal dma-iommu.c stuff, but I don't think it is critical to making
> it work with iommufd.


I agree. I have started on this. I will send incremental changes

as follow-up after this.


>> On PPC64, IOVA ranges are based on the type of the DMA window
>> and their properties. Currently, there is no way to expose the
>> attributes of the non-default 64-bit DMA window, which the platform
>> supports. The platform allows the operating system to select the
>> starting offset(at 4GiB or 512PiB default offset), pagesize and
>> window size for the non-default 64-bit DMA window. For example,
>> with VFIO, this is handled via VFIO_IOMMU_SPAPR_TCE_GET_INFO
>> and VFIO_IOMMU_SPAPR_TCE_CREATE|REMOVE ioctls. While I am exploring
>> the ways to expose and configure these DMA window attributes as
>> per user input, any suggestions in this regard will be very helpful.
> You can pass in driver specific information during HWPT creation, so
> any properties you need can be specified there.


Sure. I think IOMMU_GET_HW_INFO would be useful for getting the

platform supported configuration in this case.


> Then you'd want to introduce a new domain op to get the apertures
> instead of the single range hard coded into the domain struct. The new
> op would be able to return a list. We can use this op to return
> apertures for sign extension page tables too.
>
> Update iommufd to calculate the reserved regions by evaluating the
> whole list.
>
> I think you'll find this pretty straight forward, I'd do it as a
> followup patch to this one.


Thanks. I will wait for that patch.


>
>> Currently existing vfio type1 specific vfio-compat driver even
>> with this patch will not work for PPC64. I believe we need to have
>> a separate "vfio-spapr-compat" driver to make it work.
> Yes, vfio-compat doesn't support the special spapr ioctls.
>
> I don't think you need a new driver, just implement whatever they do
> with the existing interfaces, probably in its own .c file though.

There are ioctl number conflicts like

# grep -n "VFIO_BASE + 1[89]" include/uapi/linux/vfio.h | grep define
940:#defineVFIO_DEVICE_BIND_IOMMUFD_IO(VFIO_TYPE, VFIO_BASE + 18)
976:#defineVFIO_DEVICE_ATTACH_IOMMUFD_PT_IO(VFIO_TYPE, VFIO_BASE + 19)
1833:#defineVFIO_IOMMU_SPAPR_UNREGISTER_MEMORY_IO(VFIO_TYPE, VFIO_BASE + 18)
1856:#defineVFIO_IOMMU_SPAPR_TCE_CREATE_IO(VFIO_TYPE, VFIO_BASE + 19)
# grep -n "VFIO_BASE + 20" include/uapi/linux/vfio.h | grep define
999:#defineVFIO_DEVICE_DETACH_IOMMUFD_PT_IO(VFIO_TYPE, VFIO_BASE + 20)
1870:#defineVFIO_IOMMU_SPAPR_TCE_REMOVE_IO(VFIO_TYPE, VFIO_BASE + 20)

> However, I have no idea what is required to implement those ops, or if
> it is even possible.. It may be easier to just leave the old vfio
> stuff around instead of trying to compat it. The purpose of compat was
> to be able to build kernels without type1 at all. It isn't necessary
> to start using iommufd in new apps with the new interfaces.
>
> Given you are mainly looking at a VMM that already will have iommufd
> support it may not be worthwhile.


You are right. We do have some use cases beyond VMM, I will consider 
compat driver

only if it is helpful there.


>> @@ -1201,7 +1201,15 @@ spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
>>   	 * also sets the dma_api ops
>>   	 */
>>   	table_group = iommu_group_get_iommudata(grp);
>> +
>> +	if (old && old->type == IOMMU_DOMAIN_DMA) {
> I'm trying to delete IOMMU_DOMAIN_DMA please don't use it in
> drivers.
Sure.
>>   static const struct iommu_ops spapr_tce_iommu_ops = {
>>   	.default_domain = &spapr_tce_platform_domain,
>>   	.blocked_domain = &spapr_tce_blocked_domain,
>> @@ -1267,6 +1436,14 @@ static const struct iommu_ops spapr_tce_iommu_ops = {
>>   	.probe_device = spapr_tce_iommu_probe_device,
>>   	.release_device = spapr_tce_iommu_release_device,
>>   	.device_group = spapr_tce_iommu_device_group,
>> +	.domain_alloc_paging = spapr_tce_domain_alloc_paging,
>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>> +		.attach_dev     = spapr_tce_iommu_attach_device,
>> +		.map_pages      = spapr_tce_iommu_map_pages,
>> +		.unmap_pages    = spapr_tce_iommu_unmap_pages,
>> +		.iova_to_phys   = spapr_tce_iommu_iova_to_phys,
>> +		.free           = spapr_tce_domain_free,
>> +	}
> Please don't use default_domain_ops in a driver that is supporting
> multiple domain types and platform, it becomes confusing to guess
> which domain type those ops are linked to.


Sure.


> You should also implement the BLOCKING domain type to make VFIO work
> better


I am not sure how this could help making VFIO better. May be, I am not able

to imagine the advantages with the current platform domain approach

in place. Could you please elaborate more on this?


> I wouldn't try to guess if this is right or not, but it looks pretty
> reasonable as a first start.


Thanks, I will iterate this as RFC till i get to reasonable shape.


Regards,

Shivaprasad

> Jason

