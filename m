Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF1854270
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 06:35:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KLVjjEBM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZRjW727Rz3vX2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 16:35:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KLVjjEBM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZRhl0qd9z2ytd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 16:34:30 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41E4vlrQ031412;
	Wed, 14 Feb 2024 05:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2v0hlwpBVJIDoWo3D4rG6ozciu8MtAw5fKJ6M/0ZGtA=;
 b=KLVjjEBMoqqxjWiQsGgV9Gs0dYzXQXlHvsRIJMWuXJVEwit72eowV8sL1Yg5SAeioXNg
 HBvpY/VJf+ipoSUMz03mLOTr7CmzRHHq0Bsub64Tr4ECyheIsvw5eAXLl3gEEq7LO46S
 xeGGbIJx7Eow8aG17toiZl8MrrAIBUKvhvGslflr1XQQLb+Wt6+nAsCSzOyi9FCL0c/x
 +RzztIOrMvoPiAENdkYLgX5PZrc2o1NPBLNwa+cQoEEHkejWVbAi6Yji9t9WcB6k2KQo
 LCmPEoXmc6jjspObIlvg6jyfa4t0blrUa+jitoCxBUplmqE8tJ05hbpEltao0dubhSk1 Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8pxmgw5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 05:34:13 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41E4w2EM032629;
	Wed, 14 Feb 2024 05:34:12 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8pxmgw51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 05:34:12 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41E2NvJ0004339;
	Wed, 14 Feb 2024 05:34:11 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0c6e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 05:34:11 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41E5Y8OF26280472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Feb 2024 05:34:10 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A15158058;
	Wed, 14 Feb 2024 05:34:08 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A4855806B;
	Wed, 14 Feb 2024 05:34:02 +0000 (GMT)
Received: from [9.43.87.202] (unknown [9.43.87.202])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Feb 2024 05:34:02 +0000 (GMT)
Message-ID: <4f5e638d-30a2-4207-b515-d07c20b0fb47@linux.vnet.ibm.com>
Date: Wed, 14 Feb 2024 11:04:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/iommu: Fix the missing iommu_group_put() during
 platform domain attach
Content-Language: en-GB
To: Jason Gunthorpe <jgg@ziepe.ca>, Shivaprasad G Bhat <sbhat@linux.ibm.com>
References: <170784021983.6249.10039296655906636112.stgit@linux.ibm.com>
 <20240213172128.GM765010@ziepe.ca>
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <20240213172128.GM765010@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VEN0Ab5lxghBOi28HwoCQawyJkmQ3Lg6
X-Proofpoint-GUID: uUo8j74xaYSgknAAVs_YIypAe1HaCi1W
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=468 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2402140041
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the patch. Applied this patch and verified and issue is fixed.

This issue way originally reported in the below mail.

https://marc.info/?l=linux-kernel&m=170737160630106&w=2


Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>

On 13/02/24 10:51 pm, Jason Gunthorpe wrote:
> On Tue, Feb 13, 2024 at 10:05:22AM -0600, Shivaprasad G Bhat wrote:
>> The function spapr_tce_platform_iommu_attach_dev() is missing to call
>> iommu_group_put() when the domain is already set. This refcount leak
>> shows up with BUG_ON() during DLPAR remove operation as,
>>
>>    KernelBug: Kernel bug in state 'None': kernel BUG at arch/powerpc/platforms/pseries/iommu.c:100!
>>    Oops: Exception in kernel mode, sig: 5 [#1]
>>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
>>    <snip>
>>    Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_016) hv:phyp pSeries
>>    NIP:  c0000000000ff4d4 LR: c0000000000ff4cc CTR: 0000000000000000
>>    REGS: c0000013aed5f840 TRAP: 0700   Tainted: G          I         (6.8.0-rc3-autotest-g99bd3cb0d12e)
>>    MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44002402  XER: 20040000
>>    CFAR: c000000000a0d170 IRQMASK: 0
>>    GPR00: c0000000000ff4cc c0000013aed5fae0 c000000001512700 c0000013aa362138
>>    GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000119c8afd0
>>    GPR08: 0000000000000000 c000001284442b00 0000000000000001 0000000000001003
>>    GPR12: 0000000300000000 c0000018ffff2f00 0000000000000000 0000000000000000
>>    GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>    GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>    GPR24: c0000013aed5fc40 0000000000000002 0000000000000000 c000000002757d90
>>    GPR28: c0000000000ff440 c000000002757cb8 c00000183799c1a0 c0000013aa362b00
>>    NIP [c0000000000ff4d4] iommu_reconfig_notifier+0x94/0x200
>>    LR [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200
>>    Call Trace:
>>    [c0000013aed5fae0] [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200 (unreliable)
>>    [c0000013aed5fb10] [c0000000001a27b0] notifier_call_chain+0xb8/0x19c
>>    [c0000013aed5fb70] [c0000000001a2a78] blocking_notifier_call_chain+0x64/0x98
>>    [c0000013aed5fbb0] [c000000000c4a898] of_reconfig_notify+0x44/0xdc
>>    [c0000013aed5fc20] [c000000000c4add4] of_detach_node+0x78/0xb0
>>    [c0000013aed5fc70] [c0000000000f96a8] ofdt_write.part.0+0x86c/0xbb8
>>    [c0000013aed5fce0] [c00000000069b4bc] proc_reg_write+0xf4/0x150
>>    [c0000013aed5fd10] [c0000000005bfeb4] vfs_write+0xf8/0x488
>>    [c0000013aed5fdc0] [c0000000005c0570] ksys_write+0x84/0x140
>>    [c0000013aed5fe10] [c000000000033358] system_call_exception+0x138/0x330
>>    [c0000013aed5fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>    --- interrupt: 3000 at 0x20000433acb4
>>    <snip>
>>    ---[ end trace 0000000000000000 ]---
>>
>> The patch adds the missing iommu_group_put() call.
>>
>> Fixes: a8ca9fc9134c ("powerpc/iommu: Do not do platform domain attach atctions after probe")
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/iommu.c |    4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> Doh, that is a weird splat for this but thanks for finding it
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Jason
>
