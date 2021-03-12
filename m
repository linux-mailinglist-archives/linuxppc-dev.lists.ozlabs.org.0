Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FE338E45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:06:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxmKC39wRz3fST
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L0rSbepW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hKGGJ57d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=L0rSbepW; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hKGGJ57d; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxm943TR9z3h8r
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:59:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615553941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eMDB4smPKXpj13VyYw6JScKxmvyMa7ikPfuNl9CjCjM=;
 b=L0rSbepWKSfOYp1hqRug4ew9LfMCg9WShL1X/JdpNgrmS2zUzGhSxSGmYQs4iDDz/F0i3N
 myHE38HGahfp4yxPi/4h880SVbidanqm+r46hlR4pgKG3uyecHZZrrvMq+ZqaMpog2n27M
 9P1J0iJFET2g/zmdqizLcvonYfuqMXM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615553942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eMDB4smPKXpj13VyYw6JScKxmvyMa7ikPfuNl9CjCjM=;
 b=hKGGJ57dBkBO7zwSOp8J/VyHFePIi3REHc2HlTKG6moCyoEb9EqihStF0cXbRNc5XOAp9f
 2jOU6HJe9kAC7jyU8iWCsqfISH72hTXuEe767WTkZnLjTisfSHF16QcmLEyORLyNnPpOmQ
 66zERum+oFoWmyAR1uDOoP/Px4if6Q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-CYeILR2XPRaZIlLezxAVSA-1; Fri, 12 Mar 2021 07:57:08 -0500
X-MC-Unique: CYeILR2XPRaZIlLezxAVSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1223E108BD06;
 Fri, 12 Mar 2021 12:57:07 +0000 (UTC)
Received: from krava (unknown [10.40.192.54])
 by smtp.corp.redhat.com (Postfix) with SMTP id 5A26410016FB;
 Fri, 12 Mar 2021 12:57:04 +0000 (UTC)
Date: Fri, 12 Mar 2021 13:57:03 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/4] tools/perf: Add dynamic headers for perf report
 columns
Message-ID: <YEtlHzsJ4z19pB/M@krava>
References: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1615298640-1529-3-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615298640-1529-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Tue, Mar 09, 2021 at 09:03:58AM -0500, Athira Rajeev wrote:
> Currently the header string for different columns in perf report
> is fixed. Some fields of perf sample could have different meaning
> for different architectures than the meaning conveyed by the header
> string. An example is the new field 'var2_w' of perf_sample_weight
> structure. This is presently captured as 'Local INSTR Latency' in
> perf mem report. But this could be used to denote a different latency
> cycle in another architecture.
> 
> Introduce a weak function arch_perf_header_entry__add() to set
> the arch specific header string for the fields which can contain dynamic
> header. If the architecture do not have this function, fall back to the
> default header string value.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/event.h |  1 +
>  tools/perf/util/sort.c  | 19 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
> index f603edbbbc6f..89b149e2e70a 100644
> --- a/tools/perf/util/event.h
> +++ b/tools/perf/util/event.h
> @@ -427,5 +427,6 @@ void  cpu_map_data__synthesize(struct perf_record_cpu_map_data *data, struct per
>  
>  void arch_perf_parse_sample_weight(struct perf_sample *data, const __u64 *array, u64 type);
>  void arch_perf_synthesize_sample_weight(const struct perf_sample *data, __u64 *array, u64 type);
> +const char *arch_perf_header_entry__add(const char *se_header);
>  
>  #endif /* __PERF_RECORD_H */
> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
> index 0d5ad42812b9..741a6df29fa0 100644
> --- a/tools/perf/util/sort.c
> +++ b/tools/perf/util/sort.c
> @@ -25,6 +25,7 @@
>  #include <traceevent/event-parse.h>
>  #include "mem-events.h"
>  #include "annotate.h"
> +#include "event.h"
>  #include "time-utils.h"
>  #include "cgroup.h"
>  #include "machine.h"
> @@ -45,6 +46,7 @@
>  regex_t		ignore_callees_regex;
>  int		have_ignore_callees = 0;
>  enum sort_mode	sort__mode = SORT_MODE__NORMAL;
> +const char	*dynamic_headers[] = {"local_ins_lat"};
>  
>  /*
>   * Replaces all occurrences of a char used with the:
> @@ -1816,6 +1818,16 @@ struct sort_dimension {
>  	int			taken;
>  };
>  
> +const char * __weak arch_perf_header_entry__add(const char *se_header)

no need for the __add suffix in here

jirka

> +{
> +	return se_header;
> +}
> +
> +static void sort_dimension_add_dynamic_header(struct sort_dimension *sd)
> +{
> +	sd->entry->se_header = arch_perf_header_entry__add(sd->entry->se_header);
> +}
> +
>  #define DIM(d, n, func) [d] = { .name = n, .entry = &(func) }
>  
>  static struct sort_dimension common_sort_dimensions[] = {
> @@ -2739,11 +2751,16 @@ int sort_dimension__add(struct perf_hpp_list *list, const char *tok,
>  			struct evlist *evlist,
>  			int level)
>  {
> -	unsigned int i;
> +	unsigned int i, j;
>  
>  	for (i = 0; i < ARRAY_SIZE(common_sort_dimensions); i++) {
>  		struct sort_dimension *sd = &common_sort_dimensions[i];
>  
> +		for (j = 0; j < ARRAY_SIZE(dynamic_headers); j++) {
> +			if (!strcmp(dynamic_headers[j], sd->name))
> +				sort_dimension_add_dynamic_header(sd);
> +		}
> +
>  		if (strncasecmp(tok, sd->name, strlen(tok)))
>  			continue;
>  
> -- 
> 1.8.3.1
> 

