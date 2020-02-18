Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2F162FF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 20:28:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MW9c3CqxzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 06:28:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MW3D27tgzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 06:23:04 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by namei.org (8.14.4/8.14.4) with ESMTP id 01IJMet4013185;
 Tue, 18 Feb 2020 19:22:40 GMT
Date: Wed, 19 Feb 2020 06:22:40 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: Re: [PATCH v7 03/12] perf/core: open access to probes for CAP_PERFMON
 privileged process
In-Reply-To: <3364fa26-b5d1-1808-aaee-c057f26e0eb4@linux.intel.com>
Message-ID: <alpine.LRH.2.21.2002190622300.10165@namei.org>
References: <c8de937a-0b3a-7147-f5ef-69f467e87a13@linux.intel.com>
 <3364fa26-b5d1-1808-aaee-c057f26e0eb4@linux.intel.com>
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
Cc: linux-man@vger.kernel.org,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Stephane Eranian <eranian@google.com>,
 Paul Mackerras <paulus@samba.org>, Jiri Olsa <jolsa@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Will Deacon <will@kernel.org>, Helge Deller <deller@gmx.de>,
 Igor Lubashev <ilubashe@akamai.com>, oprofile-list@lists.sf.net,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Feb 2020, Alexey Budankov wrote:

> 
> Open access to monitoring via kprobes and uprobes and eBPF tracing for
> CAP_PERFMON privileged process. Providing the access under CAP_PERFMON
> capability singly, without the rest of CAP_SYS_ADMIN credentials,
> excludes chances to misuse the credentials and makes operation more
> secure.
> 
> perf kprobes and uprobes are used by ftrace and eBPF. perf probe uses
> ftrace to define new kprobe events, and those events are treated as
> tracepoint events. eBPF defines new probes via perf_event_open interface
> and then the probes are used in eBPF tracing.
> 
> CAP_PERFMON implements the principal of least privilege for performance
> monitoring and observability operations (POSIX IEEE 1003.1e 2.2.2.39
> principle of least privilege: A security design principle that states
> that a process or program be granted only those privileges (e.g.,
> capabilities) necessary to accomplish its legitimate function, and only
> for the time that such privileges are actually required)
> 
> For backward compatibility reasons access to perf_events subsystem
> remains open for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN
> usage for secure perf_events monitoring is discouraged with respect to
> CAP_PERFMON capability.
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>


-- 
James Morris
<jmorris@namei.org>

