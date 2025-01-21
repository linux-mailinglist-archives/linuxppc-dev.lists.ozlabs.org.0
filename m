Return-Path: <linuxppc-dev+bounces-5468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE26EA18335
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 18:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcvpM2R4bz30VZ;
	Wed, 22 Jan 2025 04:48:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737481739;
	cv=none; b=alX0NEsmm0B996TNAAU9t512eVa1SXk093iSncciNH9gEgAFg+SkPL/iRK/7q2mFMytnMBLgn+tFf7aWP82nQgFf8Zd4xaR7iEjQt3tmQZLgoDIXO0QaCX1WFmgZkWfVfAID7gc5UOEOFSPWQ6wrub3Q3sSiHXad6XqtSp+AMP8lzavm/UkYX5+pHIFe7FUVfWdCgw2LeDloVN9AyJE72RP5PVGMq/WCHxgtXiPylDWSQ4F24oumPB6KLpJ5C2IPqSVXKAVGqpi5orh9JD7u8Rt+sJwxjOVg5N7A/cHkcnnP9BReSzWwF52+/pv8o7vDAG0vGfHjKXHlZiOPMZq+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737481739; c=relaxed/relaxed;
	bh=nPHxJwINg33qJd1mbQNVC4e3b4bymgn1vEGSqb1D450=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HkYy2Ebe/i6KJnEqKGRZtkKVv0G8LR6nr/E/tTqJtzGfYIH3t91L7F6aYxBx1lFUDiRMGiskrhlEGmfoGLiLQjg2qsy3qui5tO1I1lR0fXAuZ5RH/Wksz2oYDXUZ4LcX1lA9YTm/D+4FbIx6l9PDg7FbF47jdAiUk6eQzOHQCF6mvESTwK8vXBR1v3ZCexGJTfTyRYpSZfdOhq4C+SJbc0ESVKlKxM24pC3jPM0QhkWL7JAg4LliytkxTnytmblyXR+HiaTYChblMUD+wGuDwX3QwpRFieg6ejtj8bLtsxzFm2oootsdVSUZxKgVgYbentEEARowlchAieZ+VmqocA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=wey8=un=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=wey8=un=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcvpJ6dTbz30Tx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 04:48:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62383A406C6;
	Tue, 21 Jan 2025 17:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2403C4CEDF;
	Tue, 21 Jan 2025 17:48:48 +0000 (UTC)
Date: Tue, 21 Jan 2025 12:48:51 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Zheng Yejian <zhengyejian1@huawei.com>
Cc: Martin Kelly <martin.kelly@crowdstrike.com>, "masahiroy@kernel.org"
 <masahiroy@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "pasha.tatashin@soleen.com"
 <pasha.tatashin@soleen.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "james.clark@arm.com" <james.clark@arm.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "nathan@kernel.org" <nathan@kernel.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "surenb@google.com" <surenb@google.com>, "peterz@infradead.org"
 <peterz@infradead.org>, "naveen.n.rao@linux.ibm.com"
 <naveen.n.rao@linux.ibm.com>, "kent.overstreet@linux.dev"
 <kent.overstreet@linux.dev>, "bp@alien8.de" <bp@alien8.de>,
 "yeweihua4@huawei.com" <yeweihua4@huawei.com>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>, Amit Dang
 <amit.dang@crowdstrike.com>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] kallsyms: Emit symbol for holes in text and fix
 weak function issue
Message-ID: <20250121124851.2205a8b2@gandalf.local.home>
In-Reply-To: <7266ee61-3085-74fc-2560-c62fc34c2148@huawei.com>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
	<44353f4cd4d1cc7170d006031819550b37039dd2.camel@crowdstrike.com>
	<364aaf7c-cdc4-4e57-bb4c-f62e57c23279@csgroup.eu>
	<d25741d8a6f88d5a6c219fb53e8aa0bcc1fea982.camel@crowdstrike.com>
	<1f11e3c4-e8fd-d4ac-23cd-0ab2de9c1799@huaweicloud.com>
	<30ee9989044dad1a7083a85316d77b35f838e622.camel@crowdstrike.com>
	<7266ee61-3085-74fc-2560-c62fc34c2148@huawei.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Sorry for the late reply. Forgot about this as I was focused on other end-of-year issues.

On Sat, 14 Dec 2024 16:37:59 +0800
Zheng Yejian <zhengyejian1@huawei.com> wrote:

> The direct cause of this issue is the wrong fentry being founded by ftrace_location(),
> following the approach of "FTRACE_MCOUNT_MAX_OFFSET", narrowing down the search range
> and re-finding may also solve this problem, demo patch like below (not
> fully tested):
> 
>      diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
>      index 9b17efb1a87d..7d34320ca9d1 100644
>      --- a/kernel/trace/ftrace.c
>      +++ b/kernel/trace/ftrace.c
>      @@ -1678,8 +1678,11 @@ unsigned long ftrace_location(unsigned long ip)
>                              goto out;
>      
>                      /* map sym+0 to __fentry__ */
>      -               if (!offset)
>      +               if (!offset) {
>                              loc = ftrace_location_range(ip, ip + size - 1);
>      +                       while (loc > ip && loc - ip > FTRACE_MCOUNT_MAX_OFFSET)
>      +                               loc = ftrace_location_range(ip, loc - 1);
>      +               }
>              }
> 
> Steve, Peter, what do you think?

Hmm, removing the weak functions from the __mcount_loc location should also
solve this, as the ftrace_location_range() will not return a weak function
if it's not part of the __mcount_loc table.

That is, would this patchset work?

  https://lore.kernel.org/all/20250102232609.529842248@goodmis.org/

-- Steve

