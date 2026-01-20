Return-Path: <linuxppc-dev+bounces-16074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP9mID6ub2nxEwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:33:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827AF47A16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 17:33:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwXtg0tW8z2xS2;
	Wed, 21 Jan 2026 03:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768926779;
	cv=none; b=ZiL6dDu+oS0XkF/wOQ4hrqM7Cw6IBdjZAA8B8fwO2m/mkgg2kAwCKXEB95n2z65K3WH/BfPNa4p2f+wvqT3lXMV+Qrapz93F8Z+8DCYdUZayLEcZoFAUr+9icWDpTb+DVvSx3S9m861aXeWv5U09a4mMPY1HMfxFj9+b2wXQy/gOkqruIwu5xmUDb5pDsqMFCdSCRS2DMXCaWqkWz3C1BByZPr1kbpkNAknoktj+eV3BqMk3hSprm7L78lpH2a+kwKmD8bWoi3RRDhRZgI+LQMI0RxNWm744au2n+ghhlE/QRM4WgWAZh3Ih9PQZUstwe3sHWypuEENLXhOB/34ozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768926779; c=relaxed/relaxed;
	bh=pzCqaWRw4l8YZiXRlEaKsY2UZqzEryF7b+9WjJwCLVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/ELUvUGMKXJDhRla5qie3U6yzo/XLAO3Q4eaJmJjpyoOaZuLS+pdTq50ZC/5RW2B3mdMiN4WYG5RVBCbqXBnSiM/MS/4yo/MohQDK6mQU1h/XtE5Co3sG1SHnYrmU49/wMgd0WWj71V5D1fAWQFEc/jIaZtsc98TW1fHpGUN1KDV+MP/9rFzJABfxr8hrjOgsT6Ku4hC8kasM+i4fKM34SxNvSGfPe1rf9EAIRKIrl3ciVPCyxNM7CR88n/Yc5Rf8YcVtYaBCj9+1BCjmoPY4Q1rZCfIQa5AhlbzcDs0Qn5IVpSXHuI4Rs26p+lzEhEUrvtB8N4gzbh6wXZzVa4IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwXtd73pvz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 03:32:56 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B3771476;
	Tue, 20 Jan 2026 08:32:16 -0800 (PST)
Received: from [10.1.39.200] (XHFQ2J9959.cambridge.arm.com [10.1.39.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFE823F694;
	Tue, 20 Jan 2026 08:32:18 -0800 (PST)
Message-ID: <785a7d90-babe-43af-93a6-c220c1877bcf@arm.com>
Date: Tue, 20 Jan 2026 16:32:17 +0000
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
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Content-Language: en-GB
To: Kees Cook <kees@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
 <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:dave.hansen@intel.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:david.laight.linux@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,linutronix.de,redhat.com,alien8.de,linux.intel.com,arndb.de,zx2c4.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16074-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,arm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 827AF47A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/01/2026 16:44, Kees Cook wrote:
> 
> 
> On January 19, 2026 8:00:00 AM PST, Dave Hansen <dave.hansen@intel.com> wrote:
>> On 1/19/26 05:01, Ryan Roberts wrote:
>>> x86 (AWS Sapphire Rapids):
>>> +-----------------+--------------+-------------+---------------+
>>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
>>> |                 |              | rndstack-on |               |
>>> |                 |              |             |               |
>>> +=================+==============+=============+===============+
>>> | syscall/getpid  | mean (ns)    |  (R) 13.32% |     (R) 4.60% |
>>> |                 | p99 (ns)     |  (R) 13.38% |    (R) 18.08% |
>>> |                 | p99.9 (ns)   |      16.26% |    (R) 19.38% |
>>
>> Like you noted, this is surprising. This would be a good thing to make
>> sure it goes in very early after -rc1 and gets plenty of wide testing.
> 
> Right, we are pretty late in the dev cycle (rc6). It would be prudent to get this into -next after the coming rc1 (1 month from now).
> 
> On the other hand, the changes are pretty "binary" in the sense that mistakes should be VERY visible right away. Would it be better to take this into -next immediately instead?

I don't think this question was really addressed to me, but I'll give my opinion
anyway; I agree it's pretty binary - it will either work or it will explode.
I've tested on arm64 and x86_64 so I have high confidence that it works. If you
get it into -next ASAP it has 3 weeks to soak before the merge window opens
right? (Linus said he would do an -rc8 this cycle). That feels like enough time
to me. But it's your tree ;-)

Thanks,
Ryan


> 
>> But I don't see any problems with the approach, and the move to common
>> code looks like a big win as well:
> 
> Agreed; I think it's looking great.
> 


