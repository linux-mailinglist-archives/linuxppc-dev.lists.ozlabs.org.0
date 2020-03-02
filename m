Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CA0176275
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 19:23:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WT6T0zQ7zDqXW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 05:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RdTDjpm7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WSzY6bY8zDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 05:17:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583173046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fPKPYyNpDnqAVBKIrF12LFsdNoQG0+cDCDMMSa5vHXw=;
 b=RdTDjpm7d++gXqkp11+txykl42MUnZpCp9OrpdTH0PUz+KyXm6RtIeaDONR8upn61/O+GC
 MGZpApUWm4vaMEfxPaHYkYOZ4X6V5JnOajpwVqWRJjyxi3bRsP3o3JwPvNk2VPQtR1lRWO
 iImoM4fPQzAwZxigOwFuFHb01uS3Uvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-CxihSTk0Ow6aP3RruQn1qw-1; Mon, 02 Mar 2020 10:09:01 -0500
X-MC-Unique: CxihSTk0Ow6aP3RruQn1qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D488017DF;
 Mon,  2 Mar 2020 15:08:57 +0000 (UTC)
Received: from krava (ovpn-205-46.brq.redhat.com [10.40.205.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 125FC5C1B0;
 Mon,  2 Mar 2020 15:08:49 +0000 (UTC)
Date: Mon, 2 Mar 2020 16:08:47 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v3 6/8] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Message-ID: <20200302150847.GB259142@krava>
References: <20200229094159.25573-1-kjain@linux.ibm.com>
 <20200229094159.25573-7-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200229094159.25573-7-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, acme@kernel.org,
 jmario@redhat.com, namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 29, 2020 at 03:11:57PM +0530, Kajol Jain wrote:

SNIP

> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
> index 02aee946b6c1..f629828cc0de 100644
> --- a/tools/perf/util/metricgroup.c
> +++ b/tools/perf/util/metricgroup.c
> @@ -399,6 +399,11 @@ void metricgroup__print(bool metrics, bool metricgroups, char *filter,
>  	strlist__delete(metriclist);
>  }
>  
> +int __weak arch_get_runtimeparam(void)
> +{
> +	return 1;
> +}
> +
>  static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>  				   struct list_head *group_list)
>  {
> @@ -419,52 +424,77 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>  			continue;
>  		if (match_metric(pe->metric_group, metric) ||
>  		    match_metric(pe->metric_name, metric)) {
> -			const char **ids;
> -			int idnum;
> -			struct egroup *eg;
> -			bool no_group = false;
> +			int k, count;

two things in here.. there's already ack-ed patchset from Kan Liang:
  Support metric group constraint
    >[PATCH V2 2/5] perf metricgroup: Factor out metricgroup__add_metric_weak_group()

that's changing this place, so you might want to synchronize with that


> +
> +			if (strstr(pe->metric_expr, "?"))
> +				count = arch_get_runtimeparam();
> +			else
> +				count = 1;
> +
> +			/* This loop is added to create multiple
> +			 * events depend on count value and add
> +			 * those events to group_list.
> +			 */
> +			for (k = 0; k < count; k++) {
> +				const char **ids;
> +				int idnum;
> +				struct egroup *eg;
> +				bool no_group = false;
> +				char value[PATH_MAX];
> +
> +				pr_debug("metric expr %s for %s\n",
> +					 pe->metric_expr, pe->metric_name);
> +				expr__runtimeparam = k;

the other thing is that I don't really follow what's going on in here

you're setting expr__runtimeparam to the loop index,
which you get from some arch related file

we should do this in arch-specific way.. I think that Kan's change is
already moving some bits into separate function and that should make
all this more readable, but perhaps we might need more, so all the
'repeating' code will be in a function

please either separate this to arch code, or make it understandable
for people from other archs ;-)

jirka

> +				if (expr__find_other(pe->metric_expr, NULL,
> +						     &ids, &idnum) < 0)
> +					continue;
> +				if (events->len > 0)
> +					strbuf_addf(events, ",");
> +				for (j = 0; j < idnum; j++) {
> +					pr_debug("found event %s\n", ids[j]);
> +					/*
> +					 * Duration time maps to a software
> +					 * event and can make groups not count.
> +					 * Always use it outside a group.
> +					 */
> +					if (!strcmp(ids[j], "duration_time")) {
> +						if (j > 0)
> +							strbuf_addf(events,
> +								    "}:W,");
> +						strbuf_addf(events,
> +							    "duration_time");
> +						no_group = true;
> +						continue;
> +					}
> +					strbuf_addf(events, "%s%s",
> +						    j == 0 || no_group ? "{" :
> +						    ",", ids[j]);
> +					no_group = false;
> +				}
> +				if (!no_group)
> +					strbuf_addf(events, "}:W");
>  
> -			pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
> +				eg = malloc(sizeof(struct egroup));
> +				if (!eg) {
> +					ret = -ENOMEM;
> +					break;
> +				}
> +				eg->ids = ids;
> +				eg->idnum = idnum;
>  
> -			if (expr__find_other(pe->metric_expr,
> -					     NULL, &ids, &idnum) < 0)
> -				continue;
> -			if (events->len > 0)
> -				strbuf_addf(events, ",");
> -			for (j = 0; j < idnum; j++) {
> -				pr_debug("found event %s\n", ids[j]);
> -				/*
> -				 * Duration time maps to a software event and can make
> -				 * groups not count. Always use it outside a
> -				 * group.
> -				 */
> -				if (!strcmp(ids[j], "duration_time")) {
> -					if (j > 0)
> -						strbuf_addf(events, "}:W,");
> -					strbuf_addf(events, "duration_time");
> -					no_group = true;
> -					continue;
> +				if (strstr(pe->metric_expr, "?")) {
> +					sprintf(value, "%s%c%d",
> +						pe->metric_name, '_', k);
> +				} else {
> +					strcpy(value, pe->metric_name);
>  				}
> -				strbuf_addf(events, "%s%s",
> -					j == 0 || no_group ? "{" : ",",
> -					ids[j]);
> -				no_group = false;
> -			}
> -			if (!no_group)
> -				strbuf_addf(events, "}:W");
>  
> -			eg = malloc(sizeof(struct egroup));
> -			if (!eg) {
> -				ret = -ENOMEM;
> -				break;
> +				eg->metric_name = strdup(value);
> +				eg->metric_expr = pe->metric_expr;
> +				eg->metric_unit = pe->unit;
> +				list_add_tail(&eg->nd, group_list);
> +				ret = 0;
>  			}
> -			eg->ids = ids;
> -			eg->idnum = idnum;
> -			eg->metric_name = pe->metric_name;
> -			eg->metric_expr = pe->metric_expr;
> -			eg->metric_unit = pe->unit;
> -			list_add_tail(&eg->nd, group_list);
> -			ret = 0;
>  		}
>  	}
>  	return ret;

SNIP

