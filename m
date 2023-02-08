Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A968EF99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBgVd4W3jz3cff
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:16:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K3YwynGz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K3YwynGz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBgTd46YNz2yXL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 00:15:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318D9EhU032361;
	Wed, 8 Feb 2023 13:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=mWwGpXJUxry2N+ftgb+39sOvwFnYXTNWApXud3m0siY=;
 b=K3YwynGzksGKbKdGLZHqdHIQ+j1rMX1GeEiO3v6GgQ4Ick5WnVlbklnbumMxRRI15Qyv
 xj7DQJpBGwn3mSYurS9GqJWrWJxzVoJaFoTd9uf2DCKRpJnZu5Ror1VzsOLE4uGdGRIS
 +KHv+WLZZ/hB7owUKcsZGSyqlZjgbejWqhN5avEJ4z+tB+Ap3UZ+v7pHB9UN3HUWEupM
 gI9mTB3GsXdyiV4xLPnQOgFVcEEm/+dbYj7dd+xU0kLvE3FQQFnxQKKSNXrSx75JuwKv
 W6NYA4S2moLBpTkqo6mcBKijp9JgklPnEyJ2decbUbMBiHyI3VoexPBlw5KfKYwVFvJT Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmc2v8e6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 13:15:01 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318DADk0002467;
	Wed, 8 Feb 2023 13:15:00 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmc2v8e5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 13:15:00 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318BTRal001036;
	Wed, 8 Feb 2023 13:14:59 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3nhf07dfhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 13:14:59 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 318DEvAN40174052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 13:14:57 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2713E58056;
	Wed,  8 Feb 2023 13:14:57 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0578258052;
	Wed,  8 Feb 2023 13:14:57 +0000 (GMT)
Received: from localhost (unknown [9.163.2.97])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 13:14:56 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Submission
 Endpoint <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Kajol
 Jain <kjain@linux.ibm.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 01/19] powerpc/rtas: handle extended delays safely in
 early boot
In-Reply-To: <87ttzwwgh4.fsf@mpe.ellerman.id.au>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-1-9aa6bd058063@linux.ibm.com>
 <87ttzwwgh4.fsf@mpe.ellerman.id.au>
Date: Wed, 08 Feb 2023 07:14:56 -0600
Message-ID: <87wn4snvsf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mBWR8ZRtM2gfpR6DtW2caxkDuUYywfVc
X-Proofpoint-ORIG-GUID: 8eeFieQwzdoEcJTawAVvgpHQyU_6tkHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_04,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080116
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch via B4 Submission Endpoint <devnull+nathanl.linux.ibm.com@kernel.org> writes:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> Some code that runs early in boot calls RTAS functions that can return
>> -2 or 990x statuses, which mean the caller should retry. An example is
>> pSeries_cmo_feature_init(), which invokes ibm,get-system-parameter but
>> treats these benign statuses as errors instead of retrying.
>>
>> pSeries_cmo_feature_init() and similar code should be made to retry
>> until they succeed or receive a real error, using the usual pattern:
>>
>> 	do {
>> 		rc = rtas_call(token, etc...);
>> 	} while (rtas_busy_delay(rc));
>>
>> But rtas_busy_delay() will perform a timed sleep on any 990x
>> status. This isn't safe so early in boot, before the CPU scheduler and
>> timer subsystem have initialized.
>>
>> The -2 RTAS status is much more likely to occur during single-threaded
>> boot than 990x in practice, at least on PowerVM. This is because -2
>> usually means that RTAS made progress but exhausted its self-imposed
>> timeslice, while 990x is associated with concurrent requests from the
>> OS causing internal contention. Regardless, according to the language
>> in PAPR, the OS should be prepared to handle either type of status at
>> any time.
>>
>> Add a fallback path to rtas_busy_delay() to handle this as safely as
>> possible, performing a small delay on 990x. Include a counter to
>> detect retry loops that aren't making progress and bail out.
>>
>> This was found by inspection and I'm not aware of any real
>> failures. However, the implementation of rtas_busy_delay() before
>> commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
>> was not susceptible to this problem, so let's treat this as a
>> regression.
>>
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> Fixes: 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
>> ---
>>  arch/powerpc/kernel/rtas.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 795225d7f138..ec2df09a70cf 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -606,6 +606,46 @@ unsigned int rtas_busy_delay_time(int status)
>>  	return ms;
>>  }
>>  
>> +/*
>> + * Early boot fallback for rtas_busy_delay().
>> + */
>> +static bool __init rtas_busy_delay_early(int status)
>> +{
>> +	static size_t successive_ext_delays __initdata;
>> +	bool ret;
>
> I think the logic would be easier to read if this was called "wait", but
> maybe that's just me.

Maybe "retry"? That communicates what the function is telling callers to do.

>
>> +	switch (status) {
>> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
>> +		/*
>> +		 * In the unlikely case that we receive an extended
>> +		 * delay status in early boot, the OS is probably not
>> +		 * the cause, and there's nothing we can do to clear
>> +		 * the condition. Best we can do is delay for a bit
>> +		 * and hope it's transient. Lie to the caller if it
>> +		 * seems like we're stuck in a retry loop.
>> +		 */
>> +		mdelay(1);
>> +		ret = true;
>> +		successive_ext_delays += 1;
>> +		if (successive_ext_delays > 1000) {
>> +			pr_err("too many extended delays, giving up\n");
>> +			dump_stack();
>> +			ret = false;
>
> Shouldn't we zero successive_ext_delays here?
>
> Otherwise a subsequent (possibly different) RTAS call will immediately
> fail out here if it gets a single extended delay from RTAS, won't it?

Yes, will fix. Thanks.

>
>> +		}
>> +		break;
>> +	case RTAS_BUSY:
>> +		ret = true;
>> +		successive_ext_delays = 0;
>> +		break;
>> +	default:
>> +		ret = false;
>> +		successive_ext_delays = 0;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
>>   *
>> @@ -624,11 +664,17 @@ unsigned int rtas_busy_delay_time(int status)
>>   * * false - @status is not @RTAS_BUSY nor an extended delay hint. The
>>   *           caller is responsible for handling @status.
>>   */
>> -bool rtas_busy_delay(int status)
>> +bool __ref rtas_busy_delay(int status)
>
> Can you explain the __ref in the change log.

Yes, will add that.


>>  {
>>  	unsigned int ms;
>>  	bool ret;
>>  
>> +	/*
>> +	 * Can't do timed sleeps before timekeeping is up.
>> +	 */
>> +	if (system_state < SYSTEM_SCHEDULING)
>> +		return rtas_busy_delay_early(status);
>> +
>>  	switch (status) {
>>  	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
>>  		ret = true;
>>
>
> cheers
