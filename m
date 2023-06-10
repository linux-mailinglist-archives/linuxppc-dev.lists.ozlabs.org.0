Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CFC72AEF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 23:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdrGB16ggz3fKR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 07:10:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mIxLEuMf;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=euWjH8gK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mIxLEuMf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=euWjH8gK;
	dkim-atps=neutral
X-Greylist: delayed 3613 seconds by postgrey-1.36 at boromir; Sun, 11 Jun 2023 07:10:10 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdrFG425lz3dyJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 07:10:10 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686431402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OrTOePfREEciLtXfuUl8hDBbpqxfuVX9i8krldtKOAY=;
	b=mIxLEuMfpk7GLDEgCpK9RyCRztksQ2KR3hAfMuUhrBxRYYleSd5DnOtm7ueortcishYe19
	1S3NCaeWweymMMTeajLKGDRPfP6A7h+cWuuhPVjqs7xab9LdbEqCXXM9RS68w8R9XqB9BZ
	4PIW8qLbXp5ciqzVsEtE8EjSTrCKdENU4gb1cv+to6rZdVsEOkMBGKWAnh98pBszQtxgnU
	8lDkey+xZts7l6QsZXD7ia8QVzlPSzO5t8Y2MCiAUCK2vDl0fvFbTRyc46SewJAEaTFzZn
	nix/DX0ipblz/7S2xlwnlD01kFvYdf0DBWi6eAE0b/adb7YBwsNvqK4ZKPcZYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686431402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OrTOePfREEciLtXfuUl8hDBbpqxfuVX9i8krldtKOAY=;
	b=euWjH8gK9tkmFZKPMC2SdGkEjWDHeY4U+j35rBJnG7zt2xQX5s8P3nel+NXuc2olh8obYc
	hsPx70kBtP45khAg==
To: Laurent Dufour <ldufour@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] powerpc: Add HOTPLUG_SMT support
In-Reply-To: <6e86aedb-9349-afd4-0bcb-1949e828f997@linux.ibm.com>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-8-mpe@ellerman.id.au>
 <5752a488-be54-61a0-6d18-647456abc4ee@linux.ibm.com>
 <6e86aedb-9349-afd4-0bcb-1949e828f997@linux.ibm.com>
Date: Sat, 10 Jun 2023 23:10:02 +0200
Message-ID: <87h6rf81n9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01 2023 at 18:19, Laurent Dufour wrote:
> @@ -435,12 +435,17 @@ void __init cpu_smt_disable(bool force)
>   * The decision whether SMT is supported can only be done after the full
>   * CPU identification. Called from architecture code.
>   */
> -void __init cpu_smt_check_topology(unsigned int num_threads)
> +void __init cpu_smt_check_topology(unsigned int num_threads,
> +				   unsigned int max_threads)
>  {
>  	if (!topology_smt_supported())
>  		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
>  
> -	cpu_smt_max_threads = num_threads;
> +	cpu_smt_max_threads = max_threads;
> +
> +	WARN_ON(num_threads > max_threads);
> +	if (num_threads > max_threads)
> +		num_threads = max_threads;

This does not work. The call site does:

> +	cpu_smt_check_topology(smt_enabled_at_boot, threads_per_core);

smt_enabled_at_boot is 0 when 'smt-enabled=off', which is not what the
hotplug core expects. If SMT is disabled it brings up the primary
thread, which means cpu_smt_num_threads = 1.

This needs more thoughts to avoid a completely inconsistent duct tape
mess.

Btw, the command line parser and the variable smt_enabled_at_boot being
type int allow negative number of threads too... Maybe not what you want.

Thanks,

        tglx




