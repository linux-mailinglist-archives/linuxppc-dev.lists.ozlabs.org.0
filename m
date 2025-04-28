Return-Path: <linuxppc-dev+bounces-8110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA134A9F53F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 18:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmT4T1Tyqz3089;
	Tue, 29 Apr 2025 02:12:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745856761;
	cv=none; b=P05lBS3kCbYsCK6bisINYYrnJNHnMBIbPSnPFQTob2e4g0n4tCQ+/OtDY0auYZuDK4Jku4unHuTk5S7yQ0wwxtQlLF9xo6gtEcDGwN30ioLU0SCHQ2RXIFF1Q7GTX+W3DLyyYCfoquiMLh1O/aN61m3LkMtvyBWV3tugZs0zkyeZnYE+JilASJWvyt1wMljFkiGarv1a3q773uk13lj8TSTmEEHPnnsKn8AzX/WpUCpdS8eU8BjZZa/MEQiGU5ncFoIIODcV/3bGvaJjN6b0G8zgr1k5HllIbX6IKXyggay9n5OSXBCIbkOVOA6fCa8dlMOs3/0YYP7RWNvyGcSN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745856761; c=relaxed/relaxed;
	bh=uiqn4pwQQzOUgQxa8+8l99pAwAjGyR/hPpFVJ0gj944=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=Kdh/tV11jeY6gC7GYlRR0wtnmBA+G+fd2P1vwjQGmhLW9g7A3BdCEhTkvyArJ1L6JSFv++QJWDgQVOhUMf4v0nOQKnspvLckwD5ZT2vjwWlmEcz10X/psAkYCBAeqZ3cvy5tuiOcFa+D/t+aEKy+beH8e7yaEZ29tO/gEuHD1OviW9oV0VJKUGhCl03UTYRKAeChtrsCjV0A/YiALy6itPZbdHCUgNmG3B93xm33+7gO+/CdqDxFinNrpAOYVcXkZL/iwhsnH5B/RV45MtlP1hN6ifFNgqu7J+EbNuGivq4TOe9EfuYj9LpFXxrhNudfW8js+4W2WnKxib22tdJuSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jzI6JO4Y; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jzI6JO4Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmT4R5MCGz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 02:12:39 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SBqEYC019877
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=uiqn4pwQQzOUgQxa8+8l99pAwAjGyR
	/hPpFVJ0gj944=; b=jzI6JO4Y2E+H1TUA0pxUj7SfSQ8I9wDH+XamfyRpdYXf4U
	bbOUe6Sa0VTxyiEpOYl1DOdmW5IqiKp6Tc2/LKk+gKOYOrPPPRE5Z+EMXt+PcNf9
	iYjEy5JEeA6bZUYcWxtwYh0qfulHJWdGEEJ80zyCh6NBhcZMLct4dsok1Hdx/vtv
	I2PeyXRUp4fn4oCSzHo3f2J76nY+Wn8prjKJQ1WK9Ma89nvKgu+BS5hnQH3IjB+q
	qMpUp6MR5xpkm6JWBqcMz8YlF0uEkvi7SqVeR8+iKZJXeatzzt2zZb/s0X05f5Si
	huZvapxI/5iLMWv+cYkgsmdvMewQ2HtCZkTJLoig==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469v5kma00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:36 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SCdLEV008494
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch2xw4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SGCYl720447498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BBD120043
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EEE02004B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:33 +0000 (GMT)
Received: from [9.124.218.94] (unknown [9.124.218.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 16:12:33 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------7C0CuWtond0lsnsdp4PmJRdS"
Message-ID: <1ea22f67-f711-4f44-a048-a0f9cc5e5fa7@linux.ibm.com>
Date: Mon, 28 Apr 2025 21:42:32 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
To: linuxppc-dev@lists.ozlabs.org
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
 <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
 <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
 <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com> <aAvKg8K2fyrZ6zy4@x1>
Content-Language: en-US
From: Likhitha Korrapati <likhitha@linux.ibm.com>
In-Reply-To: <aAvKg8K2fyrZ6zy4@x1>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n9HOjRbWXVOI6VbRTs-vi978Xs0wpO-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzMiBTYWx0ZWRfX9G+jvTCYPb+E S/La7CsI34VrnmQTVSrwEqQShghTaejLToSW6bJYbAJgqRo2eEcmB0qxpBdA3Hj2CQZyZeO3zfm GDVnPb/HN7JOj72keZYEYtHxVIQ0xdn4OFH/9kn2eQw6tDj3MutFX+I0sLVBNUvC0t0ki3TKOQC
 5/bWs77Lavki+5wC6XtzW0Co+RkfQFPtppoqfKl+KyHOfMS/ucyuafm66cE1lSP7nkAGbY9ZxkH heGtBK4afMAD7tITIqx7cQH66SEjLgLs2K8PVxbTJXl/4nFcRjXbb66EgAMsezCWT0qFxQ2RWpT r8sJ/qqqHIuk7WJRpPMcu/hnuQFTx/qnkOFVUEt9nIfyuiIarEX1JQCqHdWrqCUKRAy4qCclky9
 cIwJJILRy3jDOPw7rsy4qEwKmBSGHymx07l0iaO061THzRkwfSucM/jQcDqTeUrLxP+lkBWf
X-Proofpoint-GUID: n9HOjRbWXVOI6VbRTs-vi978Xs0wpO-q
X-Authority-Analysis: v=2.4 cv=DvxW+H/+ c=1 sm=1 tr=0 ts=680fa8f5 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=XR8D0OoHHMoA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=VnNF1IyMAAAA:8 a=35VNYtWOVUhRdQnF18oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VvooFKkyQ5mZQGuT1OcA:9 a=dQ_p3IHn69GFv_N0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280132
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------7C0CuWtond0lsnsdp4PmJRdS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnaldo,

On 4/25/25 23:16, Arnaldo Carvalho de Melo wrote:
> On Fri, Apr 25, 2025 at 08:19:02PM +0530, Athira Rajeev wrote:
>>> On 14 Apr 2025, at 7:08 AM, Madhavan Srinivasan<maddy@linux.ibm.com> wrote:
>>> On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
>>>> On 07/04/25 12:10 am, Athira Rajeev wrote:
>>>>>> On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati<likhitha@linux.ibm.com> wrote:
>>>>>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
>>>>>> with the following error.
>>>>>> cpumap.c: In function 'perf_cpu_map__merge':
>>>>>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>>>>>>    414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>>>>>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>> In file included from cpumap.c:4:
>>>>>> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
>>>>>>    672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
>>>>>>        |              ^~~~~~
>>>>>> cc1: all warnings being treated as errors
>>>>>> Error happens to be only in gcc13-3 and not in latest gcc 14.
>>>>>> Even though git-bisect pointed bad commit as:
>>>>>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
>>>>>> issue is with tmp_len being "int". It holds number of cpus and making
>>>>>> it "unsigned int" fixes the issues.
>>>>>> After the fix:
>>>>>>    CC      util/pmu-flex.o
>>>>>>    CC      util/expr-flex.o
>>>>>>    LD      util/perf-util-in.o
>>>>>>    LD      perf-util-in.o
>>>>>>    AR      libperf-util.a
>>>>>>    LINK    perf
>>>>>>    GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
>>>>>> Signed-off-by: Likhitha Korrapati<likhitha@linux.ibm.com>
>>>>> Looks good to me
>>>>> Reviewed-by: Athira Rajeev<atrajeev@linux.ibm.com>
>>>> Tested this patch on perf-tools-next repo, and this patch fixes the issue.
>>>> Tested-by: Venkat Rao Bagalkote<venkat88@linux.ibm.com>
>>> Arnaldo, Namhyung,
>>> can you consider pulling this fix? since it is breaking the build in gcc13-3 or
>>> if you have any comments do let us know.
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
>          RC_STRUCT(perf_cpu_map) *cpus;
>          struct perf_cpu_map *result;
>
>          if (nr_cpus == 0)
>                  return NULL;
>
>          cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);
>
>
> int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
> {
>          struct perf_cpu *tmp_cpus;
>          int tmp_len;
>          int i, j, k;
>          struct perf_cpu_map *merged;
>
>          if (perf_cpu_map__is_subset(*orig, other))
>                  return 0;
>          if (perf_cpu_map__is_subset(other, *orig)) {
>                  perf_cpu_map__put(*orig);
>                  *orig = perf_cpu_map__get(other);
>                  return 0;
>          }
>
>          tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
>          tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
>
>
> struct perf_cpu_map *perf_cpu_map__intersect(struct perf_cpu_map *orig,
>                                               struct perf_cpu_map *other)
> {
>          struct perf_cpu *tmp_cpus;
>          int tmp_len;
>          int i, j, k;
>          struct perf_cpu_map *merged = NULL;
>
>          if (perf_cpu_map__is_subset(other, orig))
>                  return perf_cpu_map__get(orig);
>          if (perf_cpu_map__is_subset(orig, other))
>                  return perf_cpu_map__get(other);
>
>          tmp_len = max(__perf_cpu_map__nr(orig), __perf_cpu_map__nr(other));
>          tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
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
I have tried using calloc() instead of malloc() and the issue still 
exists even using calloc(). cpumap.c: In function ‘perf_cpu_map__merge’:

cpumap.c:414:20: error: argument 1 range [18446744071562067968, 
18446744073709551615] exceeds maximum object size 9223372036854775807 
[-Werror=alloc-size-larger-than=]

414 | tmp_cpus = calloc(tmp_len , sizeof(struct perf_cpu));
>
> Like:
>
> diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
> index 4454a5987570cfbc..99d21618a252ac0e 100644
> --- a/tools/lib/perf/cpumap.c
> +++ b/tools/lib/perf/cpumap.c
> @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
>          }
>   
>          tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
> -       tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> +       tmp_cpus = calloc(tmp_len, sizeof(struct perf_cpu));
>          if (!tmp_cpus)
>                  return -ENOMEM;
>   
> ⬢ [acme@toolbx perf-tools-next]$
>
>
> And better, do the max size that the compiler is trying to help us
> catch?
>
> - Arnaldo

I have tried using max and it compiles with that. I am doing testing 
with this change and will be posting a V2.

Thanks

Likhitha.

>
--------------7C0CuWtond0lsnsdp4PmJRdS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hi Arnaldo,</font><br>
    </p>
    <div class="moz-cite-prefix">On 4/25/25 23:16, Arnaldo Carvalho de
      Melo wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aAvKg8K2fyrZ6zy4@x1">
      <pre wrap="" class="moz-quote-pre">On Fri, Apr 25, 2025 at 08:19:02PM +0530, Athira Rajeev wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 14 Apr 2025, at 7:08 AM, Madhavan Srinivasan <a class="moz-txt-link-rfc2396E" href="mailto:maddy@linux.ibm.com">&lt;maddy@linux.ibm.com&gt;</a> wrote:
On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 07/04/25 12:10 am, Athira Rajeev wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati <a class="moz-txt-link-rfc2396E" href="mailto:likhitha@linux.ibm.com">&lt;likhitha@linux.ibm.com&gt;</a> wrote:
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">perf build break observed when using gcc 13-3 (FC39 ppc64le)
with the following error.
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">cpumap.c: In function 'perf_cpu_map__merge':
cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
  414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from cpumap.c:4:
/usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
  672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
      |              ^~~~~~
cc1: all warnings being treated as errors
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Error happens to be only in gcc13-3 and not in latest gcc 14.
Even though git-bisect pointed bad commit as:
'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
issue is with tmp_len being "int". It holds number of cpus and making
it "unsigned int" fixes the issues.
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">After the fix:
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">  CC      util/pmu-flex.o
  CC      util/expr-flex.o
  LD      util/perf-util-in.o
  LD      perf-util-in.o
  AR      libperf-util.a
  LINK    perf
  GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Signed-off-by: Likhitha Korrapati <a class="moz-txt-link-rfc2396E" href="mailto:likhitha@linux.ibm.com">&lt;likhitha@linux.ibm.com&gt;</a>
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Looks good to me
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Reviewed-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.ibm.com">&lt;atrajeev@linux.ibm.com&gt;</a>
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Tested this patch on perf-tools-next repo, and this patch fixes the issue.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Tested-by: Venkat Rao Bagalkote <a class="moz-txt-link-rfc2396E" href="mailto:venkat88@linux.ibm.com">&lt;venkat88@linux.ibm.com&gt;</a>
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Arnaldo, Namhyung,
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">can you consider pulling this fix? since it is breaking the build in gcc13-3 or
if you have any comments do let us know.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This isn't the only place in that file where this pattern exists:

⬢ [acme@toolbx perf-tools-next]$ grep malloc tools/lib/perf/cpumap.c 
	cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);
	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
	tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
⬢ [acme@toolbx perf-tools-next]$


struct perf_cpu_map *perf_cpu_map__alloc(int nr_cpus)
{
        RC_STRUCT(perf_cpu_map) *cpus;
        struct perf_cpu_map *result;

        if (nr_cpus == 0)
                return NULL;

        cpus = malloc(sizeof(*cpus) + sizeof(struct perf_cpu) * nr_cpus);


int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
{
        struct perf_cpu *tmp_cpus;
        int tmp_len;
        int i, j, k;
        struct perf_cpu_map *merged;

        if (perf_cpu_map__is_subset(*orig, other))
                return 0;
        if (perf_cpu_map__is_subset(other, *orig)) {
                perf_cpu_map__put(*orig);
                *orig = perf_cpu_map__get(other);
                return 0;
        }

        tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
        tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));


struct perf_cpu_map *perf_cpu_map__intersect(struct perf_cpu_map *orig,
                                             struct perf_cpu_map *other)
{
        struct perf_cpu *tmp_cpus;
        int tmp_len;
        int i, j, k;
        struct perf_cpu_map *merged = NULL;

        if (perf_cpu_map__is_subset(other, orig))
                return perf_cpu_map__get(orig);
        if (perf_cpu_map__is_subset(orig, other))
                return perf_cpu_map__get(other);

        tmp_len = max(__perf_cpu_map__nr(orig), __perf_cpu_map__nr(other));
        tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));

