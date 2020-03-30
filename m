Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A56371984B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 21:39:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rjTj5PrWzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 06:39:53 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=OFtIJ+U0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rjPg6WYmzDqjG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 06:36:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585596978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jWTAjkjajdTnMmuVLUXHpOyNhDCt9s79bNubNzkpYiQ=;
 b=OFtIJ+U0zJbFJNClXoD6qsWYWxhSgSqWZAMxlMDkOrBT1kUEdn9FwT7qTdG/e5U/inedl8
 WfZG74DJRog/HUb7NKC6gL6Cr3Ev/0WrRE013nBjARjUaFlKYCTX8RPj+ncXWmaypN7y+d
 PmzexEM97faES2B/ZAEFfrG3hjNN/7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-xED46qSyP7eS7AxtU3CN4A-1; Mon, 30 Mar 2020 15:36:16 -0400
X-MC-Unique: xED46qSyP7eS7AxtU3CN4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8832D1005509;
 Mon, 30 Mar 2020 19:36:13 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D1885D9E2;
 Mon, 30 Mar 2020 19:36:02 +0000 (UTC)
Date: Mon, 30 Mar 2020 21:35:58 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v7 4/6] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Message-ID: <20200330193558.GD2490231@krava>
References: <20200327102528.4267-1-kjain@linux.ibm.com>
 <20200327102528.4267-5-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327102528.4267-5-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Fri, Mar 27, 2020 at 03:55:26PM +0530, Kajol Jain wrote:

SNIP

>  
>  %%
>  	struct expr_scanner_ctx *sctx = expr_get_extra(yyscanner);
> @@ -93,7 +106,7 @@ if		{ return IF; }
>  else		{ return ELSE; }
>  #smt_on		{ return SMT_ON; }
>  {number}	{ return value(yyscanner, 10); }
> -{symbol}	{ return str(yyscanner, ID); }
> +{symbol}	{ return str(yyscanner, ID, sctx->runtime_param); }
>  "|"		{ return '|'; }
>  "^"		{ return '^'; }
>  "&"		{ return '&'; }
> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
> index b905eaa907a7..66695b4a358d 100644
> --- a/tools/perf/util/metricgroup.c
> +++ b/tools/perf/util/metricgroup.c
> @@ -90,6 +90,7 @@ struct egroup {
>  	const char *metric_name;
>  	const char *metric_expr;
>  	const char *metric_unit;
> +	int param;

could you please use runtime_param everywhere? ... s/param/runtime_param/
or maybe just 'runtime' to keep it short..? it's param in any case ;-)

other than that it looks ok

jirka

