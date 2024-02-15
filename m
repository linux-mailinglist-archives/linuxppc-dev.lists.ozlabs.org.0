Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5EC856525
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:58:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=icozl3lF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbGqv04mgz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:58:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=icozl3lF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbGq71NHTz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 00:57:54 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDOnsM001544;
	Thu, 15 Feb 2024 13:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=X0suQNFEHvQ2shx1pc+fvDh0m23DaOEo738rP4hZFew=;
 b=icozl3lFDyZ9ngKKCD1AHMk4xbHc04lFZZXnD44RPBNA3IoMfYcd36aWxPc2qo7DsaMp
 DxOh/Vu10y3xVd95bZB/OmS9M9HWWFuanK997bL43gJhGVLIYDaqLlDckIof8MYyVzAa
 OeXg61T5tXMN7zHE2cU3/+TA19XG8UGhl5idm6CtHI88EbnJCBzOxTayCMN3SDa5CE+U
 fPsKsRtSA7C8WEXFCzOUzgQw3jx9W6CvontYI+eDOqpaur0U6/S7GEJo+0uY5J8WT2RB
 RLeZob+G4Xpf2MNyRE0HdPZwTYwqtI250cDjtTkXC6wqcmMCAEMkdGDbjgtBf7/ieZBS NA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9k9mh7ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:57:39 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDncTr010711;
	Thu, 15 Feb 2024 13:57:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9k9mh79q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:57:38 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FAxELW016479;
	Thu, 15 Feb 2024 13:57:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mymvysv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:57:36 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FDvSUh54264310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:57:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD45E20063;
	Thu, 15 Feb 2024 13:57:28 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03E332004B;
	Thu, 15 Feb 2024 13:57:25 +0000 (GMT)
Received: from [9.43.28.148] (unknown [9.43.28.148])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 13:57:24 +0000 (GMT)
Message-ID: <ca971b81-9e4f-4baa-aee4-f62fb71b4629@linux.ibm.com>
Date: Thu, 15 Feb 2024 19:27:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/iommu: Fix the iommu group reference leak
 during platform domain attach
To: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org
References: <170793401503.7491.9431631474642074097.stgit@linux.ibm.com>
 <875xyq791x.fsf@mail.lhotse>
Content-Language: en-US
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <875xyq791x.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xm9FzCdx3dwzk3DeFLahWOyHUCSLSCBY
X-Proofpoint-ORIG-GUID: 7GZTpASZG725VFksiHxTN1RJIRl1fLZD
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=619 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150112
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
Cc: venkat88@linux.vnet.ibm.com, jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, jgg@ziepe.ca, tpearson@raptorengineering.com, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/15/24 08:01, Michael Ellerman wrote:
> Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:
>> The function spapr_tce_platform_iommu_attach_dev() is missing to call
>> iommu_group_put() when the domain is already set. This refcount leak
>> shows up with BUG_ON() during DLPAR remove operation as,
<snip>
>>    [c0000013aed5fd10] [c0000000005bfeb4] vfs_write+0xf8/0x488
>>    [c0000013aed5fdc0] [c0000000005c0570] ksys_write+0x84/0x140
>>    [c0000013aed5fe10] [c000000000033358] system_call_exception+0x138/0x330
>>    [c0000013aed5fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>    --- interrupt: 3000 at 0x20000433acb4
>>    <snip>
>>    ---[ end trace 0000000000000000 ]---
>>
>> The patch makes the iommu_group_get() call only when using it there by
>> avoiding the leak.
>>
>> Fixes: a8ca9fc9134c ("powerpc/iommu: Do not do platform domain attach atctions after probe")
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>> Closes: https://lore.kernel.org/all/274e0d2b-b5cc-475e-94e6-8427e88e271d@linux.vnet.ibm.com
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>> ---
>> Changelog:
>> v1: https://lore.kernel.org/all/170784021983.6249.10039296655906636112.stgit@linux.ibm.com/
>>   - Minor refactor to call the iommu_group_get() only if required.
>>   - Updated the title, description and signature(Closes/Reported-by).
> Sorry I already applied v1.
>
> If you send this as a patch on top of v1 with a new change log I can
> merge it as a cleanup/rework.

I have posted the cleanup patch at 
https://lore.kernel.org/linux-iommu/170800513841.2411.13524607664262048895.stgit@linux.ibm.com/

Thank you!

Shivaprasad

> cheers
