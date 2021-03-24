Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C302348221
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 20:46:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5JdD1KkGz3brw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 06:46:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fcl63NbL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fDA9pfyV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fcl63NbL; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fDA9pfyV; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5Jcl493kz30Bp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 06:45:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616615136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=71BnMFS9rn8SPVKmnpmhBKFC1i10nRCVkAwJRE2/qiI=;
 b=fcl63NbLaF9WNx44G7od4SxMzLZDAqbfbyg2+FdyXDGO9OBwR8iaW7wSAa3KOP6JMVrFtQ
 /CoSeMdKSGOp+6+5I6GNb21dQgKGravOgnTWfkol+jtcrp5Re4N2gyrpKXuEYn9qdNs+Gm
 iteuPIFO3ntqRgdwKsRsVlf5LxjF6B4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616615137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=71BnMFS9rn8SPVKmnpmhBKFC1i10nRCVkAwJRE2/qiI=;
 b=fDA9pfyVyeS1YXGwTbRRWsULuDjkU9PUq1HiW7RCf5q7avwaRTZt74n7YuhsVTJTa7Y4pI
 Cv/A9bAFNOy+xdICLRrZ3ytfz4eDX7wVosbQCqplCJXKkzuhj4QcxfztymiJDUqccVrmso
 8xm8Tqdk8Ae7lWIFTOOpPgfggUPvk6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-9ef1xfLNNA2T-RmkDksVBg-1; Wed, 24 Mar 2021 15:43:49 -0400
X-MC-Unique: 9ef1xfLNNA2T-RmkDksVBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1C21922037;
 Wed, 24 Mar 2021 19:43:47 +0000 (UTC)
Received: from krava (unknown [10.40.196.25])
 by smtp.corp.redhat.com (Postfix) with SMTP id A716262677;
 Wed, 24 Mar 2021 19:43:44 +0000 (UTC)
Date: Wed, 24 Mar 2021 20:43:43 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 3/5] tools/perf: Add powerpc support for
 PERF_SAMPLE_WEIGHT_STRUCT
Message-ID: <YFuWb3S8p0ZGjmGu@krava>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-4-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616425047-1666-4-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.ibm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 22, 2021 at 10:57:25AM -0400, Athira Rajeev wrote:
> Add arch specific arch_evsel__set_sample_weight() to set the new
> sample type for powerpc.
> 
> Add arch specific arch_perf_parse_sample_weight() to store the
> sample->weight values depending on the sample type applied.
> if the new sample type (PERF_SAMPLE_WEIGHT_STRUCT) is applied,
> store only the lower 32 bits to sample->weight. If sample type
> is 'PERF_SAMPLE_WEIGHT', store the full 64-bit to sample->weight.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/arch/powerpc/util/Build   |  2 ++
>  tools/perf/arch/powerpc/util/event.c | 32 ++++++++++++++++++++++++++++++++
>  tools/perf/arch/powerpc/util/evsel.c |  8 ++++++++
>  3 files changed, 42 insertions(+)
>  create mode 100644 tools/perf/arch/powerpc/util/event.c
>  create mode 100644 tools/perf/arch/powerpc/util/evsel.c
> 
> diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
> index b7945e5a543b..8a79c4126e5b 100644
> --- a/tools/perf/arch/powerpc/util/Build
> +++ b/tools/perf/arch/powerpc/util/Build
> @@ -4,6 +4,8 @@ perf-y += kvm-stat.o
>  perf-y += perf_regs.o
>  perf-y += mem-events.o
>  perf-y += sym-handling.o
> +perf-y += evsel.o
> +perf-y += event.o
>  
>  perf-$(CONFIG_DWARF) += dwarf-regs.o
>  perf-$(CONFIG_DWARF) += skip-callchain-idx.o
> diff --git a/tools/perf/arch/powerpc/util/event.c b/tools/perf/arch/powerpc/util/event.c
> new file mode 100644
> index 000000000000..f49d32c2c8ae
> --- /dev/null
> +++ b/tools/perf/arch/powerpc/util/event.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/types.h>
> +#include <linux/string.h>
> +#include <linux/zalloc.h>
> +
> +#include "../../../util/event.h"
> +#include "../../../util/synthetic-events.h"
> +#include "../../../util/machine.h"
> +#include "../../../util/tool.h"
> +#include "../../../util/map.h"
> +#include "../../../util/debug.h"

nit, just #include "utils/...h" should work no?

other than that, the patchset looks ok to me

Acked-by: Jiri Olsa <jolsa@redhat.com>

thanks,
jirka

> +
> +void arch_perf_parse_sample_weight(struct perf_sample *data,
> +				   const __u64 *array, u64 type)
> +{
> +	union perf_sample_weight weight;
> +
> +	weight.full = *array;
> +	if (type & PERF_SAMPLE_WEIGHT)
> +		data->weight = weight.full;
> +	else
> +		data->weight = weight.var1_dw;
> +}
> +
> +void arch_perf_synthesize_sample_weight(const struct perf_sample *data,
> +					__u64 *array, u64 type)
> +{
> +	*array = data->weight;
> +
> +	if (type & PERF_SAMPLE_WEIGHT_STRUCT)
> +		*array &= 0xffffffff;
> +}
> diff --git a/tools/perf/arch/powerpc/util/evsel.c b/tools/perf/arch/powerpc/util/evsel.c
> new file mode 100644
> index 000000000000..2f733cdc8dbb
> --- /dev/null
> +++ b/tools/perf/arch/powerpc/util/evsel.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <stdio.h>
> +#include "util/evsel.h"
> +
> +void arch_evsel__set_sample_weight(struct evsel *evsel)
> +{
> +	evsel__set_sample_bit(evsel, WEIGHT_STRUCT);
> +}
> -- 
> 1.8.3.1
> 

