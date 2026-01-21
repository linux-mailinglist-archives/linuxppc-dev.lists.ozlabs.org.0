Return-Path: <linuxppc-dev+bounces-16102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAo6BhSwcGmKZAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 11:53:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A4B558C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 11:53:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx1J01Wflz2yFg;
	Wed, 21 Jan 2026 21:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768992784;
	cv=none; b=Zs31MCBSg0pEeEP7M/Vn5+e+nKDKaXBd65HlS+0fnfJj7tG7Y2aLXXAzBeLGp6HMomLiQrXb6aU9ASXlLO5YEHk7iF4Ym5zlODFHmxrD2X9JfaSrixDcyJ8WHZuBnZYlXhA5NNsD/KjOLl8UapD86PsH1CtVrxO7raOfoIt1BHbVkBwIKEs0WVZFrK35SzgZQgRW6P5PKiCe2miRhFaPhYJbUHsV8s9ONGhQRquiryPE0G1+/1sRUMSMUnc9W4/ugfY87wsMpM9U8RZASy51/oBZxJct3uWNJ6AUZLokY7Crs4i2q2Wu3eBiuAMZmGgr18bKN31jhobkIRFuBVvWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768992784; c=relaxed/relaxed;
	bh=Bhj8EYz+g3zatERB8cbuc1TV6/t3L2pcr7P/WBnmHiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fviBdHYh44ruAl01P70j1BGvlEguD820/7UV69nLpc77pZOUeWhotg2cLcpCa7nK9xNhg6xGwEhaNGh/TADEZM3YhAPHfTk0Xanuv7GbTilvneM63CnVwe3CHebwPIxCTSpS2VjHmh4f4D/bEUKX2m3j5wnf/JQ3mLp/Oi8A78dM0oz8wgdKVEpDjns5lnOSJ1hJO8By3gi39Hc3eb4ZiXMEyjtN+ILQzxaVwh6ZNJC3pmz4rxtp3XMoPAVyTBqEgc7VdE7QiiUysSQ4xtZZJNLsV5NRUwsyO2Y32bFf6eqYuDzzNATzyAn5gJnQQlpzTNCBGLZULsLYeyRpjOxXuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx1Hy3gtJz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 21:53:00 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6CE1476;
	Wed, 21 Jan 2026 02:52:21 -0800 (PST)
Received: from [10.1.25.175] (XHFQ2J9959.cambridge.arm.com [10.1.25.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02DD53F632;
	Wed, 21 Jan 2026 02:52:22 -0800 (PST)
Message-ID: <46c7d109-b076-4bb3-9e6e-36c34c546c20@arm.com>
Date: Wed, 21 Jan 2026 10:52:21 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
 <202601210752.6Nsv9et9-lkp@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <202601210752.6Nsv9et9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:david.laight.linux@gmail.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[intel.com,arm.com,kernel.org,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,linutronix.de,redhat.com,alien8.de,linux.intel.com,arndb.de,zx2c4.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16102-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,01.org:url,arm.com:mid]
X-Rspamd-Queue-Id: 92A4B558C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 23:50, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
>>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section

Hmm, clearly Dave was correct not to rush this through... yuck. I'll take a
look, but I guess there is no rush if this won't go into -next until shortly
after -rc1.

Thanks,
Ryan


