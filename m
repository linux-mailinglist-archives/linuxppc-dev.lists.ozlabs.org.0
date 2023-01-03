Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD765C428
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 17:46:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nmdsc4DkGz3c91
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 03:46:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M3avTQsh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M3avTQsh;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmdrd2cwkz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 03:45:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5OhedC6iQxipvz4TKcSMTMUuFrIpfJp0GwUPGwE5fPs=; b=M3avTQsht6HjnfiOhm0oO6WaVd
	+1FXQCTuBY8idftW2y6o4OTGSvXEvKcdj6Qt90wb3d2N3g+fbsFuNhKNd+W5xTV91K997RzAyJom0
	84c6aN9aLX/JAFKyRpXif7AqWOxuM7uZ+C+v2baQh6EzNtLQyHSuht9coDOlW/q7yd8LgZTxrvHO1
	4W4MQ47CjgWYNfLACVDTBOK61nz9jIuCRxLtSWrYgdpLj3EfRuFVCa4vt0JZOmWJ8nmLkFptttJit
	Kee0YUyiMm11H6273e+TDYU6w1QdAIEdwSmK3G5bWevalbY84kUBJ/LmGDwZOiUCV4crXRsojmKkl
	ciCX2ZRg==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkPW-00EGeO-PR; Tue, 03 Jan 2023 16:45:11 +0000
Message-ID: <9999d2de-b5bc-ba8c-4c52-5ed89472d546@infradead.org>
Date: Tue, 3 Jan 2023 08:44:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/3] powerpc: Fix processing of CONFIG_CMDLINE
To: Rob Herring <robh@kernel.org>
References: <cover.1672687924.git.geoff@infradead.org>
 <f3d97d9426eeda9ee16a0ee6f325fc02fa3a2c57.1672687924.git.geoff@infradead.org>
 <CAL_JsqLPLhe4pP-W+xRXRMjVgJn0maNGnJF9RqQCWX8Pc+GeAA@mail.gmail.com>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <CAL_JsqLPLhe4pP-W+xRXRMjVgJn0maNGnJF9RqQCWX8Pc+GeAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 1/2/23 18:03, Rob Herring wrote:
> On Mon, Jan 2, 2023 at 1:41 PM Geoff Levand <geoff@infradead.org> wrote:

>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -761,7 +761,7 @@ void __init early_init_devtree(void *params)
>>         DBG(" -> early_init_devtree(%px)\n", params);
>>
>>         /* Too early to BUG_ON(), do it by hand */
>> -       if (!early_init_dt_verify(params))
>> +       if (!early_init_dt_scan(params))
> 
> It would be nice if this could be used instead, but it does other
> things like memory setup which I think will not work for some PPC
> platforms.

It seems like what we need is to pull out the command line processing
code from early_init_dt_scan_nodes and put that into a new function,
say early_init_setup_cmdline, then have both early_init_dt_scan_nodes
and powerpc's early_init_devtree call early_init_setup_cmdline.

I'll split this series into two, one for the PS3 updates, and one
that adds early_init_setup_cmdline.

-Geoff

