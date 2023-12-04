Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60DC803EE6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 21:01:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NkN+KIYE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkZLR1wXkz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 07:01:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NkN+KIYE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkZKZ2kNhz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 07:00:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C9F5DB811BE;
	Mon,  4 Dec 2023 20:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E37C433C8;
	Mon,  4 Dec 2023 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701720043;
	bh=wl30XAUkpa2pw6wKx+oaNQPx6pqNHEJ1mH0tMi3TDP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkN+KIYEfqZlby3k70htcyJEW+wz3qRaaIIG/9jFqO/IQK6UBjEh5OiAEYxNOr7+1
	 ZC7aESnNoYL3tQYhztlBDKSX3/tUk/iRmddx3uQD5cxctWI4mU/ynLndvIlCXowxZp
	 Yul0nHP82EEnsleheDPujc4YDH7RKoI8jI6D0n9Z1lTKlgD2+Zpm8tbd4QxbZ3F/H3
	 dnEQ0FXzUSH7dHHHhTY3y3fBPv6Lyyud0pC8dZLJy6mObyBUMgAPIDfVz/RMAuH8OT
	 VKyhupE1fd1YZqhPjkEqR9ju/RDS9XV02lDVrrC0Iw8/QP5pJC3kJ4hLnH784QLde7
	 7kvTmaUNPe07A==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 5B20040094; Mon,  4 Dec 2023 17:00:40 -0300 (-03)
Date: Mon, 4 Dec 2023 17:00:40 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] perf vendor events: Update datasource event name to fix
 duplicate events
Message-ID: <ZW4v6OpQKGC7bHi2@kernel.org>
References: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
 <92bbba90-c7e4-43de-98dc-497ca323eacc@linux.ibm.com>
 <5293CFEC-6578-477B-86C2-40A50EBA144B@linux.vnet.ibm.com>
 <87E3CA3F-77D0-4A99-8575-C85544D207E1@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87E3CA3F-77D0-4A99-8575-C85544D207E1@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Sun, Dec 03, 2023 at 09:27:25PM +0530, Athira Rajeev escreveu:
> > On 29-Nov-2023, at 10:51 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> >> On 27-Nov-2023, at 5:32 PM, Disha Goel <disgoel@linux.ibm.com> wrote:
> >>> Fixes: fc1435807533 ("perf vendor events power10: Update JSON/events")
> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

> >> I have tested the patch on Power10 machine. Perf list works correctly without any segfault now.

> >> # ./perf list

> >> List of pre-defined events (to be used in -e or -M):

> >>  branch-instructions OR branches                    [Hardware event]
> >>  branch-misses                                      [Hardware event]

> >> Tested-by: Disha Goel <disgoel@linux.ibm.com>

> > Thanks Disha for testing

> Hi Arnaldo,
 
> Can we get this pulled in if the patch looks good ?

Thanks, applied to perf-tools-next.

- Arnaldo

