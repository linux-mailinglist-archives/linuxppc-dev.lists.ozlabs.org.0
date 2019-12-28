Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFB12BD5C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2019 12:11:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47lLbV3MryzDqFm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2019 22:11:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mail.hallyn.com (client-ip=178.63.66.53; helo=mail.hallyn.com;
 envelope-from=serge@mail.hallyn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=hallyn.com
X-Greylist: delayed 324 seconds by postgrey-1.36 at bilbo;
 Sat, 28 Dec 2019 14:59:02 AEDT
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47l9120KsyzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2019 14:59:00 +1100 (AEDT)
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id BA54465C; Fri, 27 Dec 2019 21:53:31 -0600 (CST)
Date: Fri, 27 Dec 2019 21:53:31 -0600
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: Re: [PATCH v4 1/9] capabilities: introduce CAP_SYS_PERFMON to kernel
 and user space
Message-ID: <20191228035331.GA16088@mail.hallyn.com>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <e0cb2b8d-e964-bc23-bf80-58d7ac4ed6f1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0cb2b8d-e964-bc23-bf80-58d7ac4ed6f1@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 28 Dec 2019 22:09:11 +1100
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
 Peter Zijlstra <peterz@infradead.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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

On Wed, Dec 18, 2019 at 12:24:28PM +0300, Alexey Budankov wrote:
> 
> Introduce CAP_SYS_PERFMON capability devoted to secure system performance
> monitoring and observability operations so that CAP_SYS_PERFMON would
> assist CAP_SYS_ADMIN capability in its governing role for perf_events,
> i915_perf and other subsystems of the kernel.
> 
> CAP_SYS_PERFMON intends to harden system security and integrity during
> system performance monitoring and observability operations by decreasing
> attack surface that is available to CAP_SYS_ADMIN privileged processes.
> 
> CAP_SYS_PERFMON intends to take over CAP_SYS_ADMIN credentials related
> to system performance monitoring and observability operations and balance
> amount of CAP_SYS_ADMIN credentials in accordance with the recommendations
> provided in the man page for CAP_SYS_ADMIN [1]: "Note: this capability
> is overloaded; see Notes to kernel developers, below."
> 
> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>

Acked-by: Serge Hallyn <serge@hallyn.com>
