Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2133AB53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 06:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzQdh6vnpz3cVS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 16:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fWofMuAR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fWofMuAR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzNxG6qgBz3cGc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:39:30 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F4YD19190647; Mon, 15 Mar 2021 00:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=zrvQB1396GgwXmRpBsCxHeBct/kVMnQ8Sm3HrX2IySk=;
 b=fWofMuARP0FDifRY08J1oWaVKBWgCVM3JK4b/SkBwjak+Jos/H9cvyF25UeoEA50+Dh7
 9H06ltxoPr3WSaOw7gfaIL5zXESB098OC1i4degMa216TbEaXbGTsYsFoSUid16pnMVq
 oF+CnngK3PjmPxWKOyNZ0tbJ8ZEAUaWqDAJABPDJNafYQlWuSBw1NqMi0iSRNMa07kL9
 hDXZAF9ptPnG5C1Axs1ylwGlKZ22MyHWlo0nGEUJNvfvx/284O9CgspY0u8YQMnNeIvH
 oWISdkDM1bsZ1sKIR1oDS9brxA76z/1h9/qGYIJpx1j6pIYZNUS1W6qLw2riMeM0A0ko 6A== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379rh40577-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 00:39:21 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12F4bp7B022948;
 Mon, 15 Mar 2021 04:39:19 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 378n180rej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 04:39:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12F4dHkh65798604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 04:39:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0119242049;
 Mon, 15 Mar 2021 04:39:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C30C42052;
 Mon, 15 Mar 2021 04:39:14 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.80.219.156])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 04:39:13 +0000 (GMT)
Subject: Re: [PATCH V2 2/2] powerpc/perf: Add platform specific
 check_attr_config
To: Alexey Kardashevskiy <aik@ozlabs.ru>, mpe@ellerman.id.au
References: <20210226065025.1254973-1-maddy@linux.ibm.com>
 <20210226065025.1254973-2-maddy@linux.ibm.com>
 <dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <5205e9b2-34d0-ad71-1698-780177356d77@linux.ibm.com>
Date: Mon, 15 Mar 2021 10:09:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru>
Content-Type: multipart/alternative;
 boundary="------------648083BC2B785552C734DCDB"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_01:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150030
X-Mailman-Approved-At: Mon, 15 Mar 2021 16:55:43 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------648083BC2B785552C734DCDB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/10/21 6:46 PM, Alexey Kardashevskiy wrote:
>
>
> On 26/02/2021 17:50, Madhavan Srinivasan wrote:
>> Add platform specific attr.config value checks. Patch
>> includes checks for both power9 and power10.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> Changelog v1:
>> - No changes.
>>
>>   arch/powerpc/perf/isa207-common.c | 41 +++++++++++++++++++++++++++++++
>>   arch/powerpc/perf/isa207-common.h |  2 ++
>>   arch/powerpc/perf/power10-pmu.c   | 13 ++++++++++
>>   arch/powerpc/perf/power9-pmu.c    | 13 ++++++++++
>>   4 files changed, 69 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/isa207-common.c 
>> b/arch/powerpc/perf/isa207-common.c
>> index e4f577da33d8..b255799f5b51 100644
>> --- a/arch/powerpc/perf/isa207-common.c
>> +++ b/arch/powerpc/perf/isa207-common.c
>> @@ -694,3 +694,44 @@ int isa207_get_alternatives(u64 event, u64 
>> alt[], int size, unsigned int flags,
>>         return num_alt;
>>   }
>> +
>> +int isa3_X_check_attr_config(struct perf_event *ev)
>
>
> "isa300" is used everywhere else to refer to ISA 3.00.


ok will rename if as isa3XX_check_attr_config then.


