Return-Path: <linuxppc-dev+bounces-3837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 979609E5E73
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 19:50:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y43NV5tgnz30V1;
	Fri,  6 Dec 2024 05:50:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733424602;
	cv=none; b=hdMPcv5ir1F05gYWshJPeR0GL8Jecu/mEP8TUh1Fv48YzYV1DDxu6oMmYOKf+itASHgMF0rf/4Od3aQRjhBp8fw+y9C27v/ndtsU71qFKvI6CcObYwvPAPDUL35LQsP53fu6hW8KtNJEFQcxnJVhDGfrRR4kc8H+1MyOSrojHxsM0/bTFIBrJDMNgOgNkR8qhXgFzQ1HtVIQMMTeMGg8zw16/FZlakx8HYvvghvRF3XjF6bw0GpvJLKCiipgzqhtzMjRF0bSV9L7UkbPb3LrCtJX2IApMUnU/ocWjIVc1K0HGIUEWlEWcm6899/hFjcWn1iZWXGQSq+I7yQcEYDQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733424602; c=relaxed/relaxed;
	bh=9J7Kv+UtG9KHDzg/Rl02SR/2IMb9Jb7zOnicTOKHJ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzLtMB/COVhpTeL9tw4QS6Vv2Dv6jzpgVl+bh3fKwLoaPMS4woxTCXnNrJm0tj/aYtXTLVYCsdSgaUNsyv/hYfLzv++uLv5xtDCex7TK05Me/Xj3vbjHsJDSHPZKvVu4v0FbPszjJ0WKwTVyDQte7ccXd8Q9pThfRdzNcyPBxzp7Jv+/HMJ/EaBvRljVVwk2PejEPESlspC4zhfVGwlYxv8VZ8uGY0Kp4N08y5BkV9/enQP0AUA3uMndyd9VuwFXkBJzuQJHlOa+w40u3wWvj9QDqX9NUfZBhy1iDlv5QogDCMBswazmkFfPguBEAYB6pe7u4zqqPJz/kvT04MGNqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WAUOWeBh; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WAUOWeBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y43NT1YYyz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 05:50:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB5B4A43EC3;
	Thu,  5 Dec 2024 18:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07F5C4CEDD;
	Thu,  5 Dec 2024 18:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733424597;
	bh=dDt0khiKo+ui9Wm7vhnocIu34JPC6qEiqspVC45Co08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAUOWeBh4k673SZK1Msddq6V6UTnmQk/LU+3iyN7fuAVSHyC00QyVNzSN85PQlFgy
	 ON9nQJ1ABrXgUL8aQBmiW7vNn8VYrHdwl1aB2seQhsUk0ygR0jnLVgnFzIULmyiLMu
	 gOWJKXpcT35sPFN3Xqn/lJkUiY6+NrAk1dinnGr0oRhvrkZ0KXIdzuTy0C5+L6PjhF
	 aOlEPZHvWG08ZSrOOcKT6L4/U7DT3p0cfLGA8UDNyc2FwqyXLmA24NSjNapUFnXssk
	 hVLzDsPHhMCbmvl0j0T6BsOJNELymYdHXl809FpiddgsKW5KhHu9nYYJEumffMAaaf
	 lavkBDZnSgndw==
Date: Thu, 5 Dec 2024 10:49:54 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
	maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.ibm.com
Subject: Re: [PATCH v1] perf test expr: Fix system_tsc_freq for only x86
Message-ID: <Z1H10jkXnGqC1vWg@google.com>
References: <20241205022305.158202-1-irogers@google.com>
 <Z1E-WHWSPAezVF4f@google.com>
 <CAP-5=fVPw5wJtVR0fxU-7drXg34vNrBsEzurfcLLvC+wFPMAAg@mail.gmail.com>
 <CAP-5=fV6s0=X-+8i2+1O_ZKERTL8+S9S-nyZC8rJPNU_nQpbyg@mail.gmail.com>
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
In-Reply-To: <CAP-5=fV6s0=X-+8i2+1O_ZKERTL8+S9S-nyZC8rJPNU_nQpbyg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 04, 2024 at 11:09:50PM -0800, Ian Rogers wrote:
> On Wed, Dec 4, 2024 at 10:33 PM Ian Rogers <irogers@google.com> wrote:
> >
> > On Wed, Dec 4, 2024 at 9:47 PM Namhyung Kim <namhyung@kernel.org> wrote:
> > >
> > > Hi Ian,
> > >
> > > On Wed, Dec 04, 2024 at 06:23:05PM -0800, Ian Rogers wrote:
> > > > The refactoring of tool PMU events to have a PMU then adding the expr
> > > > literals to the tool PMU made it so that the literal system_tsc_freq
> > > > was only supported on x86. Update the test expectations to match -
> > > > namely the parsing is x86 specific and only yields a non-zero value on
> > > > Intel.
> > > >
> > > > Fixes: 609aa2667f67 ("perf tool_pmu: Switch to standard pmu functions and json descriptions")
> > > > Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > > > Closes: https://lore.kernel.org/linux-perf-users/20241022140156.98854-1-atrajeev@linux.vnet.ibm.com/
> > > > Co-developed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > >
> > > It failed on my VM.
> > >
> > >   root@arm64-vm:~/build# ./perf test -v 7
> > >   --- start ---
> > >   test child forked, pid 2096
> > >   Using CPUID 0x00000000000f0510
> > >   division by zero
> > >   syntax error
> > >   Unrecognized literal '#system_tsc_freq'FAILED tests/expr.c:253 #system_tsc_freq == 0
> > >   ---- end(-1) ----
> > >     7: Simple expression parser                                        : FAILED!
> >
> > I'll need to check this. The test is looking for parsing failures, so
> > it's confusing to me expr__parse is returning 0. I was testing on x86
> > but disabling the literal in the tool PMU.
> 
> Hmm.. perhaps you had a similar issue to me and that b4 silently
> failed as git user.email/user.name weren't configured? When I test on

No, I confirmed it's appplied.  Maybe my VM setting has some problem.
After reboot + rebuild it works now, sorry for the noise.

Thanks,
Namhyung


> a raspberry pi 5:
> ```
> $ uname -a
> Linux raspberrypi 6.6.51+rpt-rpi-2712 #1 SMP PREEMPT Debian
> 1:6.6.51-1+rpt3 (2024-10-08) aarch64 GNU/Linux
> $ git log -1 --oneline
> 94733a0e50fd (HEAD -> ptn-expr-test) perf test expr: Fix
> system_tsc_freq for only x86
> $ /tmp/perf/perf test expr -v
> Couldn't bump rlimit(MEMLOCK), failures may take place when creating
> BPF maps, etc
>   7: Simple expression parser                                        : Ok
> ```
> 
> Thanks,
> Ian

