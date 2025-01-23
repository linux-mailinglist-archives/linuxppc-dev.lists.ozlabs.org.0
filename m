Return-Path: <linuxppc-dev+bounces-5497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F3A1A1D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 11:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdxzX3PQJz302W;
	Thu, 23 Jan 2025 21:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737628232;
	cv=none; b=Q+nK1rwSI2uaQCO9DEuw370tv0SFFRuDD3w/JSREgxmRkW+9g3g4BSVSF4r9mphUWb/pSAkMTF8waOLTvrDgG/MgNSoIZV/SHK674w0DM/9He2jPbvxC9T+i3LV9lTFZI9x2Pkhjo1ztGbU8zK89ogkjYUpTz7Aurr6XqK3rhxlmOZqC6920rviy4DaRKSXAAU0Q3Tiy1gZD5bgljomV7GLN1Qzy0G7HhJAgQy7d72DIXpcqCMepNHyRjh6MgVeeIJl9MJkr7uTRJT1uKrkB3x+TZWUOkyXvi1DUjhTQ0GT2exDvitf4PO2p0R1dCcqfymzo41OqGK41BQrwwqDwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737628232; c=relaxed/relaxed;
	bh=ElgwOmg4zurIGAG33KrdB9qV6Qn3O8n1JN+1ytDaaQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H97RKq15bS6gaBwgdi0qGd4K09lhiE0LOTiBT9v1dtGNne6bR1ghg24+eU+Bz8aMaL1SD413iPSLN9yTXJkJsrQ8VOQaUgQf/tnealHT+WRb4eeAOjQz5DpwDurCiOfyvU2oTWRKH2O/Sp2UctbKRfZGTFtdg2RY7eeukDGMSLiCsr4IBDPjz5V343cmnZNrMUmRz8/lFK4N35TohS2ijRykyBr3gp30LSjiXHMB5SXPAdEDVaimvkt9awFEexW11x9+E4h0LbXj/l0vD3fYW0P+Uteg4mlMIgZAid9NQid5Lcp1cq2k2i/id2fHF3ynVMY2UcJaVrfFWqY6/qH+SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sri3esO2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sri3esO2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdxzW3S44z302P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 21:30:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7Y7ZY031746;
	Thu, 23 Jan 2025 10:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ElgwOm
	g4zurIGAG33KrdB9qV6Qn3O8n1JN+1ytDaaQ4=; b=Sri3esO25xNK9bRMTJPS/L
	dLLKCccE9DfluAZVF6kSh9DAvvxPWazNbPArz+7XDMi3tXV2HXNsl1nmkdv588Vy
	N4UpaGWUEfDtqzKkPBz/PaURBrDU/g+aMd6v9hLIjNJfPJojUtWWHs5u7Y1Yybkg
	0Tfk+QfkpMqAwxTyW34ZJ26qG9qK4n2labKGi+PV962XnC3Ru8KPtcZhbikGhMbD
	Ju+ZpHu46JcmPBxvYSsfoBHdD/Gngqu07S7U2CUGnrFiikJtPuIWe92j6GNldUwQ
	EHTSDyDtWskl3OiLhVXXQKWgmVDT/yfF/RBTuVWEQEYGpQBalFGcs/EKsL9WZ5jA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bhfpgtfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:30:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7hopa022642;
	Thu, 23 Jan 2025 10:30:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4kcyag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:30:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NAUGO354985174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 10:30:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 186CA2004F;
	Thu, 23 Jan 2025 10:30:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5429D20040;
	Thu, 23 Jan 2025 10:30:14 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 10:30:14 +0000 (GMT)
Message-ID: <43aeaa2c-c266-4d6e-921d-80b99ceb418b@linux.ibm.com>
Date: Thu, 23 Jan 2025 16:00:13 +0530
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
Subject: Re: [PATCH v2 4/6] powerpc/kdump: preserve user-specified memory
 limit
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
 <20250121115442.1278458-5-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250121115442.1278458-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: znjyydUgdRDLatsnRWlibUpXi4ANAtb7
X-Proofpoint-ORIG-GUID: znjyydUgdRDLatsnRWlibUpXi4ANAtb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230080
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 21/01/25 5:24 pm, Sourabh Jain wrote:
> Commit 59d58189f3d9 ("crash: fix crash memory reserve exceed system
> memory bug") fails crashkernel parsing if the crash size is found to be
> higher than system RAM, which makes the memory_limit adjustment code
> ineffective due to an early exit from reserve_crashkernel().
> 
> Regardless lets not violated the user-specified memory limit by

s/violated/violate/

> adjusting it. Remove this adjustment to ensure all reservations stay
> within the limit. Commit f94f5ac07983 ("powerpc/fadump: Don't update
> the user-specified memory limit") did the same for fadump.
> 

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kexec/core.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> index b8333a49ea5d..4945b33322ae 100644
> --- a/arch/powerpc/kexec/core.c
> +++ b/arch/powerpc/kexec/core.c
> @@ -150,14 +150,6 @@ void __init reserve_crashkernel(void)
>   		return;
>   	}
>   
> -	/* Crash kernel trumps memory limit */
> -	if (memory_limit && memory_limit <= crashk_res.end) {
> -		memory_limit = crashk_res.end + 1;
> -		total_mem_sz = memory_limit;
> -		printk("Adjusted memory limit for crashkernel, now 0x%llx\n",
> -		       memory_limit);
> -	}
> -
>   	printk(KERN_INFO "Reserving %ldMB of memory at %ldMB "
>   			"for crashkernel (System RAM: %ldMB)\n",
>   			(unsigned long)(crash_size >> 20),


