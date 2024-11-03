Return-Path: <linuxppc-dev+bounces-2778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A019BA660
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 16:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhJGZ4kx3z2y8B;
	Mon,  4 Nov 2024 02:21:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730647286;
	cv=none; b=MXY0N17812YpMiifM6A/WeFqp5rzrhGBY4dK+otjq7isqDQ4kG0P4TYanSREuI/Yej/9vESLDbLTzu257g/SDdRZemVaoGhIKAgTlhZKNghWu+AjPt4ddoGxmml04DtVV7uN8ukZ8wV5WK0C4sh9GMslPniXgYxBJGR8sCYizRuGWfMz2idqZBkAFgxJ+SOIgtwRotZ7gTd9V0sr/KL0Wrh1do7hlvgHkw4F/vTxaciqtmP3tDjQvHONsvzalsKpVbZwoHTlBfbslffnw7vrDkuGBrMk91ojtnyD6dW83IWOkRwtu0XbeTcL9XinKhvXYbBuLAuK94Akub/DnE7v7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730647286; c=relaxed/relaxed;
	bh=EOWh4obHX50cGmtH4jRpO/Zb4ZygpudBMOg9rkg9z5c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IqZLp8t5g/A1ptThNLMisWzF3ezWnx/fM9CsGWHh+haWHprJjlBCYiSCIn3Ku4TvPoUzoAsYFVNAJme/eW1ElkwISodIcydfWNO0R/7d5IYu6PDv9SeHKgVGOte6nf4Co7xvEcx+TOJ1JsYMY9FzVigRRThbP6zArNJV4+GS9RVwj+tXa975AxbfD1g88REHdps1AKIvjJjxmILI8cyk3urUSWZBXS7EsSmyRKN/SZwTDWQt/i69FzDMr385ylMuiseuIHD+G+MvCW7APDkSa1okhHLbJpd44TZkexszQ8Zh1Rf+4/f/27Hk188hq7ifLDyE83tSKXh8JXXn0ug69A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p9OlbqW/; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p9OlbqW/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhJGX2BPcz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 02:21:23 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3EhiAK012841;
	Sun, 3 Nov 2024 15:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EOWh4o
	bHX50cGmtH4jRpO/Zb4ZygpudBMOg9rkg9z5c=; b=p9OlbqW/PTjJVDSyR+DO7F
	kdSIjMkg2UzkdSDpdvSdykuNJT4zRIuVZvTNVNcNWFaT8kOPUGkTS/zhPQTUs6Iu
	9W5u8zxbNQo92uaeg+OoRNbthlKhFLGh5/gQwCoiDM+PDNMBccgHcmgzSXPfBT4h
	y0TpNz8Z8pQGd8s/ldBIR+0jdVJutDDmx7iQY5BDrh2cVKRGUzqSt+XziakpSebS
	MWSTFiOeUwOh79gqyrgD16SqYGbtjW+JSCuf1TDAqZ6kQVaIxOsfIMSIdaUK4LgU
	FB5p1KKe+B7ND++/PSkezJ7ip8cRMDPObE7Xoicz5YrS0DRtn47m+7vVybNcu+Jw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pb5ag2s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Nov 2024 15:21:09 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A3FL8FN015593;
	Sun, 3 Nov 2024 15:21:08 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pb5ag2s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Nov 2024 15:21:08 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A31K4d6032050;
	Sun, 3 Nov 2024 15:21:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nydmgsj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Nov 2024 15:21:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A3FL3Q37274952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 3 Nov 2024 15:21:04 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E19E820043;
	Sun,  3 Nov 2024 15:21:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFBEE20040;
	Sun,  3 Nov 2024 15:20:57 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.246.86])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun,  3 Nov 2024 15:20:57 +0000 (GMT)
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
In-Reply-To: <941c3d6a-fc2-3fcf-5ab2-597dcf712c16@redhat.com>
Date: Sun, 3 Nov 2024 20:50:43 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <0FEA83FD-BBC9-4E83-82D6-044141E86F76@linux.vnet.ibm.com>
References: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
 <941c3d6a-fc2-3fcf-5ab2-597dcf712c16@redhat.com>
