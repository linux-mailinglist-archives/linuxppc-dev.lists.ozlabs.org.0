Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 680232FC657
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 02:19:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL72q4Vl0zDqwL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 12:18:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N/PkPNl6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL70t4fvFzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 12:17:17 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10K13YIX069054; Tue, 19 Jan 2021 20:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dj7bc47IkKwE8y2iCoozzm11KNTiyzTrnAMfxw+Ud2Q=;
 b=N/PkPNl6LDjaIOLQmiPROxM3jA51KnEuZdFWvBjQY8998fD/YM9FXt3Pu+T3SwcGqB5o
 JrPMlfXkbs3uvRPRz5hiYiYEYF+XbpWLaKf7tkHkrNFHsvohykxVU/YUqiFLWsP1dcK9
 M3XjkPDobq3wcP6B4lhiaVKHONxM/9eSYawrFDZ8liZftgZCW9/HRhwa4RR3eJaEJrS2
 ZKCKj60CMoSJaefcmTI16cf+I14uDYc7NDUPrPCgFnucBV65XeZ3JFxy6iM/ECMJzNmP
 cLYi/OSsbzmC5w26mrjP5dlV4K58qsydviyXdz31u1rsRNFT05ohgGa8DzwSDWLWuNHL rA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366a8t0hjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:17:15 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10K1CY4B017204;
 Wed, 20 Jan 2021 01:17:14 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3668nw0mnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 01:17:14 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10K1HEtC38994272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 01:17:14 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1516D2805E;
 Wed, 20 Jan 2021 01:17:14 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C71642805A;
 Wed, 20 Jan 2021 01:17:13 +0000 (GMT)
Received: from localhost (unknown [9.211.72.22])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 01:17:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/rtas: rename RTAS_RMOBUF_MAX to
 RTAS_USER_REGION_SIZE
In-Reply-To: <6905c3d2-e524-b6d8-036f-7812ea3f8b85@ozlabs.ru>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-6-nathanl@linux.ibm.com>
 <d91c5b15-7c3d-a332-45ac-1b865341e962@ozlabs.ru>
 <87a6taxkgf.fsf@linux.ibm.com>
 <6905c3d2-e524-b6d8-036f-7812ea3f8b85@ozlabs.ru>
Date: Tue, 19 Jan 2021 19:17:13 -0600
Message-ID: <87y2gowgo6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_15:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200000
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 16/01/2021 02:56, Nathan Lynch wrote:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>>>> index 332e1000ca0f..1aa7ab1cbc84 100644
>>>> --- a/arch/powerpc/include/asm/rtas.h
>>>> +++ b/arch/powerpc/include/asm/rtas.h
>>>> @@ -19,8 +19,11 @@
>>>>    #define RTAS_UNKNOWN_SERVICE (-1)
>>>>    #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
>>>>    
>>>> -/* Buffer size for ppc_rtas system call. */
>>>> -#define RTAS_RMOBUF_MAX (64 * 1024)
>>>> +/* Work areas shared with RTAS must be 4K, naturally aligned. */
>>>
>>> Why exactly 4K and not (for example) PAGE_SIZE?
>> 
>> 4K is a platform requirement and isn't related to Linux's configured
>> page size. See the PAPR specification for RTAS functions such as
>> ibm,configure-connector, ibm,update-nodes, ibm,update-properties.
>
> Good, since we are documenting things here - add to the comment ("per 
> PAPR")?

But almost every constant in this header relates to a specification or
requirement in PAPR.


>> There are other calls with work area parameters where alignment isn't
>> specified (e.g. ibm,get-system-parameter) but 4KB alignment is a safe
>> choice for those.
>> 
>>>> +#define RTAS_WORK_AREA_SIZE   4096
>>>> +
>>>> +/* Work areas allocated for user space access. */
>>>> +#define RTAS_USER_REGION_SIZE (RTAS_WORK_AREA_SIZE * 16)
>>>
>>> This is still 64K but no clarity why. There is 16 of something, what
>>> is it?
>> 
>> There are 16 4KB work areas in the region. I can name it
>> RTAS_NR_USER_WORK_AREAS or similar.
>
>
> Why 16? PAPR (then add "per PAPR") or we just like 16 ("should be
> enough")?

PAPR doesn't know anything about the user region; it's a Linux
construct. It's been 64KB since pre-git days and I'm not sure what the
original reason is. At this point, maintaining a kernel-user ABI seems
like enough justification for the value.
