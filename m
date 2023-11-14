Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EC7EADC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 11:16:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pWkm/eeQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV2Jk1hnXz2yDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 21:16:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pWkm/eeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV2Hr52Ksz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 21:15:51 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE9QUS4030885;
	Tue, 14 Nov 2023 10:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=z++h47PPOZFCmser+Hr8ID6R7FopuQOBGvktHIibgEM=;
 b=pWkm/eeQxDRkTegjQptU1oBrj5C4hL9BryJDPLDjBZQiaffcRjFXirHMqHIGoClLNaHm
 yRfkJvcXQBHMTPtCUGx6ozh3YUMfcd21c+oz0pnRnVSwSY+aSZAaO5j4/+vQAyZU1bJ/
 JIc5XWi/kIS9GW649cQWSimu8fpwe9SVE71QV1N0anT9Ds3LOrzLke9oMmd4thkYh1v8
 T8dAJ0xvQyhlt0xJhePWRPzBq8LxeZQ/Q972fFnp2tIR1RQ0YUan0DV187TvEyf2hvEP
 ZMbKTg/SvQTK5k190+t07nWZ6IJ5eIJk4dTQXeuZmFjQpcDHPNp1KgeGcLX/Ug8+dAyH VA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc64sh4rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 10:15:41 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AEA15cF017784;
	Tue, 14 Nov 2023 10:15:41 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc64sh4r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 10:15:41 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8ORV8014687;
	Tue, 14 Nov 2023 10:15:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamay78g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 10:15:39 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AEAFcFn45941278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 10:15:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02B3B20079;
	Tue, 14 Nov 2023 10:15:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6F6F20078;
	Tue, 14 Nov 2023 10:15:36 +0000 (GMT)
Received: from [9.43.56.65] (unknown [9.43.56.65])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Nov 2023 10:15:36 +0000 (GMT)
Message-ID: <b21c7dc2-cdfa-45f2-b799-18aaa7297b46@linux.ibm.com>
Date: Tue, 14 Nov 2023 15:45:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/sched: Cleanup vcpu_is_preempted()
Content-Language: en-US
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
 <20231114094622.GR2194132@linux.vnet.ibm.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20231114094622.GR2194132@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jU0lrMdIrpSrYtJNhnnlv8tlI9pujRkC
X-Proofpoint-ORIG-GUID: L8O1JqhKetV_Bfz17HifBVXT_hA80SVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311140080
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/14/23 3:16 PM, Srikar Dronamraju wrote:
> * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2023-11-14 12:42:19]:
> 
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
> 
> If we are introducing vcpu_is_dispatched, we should remove 
> yield_count_of() and use vcpu_is_dispatched everwhere
> 
> No point in having yield_count_of() and vcpu_is_dispatched, since
> yield_count_of() is only used to check if we are running in OS or not.
> 

We do

yield_count = yield_count_of(owner);
yield_to_preempted(owner, yield_count);

-aneesh
