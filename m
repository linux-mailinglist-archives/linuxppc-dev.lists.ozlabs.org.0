Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35D5135C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 15:53:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpxsL1pHRz3bck
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 23:53:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eAQ2tkW+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eAQ2tkW+; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpxrh1dxTz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 23:52:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B22C61C9A;
 Thu, 28 Apr 2022 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5544CC385A9;
 Thu, 28 Apr 2022 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651153951;
 bh=ODsMq+Ft6dlX/IlXg4fQJ5/+B9MFbJhJJW4Q4ktgLxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eAQ2tkW+noTloQZoa3bawPAwbQnElGK0hQb/COxBVytIy6TX2Ejj95XwXO+nGKI4V
 a35LPeQNI3AIi+uz4Y2X02zHmwACwr/q+20eHNrLBfNE34fNxJ2KeHgsln3ygah9pt
 vhlJAX11NIXY1yVt0UyfYUE9G4vJ9G1RSxC1sCkzDZuGtWCJji9+r52pOdC0Mijy9S
 dzOH2OrF9bf3tm5tZARzRxaFs1rhiUgKa5f2T/po64gaLVpRdYVu+nYCGECuapIQbR
 M8KBuFnmaSCBXBMpURObGEofM5FOAzBsH3evsgzBAR7rnlFndWKvQOtFKy9+0mykuQ
 Lq6lRBWsKXJFA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id D0F09400B1; Thu, 28 Apr 2022 10:52:28 -0300 (-03)
Date: Thu, 28 Apr 2022 10:52:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH 0/3] perf tools: Tidy up symbol end fixup (v3)
Message-ID: <YmqcHFtVTfvCCbTW@kernel.org>
References: <20220416004048.1514900-1-namhyung@kernel.org>
 <CAP-5=fUUeqimTKoO9PQbm4yDWXZtTqxWm9ZAsNt1=K5N1Rq_Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fUUeqimTKoO9PQbm4yDWXZtTqxWm9ZAsNt1=K5N1Rq_Lg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, linuxppc-dev@lists.ozlabs.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Michael Petlan <mpetlan@redhat.com>, Will Deacon <will@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Leo Yan <leo.yan@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Apr 25, 2022 at 01:59:03PM -0700, Ian Rogers escreveu:
> On Fri, Apr 15, 2022 at 5:40 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > Hello,
> >
> > This work is a follow-up of Ian's previous one at
> >   https://lore.kernel.org/all/20220412154817.2728324-1-irogers@google.com/
> >
> > Fixing up more symbol ends as introduced in:
> >   https://lore.kernel.org/lkml/20220317135536.805-1-mpetlan@redhat.com/
> >
> > it caused perf annotate to run into memory limits - every symbol holds
> > all the disassembled code in the annotation, and so making symbols
> > ends further away dramatically increased memory usage (40MB to >1GB).
> >
> > Modify the symbol end fixup logic so that special kernel cases aren't
> > applied in the common case.
> >
> > v3 changes)
> >  * rename is_kernel to is_kallsyms
> >  * move the logic to generic function
> >  * remove arch-specific functions
> >
> > Thanks,
> > Namhyung
> 
> Thanks Namhyung! The series:
> 
> Acked-by: Ian Rogers <irogers@google.com>

Thanks, applied to perf/urgent.

- Arnaldo

 
> > Namhyung Kim (3):
> >   perf symbol: Pass is_kallsyms to symbols__fixup_end()
> >   perf symbol: Update symbols__fixup_end()
> >   perf symbol: Remove arch__symbols__fixup_end()
> >
> >  tools/perf/arch/arm64/util/machine.c   | 21 ---------------
> >  tools/perf/arch/powerpc/util/Build     |  1 -
> >  tools/perf/arch/powerpc/util/machine.c | 25 -----------------
> >  tools/perf/arch/s390/util/machine.c    | 16 -----------
> >  tools/perf/util/symbol-elf.c           |  2 +-
> >  tools/perf/util/symbol.c               | 37 +++++++++++++++++++-------
> >  tools/perf/util/symbol.h               |  3 +--
> >  7 files changed, 29 insertions(+), 76 deletions(-)
> >  delete mode 100644 tools/perf/arch/powerpc/util/machine.c
> >
> >
> > base-commit: 41204da4c16071be9090940b18f566832d46becc
> > --
> > 2.36.0.rc0.470.gd361397f0d-goog
> >

-- 

- Arnaldo
