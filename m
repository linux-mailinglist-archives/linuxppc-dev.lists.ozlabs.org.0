Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6464137408
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 17:47:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vTRs3ptfzDqgW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 03:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ok+PdgOk; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vTPf5FtqzDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 03:45:37 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id e5so2438207qtm.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 08:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s80UcNQvKwGgKWzgf5mb0xu3daHQpbt1S8dMQfZFc54=;
 b=Ok+PdgOkxWfVNZDBHC7AxcoITL4nnSC4kT9KjSqRuC1eTjfmC3LmiPvnvS171U4tna
 EP8iijKW402NqG5BQx0coWKMEOVLMeGKc7ap98b6Rxbh9hPjWfSYFuB8E80W7o5tEa0O
 ek9FW+VSI8iQh6VP6skYcf093r9SVtaSVemJCMeYaE/PnLp/tTkEDChLmjDKQF0AdxlE
 fPjw+quRMzhLGO443NvQb4dIgcflvLFBLkxMtRcloEjnxDpZATC4idego7WSfiaP3Jw3
 BAz+Hsmc+r9gtv6eKgFDuF1OwZhT+5WqFpA+9hhpFHz1e0iBUICVW9826sBvrRCXXr80
 32OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s80UcNQvKwGgKWzgf5mb0xu3daHQpbt1S8dMQfZFc54=;
 b=P44kH6OGynIdEJ3TtvQOpikMKQi1+lwM8TgsNaF2rbR7CLSQ92EtyKxynxKSRxCzd5
 hzkq/AYOWKErOTcPvF1ANfRPowo46SZvlmRSs0bLjpYMEJJEj/wSiHg+IGQvj7MIg1Ii
 vXyCh3T9aHUlDVUAcmephcdl/TYsSNVw7rqqdCZU8PMv78/pRax3me9VTzXLym51Iynw
 Pwlz6fotqqagKrIGn9B8Hu5iVgyfuD228WtD/g0X0Ot70vcibpdcdVUDvsLnipsPrWdZ
 hI/bvkP98/5depz+A9SwVHNyOlYZNBsl0TYmTCL69aHqN2NsFDN9ZQ8KPf44VDvYVS+8
 MZ4g==
X-Gm-Message-State: APjAAAXUYOeDeVgQuAUFk5sE7et/uAxvmPCgcvXUdAwVmBAfMFTNneTn
 u0aiICBABZ/mg4WZQwZeWC8=
X-Google-Smtp-Source: APXvYqynM7DSjiVb/K1cuj10GL5Qx3F6jhpXa1DeMyONRynlWzC2QHu0QHM7eFjM/sX/8EKaoo1NZQ==
X-Received: by 2002:ac8:163c:: with SMTP id p57mr3289416qtj.106.1578674734400; 
 Fri, 10 Jan 2020 08:45:34 -0800 (PST)
Received: from quaco.ghostprotocols.net ([179.97.37.151])
 by smtp.gmail.com with ESMTPSA id g81sm1091649qkb.70.2020.01.10.08.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 08:45:33 -0800 (PST)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id BCA6F40DFD; Fri, 10 Jan 2020 13:45:31 -0300 (-03)
Date: Fri, 10 Jan 2020 13:45:31 -0300
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v4 2/9] perf/core: open access for CAP_SYS_PERFMON
 privileged process
Message-ID: <20200110164531.GA2598@kernel.org>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <c93309dc-b920-f5fa-f997-e8b2faf47b88@linux.intel.com>
 <20200108160713.GI2844@hirez.programming.kicks-ass.net>
 <cc239899-5c52-2fd0-286d-4bff18877937@linux.intel.com>
 <20200110140234.GO2844@hirez.programming.kicks-ass.net>
 <20200111005213.6dfd98fb36ace098004bde0e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200111005213.6dfd98fb36ace098004bde0e@kernel.org>
X-Url: http://acmel.wordpress.com
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
 Alexey Budankov <alexey.budankov@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Serge Hallyn <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Sat, Jan 11, 2020 at 12:52:13AM +0900, Masami Hiramatsu escreveu:
> On Fri, 10 Jan 2020 15:02:34 +0100 Peter Zijlstra <peterz@infradead.org> wrote:
> > Again, this only allows attaching to previously created kprobes, it does
> > not allow creating kprobes, right?

> > That is; I don't think CAP_SYS_PERFMON should be allowed to create
> > kprobes.

> > As might be clear; I don't actually know what the user-ABI is for
> > creating kprobes.

> There are 2 ABIs nowadays, ftrace and ebpf. perf-probe uses ftrace interface to
> define new kprobe events, and those events are treated as completely same as
> tracepoint events. On the other hand, ebpf tries to define new probe event
> via perf_event interface. Above one is that interface. IOW, it creates new kprobe.

Masami, any plans to make 'perf probe' use the perf_event_open()
interface for creating kprobes/uprobes?

- Arnaldo
