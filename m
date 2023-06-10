Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52472AF02
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 23:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdrcs1R1wz3fPX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 07:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=coADTZ7q;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=j7xDEVqZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=coADTZ7q;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=j7xDEVqZ;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdrby5CTTz3dyq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 07:26:22 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686432379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yScnQOsFVFhAhPVOHHu3ci35foOf2+5E4xZ5YAm5XhY=;
	b=coADTZ7qfhPfLldpz+STOlj7Do5x0TVF1dP4MZ/rUHEcWHGjPtpMbiiAJlgIAuwZKlAX2T
	3G2Fs+5jgnIypYOI6hmSHed8VmCTRKcJaavZmyy1aDPzLGA7EXTSMinyplTQ1ocx+WoQvL
	gHc2ylJ79EFwiIjk5poHaxNtMiWfNknFdgpizy/BHMkdcG0zADdpWQazM8R1x8uNd+i9kN
	EnKM8cIUisB5GOCTKqWAVGoiebkH47XDuP/p+5WOBYkMi4GMK51xFetbIBt3wSDEOjVCzk
	qLCguyPXpUqNIEzmsxDtpp4WcFGJPGMzFZErIrVX9d5vvDdzNJki3vf0Ao33iQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686432379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yScnQOsFVFhAhPVOHHu3ci35foOf2+5E4xZ5YAm5XhY=;
	b=j7xDEVqZ+LGNXQ5jr0ZCDGlmhcYuV11CryBOh5jCl0ZoG+uuXSGTwtdn3VrotDAe75pkh+
	530E0wvxTZ+ypaCQ==
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] cpu/SMT: Store the current/max number of threads
In-Reply-To: <20230524155630.794584-3-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-3-mpe@ellerman.id.au>
Date: Sat, 10 Jun 2023 23:26:18 +0200
Message-ID: <87fs6z80w5.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
>  #ifdef CONFIG_HOTPLUG_SMT
>  enum cpuhp_smt_control cpu_smt_control __read_mostly = CPU_SMT_ENABLED;
> +static unsigned int cpu_smt_max_threads __ro_after_init;
> +unsigned int cpu_smt_num_threads;

Why needs this to be global? cpu_smt_control is pointlessly global already.

>  void __init cpu_smt_disable(bool force)
>  {
> @@ -433,10 +435,18 @@ void __init cpu_smt_disable(bool force)
>   * The decision whether SMT is supported can only be done after the full
>   * CPU identification. Called from architecture code.
>   */
> -void __init cpu_smt_check_topology(void)
> +void __init cpu_smt_check_topology(unsigned int num_threads)
>  {
>  	if (!topology_smt_supported())
>  		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
> +
> +	cpu_smt_max_threads = num_threads;
> +
> +	// May already be disabled by nosmt command line parameter
> +	if (cpu_smt_control != CPU_SMT_ENABLED)
> +		cpu_smt_num_threads = 1;
> +	else
> +		cpu_smt_num_threads = num_threads;

Taking Laurents findings into account this should be something like
the incomplete below.

x86 would simply invoke cpu_smt_set_num_threads() with both arguments as
smp_num_siblings while PPC can funnel its command line parameter through
the num_threads argument.

Thanks,

        tglx
---
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -414,6 +414,8 @@ void __weak arch_smt_update(void) { }
 
 #ifdef CONFIG_HOTPLUG_SMT
 enum cpuhp_smt_control cpu_smt_control __read_mostly = CPU_SMT_ENABLED;
+static unsigned int cpu_smt_max_threads __ro_after_init;
+static unsigned int cpu_smt_num_threads = UINT_MAX;
 
 void __init cpu_smt_disable(bool force)
 {
@@ -427,24 +429,31 @@ void __init cpu_smt_disable(bool force)
 		pr_info("SMT: disabled\n");
 		cpu_smt_control = CPU_SMT_DISABLED;
 	}
+	cpu_smt_num_threads = 1;
 }
 
 /*
  * The decision whether SMT is supported can only be done after the full
  * CPU identification. Called from architecture code.
  */
-void __init cpu_smt_check_topology(void)
+void __init cpu_smt_set_num_threads(unsigned int max_threads, unsigned int num_threads)
 {
-	if (!topology_smt_supported())
+	if (max_threads == 1)
 		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
-}
 
-static int __init smt_cmdline_disable(char *str)
-{
-	cpu_smt_disable(str && !strcmp(str, "force"));
-	return 0;
+	cpu_smt_max_threads = max_threads;
+
+	/*
+	 * If SMT has been disabled via the kernel command line or SMT is
+	 * not supported, set cpu_smt_num_threads to 1 for consistency.
+	 * If enabled, take the architecture requested number of threads
+	 * to bring up into account.
+	 */
+	if (cpu_smt_control != CPU_SMT_ENABLED)
+		cpu_smt_num_threads = 1;
+	else if (num_threads < cpu_smt_num_threads)
+		cpu_smt_num_threads = num_threads;
 }
-early_param("nosmt", smt_cmdline_disable);
 
 static inline bool cpu_smt_allowed(unsigned int cpu)
 {
@@ -463,6 +472,13 @@ static inline bool cpu_smt_allowed(unsig
 	return !cpumask_test_cpu(cpu, &cpus_booted_once_mask);
 }
 
+static int __init smt_cmdline_disable(char *str)
+{
+	cpu_smt_disable(str && !strcmp(str, "force"));
+	return 0;
+}
+early_param("nosmt", smt_cmdline_disable);
+
 /* Returns true if SMT is not supported of forcefully (irreversibly) disabled */
 bool cpu_smt_possible(void)
 {
