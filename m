Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E173BD3AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 13:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK1Hn1Y5Pz3bXj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 21:56:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hdM04e1/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hdM04e1/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK1HJ3R5lz300S
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 21:56:27 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166BY7sq093435; Tue, 6 Jul 2021 07:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eAxSoAMfy4WoRm6Nob+I0xEpZ8yxFb5egnCHiA4R4fk=;
 b=hdM04e1/UZOt5sSzBvmJyJ5K7lIPw2Ck6xURH6ihBj6phyEslpAdtkhpWlaKodXE4Gdj
 EtZb2H+Jy2qy2zDvqeNfQDXPD5SvpuniGKJAcl/24kqciBY4ZcdnxeBma+5btMiietnZ
 FzDEXOOMJ/8yXAb66N1lBSNtDWlitJ0a5luYJ6QcTNgGQw4GOMtl0Kyxw7sKC9kRHShD
 AisACQ5S94u+NmYxL0hMhgb28idH99ZOANQ7b/cKm5+SNzof7Hf5dU7OmOhXQOFBNHrZ
 BIvb7NbPG4k2DBM+4smkpE9cxu+leCohz3FCrz91XWgnOnsrfMleZg2acHbpG9bcqfox Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39m8xsub6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 07:56:20 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 166BYXce097140;
 Tue, 6 Jul 2021 07:56:20 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39m8xsub6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 07:56:20 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 166BpoYh011922;
 Tue, 6 Jul 2021 11:56:19 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 39jfhbtn83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 11:56:19 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 166BuI1p22937970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Jul 2021 11:56:18 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 101776A057;
 Tue,  6 Jul 2021 11:56:18 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BBCF6A051;
 Tue,  6 Jul 2021 11:56:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.34.44])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  6 Jul 2021 11:56:13 +0000 (GMT)
Subject: Re: [PATCH] perf script python: Fix buffer size to report iregs in
 perf script
From: kajoljain <kjain@linux.ibm.com>
To: "acme@kernel.org" <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>
References: <20210628062341.155839-1-kjain@linux.ibm.com>
 <20210628144937.GE142768@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <ee98968a-f343-a68e-9a3e-58e97dc130c8@linux.ibm.com>
Message-ID: <c6fb2136-21e1-325a-f7f7-9745dbe29661@linux.ibm.com>
Date: Tue, 6 Jul 2021 17:26:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ee98968a-f343-a68e-9a3e-58e97dc130c8@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Dac3meT_7Ga6DLoLLfplXyxG3mVH09dk
X-Proofpoint-GUID: TPByq9dt2-DxNkKd4cHAZxd3TRrruSwA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_06:2021-07-02,
 2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060057
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com,
 "Paul A. Clarke" <pc@us.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/29/21 12:39 PM, kajoljain wrote:
> 
> 
> On 6/28/21 8:19 PM, Paul A. Clarke wrote:
>> On Mon, Jun 28, 2021 at 11:53:41AM +0530, Kajol Jain wrote:
>>> Commit 48a1f565261d ("perf script python: Add more PMU fields
>>> to event handler dict") added functionality to report fields like
>>> weight, iregs, uregs etc via perf report.
>>> That commit predefined buffer size to 512 bytes to print those fields.
>>>
>>> But incase of powerpc, since we added extended regs support
>>> in commits:
>>>
>>> Commit 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
>>> Counter SPRs as part of extended regs")
>>> Commit d735599a069f ("powerpc/perf: Add extended regs support for
>>> power10 platform")
>>>
>>> Now iregs can carry more bytes of data and this predefined buffer size
>>> can result to data loss in perf script output.
>>>
>>> Patch resolve this issue by making buffer size dynamic based on number
>>> of registers needed to print. It also changed return type for function
>>> "regs_map" from int to void, as the return value is not being used by
>>> the caller function "set_regs_in_dict".
>>>
>>> Fixes: 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
>>> Counter SPRs as part of extended regs")
>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>> ---
>>>  .../util/scripting-engines/trace-event-python.c | 17 ++++++++++++-----
>>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
>>> index 4e4aa4c97ac5..c8c9706b4643 100644
>>> --- a/tools/perf/util/scripting-engines/trace-event-python.c
>>> +++ b/tools/perf/util/scripting-engines/trace-event-python.c
>> [...]
>>> @@ -713,7 +711,16 @@ static void set_regs_in_dict(PyObject *dict,
>>>  			     struct evsel *evsel)
>>>  {
>>>  	struct perf_event_attr *attr = &evsel->core.attr;
>>> -	char bf[512];
>>> +
>>> +	/*
>>> +	 * Here value 28 is a constant size which can be used to print
>>> +	 * one register value and its corresponds to:
>>> +	 * 16 chars is to specify 64 bit register in hexadecimal.
>>> +	 * 2 chars is for appending "0x" to the hexadecimal value and
>>> +	 * 10 chars is for register name.
>>> +	 */
>>> +	int size = __sw_hweight64(attr->sample_regs_intr) * 28;
>>> +	char bf[size];
>>
>> I propose using a template rather than a magic number here. Something like:
>> const char reg_name_tmpl[] = "10 chars  ";
>> const char reg_value_tmpl[] = "0x0123456789abcdef";
>> const int size = __sw_hweight64(attr->sample_regs_intr) +
>>                  sizeof reg_name_tmpl + sizeof reg_value_tmpl;
>>
> 
> Hi Paul,
>    Thanks for reviewing the patch. Yes these are
> some standardization we can do by creating macros for different
> fields.
> The basic idea is, we want to provide significant buffer size
> based on number of registers present in sample_regs_intr to accommodate
> all data.
> 

Hi Arnaldo/Jiri,
   Is the approach used in this patch looks fine to you?

Thanks,
Kajol Jain

> But before going to optimizing code, Arnaldo/Jiri, is this approach looks good to you?
> 
>> Pardon my ignorance, but is there no separation/whitespace between the name
>> and the value?
> 
> This is how we will get data via perf script
> 
> r0:0xc000000000112008
> r1:0xc000000023b37920
> r2:0xc00000000144c900
> r3:0xc0000000bc566120
> r4:0xc0000000c5600000
> r5:0x2606c6506ca
> r6:0xc000000023b378f8
> r7:0xfffffd9f93a48f0e
> .....
> 
>  And is there some significance to 10 characters for the
>> register name, or is that a magic number?
> 
> Most of the register name are within 10 characters, basically we are giving this
> magic number to make sure we have enough space in buffer to contain all registers
> name with colon.
> 
> Thanks,
> Kajol Jain
>  
>>
>> PC
>>
