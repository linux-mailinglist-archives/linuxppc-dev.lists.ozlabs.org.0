Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0264A453
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 16:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NW5Rv36pZz3bk8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 02:40:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PutqhPvX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PutqhPvX;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NW5Qw4vQxz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 02:39:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD583B80B68;
	Mon, 12 Dec 2022 15:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB1AC433D2;
	Mon, 12 Dec 2022 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670859571;
	bh=bsRSnz3UJl2WZo1q75Npf56ZTEBh+RSUlsfyNp3xyvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PutqhPvXI160Ms7WYR5j2pKKqADTVzjLRVBNtyDPdjrLC5BP+9TuFbsq/elWL445Y
	 hoMwTkEITaxBCxaxpo7PaN/YfLx38WdnqSKxgsHUNwpgnClj+68oyzMd0q/67N9D7m
	 MoSAMj6Ym+na0wl51KqLwFK4J8XW/LiR97wjgtQgLHRjJZQYVB6sS09a7etgtNO76l
	 g5WLhPGw/zf2HPUhDorpN9fD/epnabiH1Hzd1WQ7ZwKQQbA6Fjs5imjkDI90+KbVfb
	 ODt8CUuiXbtNaCmvEAJQUZJ3fB55sA7pXKg/zs0Ko7BWeUaR4VvD3z2s+8MzzB17O5
	 5QgYdg+EQg6jw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id B302740483; Mon, 12 Dec 2022 12:39:28 -0300 (-03)
Date: Mon, 12 Dec 2022 12:39:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] perf test: Update event group check for support of
 uncore event
Message-ID: <Y5dLME8rr1YIfyQe@kernel.org>
References: <20221207165815.774-1-atrajeev@linux.vnet.ibm.com>
 <9c0ade1e-1c7b-90f5-0385-a568545567db@amd.com>
 <3C59F3E6-B7DE-485B-9483-703EBDE9AC41@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3C59F3E6-B7DE-485B-9483-703EBDE9AC41@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, linux-perf-users@vger.kernel.org, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Dec 09, 2022 at 12:57:34PM +0530, Athira Rajeev escreveu:
> 
> 
> > On 08-Dec-2022, at 9:48 AM, Ravi Bangoria <ravi.bangoria@amd.com> wrote:
> > 
> > On 07-Dec-22 10:28 PM, Athira Rajeev wrote:
> >> Event group test checks group creation for combinations of
> >> hw, sw and uncore PMU events. Some of the uncore pmus may
> >> require additional permission to access the counters.
> >> For example, in case of hv_24x7, partition need to have
> >> permissions to access hv_24x7 pmu counters. If not, event_open
> >> will fail. Hence add a sanity check to see if event_open
> >> succeeds before proceeding with the test.
> >> 
> >> Fixes: b20d9215a35f ("perf test: Add event group test for events in multiple PMUs")
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > 
> > Acked-by: Ravi Bangoria <ravi.bangoria@amd.com>
> 
> Thanks Ravi for checking the patch

Thanks, applied.

- Arnaldo

