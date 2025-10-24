Return-Path: <linuxppc-dev+bounces-13274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4810C069C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 16:06:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctPng3WHJz3bjb;
	Sat, 25 Oct 2025 01:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761314759;
	cv=none; b=HLCctj70iVBDlK5PbKQHb9+Vvp06/S3nKlVvuiDw4qe5JZVh9u5UnOpqY+gqB7pH5V91izd41eM+GNbuUvWwRv9suPHRNvNmZQgQ5vT0nNYiBZF/1fSHVSmEZW+WvT0BvCyzf6aBRjrb/j+bOQhJdYcDVLIxAAugwaYYzseyBgxeTHXk3FMoXHAf/nVzQ0rd6Sm0BnyxGEWTUkhf9M6F3IpynA7raNHZcEVzRQ1VI2CTnVVOhpxBtzkMCRXqY+3q0hsX8IiNDhnpMGHV5SQO9gjij0IwVJ8tYgqx36lC0MsvS7KpIW8jUu6RkOutLaRTNz3x5dSL3cE4ALa2GJOjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761314759; c=relaxed/relaxed;
	bh=r5JQM8tjVJeTnSP+fubx3nNdoQqoxOINnnSnyg4/w9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQzvOvEnH8QKx4K57hHDJaKnjM1QsXJG/6eCX1gkf9lAdN/bYrXeO7PcBYNTQ3kvjKCjzVSlrVE4W+ltNFQa+TJDvtVsTIbTdg44Hn5YE3SmLKbGSTpcExPCybZLEqxSDgSBARlIIqW17Rhl3ie5QsxCIsihgZnOB/1EyArCUsBeEWptSiiPlP3uX0MFBw2qkFVXK78NrDGtiOOK4+lU+cC662U46iyj/Sx3V8fTtiwsytKqxO9Kpcx9BExYb4EzRjw0A0fVZVkg5uQUZIFbtbWdN8TFUcqQRznjIC3RUHXICZZ5qKPFZb9utDMNQYjr2DzRrtmctet5dRO7/SK7Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D6k+9xDe; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D6k+9xDe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctPnc6GRGz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 01:05:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761314757; x=1792850757;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WoimfDSkoiRGXr+VziBQJvHHKgL57NRpG6O9qXGaAE0=;
  b=D6k+9xDeVFrdfwVXEkSuYXaQGyxlU40KcXt+3wUfbOzUZmweTfGHk/rg
   zQ4ZwsSwpuZYxeSzRLG8EKa1rl53t8H6j1lb5YeQiJBeCAUSrPxEPDbdJ
   B/CzVzCKU7KzQ7ngkYkob1JQ70QBTtvxjETZSveTqvc4I7LWIxsEH64UN
   cNbJNTLhLcmWe2lMgjlh8P4EiFXbTMvSJmnL92yJwKnOB8gD7Dwo4scgu
   M71y0zVMMfnGEqTnHy/Q3pSrYZqsmmDyWKqpDEzXBzNHdmtUYVopBVipn
   Rc1LPDWm3kiMd7zy5SqBLYVdJgwaVt2nm0RapS4cfB20hJDvW5VZqn4YI
   g==;
X-CSE-ConnectionGUID: LOX4t1mhSaCtoDkuseIqRQ==
X-CSE-MsgGUID: ko7cyJ0LSnCBY9O030wmkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63536916"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63536916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:05:52 -0700
X-CSE-ConnectionGUID: LEfpDIHESSiaqwLNEzO8aQ==
X-CSE-MsgGUID: wbSold2QTOiiflfqUdPudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="208083206"
Received: from spandruv-desk1.amr.corp.intel.com (HELO [10.125.109.24]) ([10.125.109.24])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:05:51 -0700
Message-ID: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
Date: Fri, 24 Oct 2025 07:05:50 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de,
 brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com,
 kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org,
 x86@kernel.org
References: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
 <20251024051653.66329-1-kuniyu@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20251024051653.66329-1-kuniyu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/23/25 22:16, Kuniyuki Iwashima wrote:
>> This makes me nervous. The access_ok() check is quite a distance away.
>> I'd kinda want to see some performance numbers before doing this. Is
>> removing a single access_ok() even measurable?
> I noticed I made a typo in commit message, s/tcp_rr/udp_rr/.
> 
> epoll_put_uevent() can be called multiple times in a single
> epoll_wait(), and we can see 1.7% more pps on UDP even when
> 1 thread has 1000 sockets only:
> 
> server: $ udp_rr --nolog -6 -F 1000 -T 1 -l 3600
> client: $ udp_rr --nolog -6 -F 1000 -T 256 -l 3600 -c -H $SERVER
> server: $ nstat > /dev/null; sleep 10; nstat | grep -i udp
> 
> Without patch (2 stac/clac):
> Udp6InDatagrams                 2205209            0.0
> 
> With patch (1 stac/clac):
> Udp6InDatagrams                 2242602            0.0

I'm totally with you about removing a stac/clac:

	https://lore.kernel.org/lkml/20250228203722.CAEB63AC@davehans-spike.ostc.intel.com/

The thing I'm worried about is having the access_ok() so distant
from the unsafe_put_user(). I'm wondering if this:

-	__user_write_access_begin(uevent, sizeof(*uevent));
+	if (!user_write_access_begin(uevent, sizeof(*uevent))
+		return NULL;
	unsafe_put_user(revents, &uevent->events, efault);
	unsafe_put_user(data, &uevent->data, efault);
	user_access_end();

is measurably slower than what was in your series. If it is
not measurably slower, then the series gets simpler because it
does not need to refactor user_write_access_begin(). It also ends
up more obviously correct because the access check is closer to
the unsafe_put_user() calls.

Also, the extra access_ok() is *much* cheaper than stac/clac.

