Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0976F943
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 07:07:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSogijEO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHDGz3RgCz3cbX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:07:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSogijEO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHDG05d5mz3cQD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 15:06:32 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37451WGg005647;
	Fri, 4 Aug 2023 05:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=8jWZvA1aGpFjCOBg0jYFrI7oOxrDajEWvp2CUMYv0lQ=;
 b=ZSogijEOdit3exECMH7E7plcnM2IwT5wwhkRHmN/MXputIwNe6Gw6qzGAuXCpH7HjBS5
 a6HnLoVhc7tNAJ5DCDgZQYcC5I0gNBy0YQLhGylc/AZTS8eaaf/DabKq76LxS2ETPr7P
 LAWxtHDLAiCbMZKLHCfYV0HZ8oUEEREibQPZR5XcVu6HBI16dsoRIMYxIn1Xp4j9PIQm
 vsds+Jzh83jor4uhPnVPRNSDjfXyIt8ts0v7sIfMiIgVZs/eZC9vG/Lg8R/DekHjD3i5
 7IJ9az9q83ORGizYKcJeCkOIrIo+67djBeQ2HapLpVC89aHsEigF9+ocm9hlx+uu4mMQ 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8tth09bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:06:27 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 374530vX010341;
	Fri, 4 Aug 2023 05:05:41 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8tth074g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:05:41 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3744VKbH027825;
	Fri, 4 Aug 2023 05:05:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s8kp2tsk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:05:00 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37454vvA39780818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Aug 2023 05:04:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5011920049;
	Fri,  4 Aug 2023 05:04:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AD1D20040;
	Fri,  4 Aug 2023 05:04:55 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.75.173])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  4 Aug 2023 05:04:55 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 1/2] tools/perf/tests: perf all metrics test fails when
 perf_event access is restricted
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7chEpdJkpWuxZD2-w89SFBm9CU28MpLA40LV+=GaLJXS1w@mail.gmail.com>
Date: Fri, 4 Aug 2023 10:34:43 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <E060270A-E282-4355-B26B-A2DEA7C0A2C6@linux.vnet.ibm.com>
References: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
 <AEE7B55C-BA6B-4E0E-A2E9-4E7EE09B4D50@linux.vnet.ibm.com>
 <CAM9d7chEpdJkpWuxZD2-w89SFBm9CU28MpLA40LV+=GaLJXS1w@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c5mB2hctxqzsELpdsILsjGJohoABkovm
X-Proofpoint-ORIG-GUID: gr4Z35uhCHC1qHUiMmXYRbFCf0OhuXTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_02,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308040045
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Jul-2023, at 11:54 PM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> On Mon, Jul 3, 2023 at 10:04=E2=80=AFPM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>>> On 15-Jun-2023, at 1:08 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> Perf all metrics test fails as below when perf_event access
>>> is restricted.
>>>=20
>>>   ./perf test -v "perf all metrics test"
>>>   Metric 'Memory_RD_BW_Chip' not printed in:
>>>   Error:
>>>   Access to performance monitoring and observability operations is =
limited.
>>>   Enforced MAC policy settings (SELinux) can limit access to =
performance
>>>   =E2=80=94
>>>   access to performance monitoring and observability operations for =
processes
>>>   without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux =
capability.
>>>   =E2=80=94
>>>   test child finished with -1
>>>   ---- end ----
>>>   perf all metrics test: FAILED!
>=20
> In my system, it fails like below:
>=20
>  $ ./perf test -v 101
>  101: perf all metrics test                                           =
:
>  --- start ---
>  test child forked, pid 398458
>  Testing branch_misprediction_ratio
>  Testing all_remote_links_outbound
>  Metric 'all_remote_links_outbound' not printed in:
>  Error:
>  Invalid event (remote_outbound_data_controller_3:u) in per-thread
> mode, enable system wide with '-a'.
>  Testing nps1_die_to_dram
>  ...
>=20
> Thanks,
> Namhyung



Hi Namhyung,

I have posted a V2 for this :
[PATCH V2 1/2] tools/perf/tests: perf all metrics test fails when =
perf_event access is restricted
[PATCH V2 2/2] tools/perf/tests: perf all metricgroups test fails when =
perf_event access is restricted

Please review and test the V2 version, and let me know your feedback.

If any other metric fails even with this fix, that would be an event =
fail I believe and not a test issue.
But looking for your test results with the V2 patchset

Thanks
Athira
>=20
>>=20
>>=20
>> Hi,
>>=20
>> Looking for review comments on this patch.
>>=20
>> Thanks
>>>=20
>>> The perf all metrics test picks the input events from
>>> "perf list --raw-dump metrics" and runs "perf stat -M "$m""
>>> for each of the metrics in the list. It fails here for some
>>> of the metrics which needs access, since it collects system
>>> wide resource details/statistics. Fix the testcase to skip
>>> those metric events.
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> tools/perf/tests/shell/stat_all_metrics.sh | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/tools/perf/tests/shell/stat_all_metrics.sh =
b/tools/perf/tests/shell/stat_all_metrics.sh
>>> index 54774525e18a..14b96484a359 100755
>>> --- a/tools/perf/tests/shell/stat_all_metrics.sh
>>> +++ b/tools/perf/tests/shell/stat_all_metrics.sh
>>> @@ -6,7 +6,9 @@ err=3D0
>>> for m in $(perf list --raw-dump metrics); do
>>>  echo "Testing $m"
>>>  result=3D$(perf stat -M "$m" true 2>&1)
>>> -  if [[ "$result" =3D~ ${m:0:50} ]] || [[ "$result" =3D~ "<not =
supported>" ]]
>>> +  # Skip if there is no access to perf_events monitoring
>>> +  # and observability operations
>>> +  if [[ "$result" =3D~ ${m:0:50} ]] || [[ "$result" =3D~ "<not =
supported>" ]] || [[ "$result" =3D~ "Access to performance monitoring =
and observability operations is limited" ]]
>>>  then
>>>    continue
>>>  fi
>>> --
>>> 2.31.1


