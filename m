Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E74182E66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 11:58:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dQmf2fzVzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 21:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cbeW9xD5; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dQdY4lHxzDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 21:52:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584010350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/bj8IgmqC84ISp8S6LnTUQZNjXZXjzcGGPxmAIczQ0=;
 b=cbeW9xD5hDzCYWEdEBlFFmSZZut5Ka+aQbpdBdD7ikCrSKSIV7hQiD9xzBKJ7pRTTDLP6r
 RlUjWef1RXWYAf6mqPYM0PjmntngtXJ2AudXzO/pKnI2exVp0z1WE0iSuJG2mMTHDE32Z7
 nAgcmq0H7rYeah/h52igbBhKuXzxnbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-Ijmha7O_NBGo77tIPN7CqA-1; Thu, 12 Mar 2020 06:52:26 -0400
X-MC-Unique: Ijmha7O_NBGo77tIPN7CqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BB168017CC;
 Thu, 12 Mar 2020 10:52:23 +0000 (UTC)
Received: from krava (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0AF5388;
 Thu, 12 Mar 2020 10:52:17 +0000 (UTC)
Date: Thu, 12 Mar 2020 11:52:14 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v4 6/8] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Message-ID: <20200312105214.GD311223@krava>
References: <20200309062552.29911-1-kjain@linux.ibm.com>
 <20200309062552.29911-7-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309062552.29911-7-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Mon, Mar 09, 2020 at 11:55:50AM +0530, Kajol Jain wrote:

SNIP

> +static int metricgroup__add_metric_runtime_param(struct strbuf *events,
> +			struct list_head *group_list, struct pmu_event *pe)
> +{
> +	int i, count;
> +	int ret = -EINVAL;
> +
> +	count = arch_get_runtimeparam();
> +
> +	/* This loop is added to create multiple
> +	 * events depend on count value and add
> +	 * those events to group_list.
> +	 */
> +
> +	for (i = 0; i < count; i++) {
> +		const char **ids;
> +		int idnum;
> +		struct egroup *eg;
> +		char value[PATH_MAX];
> +
> +		expr__runtimeparam = i;
> +
> +		if (expr__find_other(pe->metric_expr,
> +					NULL, &ids, &idnum) < 0)
> +			return ret;
> +
> +		if (events->len > 0)
> +			strbuf_addf(events, ",");
> +
> +		if (metricgroup__has_constraint(pe))
> +			metricgroup__add_metric_non_group(events, ids, idnum);
> +		else
> +			metricgroup__add_metric_weak_group(events, ids, idnum);
> +
> +		eg = malloc(sizeof(struct egroup));
> +		if (!eg) {
> +			ret = -ENOMEM;
> +			return ret;
> +		}
> +		sprintf(value, "%s%c%d", pe->metric_name, '_', i);
> +		eg->ids = ids;
> +		eg->idnum = idnum;
> +		eg->metric_name = strdup(value);
> +		eg->metric_expr = pe->metric_expr;
> +		eg->metric_unit = pe->unit;
> +		list_add_tail(&eg->nd, group_list);
> +		ret = 0;
> +
> +		if (ret != 0)
> +			break;

the inside loop is essentialy what you factor out to
metricgroup__add_metric_param right? please nove
addition of metricgroup__add_metric_param function
into separate patch

jirka


> +	}
> +	return ret;
> +}
> +static int metricgroup__add_metric_param(struct strbuf *events,
> +			struct list_head *group_list, struct pmu_event *pe)
> +{
> +
> +	const char **ids;
> +	int idnum;
> +	struct egroup *eg;
> +	int ret = -EINVAL;
> +
> +	if (expr__find_other(pe->metric_expr,
> +					     NULL, &ids, &idnum) < 0)
> +		return ret;
> +	if (events->len > 0)
> +		strbuf_addf(events, ",");
> +
> +	if (metricgroup__has_constraint(pe))
> +		metricgroup__add_metric_non_group(events, ids, idnum);
> +	else
> +		metricgroup__add_metric_weak_group(events, ids, idnum);
> +
> +	eg = malloc(sizeof(struct egroup));
> +	if (!eg)
> +		ret = -ENOMEM;
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

SNIP

