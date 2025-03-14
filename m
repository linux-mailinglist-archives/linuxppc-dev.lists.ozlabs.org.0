Return-Path: <linuxppc-dev+bounces-7051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97099A60EFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 11:33:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDgh96sdTz3cYZ;
	Fri, 14 Mar 2025 21:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741948425;
	cv=none; b=FrAigxMzmR6djB2PPd5MWKpts84T2MyoUjiLOHA+EXvm41OCdjp4Z/YXJ+BVybju9zo9vuLcBSa2qmqfnh37YnAx9UsVQXjtMIZ4QRXcz80QKNTmMYKEv0GJYyVXoYAe+4c3uktxy9ywWWYzxUZmafpKgmexbHrPfuqqhfU8poK8ED44XyN3cPJRcGnFb68HAjRZQn40r9y+x787h0m93ErLf3dhbeOjjIMq9nA6qkPGDg83CyJ9YkTd8eCTJQM66zrqnOWaetWS6kjBYHa7Mg1yJF0dIFBOe0ViY/Nbd5hs8w6zZU5PKkknbnP5ynawbWeMq7kUx8D3abN+qthGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741948425; c=relaxed/relaxed;
	bh=Zehx15J+Iu9s0WruS0o895sbHmnpA1v5UGFy+CYZIYs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ioYOq84ML0uSRPxwlYPU9TBgBNabNozF88bJ5YPp2QjbZ/UN031e4GLDrMD1tdvIV5sIv+xToeB1vFeeh2X0MiBtyMe+4629QNLqjeH/oQaEDP98LqJiNEiabzpMQUqozxChubcdsWGO4gTNe0/r7YsWjSHh4A5dDSESn7vY8AbUAVpRQ3m3rVLX2DloMCMQDP1yNOwqm3Caa3q5GaiKFRcxhQAA32dz+H+AT9KDlGQHuGDWzZfGkgc7Y211Kwoue9sDdy5HzWMjNpJx6/owjMsRIbKtaeKC3C0asJRqV8izdOs8iQ3I2mQNKZqr2M5Uky43AXrtbIETioNU7h+Z5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G59gc53B; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G59gc53B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDgh840kSz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 21:33:43 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNPAP6032478;
	Fri, 14 Mar 2025 10:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Zehx15
	J+Iu9s0WruS0o895sbHmnpA1v5UGFy+CYZIYs=; b=G59gc53BK418TbwPRKEUVX
	hlWSymuhEc/i9H6i5B8k/7oTfRhi5yp5RjpCdTCH8zZSSmoUsHSixysIsgqFQHft
	sPAXuSvYlJE9gENlcfob8tLkXol3pBx9fVkTrb6CHZcpl/h+nxz0FXWnhtBC5uCf
	WRdd/2DDZQUG+Hln4+vsfLFlOeBgsST0kNge4p4T0VxPpI6YmgwoQOXY+1to2qHI
	Z0+bDbsf+BKI2KMRpvGE4h6aqUFlsNQ+LtM78NgHsx7PBWVBzWhux/YHGpSWsU7n
	MMEHbiGRZryhJZmJMiEPt7PtoiPm3N4kxtn02/tsjyI39bnlDZbwzg8gagsOgAUA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6hpu4sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 10:33:29 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52EAV1gT022665;
	Fri, 14 Mar 2025 10:33:29 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6hpu4se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 10:33:29 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8WSwZ015357;
	Fri, 14 Mar 2025 10:33:28 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atsppfwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 10:33:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EAXOVt46268764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 10:33:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3B7E20043;
	Fri, 14 Mar 2025 10:33:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13F2D2004E;
	Fri, 14 Mar 2025 10:33:22 +0000 (GMT)
Received: from [9.39.22.126] (unknown [9.39.22.126])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 10:33:21 +0000 (GMT)
Message-ID: <cb0c10be-2c86-4b14-9f2b-5e00e4d8ae4d@linux.ibm.com>
Date: Fri, 14 Mar 2025 16:03:21 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] powerpc: powenv: oxcl: use lock guard for mutex
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: ajd@linux.ibm.com
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, fbarrat@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
 <20250314054544.1998928-6-sshegde@linux.ibm.com>
 <d6999d74-45f6-413a-8881-90473b322dfa@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <d6999d74-45f6-413a-8881-90473b322dfa@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IgaT5YasunpTLXjhRCLnVAvnQ9Mh7IHA
