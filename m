Return-Path: <linuxppc-dev+bounces-5486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4BA19D17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 04:07:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydm7x154Rz2xjK;
	Thu, 23 Jan 2025 14:07:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737601629;
	cv=none; b=GrN7dtQLLro9sdfX2GNN3oT/DHDYyE0+reTsTvi9l+rxYe0F9IbiZKLITArl6kuBf0yZMYT3nVivANfVFP1FlDt0hfs1Oeth69i9LdnW8TXAYwWZSrOZIboNS7mGvD6Hgqa1cx5ZBfMEiJu3CEUwPKzk5zzyvQWfweA7Hn+pXHfBEkdKgKtz9/dM/5fpl/Wspepy4pdKHKNIQIFrSjibJs0q+0nWayI6RK9BtFI2dbEMI4SMqTIJlGTimekZJrfrH7YxhWYj7iB1cvNZwsWyX8APNFOzSBgxfG3ERyIuWLoz6c7BjhCAW4efgPymQpslhdewa+WBzCIelW/gNDiDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737601629; c=relaxed/relaxed;
	bh=u8qPK/ZOpyWnAo6iJYxlN1jARwFQtqRdIa5HKxN3pFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okLsQqWDPLR9/LFaqVqNDSb+Kd6FJEhtgVVtsQmg94kPjcsuBbY5XEYi6+hS7xAjI71UJ3rGCBsQ5EdHJ0vI8b+EY/STho7tCvxVzqz1tDctd8GUXK+dyJSVTjsRflLMQ5tmLxQXhxuEi4IQNXjZxyn2LShSJNXCskTX2zBkME6FS1CfJB3vyZ1zckhze09Fd/URTQLjY7Hxp8pogd5WYRHMDc7X8qzGRbHtLL28nfoJCPjPiYez3Arci/tHkysSSpxVcvZnPM9rd8kBWD4n6eEmtOCzvxRqXI99y3V1tCqBAdhqBzMYS7gg0zNptM5Aaw6/hOIdZU97MD0sFBhveQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PtNVuSV7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PtNVuSV7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ydm7w1Nntz2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 14:07:07 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MFeuHS014610;
	Thu, 23 Jan 2025 03:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=u8qPK/
	ZOpyWnAo6iJYxlN1jARwFQtqRdIa5HKxN3pFs=; b=PtNVuSV7Y4qWNVFj/yppm2
	PGbBk2Q0JIpA6+mDjA7gHabzBuvBdblFZRB4AOMx9vchLYVOWTJ/qF7P7n+auy7g
	pv0GueTb4dwUvJfVA45bkxCwHn0UEqiGkOvCxYEt+ByR7C6oS39COKu/jAs2FrSP
	1egiVN+OH9NKbiYwiDus9pzo3XbnLDFyC541oVaAKCNYzRiXyA0NFKKrQp7Q3Iue
	D8SCsHzqCqBfGOt1HT9oKmBp48BGahthjsI4v7yVCs1IsfLlr+4QcvxEV1IBM8FI
	Wu+CRunylaXspklRpXw2XZKPZ7nGx2EMqJ5QlOUxaLAWVNAMl8qWfUD7Z29Wsy0Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44atg85hk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 03:06:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N259tF022387;
	Thu, 23 Jan 2025 03:06:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4kbdd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 03:06:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50N36nCT55443714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 03:06:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFB272004B;
	Thu, 23 Jan 2025 03:06:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B4AA20040;
	Thu, 23 Jan 2025 03:06:48 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 03:06:48 +0000 (GMT)
Message-ID: <2dc9ac76-30d8-44af-b8c1-c60be78753d5@linux.ibm.com>
Date: Thu, 23 Jan 2025 08:36:47 +0530
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
Subject: Re: [PATCH v2] powerpc: increase MIN RMA size for CAS negotiation
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Avnish Chouhan <avnish@linux.ibm.com>
Cc: mpe@ellerman.id.au, brking@linux.ibm.com, meghanaprakash@in.ibm.com
References: <20241206065545.14815-1-avnish@linux.ibm.com>
 <173754932979.1094869.8339209003148586969.b4-ty@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <173754932979.1094869.8339209003148586969.b4-ty@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s_FDxMky_aKjOqyWjAkkZBVdyWjN8FYI
X-Proofpoint-ORIG-GUID: s_FDxMky_aKjOqyWjAkkZBVdyWjN8FYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_11,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=798 clxscore=1015 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230021
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Maddy,

On 22/01/25 18:13, Madhavan Srinivasan wrote:
> On Fri, 06 Dec 2024 12:25:45 +0530, Avnish Chouhan wrote:
>> Change RMA size from 512 MB to 768 MB which will result
>> in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
>> Secure Boot or FADump, the 512 MB RMA memory is not sufficient for
>> booting. With this 512 MB RMA, GRUB2 run out of memory and unable to
>> load the necessary. Sometimes even usage of CDROM which requires more
>> memory for installation along with the options mentioned above troubles
>> the boot memory and result in boot failures. Increasing the RMA size
>> will resolves multiple out of memory issues observed in PowerPC.
>>
>> [...]
> Applied to powerpc/next.
>
> [1/1] powerpc: increase MIN RMA size for CAS negotiation
>        https://git.kernel.org/powerpc/c/ae908b87b6bb32c170e9baf5858f2a7553cacc06

The above changes break the fadump additional parameter for the HASH MMU.
Here is the proposed fix:
https://lore.kernel.org/all/20250120173501.1147236-1-sourabhjain@linux.ibm.com/

The proposed fix ensures that the memory reserved for the additional 
parameter for
fadump on the HASH MMU does not overlap with GRUB.

Please share your opinion on the fixes.

Thanks,
Sourabh Jain

