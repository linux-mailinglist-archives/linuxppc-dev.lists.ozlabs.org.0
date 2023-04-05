Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C78376D83D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 18:38:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps9Kz4Pkxz3f8X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 02:38:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N25+p1ID;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N25+p1ID;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps9K72mMhz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 02:37:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680712651; x=1712248651;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0xErBa/ZTd4QuIygEuCmz4Ddp7YfQ0AoZ3dVIG2ez3Y=;
  b=N25+p1IDbCy0cSYsNkhOPU7E69sETWqLDbz2s/JMbGFWU76VNmPREaAJ
   WxiTb2bpusbJ8EkPhtvBG399mHFH/ePJCxfRnWp0MrzwDGM5QgZsSCmdW
   lJx8khlSeKMwrlnGt8Ay/Wk1Y1Vn7aSEBGex1btxPfLPOt8rJzrKApw0s
   muRaA5KC2MOaMA0cqPJ/Fb/SXssjmLFJuR3NsSSRhqMD4LJCpA9SSeIqM
   Xusc1Afi9VwCVtMq56RvHCSDwG0TkC4NraRoV5uliN0Jw6uBrpweVQfaF
   sFYrau7lUhyatTHGBCUDjXHZ1jGyhDtO7yCIVKyG9gD9KQHOfBlMek7oq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="339995941"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="339995941"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 09:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="932891908"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="932891908"
Received: from kyunghyu-mobl2.amr.corp.intel.com (HELO [10.209.6.69]) ([10.209.6.69])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 09:37:05 -0700
Message-ID: <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
Date: Wed, 5 Apr 2023 09:37:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Content-Language: en-US
To: Uros Bizjak <ubizjak@gmail.com>, linux-alpha@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230405141710.3551-1-ubizjak@gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiri Olsa <jolsa@kernel.org>, Borislav Petkov <bp@alien8.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/5/23 07:17, Uros Bizjak wrote:
> Add generic and target specific support for local{,64}_try_cmpxchg
> and wire up support for all targets that use local_t infrastructure.

I feel like I'm missing some context.

What are the actual end user visible effects of this series?  Is there a
measurable decrease in perf overhead?  Why go to all this trouble for
perf?  Who else will use local_try_cmpxchg()?

I'm all for improving things, and perf is an important user.  But, if
the goal here is improving performance, it would be nice to see at least
a stab at quantifying the performance delta.
