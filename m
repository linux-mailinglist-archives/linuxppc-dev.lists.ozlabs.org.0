Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF9B188A3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:27:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hdrD24StzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 03:27:56 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=boVVogPA; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hc8r35BkzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:12:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584457928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5HQAvbPU4U3uMqTwVbtXlufV8kjT1jXd8mJ+pSamK4=;
 b=boVVogPAQ8J6KFMSEaEnFv/coxjncoAXIRY1ttyyEEcFTn/YYjmB+3eE4Xb0bigyEqxynE
 rDbsBtzB0MaX2BlJG0FNOWZNln/WhnO4HrvPrSnbL9a8ptXr1NB/c++9prRUhVWdi013Nv
 +bRnNwPuGNZ451ZEH51nQOOE3pyq/T0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-kEnLFVR7PCuI3hiVy5LX1g-1; Tue, 17 Mar 2020 11:11:00 -0400
X-MC-Unique: kEnLFVR7PCuI3hiVy5LX1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D28107ACC4;
 Tue, 17 Mar 2020 15:10:56 +0000 (UTC)
Received: from krava (unknown [10.40.195.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BE4073865;
 Tue, 17 Mar 2020 15:10:50 +0000 (UTC)
Date: Tue, 17 Mar 2020 16:10:47 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v5 09/11] perf/tools: Enhance JSON/metric infrastructure
 to handle "?"
Message-ID: <20200317151047.GF757893@krava>
References: <20200317062333.14555-1-kjain@linux.ibm.com>
 <20200317062333.14555-10-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317062333.14555-10-kjain@linux.ibm.com>
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

On Tue, Mar 17, 2020 at 11:53:31AM +0530, Kajol Jain wrote:

SBIP

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
> +		if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum, i) < 0)
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
> +		eg = malloc(sizeof(*eg));
> +		if (!eg) {
> +			ret = -ENOMEM;
> +			return ret;
> +		}
> +
> +		sprintf(value, "%s%c%d", pe->metric_name, '_', i);
> +		eg->ids = ids;
> +		eg->idnum = idnum;
> +		eg->metric_name = strdup(value);
> +		if (!eg->metric_name) {
> +			ret = -ENOMEM;
> +			return ret;
> +		}
> +
> +		eg->metric_expr = pe->metric_expr;
> +		eg->metric_unit = pe->unit;
> +		list_add_tail(&eg->nd, group_list);
> +		ret = 0;
> +
> +		if (ret != 0)
> +			break;

again, this is part of metricgroup__add_metric_param no? why not use it?

jirka

