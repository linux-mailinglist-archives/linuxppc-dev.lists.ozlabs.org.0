Return-Path: <linuxppc-dev+bounces-7995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B9A9CFDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 19:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkgJV4m3cz2yFK;
	Sat, 26 Apr 2025 03:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745603210;
	cv=none; b=XUxkzHwoZsRPduagP6lsRyAwSZIfGH+MpzJ0MADG5r4Y2B29bL5xr/S28AediYK7LDH7nSEgjhb+trogNaMAFWiXCOaUepAA9QmMZfCqquYmVvZWlQrS12GS73Sye4eBRAsq/IHe9ryxSww1y9AqnfLu7Z/DsjVxYeLQJXn71PcwEz0iMuBuqnsLROQmk1THYpjrP/LHaP5vknlfI5Db9Aee7DGYIaLYxrH7k9NJ7nCCgMHaAzXfopQsND7BB83p4gTZ7qOz1leDlEE1a7RoqSULqWoXDPNzOnpYsNeacz20uJnjBQM+emWaB6Y0aX9fly5jR4b67UhqcOEFU4KTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745603210; c=relaxed/relaxed;
	bh=ohYtiXcZslxqDRSa2W2ilOC8uqLye/CVpujTXHNq514=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odc/GaKd6UTYn7r5wZD3zbIu6ATMq1lCro1igXazksapkV3vn2WR2uZePQ1VUkQVgrAFEuJ0bWkySd1+UARY4D6BIXHLea7DkkGiFQzaw5oPY+MakBGbwKWrBKolEULtEWoELhl5y3hNEiGTyZnAsl/tfdY0JWu0m1p5m3CWD9uW2mbJGJHdVHmPsWiXvOep0JX5b2PHk365lC0aNsFi5QshNtNd8rPmceOHK0m8J3InJqproNhvu4iN5bbEPgnTrziDdpeIHxq4QEOgTF7K5OePqjt7oxXIDsByOrfywUgwybqslndD3JgcqhSiZBOjHw86AyQgy9ZQOdulIcFRIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kXqFv3PY; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kXqFv3PY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkgJT1H01z2y06
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 03:46:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A653443F56;
	Fri, 25 Apr 2025 17:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE012C4CEE9;
	Fri, 25 Apr 2025 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745603206;
	bh=Sgmu/3BDx6uV+GllAWEYIgsqkuxFB3Bo3lMKzsQbZ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXqFv3PYfpmBTMDXt0YQcvIa+c7cBzZLXfX0aRTW5hwIi7Cr/z9nrkp2qpx2QmmDs
	 2oQEfJpTjjK+eQIbvUIXDO5FMl5QTwd/OlzGK4JnEP4xpXVD1W+mTnBDo9kJ5sfAwV
	 b1qtwUhWkcS6yuSCR4sHhfZziZ8X8JKdksebA7zhaUQr4u1taFD7DKf5s161xIOktL
	 UPONCIojyn8avf9dADvif+atuQGvGvqWfkqtK7ZTEodm1acIEBcUGpTGLDhTYzC0az
	 uvDc5JFvWwEad8nFuy3XsZgsEz2/wfddc00VP0zPELSn85GCJIfnPTRk4jD2TFMTOe
	 lqb0Jz0o7PAlw==
Date: Fri, 25 Apr 2025 14:46:43 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
	Likhitha Korrapati <likhitha@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in
 cpumap.c
Message-ID: <aAvKg8K2fyrZ6zy4@x1>
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com>
 <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
 <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com>
 <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 08:19:02PM +0530, Athira Rajeev wrote:
> > On 14 Apr 2025, at 7:08 AM, Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
> > On 4/7/25 5:38 PM, Venkat Rao Bagalkote wrote:
> >> On 07/04/25 12:10 am, Athira Rajeev wrote:
> >>>> On 6 Apr 2025, at 10:04 PM, Likhitha Korrapati <likhitha@linux.ibm.com> wrote:

> >>>> perf build break observed when using gcc 13-3 (FC39 ppc64le)
> >>>> with the following error.

> >>>> cpumap.c: In function 'perf_cpu_map__merge':
> >>>> cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
> >>>>   414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
> >>>>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>> In file included from cpumap.c:4:
> >>>> /usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
> >>>>   672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
> >>>>       |              ^~~~~~
> >>>> cc1: all warnings being treated as errors

> >>>> Error happens to be only in gcc13-3 and not in latest gcc 14.
> >>>> Even though git-bisect pointed bad commit as:
> >>>> 'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
> >>>> issue is with tmp_len being "int". It holds number of cpus and making
> >>>> it "unsigned int" fixes the issues.

> >>>> After the fix:

> >>>>   CC      util/pmu-flex.o
> >>>>   CC      util/expr-flex.o
> >>>>   LD      util/perf-util-in.o
> >>>>   LD      perf-util-in.o
> >>>>   AR      libperf-util.a
> >>>>   LINK    perf
> >>>>   GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so

> >>>> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
> >>> Looks good to me

> >>> Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>

> >> Tested this patch on perf-tools-next repo, and this patch fixes the issue.

> >> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

> > Arnaldo, Namhyung,

> > can you consider pulling this fix? since it is breaking the build in gcc13-3 or
> > if you have any comments do let us know.

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

But wouldn't turning this into a calloc() be better?

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

- Arnaldo

