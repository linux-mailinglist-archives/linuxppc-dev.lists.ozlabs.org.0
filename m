Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8DE85F352
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 09:44:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qNawoqkY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgRX035qlz3dX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 19:44:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qNawoqkY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgRWD2cYDz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 19:43:36 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41M8WeeA011184;
	Thu, 22 Feb 2024 08:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AIF+4XdxX2H2LzshjeSgoUHWlIrRPIVfrjwSqAZmAGs=;
 b=qNawoqkY29/hcCMHqbbY0jXN4hERlePy1ZnQMW7Q4paMl1pJIVAdKIVuwcmBEBbCYQ0l
 PGtdS4t/Q3kT88n1zqt0USK5xfUnkCRsfWOnlSnRQZVOcAehO10dAPOVCxSYT5OS+LzJ
 3/0yk+9ZiV0cciFPbSMea3SAvOtRq0uGFNZ5Bvr83m/JPkkbT7o9qMxS9tUjvumlbdjo
 YUVzvfo7IABTMsJuPJq5mAjfgqYhL2FidJTakBtWOt7x4PRHbQQSknxrf8AAVEMUWCjQ
 a2ZXEUIAY7/TTfai+ZooE1hdxIBdzuMqoubJQfIgZpng5Z6BNtv/sv+UQBUD8VrbheJk ug== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we2uh89xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 08:43:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41M8DPbu013470;
	Thu, 22 Feb 2024 08:43:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb7h0n73n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 08:43:29 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41M8hN2c16908972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Feb 2024 08:43:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BCCC20043;
	Thu, 22 Feb 2024 08:43:23 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5CCC20040;
	Thu, 22 Feb 2024 08:43:21 +0000 (GMT)
Received: from [9.171.73.230] (unknown [9.171.73.230])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Feb 2024 08:43:21 +0000 (GMT)
Message-ID: <8598a151-812f-4be9-8c07-59cd89409de3@linux.ibm.com>
Date: Thu, 22 Feb 2024 14:13:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/hv-gpci: Fix the hcall return value checks in
 single_gpci_request function
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20240131112600.121482-1-kjain@linux.ibm.com>
 <87bk8bb9ap.fsf@mail.lhotse>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <87bk8bb9ap.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zJ8rDMTEid6pCKwPDaiE92iLZwWsi5a1
X-Proofpoint-GUID: zJ8rDMTEid6pCKwPDaiE92iLZwWsi5a1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_06,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402220068
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, akanksha@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/20/24 18:08, Michael Ellerman wrote:
> Kajol Jain <kjain@linux.ibm.com> writes:
>> Running event hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
>> in one of the system throws below error:
>>
>>  ---Logs---
>>  # perf list | grep hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles
>>   hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=?/[Kernel PMU event]
>>
>>
>>  # perf stat -v -e hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ sleep 2
>> Using CPUID 00800200
>> Control descriptor is not initialized
>> Warning:
>> hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ event is not supported by the kernel.
>> failed to read counter hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
>>
>>  Performance counter stats for 'system wide':
>>
>>    <not supported>      hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
>>
>>        2.000700771 seconds time elapsed
>>
>> The above error is because of the hcall failure as required
>> permission "Enable Performance Information Collection" is not set.
>> Based on current code, single_gpci_request function did not check the
>> error type incase hcall fails and by default returns EINVAL. But we can
>> have other reasons for hcall failures like H_AUTHORITY/H_PARAMETER for which
>> we need to act accordingly.
>> Fix this issue by adding new checks in the single_gpci_request function.
>>
>> Result after fix patch changes:
>>
>>  # perf stat -e hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ sleep 2
>> Error:
>> No permission to enable hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ event.
>>
>> Fixes: 220a0c609ad1 ("powerpc/perf: Add support for the hv gpci (get performance counter info) interface")
>> Reported-by: Akanksha J N <akanksha@linux.ibm.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-gpci.c | 29 +++++++++++++++++++++++++----
>>  1 file changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
>> index 27f18119fda1..101060facd81 100644
>> --- a/arch/powerpc/perf/hv-gpci.c
>> +++ b/arch/powerpc/perf/hv-gpci.c
>> @@ -695,7 +695,17 @@ static unsigned long single_gpci_request(u32 req, u32 starting_index,
>>  
>>  	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
>>  			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
>> -	if (ret) {
>> +
>> +	/*
>> +	 * ret value as 'H_PARAMETER' corresponds to 'GEN_BUF_TOO_SMALL',
> 
> Don't we expect H_PARAMETER if any parameter value is incorrect?
> 
>> +	 * which means that the current buffer size cannot accommodate
>> +	 * all the information and a partial buffer returned.
> 
> I don't see how we can infer that H_PARAMETER means the buffer is too
> small and accessing the first entry is OK?

Hi Michael,
  Based on getCounterInfo documentation and the name convention it uses,
we actually used H_PARAMETER to specify the buffer issue incase buffer
cannot accommodate all the data.
Hence we are using that return value in the check.

Since based on hv-gpci event counter we only want data for specific
starting index and the hv-gpci hcall actually store data starting from
given starting index in the result buffer. We can ensure that accessing
first entry will be enough.

Thanks,
Kajol Jain


> 
> cheers
> 
>> +	 * Since in this function we are only accessing data for a given starting index,
>> +	 * we don't need to accommodate whole data and can get required count by
>> +	 * accessing very first entry.
>> +	 * Hence hcall fails only incase the ret value is other than H_SUCCESS or H_PARAMETER.
>> +	 */
>> +	if (ret && (ret != H_PARAMETER)) {
>>  		pr_devel("hcall failed: 0x%lx\n", ret);
>>  		goto out;
>>  	}
