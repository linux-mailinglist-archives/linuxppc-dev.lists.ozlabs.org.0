Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E21EA7468B9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 07:07:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HOFyml4d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw9lJ5qDSz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 15:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HOFyml4d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw9h81V5hz3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 15:04:39 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3644kq2M007806;
	Tue, 4 Jul 2023 05:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=wogNd8fAxbdATQusVjpVczlx3PEIH3oZiPdkoBucOyU=;
 b=HOFyml4d19Sg9aRxw+RHgHu1DzZiMad2wMMjPw0xZO5uU5vEc/IG4h+dQpgN2e0B12gH
 pU9P9o4SFBcwlonaAyDvVyyQv2T2yt1QiBrDK6ovxywUklGj83kTThrzHktwdHFWm14h
 Pms8ZQd5lKq09OeqMyfhcFp33BssN/Y+NvH+qvLkKpJ+7HBNPeZAjS4qoCRSuDJjsVAx
 VF3PbaN3fasNWCfhZtTTW0uWtlv+ghtq5UEEXF04i3AXGXvbhLPgOZaeU2gQ2VMPTLQj
 zwnVcT/hAt6laXdvbFa2FTAP2RmLu2NwkRkIVxPTG5Q2Vf9aKzpVYRA2Is6Msd9neehX TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcpx0b1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:35 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3645080P013810;
	Tue, 4 Jul 2023 05:04:35 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcpx0b10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:35 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36440K9C012565;
	Tue, 4 Jul 2023 05:04:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3rjbs4sa9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36454TiC45154774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jul 2023 05:04:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ED6A20043;
	Tue,  4 Jul 2023 05:04:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53EAB20040;
	Tue,  4 Jul 2023 05:04:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.47.10])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 05:04:27 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 1/2] tools/perf/tests: perf all metrics test fails when
 perf_event access is restricted
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
Date: Tue, 4 Jul 2023 10:34:16 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <AEE7B55C-BA6B-4E0E-A2E9-4E7EE09B4D50@linux.vnet.ibm.com>
References: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, jolsa@kernel.org,
        irogers@google.com, namhyung@kernel.org
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6JvLRp4gc6qV1Vk9hKWewdEkkqZjix89
X-Proofpoint-ORIG-GUID: V44eZQj5aimNBWyH26bFdEzQF6x_3b7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_02,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 15-Jun-2023, at 1:08 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Perf all metrics test fails as below when perf_event access
> is restricted.
>=20
>    ./perf test -v "perf all metrics test"
>    Metric 'Memory_RD_BW_Chip' not printed in:
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
>    perf all metrics test: FAILED!


Hi,

Looking for review comments on this patch.

Thanks
>=20
> The perf all metrics test picks the input events from
> "perf list --raw-dump metrics" and runs "perf stat -M "$m""
> for each of the metrics in the list. It fails here for some
> of the metrics which needs access, since it collects system
> wide resource details/statistics. Fix the testcase to skip
> those metric events.
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> tools/perf/tests/shell/stat_all_metrics.sh | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/perf/tests/shell/stat_all_metrics.sh =
b/tools/perf/tests/shell/stat_all_metrics.sh
> index 54774525e18a..14b96484a359 100755
> --- a/tools/perf/tests/shell/stat_all_metrics.sh
> +++ b/tools/perf/tests/shell/stat_all_metrics.sh
> @@ -6,7 +6,9 @@ err=3D0
> for m in $(perf list --raw-dump metrics); do
>   echo "Testing $m"
>   result=3D$(perf stat -M "$m" true 2>&1)
> -  if [[ "$result" =3D~ ${m:0:50} ]] || [[ "$result" =3D~ "<not =
supported>" ]]
> +  # Skip if there is no access to perf_events monitoring
> +  # and observability operations
> +  if [[ "$result" =3D~ ${m:0:50} ]] || [[ "$result" =3D~ "<not =
supported>" ]] || [[ "$result" =3D~ "Access to performance monitoring =
and observability operations is limited" ]]
>   then
>     continue
>   fi
> --=20
> 2.31.1
>=20

