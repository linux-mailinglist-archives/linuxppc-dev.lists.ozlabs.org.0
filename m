Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5199177D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 07:05:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vg3LFFNu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W88lX2Czgz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 15:05:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vg3LFFNu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W88kp2cNrz30Vc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 15:04:33 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q4u0kS032238;
	Wed, 26 Jun 2024 05:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=I
	RcWdAktzJsy1wZBlGKvwOpueAhV8pRseCZB5gpHOGk=; b=Vg3LFFNuvwD29LT3f
	bCPgW2dtVGx1q7nsCQHt/wD1S1Km9sAVoabkDb47sHZEuiG5yGv4ZiAlcf8hQbXE
	DMT4Gs8uy1b+kmtzys0+Cwdhf4L2+/RJaPoZ36eEuyoqOvqPawOOShsTVgTpOya6
	GgM/M/yIsYDtZ0vmqF5NFrhyv416VunyXlGNCuJV88e+K1AVaNhul9s0+bWmkL/3
	pqDb20FVprh3HLUdcathO1RYs+Q662BU7zDdMidHdHu91UV9bmKiJZx78Qz33yc5
	kFHEqgfviO3A7ueRhpRLDViQBPynkQ8SHHmChrP93zbPHNf4dtVthz/AKSdj/kQp
	MWyFw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400anwr6x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 05:04:28 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45Q54RoR013085;
	Wed, 26 Jun 2024 05:04:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400anwr6x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 05:04:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45Q3VLtt000397;
	Wed, 26 Jun 2024 05:04:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxbn39y4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 05:04:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45Q54KjC42991884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 05:04:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C934D20049;
	Wed, 26 Jun 2024 05:04:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A289E20040;
	Wed, 26 Jun 2024 05:04:18 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.122.99])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 26 Jun 2024 05:04:18 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V4 1/3] tools/perf: Fix the string match for
 "/tmp/perf-$PID.map" files in dso__load
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7ci2raJmUjb7X2m6O1mCJm5xYLEWS8g_gC7tTjvshm1XFQ@mail.gmail.com>
Date: Wed, 26 Jun 2024 10:34:06 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <41C6FBA0-98FB-458A-AA01-77B9604D56C2@linux.vnet.ibm.com>
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
 <722cb4bc-89d4-4e03-a80d-ffe05be52c05@intel.com>
 <f65ff3cf-1724-45a1-ad88-200d72251042@intel.com>
 <CAM9d7ci2raJmUjb7X2m6O1mCJm5xYLEWS8g_gC7tTjvshm1XFQ@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VqVtTy1pBQUK1kYK-MFx1i6-MM_B1xml
X-Proofpoint-GUID: fuqKPiywl43EIW4S8iLYmijvQYqCAObm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260036
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 25 Jun 2024, at 11:29=E2=80=AFPM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>=20
> Hello,
>=20
> On Tue, Jun 25, 2024 at 5:02=E2=80=AFAM Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>>=20
>> On 25/06/24 14:57, Adrian Hunter wrote:
>>> On 23/06/24 09:48, Athira Rajeev wrote:
>>>> Perf test for perf probe of function from different CU fails
>>>> as below:
>>>>=20
>>>>     ./perf test -vv "test perf probe of function from different CU"
>>>>     116: test perf probe of function from different CU:
>>>>     --- start ---
>>>>     test child forked, pid 2679
>>>>     Failed to find symbol foo in =
/tmp/perf-uprobe-different-cu-sh.Msa7iy89bx/testfile
>>>>       Error: Failed to add events.
>>>>     --- Cleaning up ---
>>>>     "foo" does not hit any event.
>>>>       Error: Failed to delete events.
>>>>     ---- end(-1) ----
>>>>     116: test perf probe of function from different CU              =
     : FAILED!
>>>>=20
>>>> The test does below to probe function "foo" :
>>>>=20
>>>>     # gcc -g -Og -flto -c =
/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.c
>>>>     -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
>>>>     # gcc -g -Og -c =
/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.c
>>>>     -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
>>>>     # gcc -g -Og -o =
/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
>>>>     /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
>>>>     /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
>>>>=20
>>>>     # ./perf probe -x =
/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile foo
>>>>     Failed to find symbol foo in =
/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
>>>>        Error: Failed to add events.
>>>>=20
>>>> Perf probe fails to find symbol foo in the executable placed in
>>>> /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7
>>>>=20
>>>> Simple reproduce:
>>>>=20
>>>> # mktemp -d /tmp/perf-checkXXXXXXXXXX
>>>>   /tmp/perf-checkcWpuLRQI8j
>>>>=20
>>>> # gcc -g -o test test.c
>>>> # cp test /tmp/perf-checkcWpuLRQI8j/
>>>> # nm /tmp/perf-checkcWpuLRQI8j/test | grep foo
>>>>   00000000100006bc T foo
>>>>=20
>>>> # ./perf probe -x /tmp/perf-checkcWpuLRQI8j/test foo
>>>>   Failed to find symbol foo in /tmp/perf-checkcWpuLRQI8j/test
>>>>      Error: Failed to add events.
>>>>=20
>>>> But it works with any files like /tmp/perf/test. Only for
>>>> patterns with "/tmp/perf-", this fails.
>>>>=20
>>>> Further debugging, commit 80d496be89ed ("perf report: Add support
>>>> for profiling JIT generated code") added support for profiling JIT
>>>> generated code. This patch handles dso's of form
>>>> "/tmp/perf-$PID.map" .
>>>>=20
>>>> The check used "if (strncmp(self->name, "/tmp/perf-", 10) =3D=3D =
0)"
>>>> to match "/tmp/perf-$PID.map". With this commit, any dso in
>>>> /tmp/perf- folder will be considered separately for processing
>>>> (not only JIT created map files ). Fix this by changing the
>>>> string pattern to check for "/tmp/perf-%d.map". Add a helper
>>>> function is_perf_pid_map_name to do this check. In "struct dso",
>>>> dso->long_name holds the long name of the dso file. Since the
>>>> /tmp/perf-$PID.map check uses the complete name, use =
dso___long_name for
>>>> the string name.
>>>>=20
>>>> With the fix,
>>>>     # ./perf test "test perf probe of function from different CU"
>>>>     117: test perf probe of function from different CU              =
     : Ok
>>>>=20
>>>> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
>>>=20
>>> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
>>>=20
>>=20
>> Although it could use a Fixes tag
>>=20
>=20
> Thanks, I will add
>=20
> Fixes: 56cbeacf1435 ("perf probe: Add test for regression introduced
> by switch to die_get_decl_file()")
>=20
> Namhyung
>=20
Hi Adrian,
Thanks for the review.

Thanks Namhyung for adding the Fixes tag and pulling the fix

Athira

