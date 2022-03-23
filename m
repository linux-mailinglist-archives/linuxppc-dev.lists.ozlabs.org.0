Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018A4E56AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 17:42:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNvKN0gB6z2ywp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 03:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XmRrU0Vb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XmRrU0Vb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNvJZ52nwz2xVn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 03:41:50 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NGJORf000653; 
 Wed, 23 Mar 2022 16:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AsnIo7lKof5Gfu0oqGI53VISCtH8TKyRNiXMowF3/Wo=;
 b=XmRrU0VbYJFe06SpWzYS0F6n0g/KA6ibMaCTBNtK6+NwattyH6UAilma9Mk+hhdeVc8d
 N0dbOO1tOlEjGSA87AXhx6ClbgIrGffZpNculWfvl9wgoMQavbuyZom8lDUa6Pn/EjAt
 UGYst17GEU4URQQ2KbGkkBxhUkwt5xVkzxjPiYg5LN+LM1QYfXWdnFepV1cNVUCaLiS3
 EMa02P4qidwNzx13YAjFX6JUYuTsRP9QbS1r+sqW1malMDbuhTWslEU4p65lcVggi/wx
 gbfpxgJU4FGiA82RTtJQd9zxqwROht6febzvumRV/FmRFVMyFIJ3+jdpr05Nq+JH/S1M lg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f000yu37u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:41:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22NGbUta008403;
 Wed, 23 Mar 2022 16:41:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3ew6t97qc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:41:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22NGTDwa29295004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 16:29:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57C4142041;
 Wed, 23 Mar 2022 16:40:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A08BB4203F;
 Wed, 23 Mar 2022 16:40:52 +0000 (GMT)
Received: from [9.43.30.161] (unknown [9.43.30.161])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Mar 2022 16:40:52 +0000 (GMT)
Message-ID: <89843cc6-f94d-0fd2-40c5-f445731c79e6@linux.ibm.com>
Date: Wed, 23 Mar 2022 22:10:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <20220318114133.113627-2-kjain@linux.ibm.com>
 <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
 <c198a1b5-cc7e-4e51-533b-a5794f506b17@linux.ibm.com>
 <CAPcyv4j9NQ-Msr6JCp95QWAdDyTfYr65fXCoHHtjipLA=oJeHA@mail.gmail.com>
 <877d8lgf1y.fsf@mpe.ellerman.id.au>
 <CAPcyv4jjC8DAdNvJ5Y7HVG9Ss-hSk=Uae9kWoJ2ctwwe+w3__Q@mail.gmail.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <CAPcyv4jjC8DAdNvJ5Y7HVG9Ss-hSk=Uae9kWoJ2ctwwe+w3__Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9s2-R3Gvq4HBjQ1HT-D78lEsXeZJmMuc
X-Proofpoint-GUID: 9s2-R3Gvq4HBjQ1HT-D78lEsXeZJmMuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230087
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Santosh Sivaraj <santosh@fossix.org>,
 maddy@linux.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Peter Zijlstra <peterz@infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
 rnsastry@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/23/22 21:02, Dan Williams wrote:
