Return-Path: <linuxppc-dev+bounces-8242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47195AA6BD4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 09:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpjcf5l4Fz2xtt;
	Fri,  2 May 2025 17:44:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746171890;
	cv=none; b=eQ/pBL6SIxw+ajPkcQ4dX91pVxahg7Nx61n9Io+qg0p/MX1CTGCZsCwA/ZyvQGzi90JrdvC4UwB88KXEwY1h1ZsHHZmpBtSZghb9CloBeq0yhyjwK3yc344zrdcTj2LfGdglVe/b2hp2ZKEKw1UyK1o6TzrGOBB5+j4lKfHovqp3UUIwWRXRzmOk7bSkFb44GPz99o7oPKnJ7NAbvVTtbd6RkOZpjYoUverAVWu73kPLcuu2xE1m1pljaTFMrXB9InSfWJMikd7q5f8jbCAuMJmRb18j1Cmwuues2VfnS8Vy9S1jk40EGGhWIlaU74usnbDP+amb1qdGYpt0HMJ78w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746171890; c=relaxed/relaxed;
	bh=PFTDWbmpjqyNvorZ00qOZ1uq1aBoJ70rMvhghqTVrlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFynHjs/jhSjVuYeCy8oBKGk8HzJd7QgdGj2mg7qAmYvTLKbs+cnOZfoK5rH6EcfaVzPijWxzwXYiR/f1g3uAg0QGF6fyFNvfLsqa7emaO7n/5L9oBpHT3wSUmpLhf3+2IEbPPn/DXxo31gqU/81toItGPS0nElI1QFx+RA5HTWF7409Hf/zG+5iq00XfphAjr6O0oDluEz+V/u/tOCPUBqFRMHDgSUwYNKoSO94Z8P8tsVcHCdWgqFe1hL3w9zR7No66/xgfakNg98Js0RWyP1+8xj0LSP/DbNhBv5P2Xr6cfAtB4qVuDhoZTkMVE4VtiQSxz9+r89+zyk76684sw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h/oLGHJ/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h/oLGHJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zpjcd3ZB2z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 17:44:48 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541LDof1022745;
	Fri, 2 May 2025 07:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PFTDWb
	mpjqyNvorZ00qOZ1uq1aBoJ70rMvhghqTVrlw=; b=h/oLGHJ/3pmWiwDyKFvkd6
	wWA3ChBFGvb+pUpo9v6oOiAobsvGUxAMabmk1g3c+6qp3TdNwcTyxtGEXQaza1zV
	Ej3FOUS7zn26UKhYC56xIBgOHye0fTl5Pmd8kQ6kWJ5ipa3T2eLed7YRIqoHSy7S
	lt0BWjTmLa8caL7Lpikfcu+sSVYjyvue8rh5SWp26EOlYkPSSpNarbJUvWuEDvL6
	VeqnuqjUmnX5BWyXtI2FzUPuPlCXOezgpW+LEKsmxVi5jZ9XLcLlhQfe667MTh0e
	u2c7h89eprW3Dal+kxvFPiMpzhq5qwUnMcn1f0jshEf4lgwbgORvMkgrnLHGorlA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c6vjmvsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 07:44:43 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5427igvp021333;
	Fri, 2 May 2025 07:44:42 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c6vjmvsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 07:44:42 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5426fh0s000666;
	Fri, 2 May 2025 07:44:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atprvwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 07:44:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5427ibbI51511576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 07:44:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CA6820040;
	Fri,  2 May 2025 07:44:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D406F20043;
	Fri,  2 May 2025 07:44:34 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.124.221.245])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  2 May 2025 07:44:34 +0000 (GMT)
Date: Fri, 2 May 2025 13:14:32 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        Likhitha Korrapati <likhitha@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
Message-ID: <wqewmdha3bx7pmxqwbna26qnl55fcejqsjs4b2zhuciddpb3b5@7ztolpf6erwo>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
 <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
 <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
 <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com>
 <aAvKg8K2fyrZ6zy4@x1>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAvKg8K2fyrZ6zy4@x1>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA1OCBTYWx0ZWRfX4m1mmQcwxxjX 7PJbATbVI6JHd6OZrJmg/+HyH00Nir2mgxw2v2v28H65YXhjSWDzdFE/LfGNrs82w7WbmTqGB+n jZI4YStnh8EOVrYHofDvpNsQH4c1JWSeimGgtx42PyyhIOZZ3q45NUJagM9zCEAPZ1Y5XVWOAyM
 l3p695d+GcytBMrM6XStcXj2Xo9fJy4MnQuCKzhXDDWkry9gsMb4FiaaNGIfZeC/nJJYLxGIB5e 0atVaNrWoiRM6S2bFJ7y0+ZavZP9nUR+bgvUVLcsyEJC0sMzIVeX79PR7L3GNgriBnfNEcGLIkx rMEMdNj8HExvfzZDwOBkVsiimUaUGT+de9FI9O4eVuC736EUMvtdvt45t7SEFIO15pElZru39+d
 ThC+FY/02RzPcPTYo59+rXpskxsX33IGAmdat0U8Hp070DjIPcbNovdhmzudTP9qb1KUQxlW
