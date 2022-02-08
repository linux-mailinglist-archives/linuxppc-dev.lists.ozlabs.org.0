Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BB4AD952
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 14:17:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtNpy58GJz3bcC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 00:17:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k2Mb2BQl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k2Mb2BQl; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtNpH6D57z301M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 00:17:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B686616D6;
 Tue,  8 Feb 2022 13:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9BFC004E1;
 Tue,  8 Feb 2022 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644326226;
 bh=pyYWSe+Jjk7H9EMWk07P5RtmfXzKKM1LErV2wfS8qKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k2Mb2BQlgKuqbJaDUtjCkPOrmzwYLXU48ytWbBxEOlY5sBc9caCg1cY5DFmj+Q0Q5
 VtQDkm/UyWabPnK13Y4FZilRsArQJb6LvzhbwSWxpiJofz2EMt42FvqfR2U4cXnqCn
 BTgXhYEtoXNWR8IrOUU7SihX8Nkj9aadSVugloSDB7u9GRd8Ffiz2k3PimkHOGfASe
 uJqt0eoPytb+fHeBNjqsLQglRLI37wL6wnK4bxiXNr0Mp1hwRGiAZQ1oKpM6tXESyA
 097YSjs9s2skEMTczes+grTL11i90cg9DB8WePmZayo5N2tdxYiMkfWpn6ZkqSowYM
 KHZR/mL9ePDxw==
Date: Tue, 8 Feb 2022 14:17:03 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: ppc64le: `NOHZ tick-stop error: Non-RCU local softirq work is
 pending, handler #20!!!` when turning off SMT
Message-ID: <20220208131703.GA538566@lothringen>
References: <0baca95b-771f-2217-1098-2d0eee568ea7@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0baca95b-771f-2217-1098-2d0eee568ea7@molgen.mpg.de>
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
Cc: Frederic Weisbecker <fweisbec@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 08, 2022 at 08:32:37AM +0100, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On the POWER8 server IBM S822LC running Ubuntu 21.10, Linux 5.17-rc1+ built
> with
> 
>     $ grep HZ /boot/config-5.17.0-rc1+
>     CONFIG_NO_HZ_COMMON=y
>     # CONFIG_HZ_PERIODIC is not set
>     CONFIG_NO_HZ_IDLE=y
>     # CONFIG_NO_HZ_FULL is not set
>     CONFIG_NO_HZ=y
>     # CONFIG_HZ_100 is not set
>     CONFIG_HZ_250=y
>     # CONFIG_HZ_300 is not set
>     # CONFIG_HZ_1000 is not set
>     CONFIG_HZ=250
> 
> once warned about a NOHZ tick-stop error, when I executed `sudo
> /usr/sbin/ppc64_cpu --smt=off` (so that KVM would work).

I see, so I assume this sets some CPUs offline, right?

> 
> ```
> $ dmesg
> [    0.000000] Linux version 5.17.0-rc1+
> (pmenzel@flughafenberlinbrandenburgwillybrandt.molgen.mpg.de) (Ubuntu clang
> version 13.0.0-2, LLD 13.0.0) #1 SMP Fri Jan 28 17:13:04 CET 2022
> […]
> [271272.030262] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271272.305726] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271272.549790] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271274.885167] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271275.113896] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271275.412902] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271275.625245] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271275.833107] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271276.041391] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> [271277.244880] NOHZ tick-stop error: Non-RCU local softirq work is pending,
> handler #20!!!
> ```

That's IRQ_POLL_SOFTIRQ. The problem here is probably that some of these
softirqs are pending even though ksoftirqd has been parked.

I see there is irq_poll_cpu_dead() that migrates the pending queue once
the CPU is finally dead, so this is well handled.

I'm preparing a patch to fix the warning.

Thanks.
