Return-Path: <linuxppc-dev+bounces-11479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7BB3B614
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 10:35:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCs6Y2Yhzz2yrl;
	Fri, 29 Aug 2025 18:35:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756456549;
	cv=none; b=EfGYTGZ4O6OBSePb/Ui91Ku+Q9MRqMd506zWpax2ayU26P1n5abA5rjoYgCl4U0DFj6hLS3GJvKBFXfdxKoK351KO5NIdGPizo9LLjvj0tKZHuBqURf4Vy/M4NmY0X5gFCtcJHp9m0FncXGai1swzQfZahRUVHwwsEDd7gAFL2Dl+VlH7FPTinC2E2SW4auEwafLxerruAMvKQe3IJbvL5fkxIBoR7jx1FjMaynnS+Z0yAPapkHs4JCEOO1Kq1aAybOmoZXMNHcCb0CXOg7Eh6ANU6OUFh+LM0Ef+4bAfws9wafBJPZvYZrLktZECbhYyWRYVM/9U7qJHxxARgbQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756456549; c=relaxed/relaxed;
	bh=3UykXrTl2EB+vKESxnHtvi5hIMPHRCCUy7MHaCs1xXA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gNlwJvOJWKShfMQnVySwVWdissOpiETLsL/ceBzCiL9jZIOh/4i9PhOkQrcwhS7fDtn2NxdhftY6NzEHfvzL92OZ0/AHPFUM2Dk7dbgYVkJQmUa9SYS6axlqdBQ68oW++xda2f9eLuDIJ6QYrdSdezBpQvuORg9YrzocLRXUgA6quETk4pbHoBVgP9V/oeHNhSh42tkdc4FgtOzagzDfHrGoPvyGtX2CHd5UgCm/rQZ65fPYntaiU5B6ltyj4QCfwNjnQUrJeYv5OETbWeulLdhJScHDvSDYvFnEAIzDxzya+yAiLF1h/ibimDA9OeBPbsA6gTI8XWHKcExXU06Y7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hk37P4Fe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hk37P4Fe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCs6X4QCdz2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 18:35:48 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8HM2P007535;
	Fri, 29 Aug 2025 08:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3UykXr
	Tl2EB+vKESxnHtvi5hIMPHRCCUy7MHaCs1xXA=; b=hk37P4Fe0mi9T32XkwxsA3
	v2QfGOxklUu1IdEVMYeHJLEFBpauAOBImwp9iro2jVr0nY5eTglA6xOGmHEg5Cga
	ZN7zD8UkOOrCYyfvrJI9t5Rwj1svpkUm0tE4NYlLXtK8pwftJ/FqEJgpySKLZlTC
	vur30tAnD/GWulzprkpPA4y+FQRmU04mA8RXVBExHrjO0fyhq1M0Gv40TV+8h4Dl
	J5C55pxU0/vn74wcwGC4lQh3gR7OZo7b1wJlyfeya7N9zG3qOJQpl/+/QarLpM3r
	8HZhj1dkPHa8MZ/7H3GzXdi56XV92Fl3+EXvzTiM+sB+MttYjjB5iz6+NA5AhWPQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv9bu0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:35:43 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57T8Y3BF004975;
	Fri, 29 Aug 2025 08:35:42 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv9bu0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:35:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57T87VXH002482;
	Fri, 29 Aug 2025 08:35:42 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mrs1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 08:35:41 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57T8Zcai53871080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 08:35:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 355C620040;
	Fri, 29 Aug 2025 08:35:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88A7920043;
	Fri, 29 Aug 2025 08:35:31 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.17])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 29 Aug 2025 08:35:31 +0000 (GMT)
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
Subject: Re: [PATCH 12/14] tools/perf: Add support for printing synth event
 details via default callback
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <c83166e3-99d6-47aa-b774-0dfe69e0da8d@intel.com>
Date: Fri, 29 Aug 2025 14:05:17 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Kajol Jain <kjain@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C077DD2F-352D-4DEA-9A3C-9D38411FE276@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-13-atrajeev@linux.ibm.com>
 <c83166e3-99d6-47aa-b774-0dfe69e0da8d@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=GqtC+l1C c=1 sm=1 tr=0 ts=68b1665f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=PQ0u6mOqf5tVaTv6lJEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PEjV-EK6ldknHxRXMJaC9germ_M2xWSs
