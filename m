Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45C37978D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 18:56:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m1XWLM5b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQP939Wrz3c33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 02:56:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m1XWLM5b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQNG2CCWz3c09
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 02:55:25 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387GbQHE003075;
	Thu, 7 Sep 2023 16:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=KA+OOCFAb1hPshVcZs/i2seUx7ZFlIO3JRyT3VR8nE0=;
 b=m1XWLM5bmMWzByAHltFaAmTxLfBlVZp81X22HV8VzcoFN+SWNPaQtt6Bb7T8Vwm4LSH0
 CSHardDvnc2yXZ7Om7FKzMg9+T3bg0GUQwmcoDTVgH2U3CMqdTvh8/c8Ilxet7fx+RkW
 L9Lm6fnaTYM8O51ELCicJDx4YgbPVgOavMpv0L7qvdEt72BLoCF791ar5sWvzoZK+2aX
 HaItiOgs+GKl1mX96AYTfyV8ynS6aG0CM23OQ2H7EKHQC2wLMbBhShTYO5cNjb0NisDx
 2qvH7EOwM8pQpQoIWdE47xN9vlq11tmYv/fDjOQf4QBk59ZtvOSI9IrT0rR+XMrbEMMJ +w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfuuw4g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:55:19 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387GbU1D003469;
	Thu, 7 Sep 2023 16:55:19 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfuuw4fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:55:19 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387Gc7SO006622;
	Thu, 7 Sep 2023 16:55:18 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvkw1xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:55:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387GtEXE19137204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 16:55:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B31620040;
	Thu,  7 Sep 2023 16:55:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C61732004B;
	Thu,  7 Sep 2023 16:55:12 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.9.102])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Sep 2023 16:55:12 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH] perf test: Fix parse-events tests to skip parametrized
 events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fXJNqokOKJmu1n1kXUqaqabQrsXw42FVi-MrZb3Ss5R-A@mail.gmail.com>
Date: Thu, 7 Sep 2023 22:25:00 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF349DBF-8993-425F-BE39-335639AC0BC0@linux.vnet.ibm.com>
References: <20230807045016.23409-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXJNqokOKJmu1n1kXUqaqabQrsXw42FVi-MrZb3Ss5R-A@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Sduf_m4IjTo4EmE1FR7AzPVNje3ropdu
X-Proofpoint-ORIG-GUID: 7JeqYYt5ipweFfVg9InvBa71dNeBJtHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309070147
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Aug-2023, at 12:07 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Sun, Aug 6, 2023 at 9:50=E2=80=AFPM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Testcase "Parsing of all PMU events from sysfs" parse events for
>> all PMUs, and not just cpu. In case of powerpc, the PowerVM
>> environment supports events from hv_24x7 and hv_gpci PMU which
>> is of example format like below:
>>=20
>> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
>> - hv_gpci/event,partition_id=3D?/
>>=20
>> The value for "?" needs to be filled in depending on system
>> configuration. It is better to skip these parametrized events
>> in this test as it is done in:
>> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
>> parametrized events")' which handled a simialr instance with
>> "all PMU test".
>=20
> I'd say this is different, the "?" is really ugly. On other
> architectures the problem is solved by having >1 PMU, domain and core
> can be meta-data associated with the PMU. If we want to aggregate
> based on domain and core in the perf tool, it will need a different
> way of solving the problem for Power. Skipping the test is just
> pushing this problem down the road.

Hi Ian

Thanks for the comments. We will check on this for powerpc.
>=20
>> Fix parse-events test to skip parametrized events since
>> it needs proper setup of the parameters.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/parse-events.c | 32 ++++++++++++++++++++++++++++++++
>> 1 file changed, 32 insertions(+)
>>=20
>> diff --git a/tools/perf/tests/parse-events.c =
b/tools/perf/tests/parse-events.c
>> index b2f82847e4c3..605373c7d005 100644
>> --- a/tools/perf/tests/parse-events.c
>> +++ b/tools/perf/tests/parse-events.c
>> @@ -2504,7 +2504,11 @@ static int test__pmu_events(struct test_suite =
*test __maybe_unused, int subtest
>>        while ((pmu =3D perf_pmus__scan(pmu)) !=3D NULL) {
>>                struct stat st;
>>                char path[PATH_MAX];
>> +               char pmu_event[PATH_MAX + 256];
>=20
> By definition paths can't be longer than PATH_MAX.
Yeah, my bad. Will fix this.

>=20
>> +               char *buf =3D NULL;
>> +               FILE *file;
>>                struct dirent *ent;
>> +               size_t len =3D 0;
>>                DIR *dir;
>>                int err;
>>=20
>> @@ -2528,11 +2532,39 @@ static int test__pmu_events(struct test_suite =
*test __maybe_unused, int subtest
>>                        struct evlist_test e =3D { .name =3D NULL, };
>>                        char name[2 * NAME_MAX + 1 + 12 + 3];
>>                        int test_ret;
>> +                       int skip =3D 0;
>=20
> Prefer a boolean. Prefer is_event_parameterized over skip to make
> variable name more intention revealing.
Sure
>=20
>>=20
>>                        /* Names containing . are special and cannot =
be used directly */
>>                        if (strchr(ent->d_name, '.'))
>>                                continue;
>>=20
>> +                       /* exclude parametrized ones (name contains =
'?') */
>> +                       snprintf(pmu_event, PATH_MAX + 256, "%s%s", =
path, ent->d_name);
>=20
> Use sizeof(pmu_event) rather than "PATH_MAX + 256".

Will send V2 with these changes
>=20
> Thanks,
> Ian
>=20
>> +                       file =3D fopen(pmu_event, "r");
>> +                       if (!file) {
>> +                               pr_debug("can't open pmu event file =
for '%s'\n", ent->d_name);
>> +                               ret =3D combine_test_results(ret, =
TEST_FAIL);
>> +                               continue;
>> +                       }
>> +
>> +                       if (getline(&buf, &len, file) < 0) {
>> +                               pr_debug(" pmu event: %s is a null =
event\n", ent->d_name);
>> +                               ret =3D combine_test_results(ret, =
TEST_FAIL);
>> +                               continue;
>> +                       }
>> +
>> +                       if (strchr(buf, '?'))
>> +                               skip =3D 1;
>> +
>> +                       free(buf);
>> +                       buf =3D NULL;
>> +                       fclose(file);
>> +
>> +                       if (skip =3D=3D 1) {
>> +                               pr_debug("skipping parametrized PMU =
event: %s which contains ?\n", pmu_event);
>> +                               continue;
>> +                       }
>> +
>>                        snprintf(name, sizeof(name), "%s/event=3D%s/u", =
pmu->name, ent->d_name);
>>=20
>>                        e.name  =3D name;
>> --
>> 2.31.1


