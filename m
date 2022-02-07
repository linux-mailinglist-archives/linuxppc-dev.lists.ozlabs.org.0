Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015E4AC33A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 16:28:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsqlr0lR3z3cNZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 02:28:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=xgpx=sw=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsqhC6VMvz3Wtp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 02:24:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81594614A3;
 Mon,  7 Feb 2022 15:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78B2C340F0;
 Mon,  7 Feb 2022 15:24:55 +0000 (UTC)
Date: Mon, 7 Feb 2022 10:24:54 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/3] powerpc/ftrace: Override
 ftrace_location_lookup() for MPROFILE_KERNEL
Message-ID: <20220207102454.41b1d6b5@gandalf.local.home>
In-Reply-To: <fadc5f2a295d6cb9f590bbbdd71fc2f78bf3a085.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <fadc5f2a295d6cb9f590bbbdd71fc2f78bf3a085.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>, Jiri Olsa <jolsa@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon,  7 Feb 2022 12:37:21 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -1137,3 +1137,14 @@ char *arch_ftrace_match_adjust(char *str, const char *search)
>  		return str;
>  }
>  #endif /* PPC64_ELF_ABI_v1 */
> +
> +#ifdef CONFIG_MPROFILE_KERNEL
> +unsigned long ftrace_location_lookup(unsigned long ip)
> +{
> +	/*
> +	 * Per livepatch.h, ftrace location is always within the first
> +	 * 16 bytes of a function on powerpc with -mprofile-kernel.
> +	 */
> +	return ftrace_location_range(ip, ip + 16);

I think this is the wrong approach for the implementation and error prone.

> +}
> +#endif
> -- 

What I believe is a safer approach is to use the record address and add the
range to it.

That is, you know that the ftrace modification site is a range (multiple
instructions), where in the ftrace infrastructure, only one ip represents
that range. What you want is if you pass in an ip, and that ip is within
that range, you return the ip that represents that range to ftrace.

It looks like we need to change the compare function in the bsearch.

Perhaps add a new macro to define the size of the range to be searched,
instead of just using MCOUNT_INSN_SIZE? Then we may not even need this new
lookup function?

static int ftrace_cmp_recs(const void *a, const void *b)
{
	const struct dyn_ftrace *key = a;
	const struct dyn_ftrace *rec = b;

	if (key->flags < rec->ip)
		return -1;
	if (key->ip >= rec->ip + ARCH_IP_SIZE)
		return 1;
	return 0;
}

Where ARCH_IP_SIZE is defined to MCOUNT_INSN_SIZE by default, but an arch
could define it to something else, like 16.

Would that work for you, or am I missing something?

-- Steve
