Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3D19849F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 21:38:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rjRk290GzDqkq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 06:38:10 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=MFk82vMy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rjPF2vmfzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 06:36:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585596957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YkeaEvbSYfzOX+Od6LnDOCD/zgBzApumAiZCHA1KVA8=;
 b=MFk82vMyE2znnsRpZg4siIpeN49guoxILCsnYT0NBGcuudrkiJomTMZuhCO1SP7YlAAQ23
 SQt5X874exYDJ2GqMu68R4NjYX+kHkCIDyWcBNhWqoSdU0sJJP9fx4NdpIw5BWg+gYwHq3
 OWGcazkk+BHHYC2xHZ7wUTS8R2gWnPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-U2ZVlOMWOJiAovnZCjU4og-1; Mon, 30 Mar 2020 15:35:55 -0400
X-MC-Unique: U2ZVlOMWOJiAovnZCjU4og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AB5113F9;
 Mon, 30 Mar 2020 19:35:51 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8D41001B2B;
 Mon, 30 Mar 2020 19:35:38 +0000 (UTC)
Date: Mon, 30 Mar 2020 21:35:36 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v7 4/6] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Message-ID: <20200330193536.GC2490231@krava>
References: <20200327102528.4267-1-kjain@linux.ibm.com>
 <20200327102528.4267-5-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327102528.4267-5-kjain@linux.ibm.com>
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

> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> index ea10fc4412c4..516504cf0ea5 100644
> --- a/tools/perf/tests/expr.c
> +++ b/tools/perf/tests/expr.c
> @@ -10,7 +10,7 @@ static int test(struct expr_parse_ctx *ctx, const char *e, double val2)
>  {
>  	double val;
>  
> -	if (expr__parse(&val, ctx, e))
> +	if (expr__parse(&val, ctx, e, 1))
>  		TEST_ASSERT_VAL("parse test failed", 0);
>  	TEST_ASSERT_VAL("unexpected value", val == val2);
>  	return 0;
> @@ -44,15 +44,15 @@ int test__expr(struct test *t __maybe_unused, int subtest __maybe_unused)
>  		return ret;
>  
>  	p = "FOO/0";
> -	ret = expr__parse(&val, &ctx, p);
> +	ret = expr__parse(&val, &ctx, p, 1);
>  	TEST_ASSERT_VAL("division by zero", ret == -1);
>  
>  	p = "BAR/";
> -	ret = expr__parse(&val, &ctx, p);
> +	ret = expr__parse(&val, &ctx, p, 1);
>  	TEST_ASSERT_VAL("missing operand", ret == -1);
>  
>  	TEST_ASSERT_VAL("find other",
> -			expr__find_other("FOO + BAR + BAZ + BOZO", "FOO", &other, &num_other) == 0);
> +			expr__find_other("FOO + BAR + BAZ + BOZO", "FOO", &other, &num_other, 1) == 0);
>  	TEST_ASSERT_VAL("find other", num_other == 3);
>  	TEST_ASSERT_VAL("find other", !strcmp(other[0], "BAR"));
>  	TEST_ASSERT_VAL("find other", !strcmp(other[1], "BAZ"));

could we add test case for runtime param > 1 in here?
expr_parse should return value that would depend on this value..

jirka

