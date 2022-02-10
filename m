Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B44B1128
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 16:04:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvg5T0F3Sz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 02:04:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hg5kbNwL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Hg5kbNwL; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvg4k3kntz3bV2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 02:04:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21AEv57o027859; 
 Thu, 10 Feb 2022 15:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rD8FT0wQazng9rSpyV1D6sspQnqgrrTPv7XQ0rDDKfE=;
 b=Hg5kbNwLmSMdZy8E4JmpHbBQ/JFKzRcDAOFUv3ZSXWBFyfHgML/59XWSDWctE3WO/U7i
 30yBjJiFsUiJbna0aCVSvvO0eBs8Vw7qVpyATxohr9Xnu3cH3GsFIWDd6ExKCjP8yU3T
 cxmlbLvY/ZXukjq8p2/rIgLRTxfLfsEI1mmJWpYmh6NkLM8IfAWExQWsglQw8UiN+HiN
 KLb1TLQilMUvB6DdpDykNrsFSiVwfa8dLBbqxEMXi5rjpLOnqCo55tghdLlnTk2alDXA
 pysUN/nbFvPlzvQDtOCHCAbBJjWEP1lL1FKu7/VPumaIloycQlnbOvph1Bn/WfYaPTAw rA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e542f1kpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 15:03:56 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21AEY6L8007200;
 Thu, 10 Feb 2022 15:03:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3e2ygqp6wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 15:03:54 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AF3pv843844080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 15:03:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAD60AE055;
 Thu, 10 Feb 2022 15:03:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F7B3AE056;
 Thu, 10 Feb 2022 15:03:49 +0000 (GMT)
Received: from [9.43.23.209] (unknown [9.43.23.209])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Feb 2022 15:03:48 +0000 (GMT)
Message-ID: <d2c3d33a-9e4b-1efc-b956-66bbf9a6bac5@linux.ibm.com>
Date: Thu, 10 Feb 2022 20:33:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] selftest/vm: Use correct PAGE_SHIFT value for ppc64
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
 <84508bb4-9400-f429-e6d2-d8b05a1e8368@linuxfoundation.org>
 <87zgmz9x7e.fsf@linux.ibm.com>
 <eed2c443-21b0-3c0e-6571-551460fdf303@linuxfoundation.org>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <eed2c443-21b0-3c0e-6571-551460fdf303@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3ziXRdaEV6x82nCwSJaj_mZJZ08v99E4
X-Proofpoint-ORIG-GUID: 3ziXRdaEV6x82nCwSJaj_mZJZ08v99E4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_06,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100081
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
Cc: Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/10/22 20:09, Shuah Khan wrote:
> On 2/9/22 9:12 PM, Aneesh Kumar K.V wrote:
>> Shuah Khan <skhan@linuxfoundation.org> writes:
>>
>>> On 2/9/22 8:43 AM, Aneesh Kumar K.V wrote:
>>>> Keep it simple by using a #define and limiting hugepage size to 2M.
>>>> This keeps the test simpler instead of dynamically finding the page 
>>>> size
>>>> and huge page size.
>>>>
>>>> Without this tests are broken w.r.t reading /proc/self/pagemap
>>>>
>>>>     if (pread(pagemap_fd, ent, sizeof(ent),
>>>>             (uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
>>>>         err(2, "read pagemap");
>>>>
>>>> Cc: Shuah Khan <shuah@kernel.org>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>    tools/testing/selftests/vm/ksm_tests.c        | 8 ++++++++
>>>>    tools/testing/selftests/vm/transhuge-stress.c | 8 ++++++++
>>>>    2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/tools/testing/selftests/vm/ksm_tests.c 
>>>> b/tools/testing/selftests/vm/ksm_tests.c
>>>> index 1436e1a9a3d3..8200328ff018 100644
>>>> --- a/tools/testing/selftests/vm/ksm_tests.c
>>>> +++ b/tools/testing/selftests/vm/ksm_tests.c
>>>> @@ -22,8 +22,16 @@
>>>>    #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>>>>    #define MB (1ul << 20)
>>>> +#ifdef __powerpc64__
>>>> +#define PAGE_SHIFT    16
>>>> +/*
>>>> + * This will only work with radix 2M hugepage size
>>>> + */
>>>> +#define HPAGE_SHIFT 21
>>>> +#else
>>>>    #define PAGE_SHIFT 12
>>>>    #define HPAGE_SHIFT 21
>>>> +#endif
>>>>    #define PAGE_SIZE (1 << PAGE_SHIFT)
>>>>    #define HPAGE_SIZE (1 << HPAGE_SHIFT)
>>>> diff --git a/tools/testing/selftests/vm/transhuge-stress.c 
>>>> b/tools/testing/selftests/vm/transhuge-stress.c
>>>> index 5e4c036f6ad3..f04c8aa4bcf6 100644
>>>> --- a/tools/testing/selftests/vm/transhuge-stress.c
>>>> +++ b/tools/testing/selftests/vm/transhuge-stress.c
>>>> @@ -16,8 +16,16 @@
>>>>    #include <string.h>
>>>>    #include <sys/mman.h>
>>>> +#ifdef __powerpc64__
>>>> +#define PAGE_SHIFT    16
>>>> +/*
>>>> + * This will only work with radix 2M hugepage size
>>>> + */
>>>> +#define HPAGE_SHIFT 21
>>>
>>> Why not have this is in common code?
>>
>> Can you suggest where I can move that. We also have helper functions
>> like allocate_transhuge() duplicated between tests. I didn't find
>> libutil.a or anything similar supported by the selftets build.
>>
>>>
> 
> I noticed that HPAGE_SHIFT is defined in #ifdef __powerpc64__ block
> as well as #else. I am asking is it necessary to be part of both
> blocks.
> 
> +#ifdef __powerpc64__
> +#define PAGE_SHIFT    16
> +/*
> + * This will only work with radix 2M hugepage size
> + */
> +#define HPAGE_SHIFT 21  --- this one
> +#else
>    #define PAGE_SHIFT 12
>    #define HPAGE_SHIFT 21   --- this one
> +#endif
> 


The reason I did that was to add the comment which is relevant only for 
ppc64. ppc64 supports two hugepage sizes, 2M and 16M. The test won't 
work correctly with 16M hugepage size. We do have other tests in 
selftest/vm/ with similar restrictions.


-aneesh
