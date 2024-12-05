Return-Path: <linuxppc-dev+bounces-3834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C209E5D99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y41zg3CZ9z30Tf;
	Fri,  6 Dec 2024 04:46:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733420815;
	cv=none; b=AxOH1EA6wtv49vjY/m/Gm3vrPXw3gsw8cPnz+GFq3v97W2iuEBqIQ+dKnaPP9QmxQKvGc5384yYQMsJnbRJwndittHKNRN9WQiQtoX8H/g76LoTuPRiY89EIDLZ1Ka+iejLlY9fcbY9xO0FwFytLpE3lN3Avuu5qHq/ELjrOgzHyOpKKq+S7Xdd4zs5J4Gof8l16lHEmKIjF2TQqFkV/e8kkNuJhLb1MNTQzg83QqVhuAH02R2NPhHG1PV+J1Vh7gfcpKpz6nmG6g/T6X7IuDrbg861DcqzegyeLhetKl7bJLd8/PUPgLTxzKU+CiVHwVDCVypPd8fmi9cT463HNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733420815; c=relaxed/relaxed;
	bh=lYSYoihjG2eFL1YIoKOt6+AplEmbyKBmWaTidd4eHvQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RE2ZR8FLMz7Fnx5L+WbfeQ9n9dngzBbbDuBJgtnYRzkKvcIhSuD8XlTbBXJiGZBoQpYhFevPwFYhlKYTSoV3NOPJ38fYBQZjNtqZht3Rwm8aet4SFtDe+IUyMgldzFzq974CiaDCR1gctDLlSGYs6SRIF45fbNGn4bR6WaG2Tahck58i229BFNbIMnuF32yjKRHcHM3BOOYc2b6XMNXxeYWtZZq948JHbjvmmkCOAeYPJe+HP73uYC/SzFtk0ji3C7RrI+6j3baKIo/r1sSrn/JPPK51XClhGmAeh/869ET2pNxLSAWGX0e5w6tZIbrP/FQZflqutGD+rtwfdZnCww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DjQ8egvF; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DjQ8egvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y41zd5gZqz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:46:53 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5FesFv031219;
	Thu, 5 Dec 2024 17:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lYSYoi
	hjG2eFL1YIoKOt6+AplEmbyKBmWaTidd4eHvQ=; b=DjQ8egvFKwggmfDfF8/Xcr
	6SI+FoPAKpfLENHIvdaruT8ZL7L5LaXLTDIKraidg5kPyBd++xzFAsBaqBVFHZM0
	htrsy6L6M3/U9FrU0vqeGhmKBXCfxfEXjFdBvw8zcC8kIFiEVZT7E7xDM5O2u8gg
	N5Fky0xMdxmXy7VHXsWyxKrkKUbeDN1/reaIRTjgBY1X/hvWMZPeuZtx4fDW6+B2
	bo/59Qf7QZJuDiqsA/R6lWIai8eo6S30z2P4Hq7L/+GLaRvYHkkKWsL9inrLVXoB
	bgQZjbKrQ0GDTV37HdskPFixyxHbu9EJZnBx9kSnjyYl1jk6AdhsOshL4DBqRgRg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43b6hb3hxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:46:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B5Hi6Rs025568;
	Thu, 5 Dec 2024 17:46:47 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43b6hb3hxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:46:47 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5GAq9Z007467;
	Thu, 5 Dec 2024 17:46:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 438f8jtvqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 17:46:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5HkgEf34669168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 17:46:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6963420043;
	Thu,  5 Dec 2024 17:46:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7F3A20040;
	Thu,  5 Dec 2024 17:46:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.236])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Dec 2024 17:46:36 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf/tests/base_probe: Fix check for the count of
 existing probes in test_adding_kernel
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1da9544-1e17-3830-49f9-6a6d78439e71@redhat.com>
Date: Thu, 5 Dec 2024 23:16:23 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        namhyung@kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A1D31B9-6555-4550-BB8F-171402C6D88A@linux.vnet.ibm.com>
References: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
 <941c3d6a-fc2-3fcf-5ab2-597dcf712c16@redhat.com>
 <0FEA83FD-BBC9-4E83-82D6-044141E86F76@linux.vnet.ibm.com>
 <1da9544-1e17-3830-49f9-6a6d78439e71@redhat.com>
