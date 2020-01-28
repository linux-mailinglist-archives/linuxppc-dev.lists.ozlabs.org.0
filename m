Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065A14C2BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 23:15:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486gtK0y88zDqLC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 09:15:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=namei.org
 (client-ip=65.99.196.166; helo=namei.org; envelope-from=jmorris@namei.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=namei.org
Received: from namei.org (namei.org [65.99.196.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486gmH0523zDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 09:10:38 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by namei.org (8.14.4/8.14.4) with ESMTP id 00SLHXhJ004567;
 Tue, 28 Jan 2020 21:17:33 GMT
Date: Wed, 29 Jan 2020 08:17:33 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: Re: [PATCH v6 07/10] powerpc/perf: open access for CAP_PERFMON
 privileged process
In-Reply-To: <3ce8fc61-a61f-5efc-9167-94f5d39b6f1b@linux.intel.com>
Message-ID: <alpine.LRH.2.21.2001290817160.2204@namei.org>
References: <74d524ab-ac11-a7b8-1052-eba10f117e09@linux.intel.com>
 <3ce8fc61-a61f-5efc-9167-94f5d39b6f1b@linux.intel.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Song Liu <songliubraving@fb.com>, Peter Zijlstra <peterz@infradead.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Serge Hallyn <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Will Deacon <will@kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Stephane Eranian <eranian@google.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jan 2020, Alexey Budankov wrote:

> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
> ---
>  arch/powerpc/perf/imc-pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index cb50a9e1fd2d..e837717492e4 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -898,7 +898,7 @@ static int thread_imc_event_init(struct perf_event *event)
>  	if (event->attr.type != event->pmu->type)
>  		return -ENOENT;
>  
> -	if (!capable(CAP_SYS_ADMIN))
> +	if (!perfmon_capable())
>  		return -EACCES;
>  
>  	/* Sampling not supported */
> @@ -1307,7 +1307,7 @@ static int trace_imc_event_init(struct perf_event *event)
>  	if (event->attr.type != event->pmu->type)
>  		return -ENOENT;
>  
> -	if (!capable(CAP_SYS_ADMIN))
> +	if (!perfmon_capable())
>  		return -EACCES;
>  
>  	/* Return if this is a couting event */
> 


Acked-by: James Morris <jamorris@linux.microsoft.com>

-- 
James Morris
<jmorris@namei.org>

