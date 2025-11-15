Return-Path: <linuxppc-dev+bounces-14197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECBC60858
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 17:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7zVc2K5vz2yrQ;
	Sun, 16 Nov 2025 03:10:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763223000;
	cv=none; b=k7C3jsRRKUYysVr1ctbccocroCzLzczSe/O3PzQwWaPVgZ8vJK/zm2QmL28N/1r/VAqpPt1bLn+ivvCfRCpGq+zkcR/IxXdWLtZdtlhFp03CJ5HYP4NF/M+U8GXIlA60aMGnPQa+un/QXneCrxmToh+Q2OKzxWbH9RCRHUFiODzSqje9z+NCoF9Wuilt2gt3XUWRTdLq5ZN2lgMpTUzy/I5R5FpNb3QFn6YOx9U4BjfIvo8LFlYco5+SUtNLqony8rC8AJOzWmPP0ROFtpZWbUWVN2SLaM4Mng6SzvidwbBCJyshLrvDm+gpkKAg1FDk6BAXRcOjnz/06zxOCAkTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763223000; c=relaxed/relaxed;
	bh=5aeXLLodxctI/pPZxImkPY+GPKafvw9rs1/2OslTctY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAI4rFR+vrX/HcN/amlL4MnFJyP5CabR5iLuFzRB1sWQkD8lnWLp5zIbwInbTX36hg7UhTlN8xwQ1bH/wgeHEFDHGbprbC868X1T2J0DmtO9fVHYfLg0ji3NDdG1cbHAK01JsEfn6q8tMJOOONuH73b5yGAr2opeGpuizAADN9N+CBacOllNr2qAxP9F8iEej6yDcXKIy1gwHzGq75GvywKECVE/lfs2/OpznH9eetDiZ/FgiiSt+iOv3CjiH8tM1/+2KI5d1MTZelqg47yHl2tErm5kd1JHJdKTgjUDr5av0SAHbkVUgBNUADJOF3xRfeiddKjhkFxF24hxjzL6/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oDqfKQpV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oDqfKQpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7zVZ5hgLz2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Nov 2025 03:09:58 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AFBQfPY010931;
	Sat, 15 Nov 2025 16:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5aeXLL
	odxctI/pPZxImkPY+GPKafvw9rs1/2OslTctY=; b=oDqfKQpV1NuVWoNNVozN4C
	8xSl5/f+nRnqx+1QXSVq+kobKuA0d6ynqJnfxa/iSzJDWseBFdYcYcJj1Cbpw5Zf
	JYoAvDyUR2z/VMuFV3fAUNzgBfsSzYxLnWkR/Zo2606Qr4Qdpuczxzn7KjFc9MUs
	JxWclPikwoqApbvDz9b/S6taZ7Onh9YseKCAwJ2bTqpNRxcohFAikOBnJWiBqBqW
	XV6JiRJcAuhEyn9OZ+nvAhn/5f8Pbxwf3S86DTcL60AXx9K8KZnTIOwA6U5xHlef
	qkqRxSM4oGX/gbBkN2Z1F7XF4un6PtOx+ayJZ1F5bfbERmyziBhuMgBFl01N449w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwh2mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Nov 2025 16:09:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AFG9r70008447;
	Sat, 15 Nov 2025 16:09:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwh2mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Nov 2025 16:09:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AFC1jP7008182;
	Sat, 15 Nov 2025 16:09:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aah6ng92c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Nov 2025 16:09:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AFG9km641877920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Nov 2025 16:09:46 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAE2020043;
	Sat, 15 Nov 2025 16:09:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BE5C20040;
	Sat, 15 Nov 2025 16:09:43 +0000 (GMT)
Received: from [9.39.19.249] (unknown [9.39.19.249])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 15 Nov 2025 16:09:42 +0000 (GMT)
Message-ID: <a27ecae9-a001-4e57-86cf-09c2cc3d6371@linux.ibm.com>
Date: Sat, 15 Nov 2025 21:39:40 +0530
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
Subject: Re: [PATCH v4 0/5] kexec: reorganize sysfs interface and add new
 kexec sysfs
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Aditya Gupta <adityag@linux.ibm.com>,
        Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Sourabh Jain <sourabhjains@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradea
References: <20251114051504.614937-1-sourabhjain@linux.ibm.com>
 <20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9n2C37ByZa5_ROB86UWmrby0MJwyrkHq
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=6918a5d1 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=gKol05NBOib2xTfy92sA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: dVXF1qsjVYQdl2pEdgoUWq-DA0XY4uRS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+NLnRL/ZBXtZ
 Modz/yk8C4zjyeQsioo26dAgJHIVW6iKj5BonU4x+LeabDbs6qOnkD+LyRo2JtF0r5phrOUYiCh
 TVgna6iEjkOWx4ACZX39LKuD7CXpGAxTIsWyk98BQ4Axn++4DbEWK2pO7uMA1a6Oiub/KmhUkIl
 HLEwhA8+LkrOJcZ9x9fgA/bvGjxpY/ZsKFpy8KdudPOnQsWzqB+y/evMHcgrAEvgAr3avs26e3j
 f1bovNF3bBewnE/vE/9dnmFCzL0ddEdV/YJWE4K8Mdci6ElL8ah13uiq0Kl2gyXbjKV30GiuHl2
 9yAPgdiMMwcrkMrq4N02OOhAztt1DvkLX0UOkeDZ7NnvD/qK+MKd5bLvUMZ0w/YGOzC9KbSBdtN
 d4kyhbnWmPJklVVn0djxR6TN/Bqhew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 15/11/25 04:55, Andrew Morton wrote:
> On Fri, 14 Nov 2025 10:44:59 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> All existing kexec and kdump sysfs entries are moved to a new location,
>> /sys/kernel/kexec, to keep /sys/kernel/ clean and better organized.
>> Symlinks are created at the old locations for backward compatibility and
>> can be removed in the future [02/05].
>>
>> While doing this cleanup, missing ABI documentation for the old sysfs
>> interfaces is added, and those entries are marked as deprecated
>> [01/05 and 03/05]. New ABI documentation is also added for the
>> reorganized interfaces. [04/05]
>>
>> Along with this reorganization, a new sysfs file,
>> /sys/kernel/kexec/crash_cma_ranges, is introduced to export crashkernel
>> CMA reservation details to user space [05/05]. This helps tools
>> determine the total crashkernel reserved memory and warn users that
>> capturing user pages while CMA is reserved may cause incomplete or
>> unreliable dumps.
> Patchset does three unrelated things in remarkably random order.
>
> 1: Document existing stuff
>
> 	Great, thanks, in it goes.
>
> 2: export crashkernel CMA reservation to userspace
>
> 	Well, OK, probably reasonable, didn't look closely.
>
> 3: Alter longstanding userspace ABI with deprecation plan
>
> 	Whoa, tricky, needs careful consideration.
>
>
> So can we please prepare and consider this material in three separate
> patchsets?  In the above order, I suggest.

Yeah sure.

The question here is where to add the new CMA reservation sysfs.
Should I place it under /sys/kernel/ or create /sys/kernel/kexec and
add it there?

Since I am proposing that all kexec sysfs entries move to the new
location /sys/kernel/kexec, I am going to add the CMA reservation
sysfs under /sys/kernel/kexec to avoid creating a symlink for this
entry later in my third patch series.

- Sourabh


