Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611190B718
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 18:55:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vw2FKnIo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2wx11BWvz3g7p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 02:55:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vw2FKnIo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2wwH1XYsz3g5S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 02:54:38 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HGZwYC005595;
	Mon, 17 Jun 2024 16:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=5moioqHMw+p0O+/zSVi6gRBX+7JUnVJckQcSkqOJkQ4=; b=Vw2FKnIo7N6H
	Z73n7R3umr2MDSH8yfXWsYN2f+7sDtjmk03def6imZGF63bJgqZ/5fTwYg35HuNm
	FiSsgXObD07N/X23hIV/ZvzBthuUfP9Jqt0atwGMvYLhs8kTTM9BmYyaBvClV+sQ
	4Vj7HUtpoJE23sWRQ/oTuMRb4gRKIcmMENmAEqRvZZhyp2Je3VY2E4d0pfoKlq7j
	9y6bqT9nN4Pt/vWbeAUroo8sg2WEatV3WsRWyaenVTEZWSuipjOXcMzjcMIe3F4B
	SUlSRuAfjooQojxzALHsbKjiGTBkkMLzvbu1kr3UveD4jXiVlXLMyox0fKO9dckD
	IIg/ybtouw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ytqcqr9fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 16:54:21 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45HGsLad003557;
	Mon, 17 Jun 2024 16:54:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ytqcqr9fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 16:54:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45HGPSdx009941;
	Mon, 17 Jun 2024 16:54:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ysqgmbka2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 16:54:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45HGsEmJ34865760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 16:54:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79C3620040;
	Mon, 17 Jun 2024 16:54:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDD0A20043;
	Mon, 17 Jun 2024 16:54:11 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.76.136])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 17 Jun 2024 16:54:11 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V2 2/3] tools/perf: Use is_perf_pid_map_name helper
 function to check dso's of pattern /tmp/perf-%d.map
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <30cdabb5-4c36-40c6-a2c0-8059e4afb371@arm.com>
Date: Mon, 17 Jun 2024 22:23:59 +0530
Message-Id: <B752E4BA-8EB0-4617-9CB1-479027802533@linux.vnet.ibm.com>
References: <20240617130332.13427-1-atrajeev@linux.vnet.ibm.com>
 <20240617130332.13427-2-atrajeev@linux.vnet.ibm.com>
 <30cdabb5-4c36-40c6-a2c0-8059e4afb371@arm.com>
To: James Clark <james.clark@arm.com>,
        Chaitanya S Prakash <chaitanyas.prakash@arm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fCo0TbqLTDsB5BYctdo7pwIXG9M906vJ
X-Proofpoint-GUID: AEKvjbPGLMsU8J6BA7wFSLsjw1tkCehP
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170131
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, namhyung@kernel.org, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 17 Jun 2024, at 7:29=E2=80=AFPM, James Clark <james.clark@arm.com> wro=
te:
>=20
>=20
>=20
> On 17/06/2024 14:03, Athira Rajeev wrote:
>> commit 80d496be89ed ("perf report: Add support for profiling JIT
>> generated code") added support for profiling JIT generated code.
>> This patch handles dso's of form "/tmp/perf-$PID.map".
>>=20
>> Some of the references doesn't check exactly for same pattern.
>> some uses "if (!strncmp(dso_name, "/tmp/perf-", 10))". Fix
>> this by using helper function is_perf_pid_map_name which looks
>> for proper pattern of form: "/tmp/perf-$PID.map" for these checks.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/util/dsos.c    | 2 +-
>> tools/perf/util/srcline.c | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
>> index ab3d0c01dd63..23cd02aa701d 100644
>> --- a/tools/perf/util/dsos.c
>> +++ b/tools/perf/util/dsos.c
>> @@ -275,7 +275,7 @@ static void dso__set_basename(struct dso *dso)
>> char *base, *lname;
>> int tid;
>>=20
>> - if (sscanf(dso__long_name(dso), "/tmp/perf-%d.map", &tid) =3D=3D 1) {
>> + if (is_perf_pid_map_name(dso__long_name(dso))) {
>> if (asprintf(&base, "[JIT] tid %d", tid) < 0)
>> return;
>> } else {
>> diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
>> index 9d670d8c1c08..51eb78993fe2 100644
>> --- a/tools/perf/util/srcline.c
>> +++ b/tools/perf/util/srcline.c
>> @@ -39,7 +39,7 @@ static const char *srcline_dso_name(struct dso *dso)
>> if (dso_name[0] =3D=3D '[')
>> return NULL;
>>=20
>> - if (!strncmp(dso_name, "/tmp/perf-", 10))
>> + if (is_perf_pid_map_name(dso_name))
>> return NULL;
>>=20
>> return dso_name;
>=20
> Duplicate of [1] but the latest version of the other one looks like it
> might have a mistake in it.
>=20
> For this one I get this compilation error:
>=20
> util/dsos.c: In function =E2=80=98dso__set_basename=E2=80=99:
> util/dsos.c:279:21: error: =E2=80=98tid=E2=80=99 may be used uninitialized
> [-Werror=3Dmaybe-uninitialized]
>  279 |                 if (asprintf(&base, "[JIT] tid %d", tid) < 0)
>=20

Hi James,

Thanks for pointing this. I had my first version here: https://lore.kernel.=
org/linux-perf-users/5d9a9842-9b8a-428c-898f-e1ff866a6e66@intel.com/T/#m5fb=
fa712a411c0e09b8177d31fc1c2d12f437fa5 which used regex for matching the dso=
 name in util/symbol.c

Got suggestion from Adrian to use =E2=80=9Csscanf=E2=80=9D and have a helpe=
r function since this /tmp/perf-%d.map check is done in other places as wel=
l ( in util/dsos.c, util/srcline.c ). This V2 address those changes. I didn=
=E2=80=99t hit the compile error, but that is a valid one which you reporte=
d since =E2=80=9Ctid=E2=80=9D needs to be taken care of. I will check this =
compile error

Thanks
Athira=20
>=20
>=20
> [1]:
> https://lore.kernel.org/linux-perf-users/20240601125946.1741414-10-Chaita=
nyaS.Prakash@arm.com/

