Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD47EAD06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 10:30:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XrTK1lNn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV1HT3lKYz3cWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 20:30:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XrTK1lNn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV1Gf03z4z3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 20:29:45 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8vJlq023544;
	Tue, 14 Nov 2023 09:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vyLf6vY3Mf8RiyJvxIay3Blv2919ab4yuVJeuAUlEH8=;
 b=XrTK1lNnpzPUjRa5ObFfndUPmPXUuQdtAy0qRIc7XWpUtKzGyLlwxjrWSkMxMrAu24Gr
 BQZJHN8R5KcgAQkohepFGWm4H8TbogTfWl7NZUiiA3yN1juLDwyL0pRONzMd1I0OjDPu
 NemAdoK6MJB4zv+bD16MM8Mi3OfZX2tsPYsMVTD8fNQCbZBuf+80Gi25j1sDog0RHNwx
 NNzhPbWD6BFtqZqcgEZBfFLDCJ9pcXj0Np7957QyDsmexaRu+oc5P/WSwtdkoggmZtMQ
 sFsX81piino3/W1YSKbwgrzNQNQ5KMDQX+0CMuFF+YFhpLtY+n2V9LiOxNBt18Bp2rLX ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc5u7gp8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:29:35 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AE9QXK8018558;
	Tue, 14 Nov 2023 09:29:35 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc5u7gp86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:29:35 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8YB5i014869;
	Tue, 14 Nov 2023 09:29:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamxn6t1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 09:29:33 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AE9TV1j16712360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 09:29:32 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3EF720040;
	Tue, 14 Nov 2023 09:29:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9315520043;
	Tue, 14 Nov 2023 09:29:30 +0000 (GMT)
Received: from [9.43.56.65] (unknown [9.43.56.65])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Nov 2023 09:29:30 +0000 (GMT)
Message-ID: <3e609a7f-59c8-487e-8c72-81b5d902c29f@linux.ibm.com>
Date: Tue, 14 Nov 2023 14:59:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/sched: Cleanup vcpu_is_preempted()
Content-Language: en-US
To: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
References: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
 <a326ce8a-431f-45dd-a225-691f6f965b6f@linux.vnet.ibm.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <a326ce8a-431f-45dd-a225-691f6f965b6f@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oWYaGzyT_nCm3pnyQgtk-6oETAf6qxaC
X-Proofpoint-GUID: HtMhlj-xKVXfGb6y-urTTHhvC7NYvPGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140074
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
Cc: linuxppc-dev@lists.ozlabs.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/14/23 2:53 PM, Shrikanth Hegde wrote:
> 
> 
> On 11/14/23 12:42 PM, Aneesh Kumar K.V wrote:
>> No functional change in this patch. A helper is added to find if
>> vcpu is dispatched by hypervisor. Use that instead of opencoding.
>> Also clarify some of the comments.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/paravirt.h | 33 ++++++++++++++++++++++-------
>>  1 file changed, 25 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
>> index ac4279208d63..b78b82d66057 100644
>> --- a/arch/powerpc/include/asm/paravirt.h
>> +++ b/arch/powerpc/include/asm/paravirt.h
>> @@ -76,6 +76,17 @@ static inline bool is_vcpu_idle(int vcpu)
>>  {
>>  	return lppaca_of(vcpu).idle;
>>  }
>> +
>> +static inline bool vcpu_is_dispatched(int vcpu)
>> +{
>> +	/*
>> +	 * This is the yield_count.  An "odd" value (low bit on) means that
>> +	 * the processor is yielded (either because of an OS yield or a
>> +	 * hypervisor preempt).  An even value implies that the processor is
>> +	 * currently executing.
>> +	 */
>> +	return (!(yield_count_of(vcpu) & 1));
>> +}
>>  #else
>>  static inline bool is_shared_processor(void)
>>  {
>> @@ -109,6 +120,10 @@ static inline bool is_vcpu_idle(int vcpu)
>>  {
>>  	return false;
>>  }
>> +static inline bool vcpu_is_dispatched(int vcpu)
>> +{
>> +	return true;
>> +}
>>  #endif
>>
> 
> Similar code can be changed in lib/qspinlock.c and lib/locks.c as well. 

I avoided doing that because they used the fetched yield_count value

yield_to_preempted(owner, yield_count);


and the checking comes with a comment

	if ((yield_count & 1) == 0)
		goto relax; /* owner vcpu is running */


-aneesh

