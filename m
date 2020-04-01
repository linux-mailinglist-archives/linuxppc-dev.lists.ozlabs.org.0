Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB719A8D9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:49:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48shHF0q1HzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=HqlQzdOT; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sgnM2rWSzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:26:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YYo5EKAQ9jeZ5u7WqOrUteHoNVI7yscIqPfvElnPohU=; b=HqlQzdOTso81BOo6+3TntCLG5T
 +mklMvBXZ3e9he4xGmkeNbi5t4ugfq8TrkzZhGPidhsp4gu1JaVtXXetqw7yhu4LHwDN7l1kw8AK4
 SbaSKoUfEejrcmc9QD+nxze0g+FJwnwAJRiPl9XWJBVSuBhQNqbxn1tGUyUaRW1kFRn8P/xQMLP/W
 8wGd/lYGxfnlq0wolb36aIUKGWJ2gNtigsU9cCfadQ6lGbFzAyM+q71bYpiNpgG5y7CBoMsQ//11X
 uvFMcEOTovRgxSdVXgk1LtROyqmNO7W36ElgiDHK6bcqJvUrG+7vId3gUCIH0kInt/u5Eggov+BtQ
 FyrGhJJw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJZdg-000832-JJ; Wed, 01 Apr 2020 09:26:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E7008301631;
 Wed,  1 Apr 2020 11:26:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D34ED29E1FE81; Wed,  1 Apr 2020 11:26:18 +0200 (CEST)
Date: Wed, 1 Apr 2020 11:26:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Leonardo Bras <leonardo@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
Message-ID: <20200401092618.GW20713@hirez.programming.kicks-ass.net>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401000020.590447-1-leonardo@linux.ibm.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 09:00:21PM -0300, Leonardo Bras wrote:
> During a crash, there is chance that the cpus that handle the NMI IPI
> are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> will cause a deadlock. (rtas.lock and printk logbuf_lock as of today)
> 
> This is a problem if the system has kdump set up, given if it crashes
> for any reason kdump may not be saved for crash analysis.
> 
> After NMI IPI is sent to all other cpus, force unlock all spinlocks
> needed for finishing crash routine.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>

> @@ -129,6 +132,13 @@ static void crash_kexec_prepare_cpus(int cpu)
>  	/* Would it be better to replace the trap vector here? */
>  
>  	if (atomic_read(&cpus_in_crash) >= ncpus) {
> +		/*
> +		 * At this point no other CPU is running, and some of them may
> +		 * have been interrupted while holding one of the locks needed
> +		 * to complete crashing. Free them so there is no deadlock.
> +		 */
> +		arch_spin_unlock(&logbuf_lock.raw_lock);
> +		arch_spin_unlock(&rtas.lock);
>  		printk(KERN_EMERG "IPI complete\n");
>  		return;
>  	}

You might want to add a note to your asm/spinlock.h that you rely on
spin_unlock() unconditionally clearing a lock.

This isn't naturally true for all lock implementations. Consider ticket
locks, doing a surplus unlock will wreck your lock state in that case.
So anybody poking at the powerpc spinlock implementation had better know
you rely on this.
