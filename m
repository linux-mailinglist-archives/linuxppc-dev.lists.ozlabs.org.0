Return-Path: <linuxppc-dev+bounces-2364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE29A345C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 07:35:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVD1b3RYYz3bl5;
	Fri, 18 Oct 2024 16:35:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729229715;
	cv=none; b=L/B8bY11Hq5occ8TAa+mGa7gk9GCuOvLvAnmoUzUW6mcryJPKnDrljTOwJFQX3quHVAtGBKzYE/AClQjNnnbi1UfgSG4tZBAGkUO8Jm+YufC8UB7+fcF7PFD5cPJzVHFNqqzi31HPbNMlKfC6H9iKMUU/8l/8snprmdmf/skJJ4prc4ox1QSYg7MJYlOcprFAQFiStZdBL0riRrj8H5bKx0D9vOzDFaFFl4CIsHoPRsWRPYUhBZdp45Rs3ZStSnGZIsRHteqldJPMct5S9jT3Na9MxYTWjeS0nZJZ5ObeLETg5y+Bwe3IKq9tcW2LVuU40egm49qUGBIIB7RX6N2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729229715; c=relaxed/relaxed;
	bh=GfK7bPi6IdCB7ex8oq6M7wTtKsPVoKOrfFT7oK1qN0A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=l+IYEXz6oWb1y02ob7pyGmAzyJCf+kojJH0k0VcmXEX1ziG1tcmYkOP5UAN8RxIJho/P4EN0dT4pczvdcm7M5tZMY7E/LAwzYPnO/xxF4lIUGnEjnsSPMznS/rmal+Xt7toHk60nPu6db0ij/6xC3pWANljxBmee8p6HeA+q8vmPEgCsipE/MOpwqdTp4qlnngrPQ6Q8crYnuC7g0aavOI2QfOtLjydO0Jvjr+Nt9EkO+Mcog8WyOR98x5Uyq0PhRe10FSK1eTXER6lVxbM6HJQAb0JaqSKX262M5I4eJs2qxR2XbPCBoKhHVFmw0fUandRO+Wq3v6o3j7me6zXTxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6a+WAbL; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6a+WAbL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVD1Y6c8Gz3bkd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 16:35:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HJSAVO017544;
	Fri, 18 Oct 2024 05:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GfK7bP
	i6IdCB7ex8oq6M7wTtKsPVoKOrfFT7oK1qN0A=; b=q6a+WAbLEev4UJrwWOQUbu
	Kxmluoov3GfdvGGDZ39rWaVRF/Gy1yhkjW6jz0S6ZTX6TjL3iP+D18eT9PlUeSIb
	L+NoUwXQTWz/RYTv+MNsg4WyRJyA+e05GdfdwwpCB35sKxv/1zRZxTH/32X6cxVd
	KuCuq0WfweoFY7k+KmeWsr+I/AlQlfJVuk6eSpiOetR60hF81slduBBrHdhtmWh2
	wCYqUbSzogS+sIX63Cpo7Er0Ouy7r86MiNVynY2zlxa6zWGnF762Rc5zFEdI9y7X
	Y9nTYQVuX4kT33HkFnb2cRPCjAgw3MC8GBY3ZqKQ21vn5Opgzx3xf12pUzvIqetA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ar0u6t08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:35:06 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49I5Z6G8001275;
	Fri, 18 Oct 2024 05:35:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ar0u6t05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:35:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4f4N7005218;
	Fri, 18 Oct 2024 05:35:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4285njjdmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:35:05 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49I5Z15L51642662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 05:35:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8718920049;
	Fri, 18 Oct 2024 05:35:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B927C20040;
	Fri, 18 Oct 2024 05:34:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.172])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 18 Oct 2024 05:34:54 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf/tests/shell/base_probe: Enhance
 print_overall_results to print summary information
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <d7c34f4f-692e-4c1b-c268-582c645a6c33@redhat.com>
Date: Fri, 18 Oct 2024 11:04:39 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <42B1CAD9-C932-4D96-B249-5305049C2D90@linux.vnet.ibm.com>
References: <20241014154025.85564-1-atrajeev@linux.vnet.ibm.com>
 <d7c34f4f-692e-4c1b-c268-582c645a6c33@redhat.com>
