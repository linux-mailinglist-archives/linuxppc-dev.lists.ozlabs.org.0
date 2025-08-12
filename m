Return-Path: <linuxppc-dev+bounces-10878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C2B232CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 20:21:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1fwY4WJ7z2xHY;
	Wed, 13 Aug 2025 04:21:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755022909;
	cv=none; b=DnMTb9PeZGOV1Mk1XGn5SnPI5OKHh5ZUBcOwVVCGVFjJ3/BfFHu2U4CeWU1uuv/lFRQDDF2OfjrmwS4lV2is25FFUIebtWM97huMmCueBucJmEVbs21OpsahGnBa1UT9azPJ7u6+zdsQ0Fm6V4X9MeV8u6qB8GG7f9Vft7PaaW04lUMn4kQp8TF8QV+E++hGrESpk2y+twgT7bHdG4dx23C+1YNJ8dAwO/N6yEsrNLOd8mPBUQ0CFYZ3hY11ZIDaXi0JqlwrLsiazD2hL//thBRvPrNIcs0vMf1R2Doz/o2RAvq7E6jPUVIU52DJ1sRRaJAmvj1vOTduHHnDo13BDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755022909; c=relaxed/relaxed;
	bh=BhnJXJE+d2mDNDDlQFrlbM73+vFIf5rSe9uOzme4lvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXiLxVwejYuCjmcaZ/DE+HNIloziEbvxyIcIlfv5/tjOqWlPeo9Qf7QRwEj5oh7mb2eD4wPm2v3mipzWXKSRLo/dsxXGrJLS2hysbkdJ1SJV6NJNMbkaMiO4PeAF3Ah5CzYwKe2xFC5BGP5HJ03Ah5qodwo+ipsg9qB8ZTMAl+nd/hyWJtemj4tl3vq1BGkJooVnbnidUNA/tlh9w1RsUMY/dmybGgbAUpNeVLkwJiQuHFyhuUJVucP+x9DU1R2FPc7xK51s1WrC6XFaU62WjC/x/7mff6exjxG3Ls843MyU0t1pJk6IzE+ysCOonKKckWBavWN7xrPVBuBxz5oYkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UsGNFw9D; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UsGNFw9D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1fwV5rSCz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 04:21:46 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCCoLP023786;
	Tue, 12 Aug 2025 18:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BhnJXJ
	E+d2mDNDDlQFrlbM73+vFIf5rSe9uOzme4lvs=; b=UsGNFw9DsNDJfFhoDkffq/
	X7HjIfVxQ7WRU3NmhCCJiSZsiEMVp42I7+KydiE+f3z/ltSDEo7vE/1UvutdF2U1
	pOILs5277q1BfJjHpn3XrQxQvqc9eC5XGvG6EZ0lSF4d1c9LyFwIJqUROcXPhV66
	DHU1TcFEaSgP4Uxe4vTTSwxlAtlDtGaTixDIx4mV/XrMnlALCFWokSMxUN59NXvd
	p078z7oGJlhFjD0/Rz8tXMYZrg2ujmbXNIA/B2lbfIrRONyOq+AszVILxqvBvLpe
	GjyWeXPJjlDp/2GqVnwWhHUYGFmvg5FO9T9ccj+0kjGYD+FENVdkQs0FLWyD9swA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duru854w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 18:21:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CFdDio017612;
	Tue, 12 Aug 2025 18:21:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3kd5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 18:21:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57CILDRj53412110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 18:21:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2679620043;
	Tue, 12 Aug 2025 18:21:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07D4E20040;
	Tue, 12 Aug 2025 18:21:11 +0000 (GMT)
Received: from [9.39.29.151] (unknown [9.39.29.151])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 18:21:10 +0000 (GMT)
Message-ID: <7c70fac4-3cc7-4bf1-a3f1-aa1c61f67425@linux.ibm.com>
Date: Tue, 12 Aug 2025 23:51:10 +0530
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
Subject: Re: [PATCH v2 1/1] sched: preempt: Move dynamic keys into
 kernel/sched
To: mingo@redhat.com, peterz@infradead.org
Cc: mark.rutland@arm.com, bigeasy@linutronix.de, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, venkat88@linux.ibm.com,
        tglx@linutronix.de, maddy@linux.ibm.com, will@kernel.org
References: <20250716094745.2232041-1-sshegde@linux.ibm.com>
 <20250716094745.2232041-2-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250716094745.2232041-2-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: haSnYq1kEpJqLZg92sejXHgMCJiOT0xe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE3NiBTYWx0ZWRfX2uUAJz+sPSMt
 fzHrOb3+ZPGeateZtJF+Rn1YzjqF4st42vzyk59+7uBs+hxuTrRcxv3bE/Ae+ZpUK79eUkfVomS
 rpoRY02k/6a9HDeXaSlF0HNI5wEvaSyDbBhl9rbL1W0q6aYa3DF8JbG3gtk6M7PMh0W9NYqOCHK
 rzGSUkZvysZ+0m+9vQJfyKPrNl+CdO21VKcB1antFsN8iZU1tAQEd/eDizUVMh0qrFDNPQuEdLV
 szNaG5gyhhKXuLx639vevO0JABMaAmSdqSQjbnMVFwGHSEtvhtFUfzZ8Kbkt5dN7YJYg5HozPVJ
 4E3q8XI9zew7V1Yat7WxnRWvLxNGPsmy0i89/9Qdohf+hcMsxZgU8VotHxbeH/k0dnPZgQVFh33
 SdctTqgYbVgYI80EYWQJvrnAxiX4yumyKNLQHZke20CONR0UyLT6FU9hxrg+XLCaNB8MBei6
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689b861d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=a-Bos3NDH3Xla9YzJLIA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: haSnYq1kEpJqLZg92sejXHgMCJiOT0xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxlogscore=876 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120176
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/16/25 15:17, Shrikanth Hegde wrote:
> Dynamic preemption can be static key or static call based.
> Static key is used to check kernel preemption depending on
> the current preemption model. i.e enable for lazy, full.
> 
> Code is currently spread across entry/common.c, arm64 and latest being
> powerpc. There is little arch specific to it. arm64, powerpc have the
> same code. It is better to move it into kernel/sched since preemption
> is more closely associated with scheduler.
> 
> Plus, Any new arch that wants dynamic preemption enabled need to have
> only HAVE_PREEMPT_DYNAMIC_KEY.
> 
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Acked-by: Will Deacon <will@kernel.org>
> Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>   arch/arm64/include/asm/preempt.h   |  1 -
>   arch/arm64/kernel/entry-common.c   |  8 --------
>   arch/powerpc/include/asm/preempt.h | 16 ----------------
>   arch/powerpc/kernel/interrupt.c    |  4 ----
>   include/linux/irq-entry-common.h   |  1 -
>   include/linux/sched.h              |  8 ++++++++
>   kernel/entry/common.c              |  1 -
>   kernel/sched/core.c                |  4 ++++
>   8 files changed, 12 insertions(+), 31 deletions(-)
>   delete mode 100644 arch/powerpc/include/asm/preempt.h
> 

Hi Ingo, Peter.

Does this change makes sense? Are there any further concerns that you see?
Also can it go via tip tree?

Patch applies on 6.17-rc1 (at commit ca76508b9352e8c770b58213cc6c4700e459b7c2)

