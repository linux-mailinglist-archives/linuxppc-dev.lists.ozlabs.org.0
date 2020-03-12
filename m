Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A624182E6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 12:00:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dQpJ42s9zDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 22:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BPcPXBcX; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dQf40vYHzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 21:52:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584010377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qh0eXeonMgy20ck7YawIUlc8xJ7ukIA09ot5F0zPtg4=;
 b=BPcPXBcXMDiLhTIirLez1u3855R0hn2v5Z8En8r7jqz/Gm6tbCvSu8c3hb/DyccNcY0d2F
 IARAID12KJdc49dJeTdm85O7SSiCffg2zpxu3B0HuxAWm1PzKDw8wBezJF4pmbnP94CHpt
 I7qmJxIxZbnbKRUnZYX5Nzsgam6T5do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-KYVpkvHxM6yhQfbW7eF_NQ-1; Thu, 12 Mar 2020 06:52:55 -0400
X-MC-Unique: KYVpkvHxM6yhQfbW7eF_NQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8FA3800D5B;
 Thu, 12 Mar 2020 10:52:52 +0000 (UTC)
Received: from krava (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C307388;
 Thu, 12 Mar 2020 10:52:44 +0000 (UTC)
Date: Thu, 12 Mar 2020 11:52:31 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v4 6/8] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Message-ID: <20200312105231.GE311223@krava>
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

> diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
> index 9377538f4097..d17664e628db 100644
> --- a/tools/perf/util/expr.h
> +++ b/tools/perf/util/expr.h
> @@ -15,6 +15,7 @@ struct parse_ctx {
>  	struct parse_id ids[MAX_PARSE_ID];
>  };
>  
> +int expr__runtimeparam;
>  void expr__ctx_init(struct parse_ctx *ctx);
>  void expr__add_id(struct parse_ctx *ctx, const char *id, double val);
>  int expr__parse(double *final_val, struct parse_ctx *ctx, const char *expr);
> diff --git a/tools/perf/util/expr.l b/tools/perf/util/expr.l
> index 1928f2a3dddc..ec4b00671f67 100644
> --- a/tools/perf/util/expr.l
> +++ b/tools/perf/util/expr.l
> @@ -45,6 +45,21 @@ static char *normalize(char *str)
>  			*dst++ = '/';
>  		else if (*str == '\\')
>  			*dst++ = *++str;
> +        else if (*str == '?') {
> +
> +			int size = snprintf(NULL, 0, "%d", expr__runtimeparam);
> +			char * paramval = (char *)malloc(size);

can't we agree that any reasonable number in here
wouldn't cross 20 bytes in string or so and use
buffer for that instead of that malloc exercise?

thanks,
jirka

> +			int i = 0;
> +
> +			if(!paramval)
> +				*dst++ = '0';
> +			else {
> +				sprintf(paramval, "%d", expr__runtimeparam);
> +				while(i < size)
> +					*dst++ = paramval[i++];
> +				free(paramval);
> +			}
> +		}

SNIP

