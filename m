Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3C90A8F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 11:03:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ztek66uP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2kSc3L6sz3frZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 19:03:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ztek66uP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2kRt3500z3f0P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 19:02:49 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H5vHUX013461;
	Mon, 17 Jun 2024 09:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=tgNXS5H79ucwG35KsYePCtr8WrjT1qVmzdV8DrTgygs=; b=Ztek66uPVFml
	t/w2sujsjUAPGMvDqDog9HyCNpnZOEQPKo6OYXYOORFWozRo1VLW8wnLmnqrMzZH
	sLbvi8xAdwBbkv3BrgNNkLGdKNS8ijmFR99ZO4lml8fSQ+I1RdhEC51TvwMmlEXg
	GCD735jv7e5dWYXp1cCZGYZDsbHs8SMkx8EIPNnhmBeUUqhMwoAE1HW917qZbBWU
	WI0Ezpfgg8jn5jW/VM+QbuY7X5na0f48O0j3fplgWWoAyo8U+twwxoluRvqvH06I
	CzoyAeeYTqQ6FIGCriLL1BIlQKN/vr2APV6S+q3ykJAkPrk26sy5I0gC3HQwvNbv
	T5Lt80vhlw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yt8efh6rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:02:42 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45H92goU005623;
	Mon, 17 Jun 2024 09:02:42 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yt8efh6rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:02:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45H6tJHc019519;
	Mon, 17 Jun 2024 09:02:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ysnp0rp67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:02:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45H92ZBh43385220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 09:02:37 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73E4420063;
	Mon, 17 Jun 2024 09:02:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8603720040;
	Mon, 17 Jun 2024 09:02:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.215.84])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 17 Jun 2024 09:02:33 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] tools/perf: Fix parallel-perf python script to
 replace new python syntax ":=" usage
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <802a5260-8d74-4a5e-85fc-c9b86460d4c5@intel.com>
Date: Mon, 17 Jun 2024 14:32:21 +0530
Message-Id: <FEE9269F-7500-4169-9F94-50E3CCA174DF@linux.vnet.ibm.com>
References: <20240614172742.56976-1-atrajeev@linux.vnet.ibm.com>
 <20240614172742.56976-2-atrajeev@linux.vnet.ibm.com>
 <802a5260-8d74-4a5e-85fc-c9b86460d4c5@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5c_T6aJerPZEOIdkIdBcDCb19dd3zZGf
X-Proofpoint-GUID: pRVyNUmO1as08Vu7_RuDyXkPSZFRtCjC
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_07,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170068
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 16 Jun 2024, at 8:33=E2=80=AFPM, Adrian Hunter <adrian.hunter@intel.co=
m> wrote:
>=20
> On 14/06/24 20:27, Athira Rajeev wrote:
>> perf test "perf script tests" fails as below in systems
>> with python 3.6
>>=20
>> File "/home/athira/linux/tools/perf/tests/shell/../../scripts/python/par=
allel-perf.py", line 442
>> if line :=3D p.stdout.readline():
>>             ^
>> SyntaxError: invalid syntax
>> --- Cleaning up ---
>> ---- end(-1) ----
>> 92: perf script tests: FAILED!
>>=20
>> This happens because ":=3D" is a new syntax that assigns values
>> to variables as part of a larger expression. This is introduced
>> from python 3.8 and hence fails in setup with python 3.6
>=20
> According to below python 3.6 is end-of-life
>=20
> https://devguide.python.org/versions/
>=20
> What was still using python 3.6?
>=20
>> Address this by splitting the large expression and check the
>> value in two steps:
>> Previous line: if line :=3D p.stdout.readline():
>> Current change:
>> line =3D p.stdout.readline()
>> if line:
>>=20
>> With patch
>>=20
>> ./perf test "perf script tests"
>>  93: perf script tests:  Ok
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Observed this on SLES 15 SP5
Thanks for the Acked-by Adrian

I will be posting a V2 adding this Acked-by for this Patch 2 and addressing=
 changes suggested in handling "/tmp/perf-%d.map=E2=80=9D files in Patch 1

Thanks
Athira
>=20
>> ---
>> tools/perf/scripts/python/parallel-perf.py | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/scripts/python/parallel-perf.py b/tools/perf/scr=
ipts/python/parallel-perf.py
>> index 21f32ec5ed46..be85fd7f6632 100755
>> --- a/tools/perf/scripts/python/parallel-perf.py
>> +++ b/tools/perf/scripts/python/parallel-perf.py
>> @@ -439,7 +439,8 @@ def ProcessCommandOutputLines(cmd, per_cpu, fn, *x):
>> pat =3D re.compile(r"\s*\[[0-9]+\]")
>> p =3D subprocess.Popen(cmd, stdout=3Dsubprocess.PIPE)
>> while True:
>> - if line :=3D p.stdout.readline():
>> + line =3D p.stdout.readline()
>> + if line:
>> line =3D line.decode("utf-8")
>> if pat.match(line):
>> line =3D line.split()


