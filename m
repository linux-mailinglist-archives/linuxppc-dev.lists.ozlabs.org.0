Return-Path: <linuxppc-dev+bounces-12587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6CBA269E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 06:54:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXytF3zj1z303y;
	Fri, 26 Sep 2025 14:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758862469;
	cv=none; b=bIoXn8VdiVeEq/DwmfNWn7TN/zmPpGjBR6t6+eJX+aRUE/+VKCeMDWqGrOTveMdjBlcuk+rjQwddFSQhRzrmaSRCrM8uilGeA1yXcKhvCnvgj1XCfRMDGcBRpDkbKReK7sTSngJF8437LUmfx8BL4/vM0mC+kOm4yVurj6QMCr2cIA+8kBPhAfR/adzRWDEClltJDOuVW7P6x1++vDBMYuZwbpkXDGiDgP7dgEueI6dXnmRAxsPHOLCB+KqZ/OBylQhvLnDYhcgNInxwTAdZQKkymPf62LuLtsFDtfnb1qscVYT8NXQe9zhLJd9ooJY5GTmS/ne6dD45rW13pee3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758862469; c=relaxed/relaxed;
	bh=K2sVOQtpom8E+6LcdklRKyIGFTCIMW4ZFgXncQwZwZ0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jm0iwfYEYA2CrZYa1wBC1gYKxs3onEg8p68bjkY1oQqlJw4keKIMyZ6Bn7PDpWSZwIT2mnL2mJMHd8tm98PoBrtVYVpsYjsr/Z0ltmvOMJdHn2Qt2gPDQbQhnOjcNnSOYL3j95S9G/DCN2k+OjgFJZzULSmOijzitxz59zDLvK3P0UnvRQYIBG/551IEdyV4+UQ3XOo/k9Br11bAfKMX+PFZ5icmLX/cg9KVHDGDvFmoqN1LeAxG8sZmB5PW/vFXTpE9rSc28MMpyab/gwsTEFOEy3U/Yc2XzcsQfs6f5lMZkJZhhcEAuJtu0LC0YHiIFs8bws/+DPvpDyFijLhXZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jkKEEb8x; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jkKEEb8x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXytD3KP3z2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 14:54:27 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PImFqe029827;
	Fri, 26 Sep 2025 04:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K2sVOQ
	tpom8E+6LcdklRKyIGFTCIMW4ZFgXncQwZwZ0=; b=jkKEEb8xTCpaG11k4VanBq
	NzSTVVGxuqfVK76DtblE1NtsvM88e96PdBoF20yunbo8YgJMTPaN563VQU3Qkj2m
	n3ilJp8XjIAgJmM6x6JWYO7kjUAaeGTd4NfpIDmF7LlevRMlhioRVBPZ33WwVnvA
	wFovgju+e6snS0AgRc0L/b1DChY7Izss49AC/cWX9TJ1aU6ZqLmZYjqZLs33KMWL
	hkpF+XsHVVnflQCeiu0xl15AycUJ7/ZxcrMgf/IgEYQmnXpxq9RXPwmTyLn6hVxY
	vOixn8wqC9zafLIamm4Mi2lKlPXhmVE95A9+hRUiMsMdnYQI/BwIPCQpf9qb55SA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49dbbaja29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 04:54:21 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58Q4ix6S028114;
	Fri, 26 Sep 2025 04:54:20 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49dbbaja28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 04:54:20 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q215ZC014258;
	Fri, 26 Sep 2025 04:54:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49dawm2ah4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 04:54:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58Q4sGc131654626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Sep 2025 04:54:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FF402004B;
	Fri, 26 Sep 2025 04:54:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BBAE20040;
	Fri, 26 Sep 2025 04:54:10 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.144])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 26 Sep 2025 04:54:09 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH V3 0/6] perf/tools: Add interface to expose vpa dtl
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <7EE7DD5B-6550-436B-A799-2B1DF293121E@gmail.com>
Date: Fri, 26 Sep 2025 10:23:56 +0530
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB498516-CA5D-428C-B6FC-CC46A43E39AA@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
 <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com>
 <6BB167B7-6479-44E7-9175-E67E500DB9E2@linux.ibm.com>
 <7EE7DD5B-6550-436B-A799-2B1DF293121E@gmail.com>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LSZL-YOChOuAXmOKLRmXU9URqaxjpGlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3NCBTYWx0ZWRfX4uk8JQtsTb/P
 ZidDKmt3AMx/Kv68lzaxFNIAiO+901YpzZKK2OGh1xBd7Ao/zmnvxEkdt465Nu3ThZB2n1QEN2w
 vkBxWDZf0IjJwHbUIiaq3TEyyXW/owUN8aZillWdU4nu0eEaiPKQj+MvzbiRh/vM3TC25zymB7E
 kGjm7dnHpgpz46PSI4nOrq1qXWY38WrvjBP8mWVuVdPhY2eBga4Fiva36AHpOTCqjFOr5aQEQiO
 RUAZejLY6RQdUnfqejbwJQHLC765DWDjEgKlLOBjMXZFj2mWiKANco99Kq8Gv9oLn1EuZfXAotG
 +eKgR2Hw+jIsxkVL3mJrQD++emeb0fx6dc+0EBwga4wYFuLRzuoSa1zhi86lV8uZNtdCsHJoreE
 OH6idNcBM9OvleEUe3i7ruMNvLu9Cw==
X-Proofpoint-ORIG-GUID: Bopzy9ifQjE2ddeuvga69D4CkbwuHUr6
X-Authority-Analysis: v=2.4 cv=B6W0EetM c=1 sm=1 tr=0 ts=68d61c7d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=QyXUC8HyAAAA:8 a=9KmrnSt_NXlnFdTC1FQA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250174
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 25 Sep 2025, at 9:57=E2=80=AFPM, Arnaldo Carvalho de Melo =
<arnaldo.melo@gmail.com> wrote:
>=20
>=20
>=20
> On September 25, 2025 6:21:19 PM GMT+02:00, Athira Rajeev =
<atrajeev@linux.ibm.com> wrote:
>>=20
>>=20
>>> On 17 Sep 2025, at 11:28=E2=80=AFAM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>>>=20
>>> On 16/09/2025 08:25, Athira Rajeev wrote:
>>>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>>>> retrieve a log of dispatch and preempt events from the hypervisor
>>>> using data from Disptach Trace Log(DTL) buffer. With this =
information,
>>>> user can retrieve when and why each dispatch & preempt has =
occurred.
>>>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL =
counters
>>>> via perf.
>>>>=20
>>>> - Patch 1 to 6 is perf tools side code changes to enable perf
>>>> report/script on perf.data file
>>>=20
>>> For all patches 1 to 6:
>>>=20
>>> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
>>=20
>> Hi All,
>>=20
>> Looking for further comments if any on this patchset.
>> The kernel side patches for this feature which was sent as separate =
series is pulled to powerpc tree by Maddy
>>=20
>> If the tools side changes looks good, can we have this merged to perf =
tools tree ?
>=20
>=20
> Sure, I'll look at it soon now that the kernel part is merged.
>=20
> - Arnaldo
Sure, thanks Arnaldo=20

Athira
>>=20
>> Thanks
>> Athira
>>=20
>>>=20
>>=20
>=20
> - Arnaldo



