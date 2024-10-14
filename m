Return-Path: <linuxppc-dev+bounces-2239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB899D5B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 19:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS4MY2mSdz3c2R;
	Tue, 15 Oct 2024 04:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728927801;
	cv=none; b=WSKUApGn7Qp7BFYaPLUEOH5DsEtTyRdKxBxrSZn6pyexnwpK0H/Rugfkt+lM7A/XiFsh+7X5NQDeZ+Y4qYqKGRmCyJIRrfMLSQQoPGwr59hc/a8/WrBABcNcsxAAB2F5uMlhVeHtaIZUmDyO6H5JOqVUKQ9mVwZHCFRNTSHXWSVoWb4vG1jDrGveNCLoYht/WpS+/OC6wlEUYb1C+DSZk0IpmuYxrQ/cSFbgnph/mhj5U8tQxufZSIonvEuVr7JVfmdiy+oXJkBzVyCqfajvbrj/n+qVqAkRrr4WpJdKw3NRMe32Qt0h4xEUaVH/5Ay013+un6cHvE1uIJT3NAJ0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728927801; c=relaxed/relaxed;
	bh=+pWpSEvrN7/T0m/z/kjxc9+MdXShwgRoAXLi5Y+0nKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UuHkoCGA742nIQtxViR1bG/MZKjVTsCYIwQbnPdZgeph5LLmqf2xhfKkInzhwopVUJU0KntcJ5hlhyixOAzjobreImViS8QuPZ2jfprig1FIPSEF39CLhahNgTig4POhitJXtn/LvyamAWEv7ybUSVGlR5Fi2uwtccgj4NtY1OlVl2HUSchybOoVj+aRSIIfVAkPprwcJ1hyyiEOTHV4bAolkLZ1hUwiSkd+oTm1fb1fpTr4f0W+mtG7IazU9iUchyaE9PIBkNC9nChwZTr56NffqbXw0RlHqmsgKqHHuv8jP8AxjCyoY5iQKrf4IWTi5iRuF3jifpJEhRdB0A7hMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZyOhDmn; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pZyOhDmn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS4MX1qwtz3c1D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 04:43:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B9CE5C06F4;
	Mon, 14 Oct 2024 17:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237B1C4CEC3;
	Mon, 14 Oct 2024 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728927797;
	bh=OSasaQe116lFDU9PKraI9EVMOCCCqghXYmMmz0fe+48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pZyOhDmnWNp81UMfMMp4uiLcoiH93kFGcgZ2Wlzs9XHTJROAWcPSTUoZqE2Ny6Hxc
	 0n2IMhuu8jLL07i1awliZyyEO9yYqcn6wisO6MYam8ldVvtjbfhAhKPOCXbHeq7QVA
	 Cq8jlZQi+Kq3PEKwME6IDh81nZWkmRHNJf2aajSczYS28bDs8eyNCbXg5mjhu+N2yd
	 iEnEWYB0oFI+iq2w1BAsW/jL0YPFmVm7tl3rgwWRTDnufOVCXZTtYO+NOFQrmw+LCq
	 aLepYL5nvzJwAXh6QJX/Zc7CfwjfmwgRH+YZcXXTEe8cuhzN5nYiMBX49/jFhBwjjW
	 DuFKWfdob6FFg==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
 irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, 
 disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
In-Reply-To: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
References: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf/tests: Fix compilation error with strncpy
 in tests/tool_pmu
Message-Id: <172892779710.897882.14949543082561189584.b4-ty@kernel.org>
Date: Mon, 14 Oct 2024 10:43:17 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-d4707
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 13 Oct 2024 23:07:42 +0530, Athira Rajeev wrote:

> perf fails to compile on systems with GCC version11
> as below:
> 
> In file included from /usr/include/string.h:519,
>                  from /home/athir/perf-tools-next/tools/include/linux/bitmap.h:5,
>                  from /home/athir/perf-tools-next/tools/perf/util/pmu.h:5,
>                  from /home/athir/perf-tools-next/tools/perf/util/evsel.h:14,
>                  from /home/athir/perf-tools-next/tools/perf/util/evlist.h:14,
>                  from tests/tool_pmu.c:3:
> In function ‘strncpy’,
>     inlined from ‘do_test’ at tests/tool_pmu.c:25:3:
> /usr/include/bits/string_fortified.h:95:10: error: ‘__builtin_strncpy’ specified bound 128 equals destination size [-Werror=stringop-truncation]
>    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    96 |                                   __glibc_objsize (__dest));
>       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