>
>
>> +{
>> +    u64 val, sample_mode;
>> +    u64 event = ev->attr.config;
>> +
>> +    val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
>
> I am not familiar with the code - "Raw event encoding for Power9" from 
> arch/powerpc/perf/power9-pmu.c - where is this from? Is this how linux 
> defines encoding or it is P9 UM or something?

mpe and pmu folks defined the encoding format for power8, and then it 
was carried forward slightly modified for P9.

>
>> +    sample_mode = val & 0x3;
>> +
>> +    /*
>> +     * MMCRA[61:62] is Randome Sampling Mode (SM).
>> +     * value of 0b11 is reserved.
>> +     */
>> +    if (sample_mode == 0x3)
>> +        return -1;
>> +
>> +    /*
>> +     * Check for all reserved value
>> +     */
>> +    switch (val) {
>> +    case 0x5:
>> +    case 0x9:
>> +    case 0xD:
>> +    case 0x19:
>> +    case 0x1D:
>> +    case 0x1A:
>> +    case 0x1E:
>
>
> What spec did these numbers come from?


Thanks for asking. Yes, these are published as part of Performance 
monitoring unit user guide.

https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf

Will add a comment about the source of these bits.


>
>> +        return -1;
>> +    }
>> +
>> +    /*
>> +     * MMCRA[48:51]/[52:55]) Threshold Start/Stop
>> +     * Events Selection.
>> +     * 0b11110000/0b00001111 is reserved.
>
> The mapping between the event and MMCRA is very unclear :) But there 
> are more reserved values in MMCRA in PowerISA_public.v3.0B.pdf:
>
> ===
> 0000 Reserved
>
> Problem state access (SPR 770)
> 1000 - 1111 - ReservedPrivileged access (SPR 770 or 786)
> 1000 - 1111 - Implementation-dependent
> ===
>
> Do not you need to filter these too?


Most of these bits are not architected but one should refer user guide 
spec which talks about each bit and supported values.

https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf


>
>> +     */
>> +    val = (event >> EVENT_THR_CTL_SHIFT) & EVENT_THR_CTL_MASK;
>> +    if (((val & 0xF0) == 0xF0) || ((val & 0xF) == 0xF))
>> +        return -1;
>
> Since the filters may differ for problem and privileged, may be make 
> these check_attr_config() hooks return EINVAL or EPERM and pass it on 
> in the caller? Not sure there is much value in it though.


Since these are reserved values, privilege state does not matter. Will 
change it to return EINVAL.


Thanks for the review.

Maddy


>
>
>
>> +
>> +    return 0;
>> +}
>> diff --git a/arch/powerpc/perf/isa207-common.h 
>> b/arch/powerpc/perf/isa207-common.h
>> index 1af0e8c97ac7..ae8eaf05efd1 100644
>> --- a/arch/powerpc/perf/isa207-common.h
>> +++ b/arch/powerpc/perf/isa207-common.h
>> @@ -280,4 +280,6 @@ void isa207_get_mem_data_src(union 
>> perf_mem_data_src *dsrc, u32 flags,
>>                               struct pt_regs *regs);
>>   void isa207_get_mem_weight(u64 *weight);
>>   +int isa3_X_check_attr_config(struct perf_event *ev);
>> +
>>   #endif
>> diff --git a/arch/powerpc/perf/power10-pmu.c 
>> b/arch/powerpc/perf/power10-pmu.c
>> index a901c1348cad..bc64354cab6a 100644
>> --- a/arch/powerpc/perf/power10-pmu.c
>> +++ b/arch/powerpc/perf/power10-pmu.c
>> @@ -106,6 +106,18 @@ static int power10_get_alternatives(u64 event, 
>> unsigned int flags, u64 alt[])
>>       return num_alt;
>>   }
>>   +static int power10_check_attr_config(struct perf_event *ev)
>> +{
>> +    u64 val;
>> +    u64 event = ev->attr.config;
>> +
>> +    val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
>> +    if (val == 0x10 || isa3_X_check_attr_config(ev))
>> +        return -1;
>> +
>> +    return 0;
>> +}
>> +
>>   GENERIC_EVENT_ATTR(cpu-cycles,            PM_RUN_CYC);
>>   GENERIC_EVENT_ATTR(instructions,        PM_RUN_INST_CMPL);
>>   GENERIC_EVENT_ATTR(branch-instructions,        PM_BR_CMPL);
>> @@ -559,6 +571,7 @@ static struct power_pmu power10_pmu = {
>>       .attr_groups        = power10_pmu_attr_groups,
>>       .bhrb_nr        = 32,
>>       .capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
>> +    .check_attr_config    = power10_check_attr_config,
>>   };
>>     int init_power10_pmu(void)
>> diff --git a/arch/powerpc/perf/power9-pmu.c 
>> b/arch/powerpc/perf/power9-pmu.c
>> index 2a57e93a79dc..b3b9b226d053 100644
>> --- a/arch/powerpc/perf/power9-pmu.c
>> +++ b/arch/powerpc/perf/power9-pmu.c
>> @@ -151,6 +151,18 @@ static int power9_get_alternatives(u64 event, 
>> unsigned int flags, u64 alt[])
>>       return num_alt;
>>   }
>>   +static int power9_check_attr_config(struct perf_event *ev)
>> +{
>> +    u64 val;
>> +    u64 event = ev->attr.config;
>> +
>> +    val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
>> +    if (val == 0xC || isa3_X_check_attr_config(ev))
>> +        return -1;
>> +
>> +    return 0;
>> +}
>> +
>>   GENERIC_EVENT_ATTR(cpu-cycles,            PM_CYC);
>>   GENERIC_EVENT_ATTR(stalled-cycles-frontend, PM_ICT_NOSLOT_CYC);
>>   GENERIC_EVENT_ATTR(stalled-cycles-backend,    PM_CMPLU_STALL);
>> @@ -437,6 +449,7 @@ static struct power_pmu power9_pmu = {
>>       .attr_groups        = power9_pmu_attr_groups,
>>       .bhrb_nr        = 32,
>>       .capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
>> +    .check_attr_config    = power9_check_attr_config,
>>   };
>>     int init_power9_pmu(void)
>>
>