X-Authority-Analysis: v=2.4 cv=GI8IEvNK c=1 sm=1 tr=0 ts=681477eb cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=8Zd0U_MfKav0zEdrKIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: nIkLRvl2A13TXS6hPaJD8YwMqIqOd-lF
X-Proofpoint-ORIG-GUID: 7HHaU-Dxzzd2D6qhEdqCW3vSmqz6S2Sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020058
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 02:46:43PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Apr 25, 2025 at 08:19:02PM +0530, Athira Rajeev wrote:
> > > On 14 Apr 2025, at 7:08 AM, Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
> > > On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
> > >> On 07/04/25 12:10 am, Athira Rajeev wrote:
> > >>>> On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati <likhitha@linux.ibm.com> wrote:
> 
> > >>>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
> > >>>> with the following error.
> 
> > >>>> cpumap.c: In function 'perf_cpu_map__merge':
> > >>>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
> > >>>>   414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> > >>>>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >>>> In file included from cpumap.c:4:
> > >>>> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
> > >>>>   672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
> > >>>>       |              ^~~~~~
> > >>>> cc1: all warnings being treated as errors
> 
> > >>>> Error happens to be only in gcc13-3 and not in latest gcc 14.
> > >>>> Even though git-bisect pointed bad commit as:
> > >>>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
> > >>>> issue is with tmp_len being "int". It holds number of cpus and making
> > >>>> it "unsigned int" fixes the issues.
> 
> > >>>> After the fix:
> 
> > >>>>   CC      util/pmu-flex.o
> > >>>>   CC      util/expr-flex.o
> > >>>>   LD      util/perf-util-in.o
> > >>>>   LD      perf-util-in.o
> > >>>>   AR      libperf-util.a
> > >>>>   LINK    perf
> > >>>>   GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
> 
> > >>>> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
> > >>> Looks good to me
> 
> > >>> Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>
> 
> > >> Tested this patch on perf-tools-next repo, and this patch fixes the issue.
> 
> > >> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
> > > Arnaldo, Namhyung,
> 
> > > can you consider pulling this fix? since it is breaking the build in gcc13-3 or
> > > if you have any comments do let us know.
> 
> This isn't the only place in that file where this pattern exists:
> 
> ⬢ [acme@toolbx perf-tools-next]$ grep malloc tools/lib/perf/cpumap.c 
> 	cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);
> 	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> 	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> ⬢ [acme@toolbx perf-tools-next]$
> 
> 
> struct perf_cpu_map *perf_cpu_map__alloc(int nr_cpus)
> {
>         RC_STRUCT(perf_cpu_map) *cpus;
>         struct perf_cpu_map *result;
> 
>         if (nr_cpus == 0)
>                 return NULL;
> 
>         cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);
> 
> 
> int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
> {
>         struct perf_cpu *tmp_cpus;
>         int tmp_len;
>         int i, j, k;
>         struct perf_cpu_map *merged;
> 
>         if (perf_cpu_map__is_subset(*orig, other))
>                 return 0;
>         if (perf_cpu_map__is_subset(other, *orig)) {
>                 perf_cpu_map__put(*orig);
>                 *orig = perf_cpu_map__get(other);
>                 return 0;
>         }
> 
>         tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
>         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> 
> 
> struct perf_cpu_map *perf_cpu_map__intersect(struct perf_cpu_map *orig,
>                                              struct perf_cpu_map *other)
> {
>         struct perf_cpu *tmp_cpus;
>         int tmp_len;
>         int i, j, k;
>         struct perf_cpu_map *merged = NULL;
> 
>         if (perf_cpu_map__is_subset(other, orig))
>                 return perf_cpu_map__get(orig);
>         if (perf_cpu_map__is_subset(orig, other))
>                 return perf_cpu_map__get(other);
> 
>         tmp_len = max(__perf_cpu_map__nr(orig), __perf_cpu_map__nr(other));
>         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> 
> I'm trying to figure out why its only in perf_cpu_map__merge() that this
> triggers :-\
> 
> Maybe that max() call in perf_cpu_map__intersect() somehow makes the
> compiler happy.
> 
> And in perf_cpu_map__alloc() all calls seems to validate it.
> 
> But wouldn't turning this into a calloc() be better?
> 
> Like:
> 
> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
> index 4454a5987570cfbc..99d21618a252ac0e 100644
> --- a/tools/lib/perf/cpumap.c
> +++ b/tools/lib/perf/cpumap.c
> @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>         }
>  
>         tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
> -       tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> +       tmp_cpus = calloc(tmp_len, sizeof(struct perf_cpu));
>         if (!tmp_cpus)
>                 return -ENOMEM;
>  
> ⬢ [acme@toolbx perf-tools-next]$
> 
> 
> And better, do the max size that the compiler is trying to help us
> catch?
> 
> - Arnaldo
Isn't it better to use perf_cpu_map__nr. That should fix this problem.

One question I have, in perf_cpu_map__nr, the function is returning
1 in case *cpus is NULL. Is it ok to do that? wouldn't it cause problems?

Regards,
Mukesh

