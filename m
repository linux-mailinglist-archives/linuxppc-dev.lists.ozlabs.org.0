Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 903F93AB6B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5QDG1l1Yz3c32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 00:58:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=default header.b=LtCwpDBN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=LtCwpDBN; dkim-atps=neutral
X-Greylist: delayed 607 seconds by postgrey-1.36 at boromir;
 Fri, 18 Jun 2021 00:58:13 AEST
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5QCn34PLz3bsQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 00:58:12 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 72CD133BA55;
 Thu, 17 Jun 2021 10:47:58 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DhKZCbvlP3-9; Thu, 17 Jun 2021 10:47:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 0B78F33B931;
 Thu, 17 Jun 2021 10:47:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 0B78F33B931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1623941278;
 bh=PLmeUNZK9WR3Sr2WIFWT3Vd6iXIZKutqycMR2Hdur10=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=LtCwpDBN1PTYJi8ZUiyQpNX/3B26iJ4YFHCpUNkxuC/DZxtG3R6gq98F+vllh70f0
 guHwV9++CTJrY4RDnupUW+jaxChkzDohlXWciw2tLcDiWNYXn2xycDnQhQa36ejE6l
 KKldpFqf6Uk5K7tMJhpa6pdzDA+WlEKBzmrHXGLX6LnwfcnIGfSePdTMpU43LAcU77
 UNxM6gZcfhC/2UZ01A4uHToBHCHifVRJtheU6Q8N5MMh9bTFFssD1RjhmX/G84s5on
 ezWOAG3wYMTK1m0vqxL8md2AC8nSYL352pUYY4SjHetyz3Irro/zNq5B22qbECQcNY
 lGpIFbMb3uCgQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mjoObxJ2a_KR; Thu, 17 Jun 2021 10:47:58 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id EE8A133B8A0;
 Thu, 17 Jun 2021 10:47:57 -0400 (EDT)
Date: Thu, 17 Jun 2021 10:47:57 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andy Lutomirski <luto@kernel.org>
Message-ID: <827549827.10547.1623941277868.JavaMail.zimbra@efficios.com>
In-Reply-To: <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF89 (Linux)/8.8.15_GA_4026)
Thread-Topic: membarrier: Rewrite sync_core_before_usermode() and improve
 documentation
Thread-Index: HZuOJZBerHSq1IbJ6WneE0wVP8/5rA==
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jun 15, 2021, at 11:21 PM, Andy Lutomirski luto@kernel.org wrote:

> The old sync_core_before_usermode() comments suggested that a non-icache-syncing
> return-to-usermode instruction is x86-specific and that all other
> architectures automatically notice cross-modified code on return to
> userspace.
> 
> This is misleading.  The incantation needed to modify code from one
> CPU and execute it on another CPU is highly architecture dependent.
> On x86, according to the SDM, one must modify the code, issue SFENCE
> if the modification was WC or nontemporal, and then issue a "serializing
> instruction" on the CPU that will execute the code.  membarrier() can do
> the latter.
> 
> On arm64 and powerpc, one must flush the icache and then flush the pipeline
> on the target CPU, although the CPU manuals don't necessarily use this
> language.
> 
> So let's drop any pretense that we can have a generic way to define or
> implement membarrier's SYNC_CORE operation and instead require all
> architectures to define the helper and supply their own documentation as to
> how to use it.

Agreed. Documentation of the sequence of operations that need to be performed
when cross-modifying code on SMP should be per-architecture. The documentation
of the architectural effects of membarrier sync-core should be per-arch as well.

> This means x86, arm64, and powerpc for now.

And also arm32, as discussed in the other leg of the patchset's email thread.

> Let's also
> rename the function from sync_core_before_usermode() to
> membarrier_sync_core_before_usermode() because the precise flushing details
> may very well be specific to membarrier, and even the concept of
> "sync_core" in the kernel is mostly an x86-ism.

OK

> 
[...]
> 
> static void ipi_rseq(void *info)
> {
> @@ -368,12 +373,14 @@ static int membarrier_private_expedited(int flags, int
> cpu_id)
> 	smp_call_func_t ipi_func = ipi_mb;
> 
> 	if (flags == MEMBARRIER_FLAG_SYNC_CORE) {
> -		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE))
> +#ifndef CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE
> 			return -EINVAL;
> +#else
> 		if (!(atomic_read(&mm->membarrier_state) &
> 		      MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY))
> 			return -EPERM;
> 		ipi_func = ipi_sync_core;
> +#endif

Please change back this #ifndef / #else / #endif within function for

if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE)) {
  ...
} else {
  ...
}

I don't think mixing up preprocessor and code logic makes it more readable.

Thanks,

Mathieu

> 	} else if (flags == MEMBARRIER_FLAG_RSEQ) {
> 		if (!IS_ENABLED(CONFIG_RSEQ))
> 			return -EINVAL;
> --
> 2.31.1

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
