Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390E188A1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:22:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hdk858k6zDqn4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 03:22:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NZSoaRcR; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hc7D2WFKzDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:10:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584457845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rGJiZBfVk4vUHgXaemzBSI4W4XN4SypmjpeZFbIN3pk=;
 b=NZSoaRcRnOGmHtwCWZ4qgymn6foltbUCxp3no22qPd7b/GFW2LTktjTcHlUderIWBNEdOP
 yr95ZfUN/Myn4XPSNcaNSaLIvQ5pQaTPPdAx/VnaUvEvtorFjyEW0o/HZJ8q+8dHSSxdmm
 3OE12vOu7vPapcrjNpgHIxJqVbFkweg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-X7hJ84fQNGCMqAf_MdIkNg-1; Tue, 17 Mar 2020 11:10:41 -0400
X-MC-Unique: X7hJ84fQNGCMqAf_MdIkNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14255800D53;
 Tue, 17 Mar 2020 15:10:38 +0000 (UTC)
Received: from krava (unknown [10.40.195.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 104DE60BF3;
 Tue, 17 Mar 2020 15:10:32 +0000 (UTC)
Date: Tue, 17 Mar 2020 16:10:30 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v5 08/11] perf/tools: Refactoring metricgroup__add_metric
 function
Message-ID: <20200317151030.GE757893@krava>
References: <20200317062333.14555-1-kjain@linux.ibm.com>
 <20200317062333.14555-9-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317062333.14555-9-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tue, Mar 17, 2020 at 11:53:30AM +0530, Kajol Jain wrote:
> This patch refactor metricgroup__add_metric function where
> some part of it move to function metricgroup__add_metric_param.
> No logic change.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  tools/perf/util/metricgroup.c | 63 +++++++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
> index c3a8c701609a..b4919bcfbd8b 100644
> --- a/tools/perf/util/metricgroup.c
> +++ b/tools/perf/util/metricgroup.c
> @@ -474,6 +474,41 @@ static bool metricgroup__has_constraint(struct pmu_event *pe)
>  	return false;
>  }
>  
> +static int metricgroup__add_metric_param(struct strbuf *events,
> +			struct list_head *group_list, struct pmu_event *pe)
> +{
> +
> +	const char **ids;
> +	int idnum;
> +	struct egroup *eg;
> +	int ret = -EINVAL;
> +
> +	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum, 1) < 0)
> +		return ret;
> +
> +	if (events->len > 0)
> +		strbuf_addf(events, ",");
> +
> +	if (metricgroup__has_constraint(pe))
> +		metricgroup__add_metric_non_group(events, ids, idnum);
> +	else
> +		metricgroup__add_metric_weak_group(events, ids, idnum);
> +
> +	eg = malloc(sizeof(*eg));
> +	if (!eg)
> +		ret = -ENOMEM;

??? you need to return in here, eg is NULL

> +
> +	eg->ids = ids;
> +	eg->idnum = idnum;
> +	eg->metric_name = pe->metric_name;
> +	eg->metric_expr = pe->metric_expr;
> +	eg->metric_unit = pe->unit;
> +	list_add_tail(&eg->nd, group_list);
> +	ret = 0;
> +
> +	return ret;
> +}
> +
>  static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>  				   struct list_head *group_list)
>  {
> @@ -493,35 +528,13 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>  			continue;
>  		if (match_metric(pe->metric_group, metric) ||
>  		    match_metric(pe->metric_name, metric)) {
> -			const char **ids;
> -			int idnum;
> -			struct egroup *eg;
>  
>  			pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
>  
> -			if (expr__find_other(pe->metric_expr,
> -					     NULL, &ids, &idnum) < 0)
> +			ret = metricgroup__add_metric_param(events,
> +							group_list, pe);
> +			if (ret == -EINVAL)
>  				continue;

previous code did 'continue' on ret < 0, why just -EINVAL now?

jirka

