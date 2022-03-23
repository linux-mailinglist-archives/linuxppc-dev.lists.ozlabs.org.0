Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF304E4D9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 08:50:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNgVt1Rpwz30C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 18:49:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l/kmsX1u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l/kmsX1u; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNgV62jvsz2x9R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 18:49:17 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N6gimV012427; 
 Wed, 23 Mar 2022 07:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=esyvE9d47G4eT5PCtsnWcq/crKLziOOj6fAWWtqcXMs=;
 b=l/kmsX1uWIepF15zc1p3+kBP4g9PqvWl8xd3FoiVGuX3IKnXfRUWDDwgOf4sWlAEffKY
 RoCsynmNM74nGsOa15gw2DqAS61rDrWHDPOzhdSVMz4hIWpFJ3pa72ikOwHHBaUl8NcM
 nTP1KTbYI+zbVb5Dd3cYzJaykmvsYkNiV0olqzV+p4k6BJeoJ8G3pVKgcAOkfkbrcJo/
 2HItxT74rfmwYrn1kxXTWdK595uf1BSVMbikEyvstgSJmNLFe9yNlIqTlDqZYCdh4zf8
 WKkMh3FBPcmhHo8QdNQDMH319th6YxGcmzApeeEY+bGBV5qVWdv2w3E+mTidw82GbU2u kA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eywmn20ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:48:49 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22N7juZ0004242;
 Wed, 23 Mar 2022 07:48:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3ew6t9etqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:48:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22N7mib836438486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 07:48:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ED64A4040;
 Wed, 23 Mar 2022 07:48:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786DEA405E;
 Wed, 23 Mar 2022 07:48:35 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.211.147.181])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 23 Mar 2022 07:48:35 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 13:18:33 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
In-Reply-To: <CAPcyv4j9NQ-Msr6JCp95QWAdDyTfYr65fXCoHHtjipLA=oJeHA@mail.gmail.com>
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <20220318114133.113627-2-kjain@linux.ibm.com>
 <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
 <c198a1b5-cc7e-4e51-533b-a5794f506b17@linux.ibm.com>
 <CAPcyv4j9NQ-Msr6JCp95QWAdDyTfYr65fXCoHHtjipLA=oJeHA@mail.gmail.com>
Date: Wed, 23 Mar 2022 13:18:33 +0530
Message-ID: <87a6dh3y9a.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TFr3gJPNI2gWBR5RzZV2Oj1ONwN3lgOL
X-Proofpoint-GUID: TFr3gJPNI2gWBR5RzZV2Oj1ONwN3lgOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 mlxscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230042
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
 maddy@linux.ibm.com, "Weiny, Ira" <ira.weiny@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>,
 rnsastry@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Tue, Mar 22, 2022 at 7:30 AM kajoljain <kjain@linux.ibm.com> wrote:
>>
>>
>>
>> On 3/22/22 03:09, Dan Williams wrote:
>> > On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>> >>
>> >> The following build failure occures when CONFIG_PERF_EVENTS is not set
>> >> as generic pmu functions are not visible in that scenario.
>> >>
>> >> arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: =E2=80=98str=
uct perf_event=E2=80=99 has no member named =E2=80=98attr=E2=80=99
>> >>          p->nvdimm_events_map[event->attr.config],
>> >>                                    ^~
>> >> In file included from ./include/linux/list.h:5,
>> >>                  from ./include/linux/kobject.h:19,
>> >>                  from ./include/linux/of.h:17,
>> >>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
>> >> arch/powerpc/platforms/pseries/papr_scm.c: In function =E2=80=98papr_=
scm_pmu_event_init=E2=80=99:
>> >> arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: =E2=80=98str=
uct perf_event=E2=80=99 has no member named =E2=80=98pmu=E2=80=99
>> >>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
>> >>                                                  ^~
>> >> ./include/linux/container_of.h:18:26: note: in definition of macro =
=E2=80=98container_of=E2=80=99
>> >>   void *__mptr =3D (void *)(ptr);     \
>> >>                           ^~~
>> >> arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion =
of macro =E2=80=98to_nvdimm_pmu=E2=80=99
>> >>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
>> >>                               ^~~~~~~~~~~~~
>> >> In file included from ./include/linux/bits.h:22,
>> >>                  from ./include/linux/bitops.h:6,
>> >>                  from ./include/linux/of.h:15,
>> >>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
>> >>
>> >> Fix the build issue by adding check for CONFIG_PERF_EVENTS config opt=
ion
>> >> and disabling the papr_scm perf interface support incase this config
>> >> is not set
>> >>
>> >> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") =
(Commit id
>> >> based on linux-next tree)
>> >> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> >> ---
>> >>  arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++
>> >
>> > This is a bit messier than I would have liked mainly because it dumps
>> > a bunch of ifdefery into a C file contrary to coding style, "Wherever
>> > possible, don't use preprocessor conditionals (#if, #ifdef) in .c
>> > files". I would expect this all to move to an organization like:
>>
>> Hi Dan,
>>       Thanks for reviewing the patches. Inorder to avoid the multiple
>> ifdefs checks, we can also add stub function for papr_scm_pmu_register.
>> With that change we will just have one ifdef check for
>> CONFIG_PERF_EVENTS config in both papr_scm.c and nd.h file. Hence we can
>> avoid adding new files specific for papr_scm perf interface.
>>
>> Below is the code snippet for that change, let me know if looks fine to
>> you. I tested it
>> with set/unset PAPR_SCM config value and set/unset PERF_EVENTS config
>> value combinations.
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
>> b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 4dd513d7c029..38fabb44d3c3 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -69,8 +69,6 @@
>>  #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
>>  #define PAPR_SCM_PERF_STATS_VERSION 0x1
>>
>> -#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pm=
u)
>> -
>>  /* Struct holding a single performance metric */
>>  struct papr_scm_perf_stat {
>>         u8 stat_id[8];
>> @@ -346,6 +344,9 @@ static ssize_t drc_pmem_query_stats(struct
>> papr_scm_priv *p,
>>         return 0;
>>  }
>>
>> +#ifdef CONFIG_PERF_EVENTS
>> +#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pm=
u)
>> +
>>  static int papr_scm_pmu_get_value(struct perf_event *event, struct
>> device *dev, u64 *count)
>>  {
>>         struct papr_scm_perf_stat *stat;
>> @@ -558,6 +559,10 @@ static void papr_scm_pmu_register(struct
>> papr_scm_priv *p)
>>         dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=3D%d\n", =
rc);
>>  }
>>
>> +#else
>> +static inline void papr_scm_pmu_register(struct papr_scm_priv *p) { }
>
> Since this isn't in a header file, it does not need to be marked
> "inline" the compiler will figure it out.
>
>> +#endif
>
> It might be time to create:
>
> arch/powerpc/platforms/pseries/papr_scm.h
>
> ...there is quite a bit of header material accrued in papr_scm.c and
> once the ifdefs start landing in it then it becomes a nominal coding
> style issue. That said, this is certainly more palatable than the
> previous version. So if you don't want to create papr_scm.h yet for
> this, at least make a note in the changelog that the first portion of
> arch/powerpc/platforms/pseries/papr_scm.c is effectively papr_scm.h
> content and may move there in the future, or something like that.

Great suggestion Dan and incidently we are already working on a patchset
to reconcile this by moving a bunch of these defines from papr_scm.c to a
header. That work is primarily done to towards remove the redundancy
between papr_scm and generic ndtest module that we have today. We will
post the patches in next few days.

--=20
Cheers
~ Vaibhav
