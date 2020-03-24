Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B006A190F69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:25:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48msSX2dSgzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 00:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SlgOSHo0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ms910M40zDqkk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 00:12:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585055521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bAV0a5EbyjxKEoAhknEvXpmwJ3mEJrJzUIE/or3dQRE=;
 b=SlgOSHo03Dl1QxjR6tNrd+06zkOfEmqoyvpJLzf+IENVIXht/7ihUSI9iPw23HhqBdCGNV
 SYmGNUHrBmyYm6YnIgEYeIUJ03gchjqjQXTtVwGL0ny999xrX2W/vi6ifE3u1yckWDy3mH
 J4yxNgp4P7ULsiVz05fragnT9sMWGxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-xLFoOtpINUi2luA0yLmjIw-1; Tue, 24 Mar 2020 09:11:59 -0400
X-MC-Unique: xLFoOtpINUi2luA0yLmjIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D841C1926DA3;
 Tue, 24 Mar 2020 13:11:55 +0000 (UTC)
Received: from krava (unknown [10.40.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A015760BE0;
 Tue, 24 Mar 2020 13:11:43 +0000 (UTC)
Date: Tue, 24 Mar 2020 14:11:41 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v6 09/11] perf/tools: Enhance JSON/metric infrastructure
 to handle "?"
Message-ID: <20200324131141.GV1534489@krava>
References: <20200320125406.30995-1-kjain@linux.ibm.com>
 <20200320125406.30995-10-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320125406.30995-10-kjain@linux.ibm.com>
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

On Fri, Mar 20, 2020 at 06:24:04PM +0530, Kajol Jain wrote:
> Patch enhances current metric infrastructure to handle "?" in the metric
> expression. The "?" can be use for parameters whose value not known while
> creating metric events and which can be replace later at runtime to
> the proper value. It also add flexibility to create multiple events out
> of single metric event added in json file.
> 
> Patch adds function 'arch_get_runtimeparam' which is a arch specific
> function, returns the count of metric events need to be created.
> By default it return 1.
> 
> This infrastructure needed for hv_24x7 socket/chip level events.
> "hv_24x7" chip level events needs specific chip-id to which the
> data is requested. Function 'arch_get_runtimeparam' implemented
> in header.c which extract number of sockets from sysfs file
> "sockets" under "/sys/devices/hv_24x7/interface/".
> 
> 
> With this patch basically we are trying to create as many metric events
> as define by runtime_param.
> 
> For that one loop is added in function 'metricgroup__add_metric',
> which create multiple events at run time depend on return value of
> 'arch_get_runtimeparam' and merge that event in 'group_list'.
> 
> To achieve that we are actually passing this parameter value as part of
> `expr__find_other` function and changing "?" present in metric expression
> with this value.
> 
> As in our json file, there gonna be single metric event, and out of
> which we are creating multiple events, I am also merging this value
> to the original metric name to specify parameter value.
> 
> For example,
> command:# ./perf stat  -M PowerBUS_Frequency -C 0 -I 1000
> #           time             counts unit events
>      1.000101867          9,356,933      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
>      1.000101867          9,366,134      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1
>      2.000314878          9,365,868      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
>      2.000314878          9,366,092      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1
> 
> So, here _0 and _1 after PowerBUS_Frequency specify parameter value.
> 
> As after adding this to group_list, again we call expr__parse
> in 'generic_metric' function present in util/stat-display.c.
> By this time again we need to pass this parameter value. So, now to get this value
> actually I am trying to extract it from metric name itself. Because
> otherwise it gonna point to last updated value present in runtime_param.
> And gonna match for that value only.

so why can't we pass that param as integer value through the metric objects?

it get's created in metricgroup__add_metric_param:
  - as struct egroup *eg
  - we can add egroup::param and store the param value there

then in metricgroup__setup_events it moves to:
  - struct metric_expr *expr
  - we can add metric_expr::param to keep the param

then in perf_stat__print_shadow_stats there's:
  - struct metric_expr *mexp loop
  - calling generic_metric metric - we could call it with mexp::param
  - and pass the param to expr__parse

jirka