> On Wed, Mar 23, 2022 at 3:05 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Dan Williams <dan.j.williams@intel.com> writes:
>>> On Tue, Mar 22, 2022 at 7:30 AM kajoljain <kjain@linux.ibm.com> wrote:
>>>> On 3/22/22 03:09, Dan Williams wrote:
>>>>> On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>>>>>>
>>>>>> The following build failure occures when CONFIG_PERF_EVENTS is not set
>>>>>> as generic pmu functions are not visible in that scenario.
>>>>>>
>>>>>> arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: ‘struct perf_event’ has no member named ‘attr’
>>>>>>          p->nvdimm_events_map[event->attr.config],
>>>>>>                                    ^~
>>>>>> In file included from ./include/linux/list.h:5,
>>>>>>                  from ./include/linux/kobject.h:19,
>>>>>>                  from ./include/linux/of.h:17,
>>>>>>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
>>>>>> arch/powerpc/platforms/pseries/papr_scm.c: In function ‘papr_scm_pmu_event_init’:
>>>>>> arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: ‘struct perf_event’ has no member named ‘pmu’
>>>>>>   struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
>>>>>>                                                  ^~
>>>>>> ./include/linux/container_of.h:18:26: note: in definition of macro ‘container_of’
>>>>>>   void *__mptr = (void *)(ptr);     \
>>>>>>                           ^~~
>>>>>> arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion of macro ‘to_nvdimm_pmu’
>>>>>>   struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
>>>>>>                               ^~~~~~~~~~~~~
>>>>>> In file included from ./include/linux/bits.h:22,
>>>>>>                  from ./include/linux/bitops.h:6,
>>>>>>                  from ./include/linux/of.h:15,
>>>>>>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
>>>>>>
>>>>>> Fix the build issue by adding check for CONFIG_PERF_EVENTS config option
>>>>>> and disabling the papr_scm perf interface support incase this config
>>>>>> is not set
>>>>>>
>>>>>> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") (Commit id
>>>>>> based on linux-next tree)
>>>>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>>>>> ---
>>>>>>  arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++
>>>>>
>>>>> This is a bit messier than I would have liked mainly because it dumps
>>>>> a bunch of ifdefery into a C file contrary to coding style, "Wherever
>>>>> possible, don't use preprocessor conditionals (#if, #ifdef) in .c
>>>>> files". I would expect this all to move to an organization like:
>>>>
>>>> Hi Dan,
>>>>       Thanks for reviewing the patches. Inorder to avoid the multiple
>>>> ifdefs checks, we can also add stub function for papr_scm_pmu_register.
>>>> With that change we will just have one ifdef check for
>>>> CONFIG_PERF_EVENTS config in both papr_scm.c and nd.h file. Hence we can
>>>> avoid adding new files specific for papr_scm perf interface.
>>>>
>>>> Below is the code snippet for that change, let me know if looks fine to
>>>> you. I tested it
>>>> with set/unset PAPR_SCM config value and set/unset PERF_EVENTS config
>>>> value combinations.
>>>>
>>>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
>>>> b/arch/powerpc/platforms/pseries/papr_scm.c
>>>> index 4dd513d7c029..38fabb44d3c3 100644
>>>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>>>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>>>> @@ -69,8 +69,6 @@
>>>>  #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
>>>>  #define PAPR_SCM_PERF_STATS_VERSION 0x1
>>>>
>>>> -#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pmu)
>>>> -
>>>>  /* Struct holding a single performance metric */
>>>>  struct papr_scm_perf_stat {
>>>>         u8 stat_id[8];
>>>> @@ -346,6 +344,9 @@ static ssize_t drc_pmem_query_stats(struct
>>>> papr_scm_priv *p,
>>>>         return 0;
>>>>  }
>>>>
>>>> +#ifdef CONFIG_PERF_EVENTS
>>>> +#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pmu)
>>>> +
>>>>  static int papr_scm_pmu_get_value(struct perf_event *event, struct
>>>> device *dev, u64 *count)
>>>>  {
>>>>         struct papr_scm_perf_stat *stat;
>>>> @@ -558,6 +559,10 @@ static void papr_scm_pmu_register(struct
>>>> papr_scm_priv *p)
>>>>         dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
>>>>  }
>>>>
>>>> +#else
>>>> +static inline void papr_scm_pmu_register(struct papr_scm_priv *p) { }
>>>
>>> Since this isn't in a header file, it does not need to be marked
>>> "inline" the compiler will figure it out.
>>>
>>>> +#endif
>>>
>>> It might be time to create:
>>>
>>> arch/powerpc/platforms/pseries/papr_scm.h
>>>
>>> ...there is quite a bit of header material accrued in papr_scm.c and
>>> once the ifdefs start landing in it then it becomes a nominal coding
>>> style issue. That said, this is certainly more palatable than the
>>> previous version. So if you don't want to create papr_scm.h yet for
>>> this, at least make a note in the changelog that the first portion of
>>> arch/powerpc/platforms/pseries/papr_scm.c is effectively papr_scm.h
>>> content and may move there in the future, or something like that.
>>
>> IMHO the only thing that belongs in a header is content that's needed by
>> other C files. As long as those types/declarations are only used in
>> papr_scm.c then they should stay in the C file, and there's no need for
>> a header.
>>
>> I know the coding style rule is "avoid ifdefs in .c files", but I'd
>> argue that rule should be ignored if you're creating a header file
>> purely so that you can use an ifdef :)
>>
>> Coding style also says:
>>
>>   Prefer to compile out entire functions, rather than portions of functions or
>>   portions of expressions.  Rather than putting an ifdef in an expression, factor
>>   out part or all of the expression into a separate helper function and apply the
>>   conditional to that function.
>>
>> Which is what we're doing here with eg. papr_scm_pmu_register().
>>
>> Certainly for this merge window I think introducing a header is likely
>> to cause more problems than it solves, so let's not do that for now. We
>> can revisit it for the next merge window.
> 
> Fair enough. Kajol, please turn that snippet proposal into a formal patch.

Sure, I will send patchset for the same.

Thanks,
Kajol Jain
