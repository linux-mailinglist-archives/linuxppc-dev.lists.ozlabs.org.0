Return-Path: <linuxppc-dev+bounces-10514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3A7B185EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 18:42:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btsDr4Pvcz2xRs;
	Sat,  2 Aug 2025 02:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754066540;
	cv=none; b=QiZG34LKj8XfbbIpwY2wCCgrBh73nyFz2FiH57vPIc20L1j3xhEaaGJHNfB95nbtMsaw76AFLNSqgNItvnIniTePgq/pg9RjAO0MMesBw5ybyxKjnSg3UVuHiqJ/WRLJW34cZjNe7mTzCoxZdwqTpvASBOUOGmmWrQIym5XHajcEkFodLG5sAHATtF7/5BmFZUDt2A8VqQHSds3aTByb0fbW61rfZh1j3achhKj47qaBwJAUw9eQDcUMgxMxnRuXXcyDW5+RcIqTu4Hj4NvewcPcy0kgZSvZHsRz5fYRih4NyqKtr6Dtm9m40/Gg8OxByNJLXYU8VHsHmTZqFkvWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754066540; c=relaxed/relaxed;
	bh=7lzPbO3Zz51sBAJ4mlBy4X5irw7c9yo7CvSEZJhlTQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcFR0l76EaU8JW/RO4xWSclhso36mj62SmEH9Se4Kyx6K+6biaKgVW2AyVYyEBb+UUDA9uQPVWw0eAfFTn7/4It866bGriK7Ybq2DBSHX/nIRFVozpsvNz2okAVn/H/9lSgY6/Nqeit+o3LHmo6JA9HM7xmgGVWngoTVAoQrONwPSa8xSI4impk6hE0SZem7hLzB8wU17OCejli859wIyJHhvNZ+nCqMvcRfiqQ13Ko8pO7PnK+zyrpwhw034m1Rr6V8WN0xI/isuTNj5ioC2PHxRWDZolnA4PQvtxRdhHsVvQAgLTit1pBwv8tpneFYOEsXBKD+3YZW5sh9fl6Hxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mHo9bYH3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mHo9bYH3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btsDq49XVz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 02:42:19 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719lm1A002109;
	Fri, 1 Aug 2025 16:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7lzPbO
	3Zz51sBAJ4mlBy4X5irw7c9yo7CvSEZJhlTQk=; b=mHo9bYH3kzQYLhou8lMQI5
	RYBnVw9NS/bE0AVjTeLUg4UapUnRX2qwLTR4Dlp7aaO8rOlfVANtsI4wqmteEB+X
	oXqEsY5J2t1ZT065+d2seGL0HbZzej1uRgAL2qDVOgB1bb4h8f9XpZchzPfjKE5Q
	D6/M07gynDTiW6WWIhSRAFNVBOTrGXGw4JYZBOwbH1Q7Ba4mEp+vhwJh5joihXK/
	xMnY6qudxHz7NrtLk3QTRYTxHGojGEX4iFVtp+vMkH431uatDnaIJUr3caUapqMY
	5gdjr6h36LwkwMpdhIG/jnMXARLzjiFoi6i/y3ezbyqxdTehJnRdeFz6tFcEiaeA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6j80g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 16:42:08 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 571GTGPT027847;
	Fri, 1 Aug 2025 16:42:07 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6j80fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 16:42:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571Cj7Qd017369;
	Fri, 1 Aug 2025 16:42:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4859r0jann-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 16:42:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 571Gg24q47710486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Aug 2025 16:42:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B8DD20040;
	Fri,  1 Aug 2025 16:42:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E64832004B;
	Fri,  1 Aug 2025 16:42:00 +0000 (GMT)
