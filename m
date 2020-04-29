Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772F1BE1BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:53:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C1jS2GBPzDrB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 00:53:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=joG3GSna; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C1Yp2YyPzDr9K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 00:46:53 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id l78so2188340qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uegLoaGJrRXIo3UvM2TnGR4muRuT5O7FyR/8C1ZUKP8=;
 b=joG3GSnaYBRZhQbM/qg0tvQ7SRIXV9GktxzsWx7uXY1s4sG+Ivfjy5AOx1iypz2Au+
 dqmvvUt7BtBVODy/ne9bgiKNGhFXRiQO/u3FFGljz9llwgiuxDIrb3LMfVsw6AujxdKx
 e3f4eYHt8Se4O7j4JPsfZTJ3b5bhv9YBXME4gRH+NnJAhOsW6PqnuaXnTF+ubhkISOKt
 KT9Qc+7dyHqm3y4TzW15vo3OggYUbs7LlMAYJXVkPwhhe/jJlOR0HZmLocoM5Goyqile
 0sBz/Q1q/gEeehlat8p1V8DeQ2tcVJOvY4yemRrxVYU4D6Yd/OvFeVj+pphtJsgfClYH
 Wxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uegLoaGJrRXIo3UvM2TnGR4muRuT5O7FyR/8C1ZUKP8=;
 b=Yey6T773/1bw6YzyQrGVKU8n5fjSKFOuEp+LOH8r3U5zKEFQ7wprveYX+6s2IffeBm
 oslEmTHUYp4Ga/W8XlT+6ShRLZUJn8hasDup2fXyqvEl6Djo+UIxW7DBfczRd40isWHF
 FLgz/npxthPx0UPa8px0cb0lPk+8l/qu8pMBtD/d2BgrScI7H2K6Uuy9lkyQK3QIvp4x
 wvt2zHHtnS2BapxUxwA9YMo5lLu5E1mddytQh5YWEHvebesefelbt7+jf5SGhOYTVywW
 vDilGG/3jSItDbToxAzAfXzSspmUBGyIG865TF7xpg3PcS8bdYAfpefR+VooH7NwCLOy
 QeOw==
X-Gm-Message-State: AGi0PuZNBwQWGVvApFxeTpTgK1YcPLvf96KOG8miu3A362rFvhxhkRXS
 KAmjqfCLaxg2JSe2G8zu6ao=
X-Google-Smtp-Source: APiQypK4xvPE45TMp0rjKQvGGJpTzCdvm8/pjG6I2mVlZgh0fUpBCdyNGFiXlKrv//AOMIGfYLloow==
X-Received: by 2002:a37:5143:: with SMTP id f64mr16629748qkb.155.1588171609206; 
 Wed, 29 Apr 2020 07:46:49 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([179.97.37.151])
 by smtp.gmail.com with ESMTPSA id o27sm15860313qko.71.2020.04.29.07.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 07:46:48 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 0DC14409A3; Wed, 29 Apr 2020 11:46:46 -0300 (-03)
Date: Wed, 29 Apr 2020 11:46:46 -0300
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH v8 0/7] powerpc/perf: Add json file metric support for
 the hv_24x7 socket/chip level events
Message-ID: <20200429144646.GA30487@kernel.org>
References: <20200401203340.31402-1-kjain@linux.ibm.com>
 <fa31bc42-d34c-c788-0109-350d769b51ce@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa31bc42-d34c-c788-0109-350d769b51ce@linux.ibm.com>
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Apr 28, 2020 at 12:02:42PM +0530, kajoljain escreveu:
> Hi Arnaldo,
> 	Please let me know if there any changes required in this patchset,
> as some of its patches are still not part of your perf/core tree.

Thanks, I checked and all seems ok, added Jiri's Acked-by, appreciated,
thanks,

- Arnaldo
 