X-Proofpoint-ORIG-GUID: 4WcRs649npg_lg7WTpAjXos2XaWm4bOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDEyNyBTYWx0ZWRfX4BSh6mTd0cUK
 4GLlV3TvgIY7WLllROA/AUyBC0vjiu8AueEArJaeetLBw5SYE8eiaU19AE3G0z1LhxpjNMm0dwS
 cyEDskIYBzmkJxPwM+oMnJUWSpd7/oIzKQFXzSDgd9l4JBdchRUH31KRcBLF/B9++XD6OrAb0Wl
 uyMjdzzzizeB5OVlA/jiGgr7/1KMa8KOn6qHKYtYdfApzucdaCe608/fmo6Q58q6x4yIW021s2g
 Js7f/fNeX91QV+V+sFHmQkl3WsKDM+7AFPB9DPczxPIuDvOSxBBEUUl/GfU/MxaM5gA+GR4JvKM
 yTa+yP31/0TTjU0jeebRziXXjrRCgDrU7T8L/9MJVTCHiIumnrUueXky6nAS3/zFmqih4Wm40AB
 SRUZFR5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280127
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 27 Aug 2025, at 10:59=E2=80=AFPM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 15/08/2025 11:34, Athira Rajeev wrote:
>> Introduce arch_perf_sample__fprintf_synth_evt to add support for
>> printing arch specific synth event details. The process_event()
>> function in "builtin-script.c" invokes perf_sample__fprintf_synth() =
for
>> displaying PERF_TYPE_SYNTH type events.
>>=20
>>   if (attr->type =3D=3D PERF_TYPE_SYNTH && PRINT_FIELD(SYNTH))
>>    perf_sample__fprintf_synth(sample, evsel, fp);
>>=20
>> perf_sample__fprintf_synth() process the sample depending on the =
value
>> in evsel->core.attr.config . Currently all the arch specific =
callbacks
>> perf_sample__fprintf_synth* are part of "builtin-script.c" itself.
>> Example: perf_sample__fprintf_synth_ptwrite,
>> perf_sample__fprintf_synth_mwait etc. This will need adding arch
>> specific details in builtin-script.c for any new perf_synth_id =
events.
>>=20
>> Introduce arch_perf_sample__fprintf_synth_evt() and invoke this as
>> default callback for perf_sample__fprintf_synth(). This way, arch
>> specific code can handle processing the details.
>=20
> A default callback is not needed.
>=20
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> tools/perf/builtin-script.c | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>=20
>> diff --git a/tools/perf/builtin-script.c =
b/tools/perf/builtin-script.c
>> index d9fbdcf72f25..eff584735980 100644
>> --- a/tools/perf/builtin-script.c
>> +++ b/tools/perf/builtin-script.c
>> @@ -2003,6 +2003,12 @@ static int =
perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
>> return len + perf_sample__fprintf_pt_spacing(len, fp);
>> }
>>=20
>> +static void arch_perf_sample__fprintf_synth_evt(struct perf_sample =
*data __maybe_unused,
>> +  FILE *fp __maybe_unused, u64 config __maybe_unused)
>> +{
>> + return;
>> +}
>> +
>> static int perf_sample__fprintf_synth(struct perf_sample *sample,
>>       struct evsel *evsel, FILE *fp)
>> {
>> @@ -2026,6 +2032,7 @@ static int perf_sample__fprintf_synth(struct =
perf_sample *sample,
>> case PERF_SYNTH_INTEL_IFLAG_CHG:
>> return perf_sample__fprintf_synth_iflag_chg(sample, fp);
>> default:
>=20
> Should just add something like:
>=20
> case PERF_SYNTH_POWERPC_VPA_DTL:
> return perf_sample__fprintf_synth_vpadtl(sample, fp);

Ok Adrian

Will directly call perf_sample__fprintf_synth_vpadtl instead of having =
default call back

Thanks for all comments, I will post a V2 addressing the changes

Thanks
Athira
>=20
>> + arch_perf_sample__fprintf_synth_evt(sample, fp, =
evsel->core.attr.config);
>> break;
>> }