To: Michael Petlan <mpetlan@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l7XD6oizhTv72z-fWJmvemkVeWFZXl3o
X-Proofpoint-GUID: TLi-ki336M_jxNZCz-7B6k28BOdSNTWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 14 Nov 2024, at 3:35=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>=20
> On Sun, 3 Nov 2024, Athira Rajeev wrote:
>>> On 17 Oct 2024, at 3:44=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>>>=20
>>> On Mon, 14 Oct 2024, Athira Rajeev wrote:
> [...]
>>>=20
>>> I am wondering how it could happen that there were other
>>> probes in the system?
>>=20
>> Hi Michael,
>>=20
> Hello Athira.
>=20
>> Sorry for the late response.
>>=20
>> Yes, there are uprobes listed as part of =E2=80=9Cperf probe=E2=80=9D =
in the environment where I saw the test needing this change. Sharing the =
result below from perf probe:=20
>>=20
>> # ./perf probe -l
>>  uprobes:p_uprobe_dns_events_osquery4026531841 (on getaddrinfo in XX)
>>  uprobes:p_uprobe_dns_events_osquery4026532336 (on 0x129a60 in XX)
>>  uprobes:p_uprobe_dns_events_osquery4026532344 (on 0x129a60 in XX)
>>  uprobes:p_uprobe_ebpf_compat_check_osquery (on __GI___backtrace in =
XX)
>>  uprobes:p_uprobe_sys_hook_osquery (on backtrace_symbols in XX)
>>=20
>> These can=E2=80=99t be removed.
>>=20
>> # ./perf probe -d uprobes:p_uprobe_dns_events_osquery4026531841
>> Removed event: uprobes:p_uprobe_dns_events_osquery4026531841
>> Failed to delete event: Device or resource busy
>>  Error: Failed to delete events.
>>=20
>=20
> Ah, this is interesting, I have never hit that. However, it makes =
sense,
> if the resource is busy.
>=20
> However, in that case it comes to my mind that in general, these tests
> should not be run in any production environment, where one could rely =
on
> some probes will exist, etc. In case some of the probes above was not
> busy, it'd be probably cleaned up by the testcase, which might be =
unexpected
> by the creator/user of the uprobes... Maybe we should get rid of the
> probe cleaning for that cases, but I'd prefer to keep it.
>=20
>> Considering above scenario, patch here takes the probe count using:
>> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>=20
>> Also similarly looks for TEST_PROBE in result log in case of probe =
=E2=80=94del as well
>>=20
>> Any comments Michael ?
>>=20
> Yes, we probably should tweak it as you suggest.

Hi,

Thanks for checking Michael.

If the patch looks good, can we please get this pulled in ?

Thanks
Athira
>=20
> Thanks,
> Michael
>=20
>=20
>> Thanks
>> Athira
>>=20
>>>=20
>>> Cheers,
>>>=20
>>> Michael
>>>=20
>>>>=20
>>>> Example, in the system where this failed, already some
>>>> probes were default added. So count became 10
>>>> ./perf probe -l | wc -l
>>>> 10
>>>>=20
>>>> So to be specific for "inode_permission", restrict the
>>>> probe count check to that probe point alone using :
>>>> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>>=20
>>>> Similarly while removing the probe using "probe --del *",
>>>> ( removing all probes ), check uses:
>>>>=20
>>>> ../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE"
>>>>=20
>>>> But if there are other probes in the system, the log will
>>>> contain reference to other existing probe too. Hence change
>>>> usage of check_all_lines_matched.pl to check_all_patterns_found.pl
>>>> This will make sure expecting string comes in the result
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git =
a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh =
b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>> index d541ffd44a93..f8b5f096d0d7 100755
>>>> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>> @@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"force-adding probes :: second pr
>>>> (( TEST_RESULT +=3D $? ))
>>>>=20
>>>> # adding existing probe with '--force' should pass
>>>> -NO_OF_PROBES=3D`$CMD_PERF probe -l | wc -l`
>>>> +NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>> $CMD_PERF probe --force --add $TEST_PROBE 2> =
$LOGS_DIR/adding_kernel_forceadd_03.err
>>>> PERF_EXIT_CODE=3D$?
>>>>=20
>>>> @@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"using doubled probe"
>>>> $CMD_PERF probe --del \* 2> =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>> PERF_EXIT_CODE=3D$?
>>>>=20
>>>> -../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>> +../common/check_all_patterns_found.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>> CHECK_EXIT_CODE=3D$?
>>>>=20
>>>> print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple =
probes"
>>>> --=20
>>>> 2.43.5
>>=20
>>=20


