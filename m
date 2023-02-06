Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC6668B4F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 05:41:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9D9n3cYsz3cLJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 15:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lYFvjvxQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lYFvjvxQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9D8t1q74z30RT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 15:40:44 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3161HG7U022945;
	Mon, 6 Feb 2023 04:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=RV7WUkegwLiL+5H2WOWRskyGI+Aqqf6qVmM1XCFZL4w=;
 b=lYFvjvxQaSc04i2Oa7qs+04vsEZvCmZ1KBAnoi4Rc9YGMxToZO9+1NuNBMezesK3kcDJ
 IKgqsxFM1DELn6TDHzZLDsYgexTHEvymybeUA4ENOhEfj6hD+zv0L3fJ7cL103TFnrIr
 m/9dkIFKXpNoiFvzLBs16ob060iVArXZNABmwr2F0Pjwz15dKA5zEF0Bk785gvYkuSgK
 NY2ikn1G8N6WcqboLe95i6l5wWZg6DGb2VhWPmq5dgW1RdOXfghUwdKXvH8n4CQFlN06
 5hO3pfsqGLjZJhHOZ8xggPcetQrpdFofZwYv3FHyaUQYYx6AVgUKgPXAwcYnfEkF99oO mA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj16rdddx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 04:40:38 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3160sh11022813;
	Mon, 6 Feb 2023 04:40:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3nhemfhd82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 04:40:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3164eVQk46858706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 04:40:31 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C86832004B;
	Mon,  6 Feb 2023 04:40:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87D6F20043;
	Mon,  6 Feb 2023 04:40:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.64.42])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Feb 2023 04:40:30 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/perf/tests: Add system wide check for perf bench
 workload in all metric test
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230202164413.56743-1-kjain@linux.ibm.com>
Date: Mon, 6 Feb 2023 10:10:28 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <3BB099AB-5FB4-40FF-A281-C06A42FBEBC7@linux.vnet.ibm.com>
References: <20230202164413.56743-1-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hpv7KVvmI5IwzfXBm52H9-hTvdVzdYkM
X-Proofpoint-GUID: hpv7KVvmI5IwzfXBm52H9-hTvdVzdYkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_02,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060039
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
Cc: linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 02-Feb-2023, at 10:14 PM, Kajol Jain <kjain@linux.ibm.com> wrote:
>=20
> Testcase stat_all_metrics.sh fails in powerpc:
>=20
> 92: perf all metrics test : FAILED!
>=20
> Logs with verbose:
>=20
> [command]# ./perf test 92 -vv
> 92: perf all metrics test                                           :
> --- start ---
> test child forked, pid 13262
> Testing BRU_STALL_CPI
> Testing COMPLETION_STALL_CPI
> ----
> Testing TOTAL_LOCAL_NODE_PUMPS_P23
> Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
> Error:
> Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3D3/) in per-thread mode, =
enable system wide with '-a'.
> Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
> Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
> Error:
> Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3D3/) in per-thread =
mode, enable system wide with '-a'.
> ----
>=20
> Based on above logs, we could see some of the hv-24x7 metric events =
fails,
> and logs suggest to run the metric event with -a option.
> This change happened after the commit a4b8cfcabb1d ("perf stat: Delay =
metric
> parsing"), which delayed the metric parsing phase and now before =
metric parsing
> phase perf tool identifies, whether target is system-wide or not. With =
this
> change, perf_event_open will fails with workload monitoring for uncore =
events
> as expected.
>=20
> The perf all metric test case fails as some of the hv-24x7 metric =
events
> may need bigger workload to get the data. And the added perf bench
> workload in 'perf all metric test case' will not run for hv-24x7 =
without=20
> -a option.
>=20
> Fix this issue by adding system wide check for perf bench workload.
>=20
> Result with the patch changes in powerpc:
>=20
> 92: perf all metrics test : Ok
>=20
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Looks good to me

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

> ---
> tools/perf/tests/shell/stat_all_metrics.sh | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/tools/perf/tests/shell/stat_all_metrics.sh =
b/tools/perf/tests/shell/stat_all_metrics.sh
> index 6e79349e42be..d49832a316d9 100755
> --- a/tools/perf/tests/shell/stat_all_metrics.sh
> +++ b/tools/perf/tests/shell/stat_all_metrics.sh
> @@ -23,6 +23,13 @@ for m in $(perf list --raw-dump metrics); do
>   then
>     continue
>   fi
> +  # Failed again, possibly the event is uncore pmu event which will =
need
> +  # system wide monitoring with workload, so retry with -a option
> +  result=3D$(perf stat -M "$m" -a perf bench internals synthesize =
2>&1)
> +  if [[ "$result" =3D~ "${m:0:50}" ]]
> +  then
> +    continue
> +  fi
>   echo "Metric '$m' not printed in:"
>   echo "$result"
>   if [[ "$err" !=3D "1" ]]
> --=20
> 2.39.0
>=20

