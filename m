Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07179752930
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 18:54:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U5s5S28t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R210f6ny4z3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 02:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U5s5S28t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R20zl0ZP2z3c2x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 02:53:22 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DGksRV011507;
	Thu, 13 Jul 2023 16:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=7Zy8RTtUviGs7teFyUFZlWFkGwiJx6+DEnhk+sQTGW0=;
 b=U5s5S28tOH7icYAOCmtjFfxCw8KZXqpBkP6j9l7muzXfULgfUim/cy71n9LqqpfJwXGj
 yNghRrtM1h7aM5cdPf+e+fAH7kFyIcQNH+sLxK1irkvKvlfkfxyYnhltudGt6VQfIR52
 sk2ws3T6/j2FA/yTrnGcgBJ4VBcuJUMEsSGRDE4FJW+mtMKmgBuCByQKfZWbAN1CYUzz
 bNi5ioJLDKo0gmwCedt36FpRVABJFoVdITtam1FEfkkjLvAD3KfTNGSu0CjratEGUp6X
 s54VfxNWaUxAdW065Z+GgLTsexta1kzY+wjik3rJK+cKgeqr6DMck8KZpJqMD10kICJP pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rtn3eg47j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jul 2023 16:53:17 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36DGmQpl015549;
	Thu, 13 Jul 2023 16:53:16 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rtn3eg46k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jul 2023 16:53:16 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36DBovuo007062;
	Thu, 13 Jul 2023 16:53:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3rpy2eaf4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jul 2023 16:53:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36DGrAaZ45744652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jul 2023 16:53:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 553AB2004D;
	Thu, 13 Jul 2023 16:53:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D85A20049;
	Thu, 13 Jul 2023 16:53:08 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.39.172])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 13 Jul 2023 16:53:08 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 1/2] tools/perf/tests: perf all metrics test fails when
 perf_event access is restricted
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7chEpdJkpWuxZD2-w89SFBm9CU28MpLA40LV+=GaLJXS1w@mail.gmail.com>
Date: Thu, 13 Jul 2023 22:22:56 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <79C2D267-53E0-4169-91EA-98EC5F5EC9E8@linux.vnet.ibm.com>
References: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
 <AEE7B55C-BA6B-4E0E-A2E9-4E7EE09B4D50@linux.vnet.ibm.com>
 <CAM9d7chEpdJkpWuxZD2-w89SFBm9CU28MpLA40LV+=GaLJXS1w@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CA4e8x7OMtn9-1JOen8TEuSwcOjLe-ZJ
X-Proofpoint-GUID: rU2-3WC-KZfLqONJe8-Et_6R7dLRr67-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307130146
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
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

Hi Namhyung,

Thanks for checking. Is the fail behaviour observed after applying this =
fix patch ?
I will check it in my setup=20

Athira
>  ...
>=20
> Thanks,
> Namhyung
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


