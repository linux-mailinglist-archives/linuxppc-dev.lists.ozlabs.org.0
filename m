Return-Path: <linuxppc-dev+bounces-17577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FBqHqjzpmmgawAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 15:43:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8AF1F1B93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 15:43:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQJTG0mj3z3bnr;
	Wed, 04 Mar 2026 01:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772549025;
	cv=none; b=OHj3ScFqkx/opwK8jK6dehkrWakfZkigVxor8uttzBh0WMN+OCevmP5EYtDlTQpa2af51MW7KcgMh18WitFtDPpa7ZaoEIQHbkA6xNKTMxZWTqPYGjrxQzGR9Cl1smJpO5cwSgrXJ2lXAEHZQV4SpQhzFd/XZQ7kQtc2RuZS8Pb5TAWiSCjWEOUDSHAUd0F4XzYJ9DqU4D7tlReSihP2jSqtEBbdVcQCoL4vGpwISjIzfTg6lQOiBfWcnb6nQJPSVCotag8KDKt8MUcn/jI+/7GdSiczZX7HKeUbwHy57YdZXDdcHQQcnbIrfD6tvweIXhoGmerqWfoTV0VU1am4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772549025; c=relaxed/relaxed;
	bh=l9/R9jHGK3WkzvY5Ld13Rqnr3iuMuxtEV3nciTD+gEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aay5eb7blwUCT1b9HZbmIkt7xjasqkqR7IAYHEOOKlWKlLnxrzKj+Dg3nDZQ3pEpWhg0/BRlIHAluHUzEKm44lt7C89n1U0rD5zXVZ4PjQ0XAciO8fotF7KqOxyRqHKKgQc8Jurgrz6UWVE7ZtAz8zG2SATMpiUhnb8BsC8a5yzlkosfKT94KGV6eq7BUY7jHCO+YAc+7x4OKdsvQG/3nWsqkuH5PS+0dEfvwCDzpMg+XbgsA5pMBoEVTGlXdQTJFFc+iw8tYDaTNiIQtnS9vFPhez9DvhWo9P7OrBRfciLMWhlmc2286UWqcyejdpIGz4tlEpRudENA1b4rmJRe5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQJTD31Trz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:43:42 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D7F4497;
	Tue,  3 Mar 2026 06:43:03 -0800 (PST)
Received: from [10.1.31.220] (XHFQ2J9959.cambridge.arm.com [10.1.31.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12EE23F694;
	Tue,  3 Mar 2026 06:43:05 -0800 (PST)
Message-ID: <8c799a17-56e3-4ea4-84a2-b878337bddfd@arm.com>
Date: Tue, 3 Mar 2026 14:43:04 +0000
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
To: Thomas Gleixner <tglx@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-4-ryan.roberts@arm.com> <87ecmcwjh9.ffs@tglx>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <87ecmcwjh9.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 8A8AF1F1B93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17577-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,redhat.com,alien8.de,linux.intel.com,arndb.de,zx2c4.com,gmail.com];
	FORGED_SENDER(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:david.laight.linux@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.825];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 22/02/2026 21:34, Thomas Gleixner wrote:
> On Mon, Jan 19 2026 at 13:01, Ryan Roberts wrote:
>> I tested an earlier version of this change on x86 bare metal and it
>> showed a smaller but still significant improvement. The bare metal
>> system wasn't available this time around so testing was done in a VM
>> instance. I'm guessing the cost of rdtsc is higher for VMs.
> 
> No it's not, unless the hypervisor traps RDTSC, which would be insane as
> that would cause massive regressions all over the place.
> 
> So guessing is not really helpful if you want to argue performance.

Sorry for the slow response. I no longer have access to a recent bare metal x86
system that I can do performance testing on. All I have is the Sapphire Rapids
(m7i.24xlarge) VM.

My original testing was on bare metal Sapphire Rapids (same number of CPUs and
RAM as the VM).

Just to be clear, these are the results I got with bare metal vs vm. Negative is
an improvement (less time). (I)/(R) means statistically significant
improvement/regression:

+-----------------+--------------+---------------+---------------+
| Benchmark       | Result Class |        x86_64 |        x86_64 |
|                 |              |    bare metal |            VM |
+=================+==============+===============+===============+
| syscall/getpid  | mean (ns)    |    (I) -7.69% |   (I) -17.65% |
|                 | p99 (ns)     |         4.14% |   (I) -24.41% |
|                 | p99.9 (ns)   |         2.68% |   (I) -28.52% |
+-----------------+--------------+---------------+---------------+
| syscall/getppid | mean (ns)    |    (I) -5.98% |   (I) -19.24% |
|                 | p99 (ns)     |        -3.11% |   (I) -25.03% |
|                 | p99.9 (ns)   |     (R) 9.84% |   (I) -28.17% |
+-----------------+--------------+---------------+---------------+
| syscall/invalid | mean (ns)    |    (I) -6.94% |   (I) -18.56% |
|                 | p99 (ns)     |    (I) -5.57% |   (I) -20.06% |
|                 | p99.9 (ns)   |    (R) 10.53% |   (I) -25.04% |
+-----------------+--------------+---------------+---------------+

So both sets of results represent an improvement, I would say.

Given the level of review that the series has had, I propose to repost today,
then hopefully Kees will be happy to put it in his branch so that it can get
plenty of linux-next soak testing and if there are any x86 regressions lurking,
hopefully ZeroDay will spot them?

Thanks,
Ryan


> 
> Thanks,
> 
>         tglx


