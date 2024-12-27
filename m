Return-Path: <linuxppc-dev+bounces-4492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A9E9FD34F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 11:52:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKMlH4rC3z2xfW;
	Fri, 27 Dec 2024 21:52:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735296747;
	cv=none; b=ORdtWH43Yw0JIFp2DmK0EUsAbu/oRUgZDyYT7QNRtNCKrKqeVj7R6znQEYtN1ZvVye/yNgQPUmxZZAeIgJ7xpYaDUyT9R1Lqh3/TZvsFvyOfkh85C/AxorPPn2Ox6Jr/Nh3saP20cmMzuxiAyqFfcMwPZy2Odt82wz4ljWGY3LHSC5SFVXcwsJpCY0bTtaDJxjp1TIi8sMsILWggGcd9KePpQFeFQ5jFNq5YUnG8eTIdlI0BxUDAwsUEejYSzROc8CxWS2C/V/dEfigNz/p+4Zs2nTt0FqP4bvMfS9CjYOh+m1vBQV7DgYTZZNXqCLGZUY0lhMgyYqbKZbz6qCVyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735296747; c=relaxed/relaxed;
	bh=TxC/uVaaYCioJdp+8heV+g8Ns+LIhY/3VV2bUm5VDk4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SnJCnK6onAR2VNpV4qJOCBhasdJ+X8RqbwLND9UDUXdRIGyqeeZgi3gPbkoyXghkpjID4emfsPkTEJm7+1ADAzvXjS5aZeNyiteDyNlWBxfkIyet55n3lvNdBlGWB44KxaYyz/JAsXv/cx87FA0tvb8t2/U/+q1Y1YgWFl+iae2q9KHbdk2FGBSlzyBNZZBWAOacthtym7ySatenYQmKbe9KcGxNfpLm5yMsamKiZYZr2woPdWHQZj9ce+5q7hfw5o7r6zaF1tsCf+7och21zTpF00my6OdaOw2xnfghrvLSJDlprVFUbQipN3lmkPniH6S6o6Uiw8j2OyBIguCgsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdF27Oy1; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdF27Oy1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKMlG4cbWz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 21:52:26 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR7INCk017052;
	Fri, 27 Dec 2024 10:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TxC/uV
	aaYCioJdp+8heV+g8Ns+LIhY/3VV2bUm5VDk4=; b=JdF27Oy16pkkWbtS9g6dUn
	VCfZVIR1sFmFAA5Vf5VJUqqtgwZcrFbcRoHJc3VLUC74Sr0pFHxshhDf+XGaTATB
	9YBVBcgc9FrxI/tZoBujT9heGgwatZXH4jGblTt+0crjhE+ZxYzsbaIAnxSeO4dt
	xujcEMy2eLBcKv9rcWn5GipbqUQzs5zcCH2iDCCL/EavP0bHMxNw5RrSIWzZiH38
	5S3X49Fmyr5E9MiPDSGlpLyNB0Ck6hOXemSfRRxxGyjOjT6QVsXn1S2r1OZ3RBpM
	4tnGfgBCcgchurYa1xdcwSEQpT97fhAfTsssoB7vVHuRqkE1/dTnWTsZqf8/GC+Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43s8m4udch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:52:20 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BRAmU8M025381;
	Fri, 27 Dec 2024 10:52:20 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43s8m4udcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:52:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR86EBv010606;
	Fri, 27 Dec 2024 10:52:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p90ndje5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:52:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BRAqFjB50463028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Dec 2024 10:52:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 664B120040;
	Fri, 27 Dec 2024 10:52:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBF7820049;
	Fri, 27 Dec 2024 10:52:09 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.185])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Dec 2024 10:52:09 +0000 (GMT)
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
In-Reply-To: <A3E56051-673C-4DFE-B4E0-66BE324ADF15@linux.vnet.ibm.com>
Date: Fri, 27 Dec 2024 16:21:55 +0530
Cc: jolsa@kernel.org, adrian.hunter@intel.com,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4D0D083A-ACFA-4629-9408-616E88E4600F@linux.vnet.ibm.com>
References: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
 <941c3d6a-fc2-3fcf-5ab2-597dcf712c16@redhat.com>
 <0FEA83FD-BBC9-4E83-82D6-044141E86F76@linux.vnet.ibm.com>
 <1da9544-1e17-3830-49f9-6a6d78439e71@redhat.com>
 <1A1D31B9-6555-4550-BB8F-171402C6D88A@linux.vnet.ibm.com>
 <A3E56051-673C-4DFE-B4E0-66BE324ADF15@linux.vnet.ibm.com>
