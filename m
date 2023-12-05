Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F552804B06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 08:19:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZsE9meen;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SksNd5GDbz3cb6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 18:19:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZsE9meen;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SksMq0jqGz3c5j
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 18:18:46 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B57HfF9024737;
	Tue, 5 Dec 2023 07:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=uJfydSpimLPBfWLvEpMAEZ2LK+bczT0B2jnWfOkW0aw=;
 b=ZsE9meenO+XmW6+sQBqd5yjotPLx7CJYQP3By+N6NLp4799wkWB/OjQe4mOrAJSZX/mk
 16QrvinYmrTEiKGkk4rnjle3k4ZGWiNESKLpPsiQvQCtvPWHFmlcBHgnvJx4IvLSr68Y
 WgFCsp03KlXF6cW582X/+vupm3eiR6/jPGh7Bb7choRLdRBsVta37Ek7w1m2KvFACSHs
 3VvDB6dfk5X0WSMEg3twUfFa1Ia7Dp6WoQnjCv6XsWedpFvMtSxLQrPiMxhzc2grUGxh
 QmFfMFkLWvtioJhwLQ6VTSGUhIne/aIxDAPDruPYrVzfh7TDJaVAciIzKdcb5pOH+6lM Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3usybjg15x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 07:18:38 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B57HtYE025413;
	Tue, 5 Dec 2023 07:18:37 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3usybjg12j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 07:18:37 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B56Y93o008542;
	Tue, 5 Dec 2023 07:16:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3urgdkw22x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 07:16:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B57GVo119923684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Dec 2023 07:16:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56EC120043;
	Tue,  5 Dec 2023 07:16:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F5CE20040;
	Tue,  5 Dec 2023 07:16:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.215.218])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  5 Dec 2023 07:16:29 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH] perf vendor events: Update datasource event name to fix
 duplicate events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fXWm_ZZjQ-36eTJTuWQsQwwCEXer22Oid7X-PSe8=WY1Q@mail.gmail.com>
Date: Tue, 5 Dec 2023 12:46:17 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2400D325-80A3-4BA0-9467-03F452A72911@linux.vnet.ibm.com>
References: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fWtLHCyZh_6hBkCg16ekOXfwSGAVT9xvgKcUsMcu=Ou9w@mail.gmail.com>
 <ZW40nstmGUeV9Fie@kernel.org> <ZW406O38z3DmVwOX@kernel.org>
 <CAP-5=fXWm_ZZjQ-36eTJTuWQsQwwCEXer22Oid7X-PSe8=WY1Q@mail.gmail.com>
To: Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2me79ftqEHaywPzjZDi9SuYBzSVY28md
X-Proofpoint-ORIG-GUID: FufJ90xSFzSeB2cQ8H-2sKonx4UEFAYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_03,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050058
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Dec-2023, at 2:43=E2=80=AFAM, Ian Rogers <irogers@google.com> =
wrote:
>=20
> On Mon, Dec 4, 2023 at 12:22=E2=80=AFPM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
>>=20
>> Em Mon, Dec 04, 2023 at 05:20:46PM -0300, Arnaldo Carvalho de Melo =
escreveu:
>>> Em Mon, Dec 04, 2023 at 12:12:54PM -0800, Ian Rogers escreveu:
>>>> On Thu, Nov 23, 2023 at 8:01=E2=80=AFAM Athira Rajeev
>>>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>>>=20
>>>>> Running "perf list" on powerpc fails with segfault
>>>>> as below:
>>>>>=20
>>>>>   ./perf list
>>>>>   Segmentation fault (core dumped)
>>>>>=20
>>>>> This happens because of duplicate events in the json list.
>>>>> The powerpc Json event list contains some event with same
>>>>> event name, but different event code. They are:
>>>>> - PM_INST_FROM_L3MISS (Present in datasource and frontend)
>>>>> - PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
>>>>> - PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
>>>>> - PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)
>>>>>=20
>>>>> pmu_events_table__num_events uses the value from
>>>>> table_pmu->num_entries which includes duplicate events as
>>>>> well. This causes issue during "perf list" and results in
>>>>> segmentation fault.
>>>>>=20
>>>>> Since both event codes are valid, append _DSRC to the Data
>>>>> Source events (datasource.json), so that they would have a
>>>>> unique name. Also add PM_DATA_FROM_L2MISS_DSRC and
>>>>> PM_DATA_FROM_L3MISS_DSRC events. With the fix, perf list
>>>>> works as expected.
>>>>>=20
>>>>> Fixes: fc1435807533 ("perf vendor events power10: Update =
JSON/events")
>>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>>=20
>>>> Given duplicate events creates broken pmu-events.c we should =
capture
>>>> that as an exception in jevents.py. That way a JEVENTS_ARCH=3Dall =
build
>>>> will fail if any vendor/architecture would break in this way. We
>>>> should also add JEVENTS_ARCH=3Dall to tools/perf/tests/make. =
Athira, do
>>>> you want to look at doing this?
>>>=20
>>> Should I go ahead and remove this patch till this is sorted out?
>>=20
>> I'll keep it, its already in tmp.perf-tools-next, we can go from =
there
>> and improve this with follow up patches,

Thanks Arnaldo for pulling the fix patch.

>=20
> Agreed. I could look to do the follow up but likely won't have a
> chance for a while. If others could help out it would be great. I'd
> like to have the jevents and json be robust enough that we don't trip
> over problems like this and the somewhat similar AmpereOne issue.

Yes Ian.

I will look at adding this with follow up patches and including this as =
part of tools/perf/tests/make

Thanks
Athira
>=20
> Thanks,
> Ian
>=20
>> - Arnaldo


