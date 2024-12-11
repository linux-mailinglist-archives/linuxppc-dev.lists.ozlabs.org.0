Return-Path: <linuxppc-dev+bounces-3994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 179969ED640
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 20:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7lhy0cGCz30DX;
	Thu, 12 Dec 2024 06:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733944626;
	cv=none; b=iNrjJNMcqbs37T5yORKw8E3WXIYeKdbFqTuoseAw/wjy/cNUGycOXZEVkquG+31J5WZpctaRTTTpfLzX+XtcJvhIp+oKSEWiBMMNQy3yEmaw+xHQsGfsLoPGSeOrFoR81/7uSfQnwiz4JRpiUl/90CDXXKxwj0X6aFxGU5qB6YVT1XOSg8itj5kGB3PFFDpiBXysCeGlFtMmR12lBZLHkKsSa1MyIozU1Eek1XCDPRDUc3M2Y2pPsiP4stXX3QQvOHMGWXpYxf+rR2SgfP+NxOj6XxZPSzknnMeAgwjELacICsKK+hWiDjUQxWL6ezlFMzBH4s0gVPK1ZHom8C7ALA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733944626; c=relaxed/relaxed;
	bh=FHcC57ePqes+RYwXO+EjPnv9Ru8ETOOeSbHvI0QRToA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxJnMabbI0zedUK3++1krNKyIRaGBQ5K+PdElU4vuxcGTFBWYLZZ/xoTEB2udN1qKXA57RiveX5Fn4OQfVF0Bz99bdjvpk1GEzKnbbTYKbLfyQ1gg7/zAzOAc4Hr2mRbAo0slnigGNg0jsvfS7XY1Xjxlhs+xQHBC4P8vP2FEcXDmtW2/lZsIcnsxg4/XwHIMQagt4Stlv4Uz+yR4eJXRbTnE5U7UEKn9T0HTj67OAroGaBs9m5dRsqJSSjUYykrWqyKkLlDwYrQYJg/+sYmXlfnDCKGaHTe4BXWwmQcp7FVCtOXnJmlq3mZ5qzG7tBrNtEGHvct/HSCb6JfrQa3OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bBaTy5aq; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bBaTy5aq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7lhw3pkBz2yXm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 06:17:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 315705C5412;
	Wed, 11 Dec 2024 19:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF22C4CED2;
	Wed, 11 Dec 2024 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733944622;
	bh=JYtE/PzAOPqP/g9sqizspw7MFjU0tdkKLj4+8sLFF4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBaTy5aq36nH1Xxi7n47Yx9pPGGdhACrjS4YuC1UxYhmxrMztqr8DYIuiu/wspEES
	 hG0xUtK+XSAViDRh302aaRhzfLsS4yEoFvDD9RP3H58GDqMPxbkDV/ox9YPN/TRopB
	 M4ujBNnYB0TSVpdfmTHFYYFiBIvCVp1DYPMTREu9USZ2kG5Z8fC5S96mFZ1FgFVOAA
	 NlBPSYAWljJJGeOJLkkA0zpp87NALsXPOSRP2yVHr6TBohesu2QIYY/LvXDr48a/1D
	 A0zkKY0IjFMflg9Z29SLpL6oZkbo+xleTVyhQxoHzIFZONR6gCnnMhgaqRe5Rot1F8
	 8jGUDmA8Iz6AQ==
Date: Wed, 11 Dec 2024 11:17:00 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <Z1nlLM0JJqEwxRFx@google.com>
References: <20241205022305.158202-1-irogers@google.com>
 <Z1iUmVRzN0V3vMpG@x1>
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
In-Reply-To: <Z1iUmVRzN0V3vMpG@x1>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 10, 2024 at 04:20:57PM -0300, Arnaldo Carvalho de Melo wrote:
> On Wed, Dec 04, 2024 at 06:23:05PM -0800, Ian Rogers wrote:
> > The refactoring of tool PMU events to have a PMU then adding the expr
> > literals to the tool PMU made it so that the literal system_tsc_freq
> > was only supported on x86. Update the test expectations to match -
> > namely the parsing is x86 specific and only yields a non-zero value on
> > Intel.
> 
> Namhyung,
> 
> 	Since you see no more problems and Athira tested it, I think
> this should go via perf-tools, right?

Yep, will do.

Thanks,
Namhyung


