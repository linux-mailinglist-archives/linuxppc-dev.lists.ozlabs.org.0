Return-Path: <linuxppc-dev+bounces-4210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC09F396A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 19:58:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBq2Z1X74z2ytQ;
	Tue, 17 Dec 2024 05:57:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734375478;
	cv=none; b=NbOvabSPnjG+jPTOns9USvPM5qwJVOvFFTIAVO+wG4taoVB2j9qlPC/Y/NNXu39qYN/sTMwvaXHwfp+eUHsK3QhKqB7OOd58OS2hyK5syIAgkOP4gL7GmpJcn1/m4uwZ58p48/tRkxN+TaguIJgKVGJb97NU4Cp2QLuGDNxj0brdWNVaji3BO6W6PTVYs8Awa19oYgEehK/Ft3TFFp61J4cDJXsZ+jCwAgEt43PI9Tma4buwu3xioZfLZMovIsUDLIzON8SI0Hc4gjDZJI/vNIURRTM28l0Z+KdlJhz02NzZdy1MOqciv0YPasUCebjdxo6gwR9TUzv+7aOxAgfK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734375478; c=relaxed/relaxed;
	bh=K0iKeeEvUGhlcloY0oOHKt2iMEYxjs+mJKyhNYkb0/g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=E4Qo6uWDrC21RM2IfatISMQWcRyI6mUqH7OVh9/w2jgnZPISGFdJAup2RCZB87C+kPnVXOv7NbsbFyQ1T/uKA5sBnbiNaHxagCnK4JZAP8qR8i952JvKISPeLWGPja1VZDCTF7f2k8aDxNxlKGXm9K1XdMt//EyU/VSBwQpuAyoly0P9LyHLZB6MziaDcJ18nhqnjGFdelEJ51pxNNdZq3bFb6iDCefKvgz5ij7cz0oPcUKrpu51m1fWrBQcbvBmufQnjlQ3KpZK7o8lZoxGXr2UCIw4/AhuKp+6osQk33iWP7exbGXWujKgaVujK3ze+Hb2mNwu3e89bLb5iuYR4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y/7EgFuH; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y/7EgFuH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBq2Y0Jp5z2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 05:57:56 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEonGH012115;
	Mon, 16 Dec 2024 18:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K0iKee
	EvUGhlcloY0oOHKt2iMEYxjs+mJKyhNYkb0/g=; b=Y/7EgFuHb/KOCe1ui+tjqo
	vXK9rOLFAqzG/j5gsqBOW8QL42Fqao3F7majRA/aFM5cX54nL775gWJbQTlSTAhq
	lYSbviPKr03Q+LI2iES6V5xi6EkCAZOk/6Oalp2np05SjxDOybRMME6YLU6qLBoZ
	p+p4qIRptnSaKMVTGVXLQfPZUs6UQc1Ae3D3I8SZCdfO0y1mlCoSp8oZlTSsNCji
	giehs2m4Oi6s7pn8qTlbHHaiq2d2fYM4zLSYoUTNDfO5P83Zc9bb/KFRquOHn7q3
	c2LR4ZzmMSMXOrv8WOwCLcZnkS9I5H1f9lYqVggKoBifQuZP2adBca/wAnkf/J4Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb49a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 18:57:52 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGIvN0X017354;
	Mon, 16 Dec 2024 18:57:51 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb499w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 18:57:51 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGI6BLG024022;
	Mon, 16 Dec 2024 18:57:50 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnuk790d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 18:57:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGIvkrf33358398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 18:57:46 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52CC320043;
	Mon, 16 Dec 2024 18:57:46 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2211220040;
	Mon, 16 Dec 2024 18:57:40 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.242.205])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 16 Dec 2024 18:57:39 +0000 (GMT)
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
In-Reply-To: <1A1D31B9-6555-4550-BB8F-171402C6D88A@linux.vnet.ibm.com>
Date: Tue, 17 Dec 2024 00:27:24 +0530
Cc: jolsa@kernel.org, adrian.hunter@intel.com,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A3E56051-673C-4DFE-B4E0-66BE324ADF15@linux.vnet.ibm.com>
References: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
 <941c3d6a-fc2-3fcf-5ab2-597dcf712c16@redhat.com>
 <0FEA83FD-BBC9-4E83-82D6-044141E86F76@linux.vnet.ibm.com>
 <1da9544-1e17-3830-49f9-6a6d78439e71@redhat.com>
 <1A1D31B9-6555-4550-BB8F-171402C6D88A@linux.vnet.ibm.com>