X-Proofpoint-ORIG-GUID: F-LiitUIB4IY-Iw_HplT5YqSh7kdHWj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/14/25 15:00, Shrikanth Hegde wrote:
> 
> 
> On 3/14/25 11:15, Shrikanth Hegde wrote:
>> use guard(mutex) for scope based resource management of mutex.
>> This would make the code simpler and easier to maintain.
>>
>> More details on lock guards can be found at
>> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/ocxl.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/ 
>> platforms/powernv/ocxl.c
>> index 64a9c7125c29..f8139948348e 100644
>> --- a/arch/powerpc/platforms/powernv/ocxl.c
>> +++ b/arch/powerpc/platforms/powernv/ocxl.c
>> @@ -172,12 +172,11 @@ static void pnv_ocxl_fixup_actag(struct pci_dev 
>> *dev)
>>       if (phb->type != PNV_PHB_NPU_OCAPI)
>>           return;
>> -    mutex_lock(&links_list_lock);
>> +    guard(mutex)(&links_list_lock);
>>       link = find_link(dev);
>>       if (!link) {
>>           dev_warn(&dev->dev, "couldn't update actag information\n");
>> -        mutex_unlock(&links_list_lock);
>>           return;
>>       }
>> @@ -206,7 +205,6 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
>>       dev_dbg(&dev->dev, "total actags for function: %d\n",
>>           link->fn_desired_actags[PCI_FUNC(dev->devfn)]);
>> -    mutex_unlock(&links_list_lock);
>>   }
>>   DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_ocxl_fixup_actag);
>> @@ -253,12 +251,11 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 
>> *base, u16 *enabled,
>>   {
>>       struct npu_link *link;
>> -    mutex_lock(&links_list_lock);
>> +    guard(mutex)(&links_list_lock);
>>       link = find_link(dev);
>>       if (!link) {
>>           dev_err(&dev->dev, "actag information not found\n");
>> -        mutex_unlock(&links_list_lock);
>>           return -ENODEV;
>>       }
>>       /*
>> @@ -274,7 +271,6 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 
>> *base, u16 *enabled,
>>       *enabled   = link->fn_actags[PCI_FUNC(dev->devfn)].count;
>>       *supported = link->fn_desired_actags[PCI_FUNC(dev->devfn)];
>> -    mutex_unlock(&links_list_lock);
>>       return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(pnv_ocxl_get_actag);
>> @@ -293,12 +289,11 @@ int pnv_ocxl_get_pasid_count(struct pci_dev 
>> *dev, int *count)
>>        *
>>        * We only support one AFU-carrying function for now.
>>        */
>> -    mutex_lock(&links_list_lock);
>> +    guard(mutex)(&links_list_lock);
>>       link = find_link(dev);
>>       if (!link) {
>>           dev_err(&dev->dev, "actag information not found\n");
>> -        mutex_unlock(&links_list_lock);
>>           return -ENODEV;
>>       }
>> @@ -309,7 +304,6 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, 
>> int *count)
>>               break;
>>           }
>> -    mutex_unlock(&links_list_lock);
> 
> Hi. Andrew,
> 
> After this change below dev_dbg will be called with mutex held still. Is 
> that a concern? I don't see the mutex being used in that path.
> 
> Since using scoped_guard cause more code churn here, I would prefer not 
> use it.

I see current code in pnv_ocxl_fixup_actag calls dev_dbg with mutex 
held. So likely not a concern of using just guard in 
pnv_ocxl_get_pasid_count as well.

Assuming that, let me send out v2 with corrected commit subject. :w

> 
>>       dev_dbg(&dev->dev, "%d PASIDs available for function\n",
>>           rc ? 0 : *count);
>>       return rc;
> 