To: Michael Petlan <mpetlan@redhat.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: niwwMTSra3zxbGqzC9O5ngW1Grbcy2Lh
X-Proofpoint-ORIG-GUID: buif0MqBx7wpT1mNE1DqnuRMAPYFE12m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180032
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 17 Oct 2024, at 3:52=E2=80=AFPM, Michael Petlan =
<mpetlan@redhat.com> wrote:
>=20
> On Mon, 14 Oct 2024, Athira Rajeev wrote:
>> Currently print_overall_results prints the number of
>> fails in the summary, example from base_probe tests in
>> testsuite_probe:
>>=20
>> ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
>> 11 failures found
>>=20
>> test_invalid_options contains multiple tests and out
>> of that 11 failed. Sometimes it could happen that it
>> is due to missing dependency in the build or environment
>> dependency.
>>=20
>> Example, perf probe -L requires DWARF enabled. otherwise
>> it fails as below:
>> ./perf probe -L
>>  Error: switch `L' is not available because NO_DWARF=3D1
>>=20
>> "-L" is tested as one of the option in :
>>   for opt in '-a' '-d' '-L' '-V'; do
>>   <<perf probe test>>
>>   print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "missing argument
>> for $opt"
>>=20
>> Here -a and -d doesn't require DWARF. Similarly there
>> are few other tests requiring DWARF. To hint the user that
>> missing dwarf could be one issue, update print_overall_results
>> to print a comment string along with summary hinting the possible
>> cause. Update test_invalid_options.sh and test_line_semantics.sh
>> to pass the info about dwarf requirement since these tests
>> failed when perf is built without DWARF.
>>=20
>> With the change:
>> ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
>> 11 failures found :: Some of the tests need DWARF to run
>=20
> Hello Athira,
>=20
> I admit that the idea of some hint why the test failed
> might be useful, however a static hint that might or
> might not be related to the particular failure seems to
> be rather misleading to me. If the test fails for any
> other reason, the user is still told about DWARF which
> might not be true.
>=20
> I think that such hints would need some test result post-
> processing to determine the actual reason.

Sure, agree to your point. I will add post-processing check for dwarf =
and accordingly add the summary information
Will post a V2=20

Thanks
Athira
>=20
> Michael
>=20
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/shell/base_probe/test_invalid_options.sh | 2 +-
>> tools/perf/tests/shell/base_probe/test_line_semantics.sh  | 2 +-
>> tools/perf/tests/shell/common/init.sh                     | 3 ++-
>> 3 files changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git =
a/tools/perf/tests/shell/base_probe/test_invalid_options.sh =
b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
>> index 1fedfd8b0d0d..e133bb0aa949 100755
>> --- a/tools/perf/tests/shell/base_probe/test_invalid_options.sh
>> +++ b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
>> @@ -75,5 +75,5 @@ done
>>=20
>>=20
>> # print overall results
>> -print_overall_results "$TEST_RESULT"
>> +print_overall_results "$TEST_RESULT" "Some of the tests need DWARF =
to run"
>> exit $?
>> diff --git a/tools/perf/tests/shell/base_probe/test_line_semantics.sh =
b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
>> index d8f4bde0f585..99f4f56a3292 100755
>> --- a/tools/perf/tests/shell/base_probe/test_line_semantics.sh
>> +++ b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
>> @@ -51,5 +51,5 @@ done
>>=20
>>=20
>> # print overall results
>> -print_overall_results "$TEST_RESULT"
>> +print_overall_results "$TEST_RESULT" "Some of the tests need DWARF =
to run"
>> exit $?
>> diff --git a/tools/perf/tests/shell/common/init.sh =
b/tools/perf/tests/shell/common/init.sh
>> index 075f17623c8e..0862cbc1c6f7 100644
>> --- a/tools/perf/tests/shell/common/init.sh
>> +++ b/tools/perf/tests/shell/common/init.sh
>> @@ -46,10 +46,11 @@ print_results()
>> print_overall_results()
>> {
>> RETVAL=3D"$1"; shift
>> + TASK_COMMENT=3D"$*"
>> if [ $RETVAL -eq 0 ]; then
>> _echo "$MALLPASS## [ PASS ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME =
SUMMARY"
>> else
>> - _echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME =
SUMMARY :: $RETVAL failures found"
>> + _echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME =
SUMMARY :: $RETVAL failures found :: $TASK_COMMENT"
>> fi
>> return $RETVAL
>> }
>> --=20
>> 2.43.5
>>=20
>>=20
>>=20
>=20


