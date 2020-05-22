Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 442DF1DDCFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 04:03:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SqX03FslzDqx6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 12:03:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=WPC8+ucV; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SqTC1Rr3zDqwj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 12:00:46 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id f13so9395185qkh.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 19:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7VXhRvEZ7AZfj1IqAb7ZWt33FE0XL8kfxx31Yf9Ecuw=;
 b=WPC8+ucVfXY+1tpUgjR07S2UMMPw8h0/8LAGLBS8Znu29ayxkCmGkQpm2rNlHp681Y
 iEFsGHCj5SpuQl0hdoK/kk1vRohCokt3UVU3OzqsF9AVFV7syE3vg5b9x7AtbqhMBOFh
 9VEPHONSG6IIavPXa3Wew7CX9MQHd+PzBOqQTKrZ2ej1Ok4DN3jqMad6rxuXVfI+tVvY
 VXONL7CzMbE6YarfqQ5be2TdAMby/zZXM2bF4ErdDFiS7uZMST40ntdFNm6UnAmd11qW
 YEWD8OXyEjMIgKs0hTUa13Sm+ogq/8Y9p1nmkbUBzUBUQr0L6zcqsHdfPakA4caM8sR5
 /AvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7VXhRvEZ7AZfj1IqAb7ZWt33FE0XL8kfxx31Yf9Ecuw=;
 b=N0u/EIlMQO1kUisactYOMqLmV7bgalliiOcAbB7k69k7c6Ay/nxDPHQWxEGHCKR8En
 VkvHF3Az3FXmm4VQlkmiArXb5Btn5n+ALMAQZPttAGElcfcu5lJ/FVTJWA5fASuoS1+h
 JCjURg5zddn1KMW+V1tBs+hlqH5HjvMz68+wUCLUau533qGjQ0S9W+LBwFuDkwaSKRUO
 2Qht9vP4Z4x1dVQZNXwuEAuBwbOPgcwkzabkKtAQ4pEKTQcCmY0LwERrzTckS5rxcLcq
 ceN/BKAeJ334hN1CROxZgnKQ6zVP0EIhRFDYkD8U50h4nE8Vgp3CwpY866wS8trBBSRW
 IzBA==
X-Gm-Message-State: AOAM531DtDIaUg1Nc2RjXWxyKd7ess3HODWt03dQJ2GnAwVRUkwgo45s
 jHOi3AkGZ8wW+KWbXr2VQKyYYQ==
X-Google-Smtp-Source: ABdhPJxQxaBQ20712JGspAdfjSIEw8SaV9KRIZqgplkYJhLE0+UteD9xq8e8wbquN7K3Y9bym+aY+Q==
X-Received: by 2002:a05:620a:a53:: with SMTP id
 j19mr13148335qka.183.1590112843194; 
 Thu, 21 May 2020 19:00:43 -0700 (PDT)
Received: from ovpn-112-192.phx2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id s201sm949467qka.8.2020.05.21.19.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 19:00:42 -0700 (PDT)
Date: Thu, 21 May 2020 22:00:33 -0400
From: Qian Cai <cai@lca.pw>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200522020033.GA17093@ovpn-112-192.phx2.redhat.com>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521093938.GG325280@hirez.programming.kicks-ass.net>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 11:39:38AM +0200, Peter Zijlstra wrote:
> On Thu, May 21, 2020 at 02:40:36AM +0200, Frederic Weisbecker wrote:
> > On Wed, May 20, 2020 at 02:50:56PM +0200, Peter Zijlstra wrote:
> > > On Tue, May 19, 2020 at 11:58:17PM -0400, Qian Cai wrote:
> > > > Just a head up. Repeatedly compiling kernels for a while would trigger
> > > > endless soft-lockups since next-20200519 on both x86_64 and powerpc.
> > > > .config are in,
> > > 
> > > Could be 90b5363acd47 ("sched: Clean up scheduler_ipi()"), although I've
> > > not seen anything like that myself. Let me go have a look.
> > > 
> > > 
> > > In as far as the logs are readable (they're a wrapped mess, please don't
> > > do that!), they contain very little useful, as is typical with IPIs :/
> > > 
> > > > [ 1167.993773][    C1] WARNING: CPU: 1 PID: 0 at kernel/smp.c:127
> > > > flush_smp_call_function_queue+0x1fa/0x2e0
> > 
> > So I've tried to think of a race that could produce that and here is
> > the only thing I could come up with. It's a bit complicated unfortunately:
> 
> This:
> 
> >         smp_call_function_single_async() {             smp_call_function_single_async() {
> >             // verified csd->flags != CSD_LOCK             // verified csd->flags != CSD_LOCK
> >             csd->flags = CSD_LOCK                          csd->flags = CSD_LOCK
> 
> concurrent smp_call_function_single_async() using the same csd is what
> I'm looking at as well. Now in the ILB case there is an easy cure:
> 
> (because there is only a single ilb target)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 01f94cf52783..b6d8a7b991f0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10033,7 +10033,7 @@ static void kick_ilb(unsigned int flags)
>  	 * is idle. And the softirq performing nohz idle load balance
>  	 * will be run before returning from the IPI.
>  	 */
> -	smp_call_function_single_async(ilb_cpu, &cpu_rq(ilb_cpu)->nohz_csd);
> +	smp_call_function_single_async(ilb_cpu, &this_rq()->nohz_csd);
>  }
>  
>  /*
> 
> Qian, can you give that a spin?

Running for a few hours now. It works fine.