--------------648083BC2B785552C734DCDB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/10/21 6:46 PM, Alexey
      Kardashevskiy wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru">
      <br>
      <br>
      On 26/02/2021 17:50, Madhavan Srinivasan wrote:
      <br>
      <blockquote type="cite">Add platform specific attr.config value
        checks. Patch
        <br>
        includes checks for both power9 and power10.
        <br>
        <br>
        Signed-off-by: Madhavan Srinivasan <a class="moz-txt-link-rfc2396E" href="mailto:maddy@linux.ibm.com">&lt;maddy@linux.ibm.com&gt;</a>
        <br>
        ---
        <br>
        Changelog v1:
        <br>
        - No changes.
        <br>
        <br>
          arch/powerpc/perf/isa207-common.c | 41
        +++++++++++++++++++++++++++++++
        <br>
          arch/powerpc/perf/isa207-common.h |  2 ++
        <br>
          arch/powerpc/perf/power10-pmu.c   | 13 ++++++++++
        <br>
          arch/powerpc/perf/power9-pmu.c    | 13 ++++++++++
        <br>
          4 files changed, 69 insertions(+)
        <br>
        <br>
        diff --git a/arch/powerpc/perf/isa207-common.c
        b/arch/powerpc/perf/isa207-common.c
        <br>
        index e4f577da33d8..b255799f5b51 100644
        <br>
        --- a/arch/powerpc/perf/isa207-common.c
        <br>
        +++ b/arch/powerpc/perf/isa207-common.c
        <br>
        @@ -694,3 +694,44 @@ int isa207_get_alternatives(u64 event, u64
        alt[], int size, unsigned int flags,
        <br>
                return num_alt;
        <br>
          }
        <br>
        +
        <br>
        +int isa3_X_check_attr_config(struct perf_event *ev)
        <br>
      </blockquote>
      <br>
      <br>
      "isa300" is used everywhere else to refer to ISA 3.00.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>ok will rename if as isa3XX_check_attr_config then.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru">
      <br>
      <br>
      <blockquote type="cite">+{
        <br>
        +    u64 val, sample_mode;
        <br>
        +    u64 event = ev-&gt;attr.config;
        <br>
        +
        <br>
        +    val = (event &gt;&gt; EVENT_SAMPLE_SHIFT) &amp;
        EVENT_SAMPLE_MASK;
        <br>
      </blockquote>
      <br>
      I am not familiar with the code - "Raw event encoding for Power9"
      from arch/powerpc/perf/power9-pmu.c - where is this from? Is this
      how linux defines encoding or it is P9 UM or something?
      <br>
    </blockquote>
    <p>mpe and pmu folks defined the encoding format for power8, and
      then it was carried forward slightly modified for P9.<span
        style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(248, 248,
        248); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"></span></p>
    <blockquote type="cite"
      cite="mid:dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru">
      <br>
      <blockquote type="cite">+    sample_mode = val &amp; 0x3;
        <br>
        +
        <br>
        +    /*
        <br>
        +     * MMCRA[61:62] is Randome Sampling Mode (SM).
        <br>
        +     * value of 0b11 is reserved.
        <br>
        +     */
        <br>
        +    if (sample_mode == 0x3)
        <br>
        +        return -1;
        <br>
        +
        <br>
        +    /*
        <br>
        +     * Check for all reserved value
        <br>
        +     */
        <br>
        +    switch (val) {
        <br>
        +    case 0x5:
        <br>
        +    case 0x9:
        <br>
        +    case 0xD:
        <br>
        +    case 0x19:
        <br>
        +    case 0x1D:
        <br>
        +    case 0x1A:
        <br>
        +    case 0x1E:
        <br>
      </blockquote>
      <br>
      <br>
      What spec did these numbers come from?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks for asking. Yes, these are published as part of
      Performance monitoring unit user guide.</p>
    <p><a class="moz-txt-link-freetext" href="https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf">https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf</a><br>
    </p>
    <p>Will add a comment about the source of these bits.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru">
      <br>
      <blockquote type="cite">+        return -1;
        <br>
        +    }
        <br>
        +
        <br>
        +    /*
        <br>
        +     * MMCRA[48:51]/[52:55]) Threshold Start/Stop
        <br>
        +     * Events Selection.
        <br>
        +     * 0b11110000/0b00001111 is reserved.
        <br>
      </blockquote>
      <br>
      The mapping between the event and MMCRA is very unclear :) But
      there are more reserved values in MMCRA in
      PowerISA_public.v3.0B.pdf:
      <br>
      <br>
      ===
      <br>
      0000 Reserved
      <br>
      <br>
      Problem state access (SPR 770)
      <br>
      1000 - 1111 - ReservedPrivileged access (SPR 770 or 786)
      <br>
      1000 - 1111 - Implementation-dependent
      <br>
      ===
      <br>
      <br>
      Do not you need to filter these too?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Most of these bits are not architected but one should refer user
      guide spec which talks about each bit and supported values.</p>
    <p><a class="moz-txt-link-freetext" href="https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf">https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf</a></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru">
      <br>
      <blockquote type="cite">+     */
        <br>
        +    val = (event &gt;&gt; EVENT_THR_CTL_SHIFT) &amp;
        EVENT_THR_CTL_MASK;
        <br>
        +    if (((val &amp; 0xF0) == 0xF0) || ((val &amp; 0xF) == 0xF))
        <br>
        +        return -1;
        <br>
      </blockquote>
      <br>
      Since the filters may differ for problem and privileged, may be
      make these check_attr_config() hooks return EINVAL or EPERM and
      pass it on in the caller? Not sure there is much value in it
      though.</blockquote>
    <p><br>
    </p>
    <p>Since these are reserved values, privilege state does not matter.
      Will change it to return EINVAL.</p>
    <p><br>
    </p>
    <p>Thanks for the review.</p>
    <p>Maddy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru">
      <br>
      <br>
      <br>
      <blockquote type="cite">+
        <br>
        +    return 0;
        <br>
        +}
        <br>
        diff --git a/arch/powerpc/perf/isa207-common.h
        b/arch/powerpc/perf/isa207-common.h
        <br>
        index 1af0e8c97ac7..ae8eaf05efd1 100644
        <br>
        --- a/arch/powerpc/perf/isa207-common.h
        <br>
        +++ b/arch/powerpc/perf/isa207-common.h
        <br>
        @@ -280,4 +280,6 @@ void isa207_get_mem_data_src(union
        perf_mem_data_src *dsrc, u32 flags,
        <br>
                                      struct pt_regs *regs);
        <br>
          void isa207_get_mem_weight(u64 *weight);
        <br>
          +int isa3_X_check_attr_config(struct perf_event *ev);
        <br>
        +
        <br>
          #endif
        <br>
        diff --git a/arch/powerpc/perf/power10-pmu.c
        b/arch/powerpc/perf/power10-pmu.c
        <br>
        index a901c1348cad..bc64354cab6a 100644
        <br>
        --- a/arch/powerpc/perf/power10-pmu.c
        <br>
        +++ b/arch/powerpc/perf/power10-pmu.c
        <br>
        @@ -106,6 +106,18 @@ static int power10_get_alternatives(u64
        event, unsigned int flags, u64 alt[])
        <br>
              return num_alt;
        <br>
          }
        <br>
          +static int power10_check_attr_config(struct perf_event *ev)
        <br>
        +{
        <br>
        +    u64 val;
        <br>
        +    u64 event = ev-&gt;attr.config;
        <br>
        +
        <br>
        +    val = (event &gt;&gt; EVENT_SAMPLE_SHIFT) &amp;
        EVENT_SAMPLE_MASK;
        <br>
        +    if (val == 0x10 || isa3_X_check_attr_config(ev))
        <br>
        +        return -1;
        <br>
        +
        <br>
        +    return 0;
        <br>
        +}
        <br>
        +
        <br>
          GENERIC_EVENT_ATTR(cpu-cycles,            PM_RUN_CYC);
        <br>
          GENERIC_EVENT_ATTR(instructions,        PM_RUN_INST_CMPL);
        <br>
          GENERIC_EVENT_ATTR(branch-instructions,        PM_BR_CMPL);
        <br>
        @@ -559,6 +571,7 @@ static struct power_pmu power10_pmu = {
        <br>
              .attr_groups        = power10_pmu_attr_groups,
        <br>
              .bhrb_nr        = 32,
        <br>
              .capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
        <br>
        +    .check_attr_config    = power10_check_attr_config,
        <br>
          };
        <br>
            int init_power10_pmu(void)
        <br>
        diff --git a/arch/powerpc/perf/power9-pmu.c
        b/arch/powerpc/perf/power9-pmu.c
        <br>
        index 2a57e93a79dc..b3b9b226d053 100644
        <br>
        --- a/arch/powerpc/perf/power9-pmu.c
        <br>
        +++ b/arch/powerpc/perf/power9-pmu.c
        <br>
        @@ -151,6 +151,18 @@ static int power9_get_alternatives(u64
        event, unsigned int flags, u64 alt[])
        <br>
              return num_alt;
        <br>
          }
        <br>
          +static int power9_check_attr_config(struct perf_event *ev)
        <br>
        +{
        <br>
        +    u64 val;
        <br>
        +    u64 event = ev-&gt;attr.config;
        <br>
        +
        <br>
        +    val = (event &gt;&gt; EVENT_SAMPLE_SHIFT) &amp;
        EVENT_SAMPLE_MASK;
        <br>
        +    if (val == 0xC || isa3_X_check_attr_config(ev))
        <br>
        +        return -1;
        <br>
        +
        <br>
        +    return 0;
        <br>
        +}
        <br>
        +
        <br>
          GENERIC_EVENT_ATTR(cpu-cycles,            PM_CYC);
        <br>
          GENERIC_EVENT_ATTR(stalled-cycles-frontend,   
        PM_ICT_NOSLOT_CYC);
        <br>
          GENERIC_EVENT_ATTR(stalled-cycles-backend,    PM_CMPLU_STALL);
        <br>
        @@ -437,6 +449,7 @@ static struct power_pmu power9_pmu = {
        <br>
              .attr_groups        = power9_pmu_attr_groups,
        <br>
              .bhrb_nr        = 32,
        <br>
              .capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
        <br>
        +    .check_attr_config    = power9_check_attr_config,
        <br>
          };
        <br>
            int init_power9_pmu(void)
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------648083BC2B785552C734DCDB--