> Thanks,
> Kajol Jain
> 
> On 4/2/20 2:03 AM, Kajol Jain wrote:
> > Patchset adds json file metric support for the hv_24x7 socket/chip level
> > events. "hv_24x7" pmu interface events needs system dependent parameter
> > like socket/chip/core. For example, hv_24x7 chip level events needs
> > specific chip-id to which the data is requested should be added as part
> > of pmu events.
> > 
> > So to enable JSON file support to "hv_24x7" interface, patchset reads
> > total number of sockets details in sysfs under 
> > "/sys/devices/hv_24x7/interface/".
> > 
> > Second patch of the patchset adds expr_scanner_ctx object to hold user
> > data for the expr scanner, which can be used to hold runtime parameter.
> > 
> > Patch 4 & 6 of the patchset handles perf tool plumbing needed to replace
> > the "?" character in the metric expression to proper value and hv_24x7
> > json metric file for different Socket/chip resources.
> > 
> > Patch set also enable Hz/hz prinitg for --metric-only option to print
> > metric data for bus frequency.
> > 
> > Applied and tested all these patches cleanly on top of jiri's flex changes
> > with the changes done by Kan Liang for "Support metric group constraint"
> > patchset and made required changes.
> > 
> > Also apply this patch on top of the fix patch send earlier
> > for printing metric name incase overlapping events.
> > https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=37cd7f65bf71a48f25eeb6d9be5dacb20d008ea6
> > 
> > Changelog:
> > v7 -> v8
> > - Add test case for testing parsing of "?" in metric expression
> > - Reaname variables name to runtime
> > 
> > v6 -> v7
> > - Spit patchset into two patch series one for kernel changes and other
> >   for tool side changes.
> > - Made changes Suggested by Jiri, including rather then reading runtime
> >   parameter from metric name, actually add it in structure egroup and
> >   metric_expr.
> > - As we don't need to read runtime parameter from metric name,
> >   now I am not appending it and rather just printing it in
> >   generic_metric function.
> > 
> > Kernel Side changes patch series: https://lkml.org/lkml/2020/3/27/58
> > 
> > v5 -> v6
> > - resolve compilation issue due to rearranging patch series.
> > - Rather then adding new function to take careof case for runtime param
> >   in metricgroup__add_metric, using metricgroup__add_metric_param itself
> >   for that work.
> > - Address some optimization suggested like using directly file path
> >   rather then adding new macro in header.c
> > - Change commit message on patch where we are adding "?" support
> >   by adding simple example.
> > 
> > v4 -> v5
> > - Using sysfs__read_int instead of sysfs__read_ull while reading
> >   parameter value in powerpc/util/header.c file.
> > 
> > - Using asprintf rather then malloc and sprintf 
> >   Suggested by Arnaldo Carvalho de Melo
> > 
> > - Break patch 6 from previous version to two patch,
> >   - One to add refactor current "metricgroup__add_metric" function
> >     and another where actually "?" handling infra added.
> > 
> > - Add expr__runtimeparam as part of 'expr_scanner_ctx' struct
> >   rather then making it global variable. Thanks Jiri for
> >   adding this structure to hold user data for the expr scanner.
> > 
> > - Add runtime param as agrugement to function 'expr__find_other'
> >   and 'expr__parse' and made changes on references accordingly.
> > 
> > v3 -> v4
> > - Apply these patch on top of Kan liang changes.
> >   As suggested by Jiri.
> > 
> > v2 -> v3
> > - Remove setting  event_count to 0 part in function 'h_24x7_event_read'
> >   with comment rather then adding 0 to event_count value.
> >   Suggested by: Sukadev Bhattiprolu
> > 
> > - Apply tool side changes require to replace "?" on Jiri's flex patch
> >   series and made all require changes to make it compatible with added
> >   flex change.
> > 
> > v1 -> v2
> > - Rename hv-24x7 metric json file as nest_metrics.json
> > 
> > Jiri Olsa (2):
> >   perf expr: Add expr_ prefix for parse_ctx and parse_id
> >   perf expr: Add expr_scanner_ctx object
> > 
> > Kajol Jain (5):
> >   perf/tools: Refactoring metricgroup__add_metric function
> >   perf/tools: Enhance JSON/metric infrastructure to handle "?"
> >   perf/tests/expr: Added test for runtime param in metric expression
> >   tools/perf: Enable Hz/hz prinitg for --metric-only option
> >   perf/tools/pmu-events/powerpc: Add hv_24x7 socket/chip level metric
> >     events
> > 
> >  tools/perf/arch/powerpc/util/header.c         |  8 ++
> >  .../arch/powerpc/power9/nest_metrics.json     | 19 +++++
> >  tools/perf/tests/expr.c                       | 20 +++--
> >  tools/perf/util/expr.c                        | 25 +++---
> >  tools/perf/util/expr.h                        | 19 +++--
> >  tools/perf/util/expr.l                        | 37 ++++++---
> >  tools/perf/util/expr.y                        |  6 +-
> >  tools/perf/util/metricgroup.c                 | 78 +++++++++++++------
> >  tools/perf/util/metricgroup.h                 |  2 +
> >  tools/perf/util/stat-display.c                |  2 -
> >  tools/perf/util/stat-shadow.c                 | 19 +++--
> >  11 files changed, 164 insertions(+), 71 deletions(-)
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power9/nest_metrics.json
> > 

-- 

- Arnaldo