To: Michael Petlan <mpetlan@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L6Paa0hAFreWtAyKf3Vx6FCU1Mzer7p5
X-Proofpoint-ORIG-GUID: 1QF8a3kELtaaxW825W829_VcPlPRmQ_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 17 Dec 2024, at 12:27=E2=80=AFAM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
>> On 5 Dec 2024, at 11:16=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>>> On 14 Nov 2024, at 3:35=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>>>=20
>>> On Sun, 3 Nov 2024, Athira Rajeev wrote:
>>>>> On 17 Oct 2024, at 3:44=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>>>>>=20
>>>>> On Mon, 14 Oct 2024, Athira Rajeev wrote:
>>> [...]
>>>>>=20
>>>>> I am wondering how it could happen that there were other
>>>>> probes in the system?
>>>>=20
>>>> Hi Michael,
>>>>=20
>>> Hello Athira.
>>>=20
>>>> Sorry for the late response.
>>>>=20
>>>> Yes, there are uprobes listed as part of =E2=80=9Cperf probe=E2=80=9D=
 in the environment where I saw the test needing this change. Sharing =
the result below from perf probe:=20
>>>>=20
>>>> # ./perf probe -l
>>>> uprobes:p_uprobe_dns_events_osquery4026531841 (on getaddrinfo in =
XX)
>>>> uprobes:p_uprobe_dns_events_osquery4026532336 (on 0x129a60 in XX)
>>>> uprobes:p_uprobe_dns_events_osquery4026532344 (on 0x129a60 in XX)
>>>> uprobes:p_uprobe_ebpf_compat_check_osquery (on __GI___backtrace in =
XX)
>>>> uprobes:p_uprobe_sys_hook_osquery (on backtrace_symbols in XX)
>>>>=20
>>>> These can=E2=80=99t be removed.
>>>>=20
>>>> # ./perf probe -d uprobes:p_uprobe_dns_events_osquery4026531841
>>>> Removed event: uprobes:p_uprobe_dns_events_osquery4026531841
>>>> Failed to delete event: Device or resource busy
>>>> Error: Failed to delete events.
>>>>=20
>>>=20
>>> Ah, this is interesting, I have never hit that. However, it makes =
sense,
>>> if the resource is busy.
>>>=20
>>> However, in that case it comes to my mind that in general, these =
tests
>>> should not be run in any production environment, where one could =
rely on
>>> some probes will exist, etc. In case some of the probes above was =
not
>>> busy, it'd be probably cleaned up by the testcase, which might be =
unexpected
>>> by the creator/user of the uprobes... Maybe we should get rid of the
>>> probe cleaning for that cases, but I'd prefer to keep it.
>>>=20
>>>> Considering above scenario, patch here takes the probe count using:
>>>> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>>=20
>>>> Also similarly looks for TEST_PROBE in result log in case of probe =
=E2=80=94del as well
>>>>=20
>>>> Any comments Michael ?
>>>>=20
>>> Yes, we probably should tweak it as you suggest.
>>=20
>> Hi,
>>=20
>> Thanks for checking Michael.
>>=20
>> If the patch looks good, can we please get this pulled in ?
>>=20
>=20
> Hi,
>=20
> Can we please pull in this patch if it looks fine.
>=20
> Thanks
> Athira

Hi,

Looking for review comments on this

Athira
>> Thanks
>> Athira
>>>=20
>>> Thanks,
>>> Michael
>>>=20
>>>=20
>>>> Thanks
>>>> Athira
>>>>=20
>>>>>=20
>>>>> Cheers,
>>>>>=20
>>>>> Michael
>>>>>=20
>>>>>>=20
>>>>>> Example, in the system where this failed, already some
>>>>>> probes were default added. So count became 10
>>>>>> ./perf probe -l | wc -l
>>>>>> 10
>>>>>>=20
>>>>>> So to be specific for "inode_permission", restrict the
>>>>>> probe count check to that probe point alone using :
>>>>>> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>>>>=20
>>>>>> Similarly while removing the probe using "probe --del *",
>>>>>> ( removing all probes ), check uses:
>>>>>>=20
>>>>>> ../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE"
>>>>>>=20
>>>>>> But if there are other probes in the system, the log will
>>>>>> contain reference to other existing probe too. Hence change
>>>>>> usage of check_all_lines_matched.pl to =
check_all_patterns_found.pl
>>>>>> This will make sure expecting string comes in the result
>>>>>>=20
>>>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>>>> ---
>>>>>> tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
>>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>=20
>>>>>> diff --git =
a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh =
b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>>> index d541ffd44a93..f8b5f096d0d7 100755
>>>>>> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>>> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>>> @@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE =
$CHECK_EXIT_CODE "force-adding probes :: second pr
>>>>>> (( TEST_RESULT +=3D $? ))
>>>>>>=20
>>>>>> # adding existing probe with '--force' should pass
>>>>>> -NO_OF_PROBES=3D`$CMD_PERF probe -l | wc -l`
>>>>>> +NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>>>> $CMD_PERF probe --force --add $TEST_PROBE 2> =
$LOGS_DIR/adding_kernel_forceadd_03.err
>>>>>> PERF_EXIT_CODE=3D$?
>>>>>>=20
>>>>>> @@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE =
$CHECK_EXIT_CODE "using doubled probe"
>>>>>> $CMD_PERF probe --del \* 2> =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>>>> PERF_EXIT_CODE=3D$?
>>>>>>=20
>>>>>> -../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>>>> +../common/check_all_patterns_found.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>>>> CHECK_EXIT_CODE=3D$?
>>>>>>=20
>>>>>> print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple =
probes"
>>>>>> --=20
>>>>>> 2.43.5