I'm trying to figure out why its only in perf_cpu_map__merge() that this
triggers :-\

Maybe that max() call in perf_cpu_map__intersect() somehow makes the
compiler happy.

And in perf_cpu_map__alloc() all calls seems to validate it.

But wouldn't turning this into a calloc() be better?</pre>
    </blockquote>
    <span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">I have tried using calloc() instead of malloc() and the issue still exists even using calloc().
cpumap.c: In function ‘perf_cpu_map__merge’:
</span>
    <p><span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">cpumap.c:414:20: error: argument 1 range [18446744071562067968, 18446744073709551615] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]</span></p>
    <p><span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
    <span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">  414 |         tmp_cpus = calloc(tmp_len , sizeof(struct perf_cpu));

</span>
    <blockquote type="cite" cite="mid:aAvKg8K2fyrZ6zy4@x1">
      <pre wrap="" class="moz-quote-pre">

Like:

diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
index 4454a5987570cfbc..99d21618a252ac0e 100644
--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
        }
 
        tmp_len = __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
-       tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
+       tmp_cpus = calloc(tmp_len, sizeof(struct perf_cpu));
        if (!tmp_cpus)
                return -ENOMEM;
 
⬢ [acme@toolbx perf-tools-next]$


And better, do the max size that the compiler is trying to help us
catch?

- Arnaldo</pre>
    </blockquote>
    <p><span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">I have tried using max and it compiles with that. I am doing testing with this change and will be posting a V2.</span></p>
    <p><span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Thanks</span></p>
    <p><span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Likhitha.
</span></p>
    <blockquote type="cite" cite="mid:aAvKg8K2fyrZ6zy4@x1">
      <pre wrap="" class="moz-quote-pre">

</pre>
    </blockquote>
  </body>
</html>

--------------7C0CuWtond0lsnsdp4PmJRdS--


