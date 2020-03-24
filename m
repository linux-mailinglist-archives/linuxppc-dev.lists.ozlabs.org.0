Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD1190EDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:18:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48msJ24jtnzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 00:18:10 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=Mz3AaVGy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ms8d5t5czDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 00:11:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585055501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cd6KV/emetvr0s6RZCThEP3Rmoq7QiPbyQdz5ZsuYJo=;
 b=Mz3AaVGyLr2vyI1pSkVCHL/mz2qblEpDtsAosS0MHzDw0fGWxwwTbbdw7M3ZT6WvPb/wPD
 8R/ce1e4Wicb4bcQRzFla3FMAk6CoT6lkPs5HyErqYETxx5N3yxcbFIMmwnyefYF90ykvq
 e79PwC/JWJNujoD8kyWoLk3TCo1h6GY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-K2fQwpdFM1ycnE_NYyjqzQ-1; Tue, 24 Mar 2020 09:11:37 -0400
X-MC-Unique: K2fQwpdFM1ycnE_NYyjqzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ADEB801E67;
 Tue, 24 Mar 2020 13:11:34 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 859B290CF1;
 Tue, 24 Mar 2020 13:11:21 +0000 (UTC)
Date: Tue, 24 Mar 2020 14:11:12 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v6 09/11] perf/tools: Enhance JSON/metric infrastructure
 to handle "?"
Message-ID: <20200324131112.GU1534489@krava>
References: <20200320125406.30995-1-kjain@linux.ibm.com>
 <20200320125406.30995-10-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320125406.30995-10-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Fri, Mar 20, 2020 at 06:24:04PM +0530, Kajol Jain wrote:

SNIP

> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
> index 52fb119d25c8..b4b91d8ad5be 100644
> --- a/tools/perf/util/metricgroup.c
> +++ b/tools/perf/util/metricgroup.c
> @@ -474,8 +474,13 @@ static bool metricgroup__has_constraint(struct pmu_event *pe)
>  	return false;
>  }
>  
> +int __weak arch_get_runtimeparam(void)
> +{
> +	return 1;
> +}
> +
>  static int metricgroup__add_metric_param(struct strbuf *events,
> -			struct list_head *group_list, struct pmu_event *pe)
> +		struct list_head *group_list, struct pmu_event *pe, int param)
>  {
>  
>  	const char **ids;
> @@ -483,7 +488,7 @@ static int metricgroup__add_metric_param(struct strbuf *events,

could you please call this function __metricgroup__add_metric instead?

>  	struct egroup *eg;
>  	int ret = -EINVAL;
>  
> -	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum) < 0)
> +	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum, param) < 0)
>  		return ret;
>  
>  	if (events->len > 0)
> @@ -502,11 +507,21 @@ static int metricgroup__add_metric_param(struct strbuf *events,
>  
>  	eg->ids = ids;
>  	eg->idnum = idnum;
> -	eg->metric_name = pe->metric_name;
> +	if (strstr(pe->metric_expr, "?")) {
> +		char value[PATH_MAX];
> +
> +		sprintf(value, "%s%c%d", pe->metric_name, '_', param);
> +		eg->metric_name = strdup(value);

how is eg->metric_name getting released?

> +		if (!eg->metric_name) {
> +			ret = -ENOMEM;
> +			return ret;

		return -ENOMEM; ??

> +		}
> +	}
> +	else
> +		eg->metric_name = pe->metric_name;
>  	eg->metric_expr = pe->metric_expr;
>  	eg->metric_unit = pe->unit;
>  	list_add_tail(&eg->nd, group_list);
> -
>  	return 0;
>  }
>  

SNIP

thanks,
jirka

