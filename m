Return-Path: <linuxppc-dev+bounces-2304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243C9A007B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 07:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSzfQ1sfpz2xtt;
	Wed, 16 Oct 2024 16:14:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729055662;
	cv=none; b=ApCgfAOJXtTNPHh/kT/1w2mkWC1QZWTUrwxPheXu30blQmlIT6fQKFnJAtZSjUEC60cjPW86eJ25GBwcMAHU6ptFlJm51PUgLo0cqiQSFDIPxkLHCRUzvQT3hVRsxLalBXaner6EHIfA6GOFCveXe6/B/iApr8frr3CBOOHSEMp1JSzaPB5R5rKPKDqMerziIkrdrpWQAME0qpxMe/UEijn2Xy0+lk32HS/nzFM+d8emD38l0KeHlNJSq3OcvyOIbJ5lmwH6cn5hxTQ1wKOW5tlgm6lWPAIJ+Eud7UOWZOT4hh7vQSWJ5k6S98V+KKKa4drQ+3HuY5dQ1vBQs0IPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729055662; c=relaxed/relaxed;
	bh=7z0sUnMIFPQzjqOBf3KQACVYlXc/DJ7aUVc/acNXyX0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fJnkHxLmg8IDRmx7sR8TvBBfJInmMxvrdQ+ocnl25liyXzT1mCQ0amiXyW6a0rIQ8wo9zI26SPUBWN1V+VtT0sTlNv67KAIISZ/PB0oRokUGK66ndmAPgbt6V+366AbVUB0RXIjRXV98V6gMNNjc8LHNde09O8DpD9UsNdVO+OCoppAy1vZWjDz0m0oYHLu3j6bCutPUkec9zxM1V3e6AlfENCyV593asOSCe3RhnpNGkE4KD4/ufxaZIPAXJPqUJY0X/hH5ECU0b66h0XqjGJo6GxYwr0WBKQfwx64Ocpjf/qfG/ovEvA44GEx18iJQkIBBft18ekgVDXTP+3m1Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qs25HTSX; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qs25HTSX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSzfP0pr9z2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 16:14:20 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G4sn8W011325;
	Wed, 16 Oct 2024 05:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7z0sUn
	MIFPQzjqOBf3KQACVYlXc/DJ7aUVc/acNXyX0=; b=qs25HTSXkW1UnSmjBD/6K1
	YWzpiCrlR/aaMkkIeuhGjm6kkyKhPMYhNXkBZ/gbJeFxRrx5McjxEiDSZ8+gG0oj
	WS5brZUyRKnPFO993KN9FCErXh5PRxEzOoE0qc05cGNO+vQTnJV3XlEmJUDbq5kF
	FebwztmCj3m8coiF16Jl831n1akvc2ZwefO1eoB4leJI5XJD2238gON8cJeuTAWd
	WuaOaDP8s9O5hkAdX6MB8EZ5iQo7hFQusaZduG7Yu1vAs3VP5h5rs7OCgZU8cyvu
	snvDCo2fEG+8ewZ+iB+4FXN+rxBvHZWUsJFXHwW9o1SsGy4YytDX6uIvB0pp41Yw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42a6vm02f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:14:13 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49G5EDh2018494;
	Wed, 16 Oct 2024 05:14:13 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42a6vm02ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:14:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49G4riUk005946;
	Wed, 16 Oct 2024 05:14:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 428650y2yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:14:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49G5E90s56361304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 05:14:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33BAF20043;
	Wed, 16 Oct 2024 05:14:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AD1420040;
	Wed, 16 Oct 2024 05:14:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.246.127])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Oct 2024 05:14:02 +0000 (GMT)
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
In-Reply-To: <20241014154025.85564-1-atrajeev@linux.vnet.ibm.com>
Date: Wed, 16 Oct 2024 10:43:47 +0530
Cc: jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5210E6E-152B-4A68-BB4C-A6247AFBD502@linux.vnet.ibm.com>
References: <20241014154025.85564-1-atrajeev@linux.vnet.ibm.com>
To: vmolnaro@redhat.com, Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p6jSq9LFqrPg0MjTV5g8RQf6VGMSLCAp
X-Proofpoint-GUID: OIujI3kJEhNVyHIUZ07W5q8FnriafDMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 14 Oct 2024, at 9:10=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Currently print_overall_results prints the number of
> fails in the summary, example from base_probe tests in
> testsuite_probe:
>=20
> ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
> 11 failures found
>=20
> test_invalid_options contains multiple tests and out
> of that 11 failed. Sometimes it could happen that it
> is due to missing dependency in the build or environment
> dependency.
>=20
> Example, perf probe -L requires DWARF enabled. otherwise
> it fails as below:
> ./perf probe -L
>  Error: switch `L' is not available because NO_DWARF=3D1
>=20
> "-L" is tested as one of the option in :
>   for opt in '-a' '-d' '-L' '-V'; do
>   <<perf probe test>>
>   print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "missing argument
> for $opt"
>=20
> Here -a and -d doesn't require DWARF. Similarly there
> are few other tests requiring DWARF. To hint the user that
> missing dwarf could be one issue, update print_overall_results
> to print a comment string along with summary hinting the possible
> cause. Update test_invalid_options.sh and test_line_semantics.sh
> to pass the info about dwarf requirement since these tests
> failed when perf is built without DWARF.
>=20
> With the change:
> ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
> 11 failures found :: Some of the tests need DWARF to run
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Adding Veronika in the mail. Sorry missed to add initially. Please share =
review comments on this fix.

Thanks
Athira
> ---
> tools/perf/tests/shell/base_probe/test_invalid_options.sh | 2 +-
> tools/perf/tests/shell/base_probe/test_line_semantics.sh  | 2 +-
> tools/perf/tests/shell/common/init.sh                     | 3 ++-
> 3 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/perf/tests/shell/base_probe/test_invalid_options.sh =
b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> index 1fedfd8b0d0d..e133bb0aa949 100755
> --- a/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> +++ b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
> @@ -75,5 +75,5 @@ done
>=20
>=20
> # print overall results
> -print_overall_results "$TEST_RESULT"
> +print_overall_results "$TEST_RESULT" "Some of the tests need DWARF to =
run"
> exit $?
> diff --git a/tools/perf/tests/shell/base_probe/test_line_semantics.sh =
b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> index d8f4bde0f585..99f4f56a3292 100755
> --- a/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> +++ b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
> @@ -51,5 +51,5 @@ done
>=20
>=20
> # print overall results
> -print_overall_results "$TEST_RESULT"
> +print_overall_results "$TEST_RESULT" "Some of the tests need DWARF to =
run"
> exit $?
> diff --git a/tools/perf/tests/shell/common/init.sh =
b/tools/perf/tests/shell/common/init.sh
> index 075f17623c8e..0862cbc1c6f7 100644
> --- a/tools/perf/tests/shell/common/init.sh
> +++ b/tools/perf/tests/shell/common/init.sh
> @@ -46,10 +46,11 @@ print_results()
> print_overall_results()
> {
> RETVAL=3D"$1"; shift
> + TASK_COMMENT=3D"$*"
> if [ $RETVAL -eq 0 ]; then
> _echo "$MALLPASS## [ PASS ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME =
SUMMARY"
> else
> - _echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME =
SUMMARY :: $RETVAL failures found"
> + _echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME =
SUMMARY :: $RETVAL failures found :: $TASK_COMMENT"
> fi
> return $RETVAL
> }
> --=20
> 2.43.5
>=20
>=20


