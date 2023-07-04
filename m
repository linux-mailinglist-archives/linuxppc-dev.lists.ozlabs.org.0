Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE97468B4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 07:06:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XVgXzqGP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw9kL2jBnz3bP2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 15:06:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XVgXzqGP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw9gy29NJz3bZD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 15:04:30 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3644lFY6030186;
	Tue, 4 Jul 2023 05:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=VhmMg2zJnymb1K2VXCFWCiH5P8OiGDYED2f2h2PyAJM=;
 b=XVgXzqGPpNnXFWr86TrDXwv5tWjSKjsEcPEv4c6aiq/RaOoJcuLVYO3OO9JIxQP0UCnR
 ++CXYQDHyF3SNfgiWuONBQHWfHvSucv62N/hw4CAd2wcU0MVx5jqAYK5ZBQZA+mRquhA
 nELtNrzB2fnE2p8X0ESctm8Eeqskgvm/Xs+GEZe4fVz/3Xl2LVPHsXc4+STDnO6sEwmm
 A/xwjgdSuNtJlPoZcH4qLAecT4M/Zh88OJTmwYKwxr1K6toFsB4hMkOvNeD9xjlT4eKd
 /eyAI6+cq0eVOS2JH+tIoWy9TEuqQhHtj+OH6H1MKH+GgL6gHyBnQEW8sAwiRwt97l3w 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcpx0aub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:24 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3644pBKh006818;
	Tue, 4 Jul 2023 05:04:24 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcpx0atv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:24 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3644TXbv012574;
	Tue, 4 Jul 2023 05:04:22 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rjbs51ab7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36454Jdq43188736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jul 2023 05:04:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E29AF20040;
	Tue,  4 Jul 2023 05:04:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27BA22004F;
	Tue,  4 Jul 2023 05:04:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.47.10])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 05:04:16 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 2/2] tools/perf/tests: perf all metricgroups test fails
 when perf_event access is restricted
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230615073803.54481-2-atrajeev@linux.vnet.ibm.com>
Date: Tue, 4 Jul 2023 10:34:05 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <14FA8C3A-CA5A-4886-905B-777025B5CA43@linux.vnet.ibm.com>
References: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
 <20230615073803.54481-2-atrajeev@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 341FZBDRqBFnkK4OZZAA9Syz5VQphhMF
X-Proofpoint-ORIG-GUID: A7mbBnNZgVN3Wz1Ia9jyEPu1A3hLvluk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_02,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040042
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
Cc: linux-perf-users@vger.kernel.org, Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 15-Jun-2023, at 1:08 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Perf all metricgroups test fails as below when perf_event access
> is restricted.
>=20
>    ./perf test -v "perf all metricgroups test"
>    Testing Memory_BW
>    Error:
>    Access to performance monitoring and observability operations is =
limited.
>    Enforced MAC policy settings (SELinux) can limit access to =
performance
>    =E2=80=94
>    access to performance monitoring and observability operations for =
processes
>    without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux =
capability.
>    =E2=80=94
>    test child finished with -1
>    ---- end ----
>    perf all metricgroups test: FAILED!
>=20
> Fix the testcase to skip those metric events which needs perf_event =
access
> explicitly. The exit code of the testcase is based on return code of
> the perf stat command ( enabled by set -e option ). Hence save the
> exit status in a variable and use that to decide success or fail for =
the
> testcase.
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> tools/perf/tests/shell/stat_all_metricgroups.sh | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/perf/tests/shell/stat_all_metricgroups.sh =
b/tools/perf/tests/shell/stat_all_metricgroups.sh
> index cb35e488809a..fa86b562676a 100755
> --- a/tools/perf/tests/shell/stat_all_metricgroups.sh
> +++ b/tools/perf/tests/shell/stat_all_metricgroups.sh
> @@ -2,11 +2,19 @@
> # perf all metricgroups test
> # SPDX-License-Identifier: GPL-2.0
>=20
> -set -e
> -
> for m in $(perf list --raw-dump metricgroups); do
>   echo "Testing $m"
> -  perf stat -M "$m" -a true
> +  result=3D$(perf stat -M "$m" -a true 2>&1)
> +  rc=3D$?
> +  # Skip if there is no access to perf_events monitoring
> +  # Otherwise exit based on the return code of perf comamnd.
> +  if [[ "$result" =3D~ "Access to performance monitoring and =
observability operations is limited" ]]
> +  then
> +      continue
> +  else
> +      [ $rc -ne 0 ] && exit $rc
> +  fi
> +
> done

Hi,

Looking for review comments on this patch.

Thanks
Athira
>=20
> exit 0
> --=20
> 2.31.1
>=20