Received: from [9.39.23.28] (unknown [9.39.23.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Aug 2025 16:42:00 +0000 (GMT)
Message-ID: <322f02ee-4de9-4b1c-9727-409eb50c21fe@linux.ibm.com>
Date: Fri, 1 Aug 2025 22:12:00 +0530
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
Subject: Re: [PATCH v2] powerpc/qspinlock: Add spinlock contention tracepoint
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20250725081432.1254986-1-nysal@linux.ibm.com>
 <20250731061856.1858898-1-nysal@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250731061856.1858898-1-nysal@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wCuFmtzg-IvhBFynuU-RO3dOMmz8--I1
X-Authority-Analysis: v=2.4 cv=Mbtsu4/f c=1 sm=1 tr=0 ts=688cee60 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=Q9BW1oDvyV82DcSIcF4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SaYTAZEKmauWp9N7F5xDBkM6GAgcK3en
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEyNiBTYWx0ZWRfX/Hf8anFraG1b
 zfy7NTlSWhG67DNHPDxV4JD11ReHLaSWQKIGQh3FpP+nlMg+6RVscqRo7R8fsPL/H3nUO6X09Qe
 5NzJ6jBLmD3m4Naon+6qfT+hVP3nfQMvROb8nfQPbVWA7n8pOCD7rvoIFP5mh/8yE152SkY+1Gm
 Te+zU8JUUhFdKlYf4MBPo7R3VAdRJkMrGDJP+O2leW0X3dV3gOZ7lIVX20CoCK0ch+Rwo9Sstz+
 33I6FR+N1IE+9t3lHcZm3aRgAhzvIAwEMyz/otHeT7GO4SzIeIO0VUlUOQa6C9fgVFLeSzofh9f
 gkInFmMUw2PqPD5yScbUYew+Y7KgLTQY9B7USMOb1midjUrBpmaQLnUWoSyAY8PN4Gbm8FHgu3D
 +F4Ld3Y9yY/y4r8DByGCq0Ccml270/jDfaAtuhrZguF+6QTntWVwXMO+GUeIdSBn+nbxo0RL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_05,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010126
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/31/25 11:48, Nysal Jan K.A. wrote:
> Add a lock contention tracepoint in the queued spinlock slowpath.
> Also add the __lockfunc annotation so that in_lock_functions()
> works as expected.
> 

There is bit of pure code movement. Given that is small, single patch is fine.

> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>

Tried the patch and able to see tracepoints.

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> ---
>   arch/powerpc/lib/qspinlock.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index bcc7e4dff8c3..95ab4cdf582e 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -9,6 +9,7 @@
>   #include <linux/sched/clock.h>
>   #include <asm/qspinlock.h>
>   #include <asm/paravirt.h>
> +#include <trace/events/lock.h>
>   
>   #define MAX_NODES	4
>   
> @@ -708,26 +709,26 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>   	qnodesp->count--;
>   }
>   
> -void queued_spin_lock_slowpath(struct qspinlock *lock)
> +void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock)
>   {
> +	trace_contention_begin(lock, LCB_F_SPIN);
>   	/*
>   	 * This looks funny, but it induces the compiler to inline both
>   	 * sides of the branch rather than share code as when the condition
>   	 * is passed as the paravirt argument to the functions.
>   	 */
>   	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
> -		if (try_to_steal_lock(lock, true)) {
> +		if (try_to_steal_lock(lock, true))
>   			spec_barrier();
> -			return;
> -		}
> -		queued_spin_lock_mcs_queue(lock, true);
> +		else
> +			queued_spin_lock_mcs_queue(lock, true);
>   	} else {
> -		if (try_to_steal_lock(lock, false)) {
> +		if (try_to_steal_lock(lock, false))
>   			spec_barrier();
> -			return;
> -		}
> -		queued_spin_lock_mcs_queue(lock, false);
> +		else
> +			queued_spin_lock_mcs_queue(lock, false);
>   	}
> +	trace_contention_end(lock, 0);
>   }
>   EXPORT_SYMBOL(queued_spin_lock_slowpath);
>   
> 


