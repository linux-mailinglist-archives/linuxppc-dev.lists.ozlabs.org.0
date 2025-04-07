Return-Path: <linuxppc-dev+bounces-7477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F76A7D39F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 07:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWJ2J3zvlz2yqm;
	Mon,  7 Apr 2025 15:40:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744004408;
	cv=none; b=dEYRIPzbdW8zVIbnsIRdLFsD2k01jTi5tuZEkqrdj50lZWsp1pD7HzoU5OBdqlx0d9uMqg0BsgOSRKZ6A9Gy6+hTl/Jovqi/bFGLaHhJ1vK2gi4JRZcpQx7dRy65ibzcUV1ltgV40JFBz5EtZ2BPvNR0j/F3KiL8Roy+1RH/lJoX7iWoVsXPI60Ha6wXdHMrCGdO1qNtPFwL2rbSRqwZAv6nyzLZXeFo9GarPZqwlauQqnWs5wBFDLcVUkCMdVJDg1xX8vpf5bdFkUOqG28/bA3uO+/A8a8bfuGbBtLfDxnCifpmXvjDzpPOjVj0s7Js/ch4NhPWlnBG0Z6iyFOZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744004408; c=relaxed/relaxed;
	bh=FNXHu3cYSruzshGfUM3k+8K221VbQyy3fYfzBVH5HBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoNIpHd9RLiXyRrVDJzgNu4qNYi1RR22PhXoS0lPOTUORpOPUvQB4yC0aAG0eFqKw3qSfImrZHndulXqCu6IIMlUc5tTFoNe+G5vOZWEf7MACrz3RNojtWcFn4Yr1BvJvqqIkTokCdy1IZxw4cHaq8vz03Iwv+rJcrTwJ4pylnAnOiwvNUJzuEPAD/o+XX8D6tFiZ8DXfkCefslgPWgQR8iI6bpPrrpEBHsEvnazqmRhF53zt1yhIiJI5xc+X83TmDA1c7H3AJnoF/1jSGZupQlRWE1Qoe9Yk/UZpeQxKzthmwKm2+SN/TlyUuFJdnch0E6afvMX0MGiabKOQLm0ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ou6wAf4J; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ou6wAf4J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWJ2D6rj5z2yqN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 15:40:04 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5370beuS018400;
	Mon, 7 Apr 2025 05:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=FNXHu3cYSruzshGfUM3k+8K221VbQy
	y3fYfzBVH5HBc=; b=ou6wAf4JTQbHYXVCFARTCGtjXRR2OweA5GaO/cPK1iQVaD
	y3GWbXLUi8yC/30rxy9zNeDT6cCyoXitXxcvI8nqyqXsYfsAkZv+MzE5cI59mcnp
	8WVGyEI3IgV/CME9ZOOIfDWgmdBRJ71gjPRTi3Z723KrBgkf2XAJ2XnV9VAGFhwh
	BOB8jkwy9F1q1WGmSd3RdisPJIALZX9bnZdpDE++dBRU3V/wDWlhDCdVIKSQ4gb8
	Q/AwfdZ6DZ3C8w2EvxLlr8ykukL4F9ZnC8yPtavMKheRAHjquDuk/bIAbSePY2yb
	uH/WkV9tEOtkQBRfEyNpggc/XTwgTbfvZdL8T0QA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswsyha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 05:39:57 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5375VgnX025622;
	Mon, 7 Apr 2025 05:39:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswsyh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 05:39:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5372Av4q018899;
	Mon, 7 Apr 2025 05:39:56 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uhj243cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 05:39:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5375dqav53870954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 05:39:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E302320049;
	Mon,  7 Apr 2025 05:39:52 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C705920040;
	Mon,  7 Apr 2025 05:39:50 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.124.220.143])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  7 Apr 2025 05:39:50 +0000 (GMT)
Date: Mon, 7 Apr 2025 11:09:48 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Likhitha Korrapati <likhitha@linux.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.ibm.com
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
Message-ID: <jurbzu545pw54ln75irvovshdbvvj7xnwefhhcdpvm3knalx7n@ivftcr2jlf5x>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406163412.897313-1-likhitha@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 78BJTxYe9xydQ_vTN461Hk3AakOHZNGK
X-Proofpoint-ORIG-GUID: vEXSlzTbQ-TfVNDtUzJ7sCljBVRJjDjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070037
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 06, 2025 at 10:04:12PM +0530, Likhitha Korrapati wrote:
> perf build break observed when using gcc 13-3 (FC39 ppc64le)
> with the following error.
> 
> cpumap.c: In function 'perf_cpu_map__merge':
> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>   414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from cpumap.c:4:
> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
>   672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
>       |              ^~~~~~
> cc1: all warnings being treated as errors
> 
> Error happens to be only in gcc13-3 and not in latest gcc 14.
> Even though git-bisect pointed bad commit as:
> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
> issue is with tmp_len being "int". It holds number of cpus and making
> it "unsigned int" fixes the issues.
> 
> After the fix:
> 
>   CC      util/pmu-flex.o
>   CC      util/expr-flex.o
>   LD      util/perf-util-in.o
>   LD      perf-util-in.o
>   AR      libperf-util.a
>   LINK    perf
>   GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
> 
> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
> ---
>  tools/lib/perf/cpumap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
> index 4454a5987570..c7c784e18225 100644
> --- a/tools/lib/perf/cpumap.c
> +++ b/tools/lib/perf/cpumap.c
> @@ -398,7 +398,7 @@ bool perf_cpu_map__is_subset(const struct perf_cpu_map *a, const struct perf_cpu
>  int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>  {
>  	struct perf_cpu *tmp_cpus;
> -	int tmp_len;
> +	unsigned int tmp_len;
>  	int i, j, k;
>  	struct perf_cpu_map *merged;
>
LGTM

Reviewed-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

> -- 
> 2.43.5
> 