To: Michael Petlan <mpetlan@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZNPgR43hHq1zYd-ms2dJKBfRMJUpOEqd
X-Proofpoint-GUID: Kg610QxXG4_QrX7-nmIteHpgfk6eW7oQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160154
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 5 Dec 2024, at 11:16=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
>> On 14 Nov 2024, at 3:35=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>>=20
>> On Sun, 3 Nov 2024, Athira Rajeev wrote:
>>>> On 17 Oct 2024, at 3:44=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>>>>=20
>>>> On Mon, 14 Oct 2024, Athira Rajeev wrote:
>> [...]
>>>>=20
>>>> I am wondering how it could happen that there were other
>>>> probes in the system?
>>>=20
>>> Hi Michael,
>>>=20
>> Hello Athira.
>>=20
>>> Sorry for the late response.
>>>=20
>>> Yes, there are uprobes listed as part of =E2=80=9Cperf probe=E2=80=9D =
in the environment where I saw the test needing this change. Sharing the =
result below from perf probe:=20
>>>=20
>>> # ./perf probe -l
>>> uprobes:p_uprobe_dns_events_osquery4026531841 (on getaddrinfo in XX)
>>> uprobes:p_uprobe_dns_events_osquery4026532336 (on 0x129a60 in XX)
>>> uprobes:p_uprobe_dns_events_osquery4026532344 (on 0x129a60 in XX)
>>> uprobes:p_uprobe_ebpf_compat_check_osquery (on __GI___backtrace in =
XX)
>>> uprobes:p_uprobe_sys_hook_osquery (on backtrace_symbols in XX)
>>>=20
>>> These can=E2=80=99t be removed.
>>>=20
>>> # ./perf probe -d uprobes:p_uprobe_dns_events_osquery4026531841
>>> Removed event: uprobes:p_uprobe_dns_events_osquery4026531841
>>> Failed to delete event: Device or resource busy
>>> Error: Failed to delete events.
>>>=20
>>=20
>> Ah, this is interesting, I have never hit that. However, it makes =
sense,
>> if the resource is busy.
>>=20
>> However, in that case it comes to my mind that in general, these =
tests
>> should not be run in any production environment, where one could rely =
on
>> some probes will exist, etc. In case some of the probes above was not
>> busy, it'd be probably cleaned up by the testcase, which might be =
unexpected
>> by the creator/user of the uprobes... Maybe we should get rid of the
>> probe cleaning for that cases, but I'd prefer to keep it.
>>=20
>>> Considering above scenario, patch here takes the probe count using:
>>> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>=20
>>> Also similarly looks for TEST_PROBE in result log in case of probe =
=E2=80=94del as well
>>>=20
>>> Any comments Michael ?
>>>=20
>> Yes, we probably should tweak it as you suggest.
>=20
> Hi,
>=20
> Thanks for checking Michael.
>=20
> If the patch looks good, can we please get this pulled in ?
>=20

Hi,

Can we please pull in this patch if it looks fine.

Thanks
Athira
> Thanks
> Athira
>>=20
>> Thanks,
>> Michael
>>=20
>>=20
>>> Thanks
>>> Athira
>>>=20
>>>>=20
>>>> Cheers,
>>>>=20
>>>> Michael
>>>>=20
>>>>>=20
>>>>> Example, in the system where this failed, already some
>>>>> probes were default added. So count became 10
>>>>> ./perf probe -l | wc -l
>>>>> 10
>>>>>=20
>>>>> So to be specific for "inode_permission", restrict the
>>>>> probe count check to that probe point alone using :
>>>>> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>>>=20
>>>>> Similarly while removing the probe using "probe --del *",
>>>>> ( removing all probes ), check uses:
>>>>>=20
>>>>> ../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE"
>>>>>=20
>>>>> But if there are other probes in the system, the log will
>>>>> contain reference to other existing probe too. Hence change
>>>>> usage of check_all_lines_matched.pl to check_all_patterns_found.pl
>>>>> This will make sure expecting string comes in the result
>>>>>=20
>>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>>> ---
>>>>> tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>=20
>>>>> diff --git =
a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh =
b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>> index d541ffd44a93..f8b5f096d0d7 100755
>>>>> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>>>>> @@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"force-adding probes :: second pr
>>>>> (( TEST_RESULT +=3D $? ))
>>>>>=20
>>>>> # adding existing probe with '--force' should pass
>>>>> -NO_OF_PROBES=3D`$CMD_PERF probe -l | wc -l`
>>>>> +NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>>>> $CMD_PERF probe --force --add $TEST_PROBE 2> =
$LOGS_DIR/adding_kernel_forceadd_03.err
>>>>> PERF_EXIT_CODE=3D$?
>>>>>=20
>>>>> @@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"using doubled probe"
>>>>> $CMD_PERF probe --del \* 2> =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>>> PERF_EXIT_CODE=3D$?
>>>>>=20
>>>>> -../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>>> +../common/check_all_patterns_found.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>>>>> CHECK_EXIT_CODE=3D$?
>>>>>=20
>>>>> print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple =
probes"
>>>>> --=20
>>>>> 2.43.5



