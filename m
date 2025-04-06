Return-Path: <linuxppc-dev+bounces-7471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6434A7CFC0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Apr 2025 20:40:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZW1PQ6CrZz2yNG;
	Mon,  7 Apr 2025 04:40:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743964842;
	cv=none; b=hb+TtlSkngpmgiJnsgS6TD2neDpYWAZla5GtFc30nWS+qUo1/afe7ocuhECx8EHLqspJKKrQATTPbD1hTU5vkyxQBytSzOkFNxRh7uqnLtuLm69W+ohI5LwPzpkQ1Ht/Bo23UrvTVr00NMPCVv9ubcIxuiQe1O55Le1NyxtPF/eBN5EHLunWiW7gTzBvrOeGKh1hEL2bs5pAVfifNTn+zDxPEkAixS5FGIyx8apEO2XfHwYOE5EeLF0zb+CnzYP02fJZxHe16A+6XAyAXBsfC55AKi1rw/9RKxMaLy79a3m6Y/RwUJR9oLTv3kex41Bl704+4lXbvnbBQ5VQ9maSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743964842; c=relaxed/relaxed;
	bh=Xl10n4EfMGcz5yZJ50T336+BxH5qajS9T0JHC53F5jQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UdOmpyESyxehxy5gunc5OcL3wRRtSV7q2M5kI1Pt+pEGqE6TUbPQVza78Siz4g7V8TiZCgSoOW79mnmQslK3eVIVdT1LoCL4y4lUSQwj3oScEd1guKVG8rvYJpo720W9UrhLlQ86sqjoFhTtq3aTFZyiX9dAnlll9P65gok1B5IF1hZW9+FeffpECBJVIj69gGXnw1DWwlBbzgqcfn9EDid1ZeDiwOlmgPezVM61Udywtu6LveJV+grU2tALuYabezT44xMIUoofcgjHfHbOoJhf2qXOmIdIQn4IA/0apuHQZLtkAV7MUlydZDG2AgV9TohAAjM5QSmUpOEipuXWLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F1fL5+SY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F1fL5+SY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZW1PP1QDSz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 04:40:40 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536HBT2p029560;
	Sun, 6 Apr 2025 18:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Xl10n4
	EfMGcz5yZJ50T336+BxH5qajS9T0JHC53F5jQ=; b=F1fL5+SYLXQRcIzIE3bG+z
	17qWVFgCHHsS/kT9/Ih0tNwUysERJ3AaXrpb2NU7td0Fycwi0A7yUFKfrTdxxhB3
	wVsixeM/wCBor5RTJQ82sI4HQNtHqCtchrDt99h0A1NkDz48HwSQNIpr8xN8t9id
	BB9z+ujWFcht4yJZgRA3AuWWDQ+O9qHREYhLmLrRufPLFufHnvSSpyyJiEgXrCIZ
	TspqeNFnrxPGrz1JmryZ9uGkaZwoxNeIO86cNDjZOYCK7B6dpTN9oK8Z1rpHF6Tr
	XBH8FkzaPbBZrAruDFM3O8bnddD5qgoqpL3jIbELPr0pCnsgKtSGvnCGPZdkF82A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswr70x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 18:40:33 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 536IeXHE028114;
	Sun, 6 Apr 2025 18:40:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswr70v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 18:40:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 536EFFNR017825;
	Sun, 6 Apr 2025 18:40:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uh2kaebm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 18:40:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 536IeSiR34275818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Apr 2025 18:40:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAAE82004B;
	Sun,  6 Apr 2025 18:40:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD06B20049;
	Sun,  6 Apr 2025 18:40:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.249.15])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun,  6 Apr 2025 18:40:24 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250406163412.897313-1-likhitha@linux.ibm.com>
Date: Mon, 7 Apr 2025 00:10:10 +0530
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
To: Likhitha Korrapati <likhitha@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7lJ4UcsV-HIAwTh8ZFgXypNSTl-whGHR
X-Proofpoint-ORIG-GUID: qXiy8iHudRf1hA3t8OZmmbcQ2ADDUIS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504060135
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 6 Apr 2025, at 10:04=E2=80=AFPM, Likhitha Korrapati =
<likhitha@linux.ibm.com> wrote:
>=20
> perf build break observed when using gcc 13-3 (FC39 ppc64le)
> with the following error.
>=20
> cpumap.c: In function 'perf_cpu_map__merge':
> cpumap.c:414:20: error: argument 1 range [18446744069414584320, =
18446744073709551614] exceeds maximum object size 9223372036854775807 =
[-Werror=3Dalloc-size-larger-than=3D]
>  414 |         tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
>      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from cpumap.c:4:
> /usr/include/stdlib.h:672:14: note: in a call to allocation function =
'malloc' declared here
>  672 | extern void *malloc (size_t __size) __THROW =
__attribute_malloc__
>      |              ^~~~~~
> cc1: all warnings being treated as errors
>=20
> Error happens to be only in gcc13-3 and not in latest gcc 14.
> Even though git-bisect pointed bad commit as:
> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are =
used")',
> issue is with tmp_len being "int". It holds number of cpus and making
> it "unsigned int" fixes the issues.
>=20
> After the fix:
>=20
>  CC      util/pmu-flex.o
>  CC      util/expr-flex.o
>  LD      util/perf-util-in.o
>  LD      perf-util-in.o
>  AR      libperf-util.a
>  LINK    perf
>  GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
>=20
> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
Looks good to me

Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>

Thanks
Athira
> ---
> tools/lib/perf/cpumap.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
> index 4454a5987570..c7c784e18225 100644
> --- a/tools/lib/perf/cpumap.c
> +++ b/tools/lib/perf/cpumap.c
> @@ -398,7 +398,7 @@ bool perf_cpu_map__is_subset(const struct =
perf_cpu_map *a, const struct perf_cpu
> int perf_cpu_map__merge(struct perf_cpu_map **orig, struct =
perf_cpu_map *other)
> {
> struct perf_cpu *tmp_cpus;
> - int tmp_len;
> + unsigned int tmp_len;
> int i, j, k;
> struct perf_cpu_map *merged;
>=20
> --=20
> 2.43.5
>=20


