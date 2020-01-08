Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99357134743
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 17:09:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tDjB2gvZzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 03:09:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="gqbvtODk"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tDff5FlFzDqT8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 03:07:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vTWY1coa2Uglbk+2ijUNU4PAcTKo3OAi9shtTNMi0Rk=; b=gqbvtODkaNnvdu0BtI1I+oz9W
 A/2kAzeM+Of8bAddV33sSuyFB5xF+Iq5ljJRIvioI+k+R95x57awB/8d2/OaCxPEWI73HH3ggqw/b
 sRuPnU/M3cuEf3KHzciBaTOkOpg9la+z/euW56512nmDwFzNGDIve2Ho4jXCQShNWbCSAJw0jVzgp
 W73rwpfbOnlx/JXYvxqZG+ueOUqg0TTsDyxTW539J3TnC4nfAFSqo8UjcEPXCvaV8lYoYsU9cKROX
 c5nXwgc0c5to6F7JUcDXFL8eRwzCCSZ1nK2sOxQ5uehPgx5U+VprgiM8abXXvQlwSBJdkTRyrU3JI
 mPuHTmEYQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipDrb-0002aV-JF; Wed, 08 Jan 2020 16:07:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0BFB530018B;
 Wed,  8 Jan 2020 17:05:40 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 08A5520B79C82; Wed,  8 Jan 2020 17:07:14 +0100 (CET)
Date: Wed, 8 Jan 2020 17:07:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: Re: [PATCH v4 2/9] perf/core: open access for CAP_SYS_PERFMON
 privileged process
Message-ID: <20200108160713.GI2844@hirez.programming.kicks-ass.net>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <c93309dc-b920-f5fa-f997-e8b2faf47b88@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c93309dc-b920-f5fa-f997-e8b2faf47b88@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Song Liu <songliubraving@fb.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Serge Hallyn <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 12:25:35PM +0300, Alexey Budankov wrote:
> 
> Open access to perf_events monitoring for CAP_SYS_PERFMON privileged
> processes. For backward compatibility reasons access to perf_events
> subsystem remains open for CAP_SYS_ADMIN privileged processes but
> CAP_SYS_ADMIN usage for secure perf_events monitoring is discouraged
> with respect to CAP_SYS_PERFMON capability.
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
> ---
>  include/linux/perf_event.h | 6 +++---
>  kernel/events/core.c       | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 34c7c6910026..f46acd69425f 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1285,7 +1285,7 @@ static inline int perf_is_paranoid(void)
>  
>  static inline int perf_allow_kernel(struct perf_event_attr *attr)
>  {
> -	if (sysctl_perf_event_paranoid > 1 && !capable(CAP_SYS_ADMIN))
> +	if (sysctl_perf_event_paranoid > 1 && !perfmon_capable())
>  		return -EACCES;
>  
>  	return security_perf_event_open(attr, PERF_SECURITY_KERNEL);
> @@ -1293,7 +1293,7 @@ static inline int perf_allow_kernel(struct perf_event_attr *attr)
>  
>  static inline int perf_allow_cpu(struct perf_event_attr *attr)
>  {
> -	if (sysctl_perf_event_paranoid > 0 && !capable(CAP_SYS_ADMIN))
> +	if (sysctl_perf_event_paranoid > 0 && !perfmon_capable())
>  		return -EACCES;
>  
>  	return security_perf_event_open(attr, PERF_SECURITY_CPU);
> @@ -1301,7 +1301,7 @@ static inline int perf_allow_cpu(struct perf_event_attr *attr)
>  
>  static inline int perf_allow_tracepoint(struct perf_event_attr *attr)
>  {
> -	if (sysctl_perf_event_paranoid > -1 && !capable(CAP_SYS_ADMIN))
> +	if (sysctl_perf_event_paranoid > -1 && !perfmon_capable())
>  		return -EPERM;
>  
>  	return security_perf_event_open(attr, PERF_SECURITY_TRACEPOINT);

These are OK I suppose.

> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 059ee7116008..d9db414f2197 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -9056,7 +9056,7 @@ static int perf_kprobe_event_init(struct perf_event *event)
>  	if (event->attr.type != perf_kprobe.type)
>  		return -ENOENT;
>  
> -	if (!capable(CAP_SYS_ADMIN))
> +	if (!perfmon_capable())
>  		return -EACCES;
>  
>  	/*

This one only allows attaching to already extant kprobes, right? It does
not allow creation of kprobes.

> @@ -9116,7 +9116,7 @@ static int perf_uprobe_event_init(struct perf_event *event)
>  	if (event->attr.type != perf_uprobe.type)
>  		return -ENOENT;
>  
> -	if (!capable(CAP_SYS_ADMIN))
> +	if (!perfmon_capable())
>  		return -EACCES;
>  
>  	/*

Idem, I presume.

> @@ -11157,7 +11157,7 @@ SYSCALL_DEFINE5(perf_event_open,
>  	}
>  
>  	if (attr.namespaces) {
> -		if (!capable(CAP_SYS_ADMIN))
> +		if (!perfmon_capable())
>  			return -EACCES;
>  	}

And given we basically make the entire kernel observable with this CAP,
busting namespaces shoulnd't be a problem either.

So yeah, I suppose that works.
