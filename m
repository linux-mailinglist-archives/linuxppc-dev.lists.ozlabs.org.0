Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D314C5F491C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 20:15:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhm8V0QDSz3bhv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 05:15:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jH3DB9eL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jH3DB9eL;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhm7Z5JM3z2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 05:14:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 95B5BB81B7A;
	Tue,  4 Oct 2022 18:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32603C433D6;
	Tue,  4 Oct 2022 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664907270;
	bh=jclFgCrFUBn52qvUWEPs5SL9Ek1Ns+2EbUXKGu56P5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jH3DB9eLjbBMsr8xuoLQUMS4XpT9bSi47/jFb/UHoeBrHxHkcLIFJj4qaGZRS0bmm
	 mudXMvdEp0MbWERQNjHPsxAIIp5esA4gbONuN/VzVGuJfN1HP6QrvGeaV9gM3dfgGJ
	 UE13UfjPIjIQrWUJ7CQGuDEDkZ4kZ1HVO8laxikUb0aD4sO/KfDK/2Qc5UZxWW+hN7
	 krchhsplTYUBSJotrVEM9cvVfclB8oD6lLbWsFyMQSuPJSw4Mxckg0eR+fymJ/L4qG
	 T9rX5q5rMvOvw/F9s+x2ZcUMBrmyfPYFZ7vqwO9XNzXZ6sHCnV+meeSNQ90gBnM7as
	 1RKBf3vl1QCCw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id F16114062C; Tue,  4 Oct 2022 15:14:27 -0300 (-03)
Date: Tue, 4 Oct 2022 15:14:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
Message-ID: <Yzx4A+2I4yWTlbEn@kernel.org>
References: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
 <4792ef3a-8790-a0d4-50f2-4917874d81d6@arm.com>
 <82D5587E-593A-43A7-92D7-7E095E2BE9A9@linux.vnet.ibm.com>
 <6627ae9a-91e3-0923-1234-54e0fc3f4916@arm.com>
 <CAP-5=fVBzLfhfwPjxE_9DNeesPaPxf3k0b5T5S6THzB1H85mrA@mail.gmail.com>
 <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
 <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
 <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
 <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, atrajeev <atrajeev@imap.linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Oct 04, 2022 at 07:49:21AM -0700, Ian Rogers escreveu:
> On Tue, Oct 4, 2022, 12:06 AM Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > Thanks for helping with testing. Can I add your Tested-by for the patch ?
 
> Yep.
 
> Tested-by: Ian Rogers <irogers@google.com>
 
> Thanks,
> Ian
