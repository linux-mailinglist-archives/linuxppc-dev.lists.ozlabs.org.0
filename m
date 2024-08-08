Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D294C4C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 20:45:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noIGMSXT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfwvg2qmnz2xmh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 04:45:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noIGMSXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfwv128fkz2xfq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 04:44:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35F0B61599;
	Thu,  8 Aug 2024 18:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B939C32782;
	Thu,  8 Aug 2024 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723142667;
	bh=yBncEqq2sXHui7DWw9Ittf1PXvuGN/iNU/JonnHljMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noIGMSXT7Cvt5hAE7vaVJP0P1JaaPtBDQ+rGBNcM16SDg3OK3291zy0SG8KV8mw+t
	 Acb3eIoVrJ1pshi2YtoOMIquTa6bARoB/vKi+1LNa+8OdcpY2I+zKFLt9VG21U0mqa
	 tAYi0OQcKlcKbQyAQ9GoqPsov+PsJ4e0fKGCQ2Z4KItPyAtu6O8gj049NzMJFmwOhW
	 EEYbZIOpaMmRy+9x7oz0fNdjiNtR9KL7LWoet3JWYXV4sjTlHSAE/tCKqqTQfoiND2
	 TLXIzC4sfB8w1bW11sWeURtvmDu+daDOVDcr5fHsarjZ4pMF92CdZ0FqRneLIhfHO2
	 eblAmXk0gRORA==
Date: Thu, 8 Aug 2024 11:44:24 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCHSET 00/10] perf tools: Sync tools and kernel headers for
 v6.11
Message-ID: <ZrUSCFLWDg9iJ_23@google.com>
References: <20240806225013.126130-1-namhyung@kernel.org>
 <ZrO5HR9x2xyPKttx@google.com>
 <F3C6DE61-8E10-4814-A6C0-C7569B3FD613@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F3C6DE61-8E10-4814-A6C0-C7569B3FD613@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Kajol Jain <kjain@linux.ibm.com>, James Clark <james.clark@linaro.org>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Aug 08, 2024 at 12:14:12PM +0530, Athira Rajeev wrote:
> 
> 
> > On 7 Aug 2024, at 11:42 PM, Namhyung Kim <namhyung@kernel.org> wrote:
> > 
> > Hello folks,
> > 
> > On Tue, Aug 06, 2024 at 03:50:03PM -0700, Namhyung Kim wrote:
> >> Hello,
> >> 
> >> This is the usual sync up in header files we keep in tools directory.
> >> I put a file to give the reason of this work and not to repeat it in
> >> every commit message.  The changes will be carried in the perf-tools
> >> tree.
> > 
> > Could you please double check what's in the tmp.perf-tools branch at the
> > perf-tools tree so I don't break build and perf trace for arm64, powerpc
> > and s390?  It has this patchset + arm64 unistd header revert (according
> > to the discussion on patch 6/10) on top of v6.11-rc2.
> > 
> > Thanks,
> > Namhyung
> Hi Namhyung,
> 
> Can you please point to the tree. I checked in https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git as well as https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git , but didn’t find the changes. May be I am missing something. I am trying to check the build in powerpc.

Oh, sorry about that.  It's in:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git

(no -next at the end)

Thanks,
Namhyung

