Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622F6DDC7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 15:44:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwnBw0bmqz3f53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 23:44:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aF0AKJCu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aF0AKJCu;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwn9z6Gm4z2yHZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 23:43:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681220632; x=1712756632;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2GeQQq+KcbTCEU+rXh5JGw+yLkL8a8JmHupdRnaoc8M=;
  b=aF0AKJCuKyTc6LuJt3x50JsZxedHWhD5RILGqoVVIrPf/ufp/noSR6fJ
   soArdVdYdUJL2I32d6mBucrwHk/ugwMQfjOhXsGpphleeqOSYhc3yrTPn
   NhvWlAXfhume82IskZHw5RfZcfXtMP6J1WihQl4rPdPX2CgqHJYJ1N8+r
   6wS6R1oH1YJHvSiT+ILrGGM+v2HLtglA/dHzs3/IwONZ+FCThkCBOo11w
   8tR4g8mfwo30bAKzxI71oOeWKVHHI8MwVl7LqTcsi2s+8PimN1QOj5FQw
   GJ3PWysIiIjf1toBrdyopn3wj7N41GnMlXqxefJvs2qUh0I74tsVDcH6P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="429905391"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="429905391"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 06:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812566489"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="812566489"
Received: from gtryonx-mobl.amr.corp.intel.com (HELO [10.209.72.81]) ([10.209.72.81])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 06:43:39 -0700
Message-ID: <1fee0372-3a3b-5e09-38c3-ffb3523fe195@intel.com>
Date: Tue, 11 Apr 2023 06:43:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
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
Cc: Ian Rogers <irogers@google.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, loongarch@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel
 .org, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/11/23 04:35, Mark Rutland wrote:
> I agree it'd be nice to have performance figures, but I think those would only
> need to demonstrate a lack of a regression rather than a performance
> improvement, and I think it's fairly clear from eyeballing the generated
> instructions that a regression isn't likely.

Thanks for the additional context.

I totally agree that there's zero burden here to show a performance
increase.  If anyone can think of a quick way to do _some_ kind of
benchmark on the code being changed and just show that it's free of
brown paper bags, it would be appreciated.  Nothing crazy, just think of
one workload (synthetic or not) that will stress the paths being changed
and run it with and without these changes.  Make sure there are not
surprises.

I also agree that it's unlikely to be brown paper bag material.
