Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DF18CBF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:49:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kL9x0BR7zDrFP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 21:49:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kKrT4NfpzDrR9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 21:33:59 +1100 (AEDT)
IronPort-SDR: HgKbWDAoq0l/pNjoX29WVW8iOgQloiX8jL31HtCcNwjOoPziBPaVvdHqr0Jv75oFXiC2t/kxNS
 ZfnlFJckIq2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 03:33:57 -0700
IronPort-SDR: dvyOOwpm3ck0vNEcjFg0Ln9rtXpCUZTdZcp6iT/sMJoJaRldBYM8OWYnTUButP6k1/hcmEEsxM
 R4UhrSvV447g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="446612540"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 20 Mar 2020 03:33:50 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jFEyM-00BKoR-Uc; Fri, 20 Mar 2020 12:33:50 +0200
Date: Fri, 20 Mar 2020 12:33:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH v12 8/8] MAINTAINERS: perf: Add pattern that matches ppc
 perf to the perf entry.
Message-ID: <20200320103350.GV1922688@smile.fi.intel.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584699455.git.msuchanek@suse.de>
 <4b150d01c60bd37705789200d9adee9f1c9b50ce.1584699455.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b150d01c60bd37705789200d9adee9f1c9b50ce.1584699455.git.msuchanek@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 11:20:19AM +0100, Michal Suchanek wrote:
> While at it also simplify the existing perf patterns.
> 

And still missed fixes from parse-maintainers.pl.

I see it like below in the linux-next (after the script)

PERFORMANCE EVENTS SUBSYSTEM
M:      Peter Zijlstra <peterz@infradead.org>
M:      Ingo Molnar <mingo@redhat.com>
M:      Arnaldo Carvalho de Melo <acme@kernel.org>
R:      Mark Rutland <mark.rutland@arm.com>
R:      Alexander Shishkin <alexander.shishkin@linux.intel.com>
R:      Jiri Olsa <jolsa@redhat.com>
R:      Namhyung Kim <namhyung@kernel.org>
L:      linux-kernel@vger.kernel.org
S:      Supported
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
F:      arch/*/events/*
F:      arch/*/events/*/*
F:      arch/*/include/asm/perf_event.h
F:      arch/*/kernel/*/*/perf_event*.c
F:      arch/*/kernel/*/perf_event*.c
F:      arch/*/kernel/perf_callchain.c
F:      arch/*/kernel/perf_event*.c
F:      include/linux/perf_event.h
F:      include/uapi/linux/perf_event.h
F:      kernel/events/*
F:      tools/perf/

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13080,7 +13080,7 @@ R:	Namhyung Kim <namhyung@kernel.org>
>  L:	linux-kernel@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
>  S:	Supported
> -F:	kernel/events/*
> +F:	kernel/events/
>  F:	include/linux/perf_event.h
>  F:	include/uapi/linux/perf_event.h
>  F:	arch/*/kernel/perf_event*.c
> @@ -13088,8 +13088,8 @@ F:	arch/*/kernel/*/perf_event*.c
>  F:	arch/*/kernel/*/*/perf_event*.c
>  F:	arch/*/include/asm/perf_event.h
>  F:	arch/*/kernel/perf_callchain.c
> -F:	arch/*/events/*
> -F:	arch/*/events/*/*
> +F:	arch/*/events/
> +F:	arch/*/perf/
>  F:	tools/perf/
>  
>  PERFORMANCE EVENTS SUBSYSTEM ARM64 PMU EVENTS

-- 
With Best Regards,
Andy Shevchenko