To: Michael Petlan <mpetlan@redhat.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6r_fVA75LzzqdfdZBzaDjW__PVcI46iB
X-Proofpoint-ORIG-GUID: gQo8f99hDv2LATuXkgEx3-H6_o6XJnPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411030138
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 17 Oct 2024, at 3:44=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>=20
> On Mon, 14 Oct 2024, Athira Rajeev wrote:
>> perftool-testsuite_probe fails in test_adding_kernel as below:
>> Regexp not found: "probe:inode_permission_11"
>> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: force-adding =
probes ::
>> second probe adding (with force) (output regexp parsing)
>> event syntax error: 'probe:inode_permission_11'
>>   \___ unknown tracepoint
>>=20
>> Error:  File /sys/kernel/tracing//events/probe/inode_permission_11
>> not found.
>> Hint:   Perhaps this kernel misses some CONFIG_ setting to
>> enable this feature?.
>>=20
>> The test does the following:
>> 1) Adds a probe point first using :
>>    $CMD_PERF probe --add $TEST_PROBE
>> 2) Then tries to add same probe again without =E2=80=94force
>> and expects it to fail. Next tries to add same probe again
>> with =E2=80=94force. In this case, perf probe succeeds and adds
>> the probe with a suffix number. Example:
>>=20
>> ./perf probe --add inode_permission
>> Added new event:
>>  probe:inode_permission (on inode_permission)
>>=20
>> ./perf probe --add inode_permission --force
>> Added new event:
>>  probe:inode_permission_1 (on inode_permission)
>>=20
>>  ./perf probe --add inode_permission --force
>> Added new event:
>>  probe:inode_permission_2 (on inode_permission)
>>=20
>> Each time, suffix is added to existing probe name.
>> To get the suffix number, test cases uses :
>> NO_OF_PROBES=3D`$CMD_PERF probe -l | wc -l`
>>=20
>> This will work if there is no other probe existing
>> in the system. If there are any other probes other than
>> kernel probes or inode_permission, ( example: any probe),
>> "perf probe -l" will include count for other probes too.
>=20
> Hello.
>=20
> When designing this test, I was relying on the fact that
> there are no existing probes, because all should have been
> removed at line 43 of the same test:
>=20
> 40 ### basic probe adding
> 41
> 42 for opt in "" "-a" "--add"; do
> --> 43     clear_all_probes
> 44     $CMD_PERF probe $opt $TEST_PROBE 2> =
$LOGS_DIR/adding_kernel_add$opt.err
> 45     PERF_EXIT_CODE=3D$?
> 46
> 47 ../common/check_all_patterns_found.pl "Added new events?:" =
"probe:$TEST_PROBE" "on $TEST_PROBE" < =
$LOGS_DIR/adding_kernel_add$opt.err
> 48  CHECK_EXIT_CODE=3D$?
> 49
> 50 print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "adding probe =
$TEST_PROBE :: $opt"
> 51  (( TEST_RESULT +=3D $? ))
> 52 done
> 53
>=20
> I am wondering how it could happen that there were other
> probes in the system?

Hi Michael,

Sorry for the late response.

Yes, there are uprobes listed as part of =E2=80=9Cperf probe=E2=80=9D in =
the environment where I saw the test needing this change. Sharing the =
result below from perf probe:=20

# ./perf probe -l
  uprobes:p_uprobe_dns_events_osquery4026531841 (on getaddrinfo in XX)
  uprobes:p_uprobe_dns_events_osquery4026532336 (on 0x129a60 in XX)
  uprobes:p_uprobe_dns_events_osquery4026532344 (on 0x129a60 in XX)
  uprobes:p_uprobe_ebpf_compat_check_osquery (on __GI___backtrace in XX)
  uprobes:p_uprobe_sys_hook_osquery (on backtrace_symbols in XX)

These can=E2=80=99t be removed.

# ./perf probe -d uprobes:p_uprobe_dns_events_osquery4026531841
Removed event: uprobes:p_uprobe_dns_events_osquery4026531841
Failed to delete event: Device or resource busy
  Error: Failed to delete events.


Considering above scenario, patch here takes the probe count using:
NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`

Also similarly looks for TEST_PROBE in result log in case of probe =
=E2=80=94del as well

Any comments Michael ?

Thanks
Athira

>=20
> Cheers,
>=20
> Michael
>=20
>>=20
>> Example, in the system where this failed, already some
>> probes were default added. So count became 10
>>  ./perf probe -l | wc -l
>>  10
>>=20
>> So to be specific for "inode_permission", restrict the
>> probe count check to that probe point alone using :
>> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>>=20
>> Similarly while removing the probe using "probe --del *",
>> ( removing all probes ), check uses:
>>=20
>> ../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE"
>>=20
>> But if there are other probes in the system, the log will
>> contain reference to other existing probe too. Hence change
>> usage of check_all_lines_matched.pl to check_all_patterns_found.pl
>> This will make sure expecting string comes in the result
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh =
b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>> index d541ffd44a93..f8b5f096d0d7 100755
>> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
>> @@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"force-adding probes :: second pr
>> (( TEST_RESULT +=3D $? ))
>>=20
>> # adding existing probe with '--force' should pass
>> -NO_OF_PROBES=3D`$CMD_PERF probe -l | wc -l`
>> +NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>> $CMD_PERF probe --force --add $TEST_PROBE 2> =
$LOGS_DIR/adding_kernel_forceadd_03.err
>> PERF_EXIT_CODE=3D$?
>>=20
>> @@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"using doubled probe"
>> $CMD_PERF probe --del \* 2> =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>> PERF_EXIT_CODE=3D$?
>>=20
>> -../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>> +../common/check_all_patterns_found.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
>> CHECK_EXIT_CODE=3D$?
>>=20
>> print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple =
probes"
>> --=20
>> 2.43.5



