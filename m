Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9D5715E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 11:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhwh6217jz3cC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 19:39:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W56yctbM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W56yctbM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhwgP30CWz30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 19:38:56 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C8hwah016743;
	Tue, 12 Jul 2022 09:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qk1ofYEcashXPyp+CEb/2pdcw933tEZ/rPjXONA7U7I=;
 b=W56yctbMr+6bZ5eMhwtUPf/zig59CWdqbBkxLn3cp4jNPh+Te+kf/e9hO+3AtAhvFMLM
 ZeBSMd/EzX12Vj5EKk9iFigCU4jYVGpDAIM1W0HXoN62stbIfzR96FaLMpAHqYOkMjXX
 bRV30qD/AijJykjcOBACrrq1s4r1f5jyL9D1I33Q8qx7mBf/n4zxa1GmYBDZGyvIwgMf
 s9c1MHw0+ADdHyCRl4Tl9PQMA/a3OeIxccqU0yfcQ/lz4+VawIUW/YXqAk2dbgjuLGDh
 rM1hqdaH88NmMn9r2oTRjRKMCidJ0CYQErKz9kfi+ayzURsheNYJEWdyZElTLgCZN1nb 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h95puhejt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 09:38:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C9R3KZ000819;
	Tue, 12 Jul 2022 09:38:48 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h95puheht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 09:38:48 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C9MYFL019806;
	Tue, 12 Jul 2022 09:38:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma05fra.de.ibm.com with ESMTP id 3h71a8ty46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 09:38:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26C9ciqd22741340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Jul 2022 09:38:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72533AE051;
	Tue, 12 Jul 2022 09:38:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBE4FAE045;
	Tue, 12 Jul 2022 09:38:43 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 12 Jul 2022 09:38:43 +0000 (GMT)
Message-ID: <b820274e-56fe-501b-0d1d-41703fbe6b48@linux.ibm.com>
Date: Tue, 12 Jul 2022 11:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.1
Subject: Re: [PATCH v3 1/4] powerpc/mobility: wait for memory transfer to
 complete
Content-Language: fr
To: Nicholas Piggin <npiggin@gmail.com>, benh@kernel.crashing.org,
        haren@linux.vnet.ibm.com, linux@roeck-us.net, mpe@ellerman.id.au,
        nathanl@linux.ibm.com, paulus@samba.org, wim@linux-watchdog.org
References: <20220627135347.32624-1-ldufour@linux.ibm.com>
 <20220627135347.32624-2-ldufour@linux.ibm.com>
 <1657588908.mis26ebam4.astroid@bobo.none>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <1657588908.mis26ebam4.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gGeqaXoIfANwKkwvyYrnJDbG_fiXd63x
X-Proofpoint-ORIG-GUID: F_80hR8xTapnMRjaIvF7lke68QdSPRLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_05,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207120035
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 12/07/2022 à 03:33, Nicholas Piggin a écrit :
> Excerpts from Laurent Dufour's message of June 27, 2022 11:53 pm:
>> In pseries_migration_partition(), loop until the memory transfer is
>> complete. This way the calling drmgr process will not exit earlier,
>> allowing callbacks to be run only once the migration is fully completed.
>>
>> If reading the VASI state is done after the hypervisor has completed the
>> migration, the HCALL is returning H_PARAMETER. We can safely assume that
>> the memory transfer is achieved if this happens.
>>
>> This will also allow to manage the NMI watchdog state in the next commits.
>>
>> Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/mobility.c | 42 +++++++++++++++++++++--
>>  1 file changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index 78f3f74c7056..907a779074d6 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -427,6 +427,43 @@ static int wait_for_vasi_session_suspending(u64 handle)
>>  	return ret;
>>  }
>>  
>> +static void wait_for_vasi_session_completed(u64 handle)
>> +{
>> +	unsigned long state = 0;
>> +	int ret;
>> +
>> +	pr_info("waiting for memory transfert to complete...\n");
> 
>                                             ^ extra t (also below)

I tried to push one French word, but you caught it ;)
Will fix that and the other ones.

>> +
>> +	/*
>> +	 * Wait for transition from H_VASI_RESUMED to H_VASI_COMPLETED.
>> +	 */
>> +	while (true) {
>> +		ret = poll_vasi_state(handle, &state);
>> +
>> +		/*
>> +		 * If the memory transfer is already complete and the migration
>> +		 * has been cleaned up by the hypervisor, H_PARAMETER is return,
>> +		 * which is translate in EINVAL by poll_vasi_state().
>> +		 */
>> +		if (ret == -EINVAL || (!ret && state == H_VASI_COMPLETED)) {
>> +			pr_info("memory transfert completed.\n");
>> +			break;
>> +		}
>> +
>> +		if (ret) {
>> +			pr_err("H_VASI_STATE return error (%d)\n", ret);
>> +			break;
>> +		}
>> +
>> +		if (state != H_VASI_RESUMED) {
>> +			pr_err("unexpected H_VASI_STATE result %lu\n", state);
>> +			break;
>> +		}
>> +
>> +		msleep(500);
> 
> Is 500 specified anywhere? Another caller uses 1000, and the other one 
> uses some backoff interval starting at 1ms...

This is a bit empiric, the idea is to wait for the overall memory transfer
to be done. There is no real need to interact immediately after the
operation is terminated, so I pick that value to not make too many Hcalls
just for that. From the test I did, that seems to be a reasonable choice.

> 
>> +	}
>> +}
>> +
>>  static void prod_single(unsigned int target_cpu)
>>  {
>>  	long hvrc;
>> @@ -673,9 +710,10 @@ static int pseries_migrate_partition(u64 handle)
>>  	vas_migration_handler(VAS_SUSPEND);
>>  
>>  	ret = pseries_suspend(handle);
>> -	if (ret == 0)
>> +	if (ret == 0) {
>>  		post_mobility_fixup();
>> -	else
>> +		wait_for_vasi_session_completed(handle);
> 
> If this wasn't required until later patches, maybe a comment about why 
> it's here? Could call it wait_for_migration() or similar too.
> 
> Looks okay though from my basic reading of PAPR.
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks Nick for reviewing this series.

> 
>> +	} else
>>  		pseries_cancel_migration(handle, ret);
>>  
>>  	vas_migration_handler(VAS_RESUME);
>> -- 
>> 2.36.1
>>
>>

