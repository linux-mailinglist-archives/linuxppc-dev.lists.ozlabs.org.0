Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8814A9FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 20:35:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SxZs3FfrzDqg7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 04:35:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=fdox=ur=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SxX71zj6zDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 04:32:38 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01DB32084B;
 Tue, 18 Jun 2019 18:32:35 +0000 (UTC)
Date: Tue, 18 Jun 2019 14:32:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/7] powerpc/ftrace: Update ftrace_location() for
 powerpc -mprofile-kernel
Message-ID: <20190618143234.78539805@gandalf.local.home>
In-Reply-To: <1560881840.vz9llflvnf.naveen@linux.ibm.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <186656540d3e6225abd98374e791a13d10d86fab.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190618114509.5b1acbe5@gandalf.local.home>
 <1560881411.p0i6a1dkwk.naveen@linux.ibm.com>
 <1560881840.vz9llflvnf.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jun 2019 23:53:11 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> Naveen N. Rao wrote:
> > Steven Rostedt wrote:  
> >> On Tue, 18 Jun 2019 20:17:04 +0530
> >> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
> >>   
> >>> @@ -1551,7 +1551,7 @@ unsigned long ftrace_location_range(unsigned long start, unsigned long end)
> >>>  	key.flags = end;	/* overload flags, as it is unsigned long */
> >>>  
> >>>  	for (pg = ftrace_pages_start; pg; pg = pg->next) {
> >>> -		if (end < pg->records[0].ip ||
> >>> +		if (end <= pg->records[0].ip ||  
> >> 
> >> This breaks the algorithm. "end" is inclusive. That is, if you look for
> >> a single byte, where "start" and "end" are the same, and it happens to
> >> be the first ip on the pg page, it will be skipped, and not found.  
> > 
> > Thanks. It looks like I should be over-riding ftrace_location() instead.  
> > I will update this patch.  
> 
> I think I will have ftrace own the two instruction range, regardless of 
> whether the preceding instruction is a 'mflr r0' or not. This simplifies 
> things and I don't see an issue with it as of now. I will do more 
> testing to confirm.
> 
> - Naveen
> 
> 
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -951,6 +951,16 @@ void arch_ftrace_update_code(int command)
>  }
>  
>  #ifdef CONFIG_MPROFILE_KERNEL
> +/*
> + * We consider two instructions -- 'mflr r0', 'bl _mcount' -- to be part
> + * of ftrace. When checking for the first instruction, we want to include
> + * the next instruction in the range check.
> + */
> +unsigned long ftrace_location(unsigned long ip)
> +{
> +	return ftrace_location_range(ip, ip + MCOUNT_INSN_SIZE);
> +}
> +
>  /* Returns 1 if we patched in the mflr */
>  static int __ftrace_make_call_prep(struct dyn_ftrace *rec)
>  {
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 21d8e201ee80..122e2bb4a739 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -1573,7 +1573,7 @@ unsigned long ftrace_location_range(unsigned long start, unsigned long end)
>   * the function tracer. It checks the ftrace internal tables to
>   * determine if the address belongs or not.
>   */
> -unsigned long ftrace_location(unsigned long ip)
> +unsigned long __weak ftrace_location(unsigned long ip)
>  {
>  	return ftrace_location_range(ip, ip);
>  }

Actually, instead of making this a weak function, let's do this:


In include/ftrace.h:

#ifndef FTRACE_IP_EXTENSION
# define FTRACE_IP_EXTENSION	0
#endif


In arch/powerpc/include/asm/ftrace.h

#define FTRACE_IP_EXTENSION	MCOUNT_INSN_SIZE


Then we can just have:

unsigned long ftrace_location(unsigned long ip)
{
	return ftrace_location_range(ip, ip + FTRACE_IP_EXTENSION);
}

-- Steve
