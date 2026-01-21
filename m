Return-Path: <linuxppc-dev+bounces-16103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNoHGWjBcGmKZgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 13:07:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779EB567C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 13:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx2xJ6pR1z2yFg;
	Wed, 21 Jan 2026 23:07:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768997220;
	cv=none; b=YaULbPlUOwHfyd3e2yj+6+hsarff9lLhvOL5+rhi9NYIsgIw7RRn4ydM7Tv47AjfPA5YrDT4H2iLp2gzo4xLhUO9ydAK0lKQ1OfoT6dUixjlxZyPpyGhEkrhRUlDn+ZBQ01NZdKVTVgytrPf8Iq8XrfMk78iVsKjC2utYUEZ17EAq+CXVYx705v365OsB4pvMXylcC7tJ28mVxSrHjESOzsZj0YePVR6px/9WmjsrsJxcEHFNCZJysmUwX6uBhdKcIUV1vfc6CN3UpBc3DDX0286F43EHxAACoCMLhvocR0zE502ULomEn/cd43FrqM2zHn2QUHFC44IsOr9bB2R7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768997220; c=relaxed/relaxed;
	bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mk9cwBwx6LoUy0jLjavvT3JdfyEjVwxkwV3lnblGi2MizEpf+6PQnJJDBK1XqRJ1FR0FPGrix1fqBhnpMMhVkteF9RN4X9tHHG6AR8e1ttFdp5BId4VJlFF3Jje2nlfzpLm+Nq0/cuB0/sqbJOiYWFZjIIRJuB1MFDver+FXAYAHqKlTa4OcdU4/lbFMKkfU2vx6vdoDGs/6h/MKwv4S4MmgKtnflZx8aRySec4ag+Z60wyHQFDpYSRGFyeOcddQQsny+MjHdKcLtnUb/JxyZmg+NG45tkhphl2HB/DZpUh7M0HNtz7R9EwIAuPMstqMzEIcCQc47gDUi9PrwxhMyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gPtA9RNj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gPtA9RNj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx2xG4TGDz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 23:06:57 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b6f59c4f5so7413095e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 04:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768997213; x=1769602013; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=gPtA9RNjo8cZivPCUZU192NQPuusocoYxIwr1H4QhOdgTXBd6U2+68PmtcIfQhDSsH
         pqdcJ7Y5esG8LHrqsqZlz/t35f4q6tzPl4d0uCgRHZ6KH3E92IhX4RS2xnzoofJ0rOOi
         20QqXW88WmO0+i2e1Pv4WIa/FDb1v0dRMicY/r0/K/g89AxPy0W+nv43nxRUW54aimRK
         UmQVJa8QXOrYacENIOR2N1S8TyJ6tM1Vo/Yw6HO3QEvNlqZ8otx+E/DWnDWXp2iuUgES
         A4m6OpY/PXqWAKmyU80BBaZqFgq9jMP9rBPtNMh/O/A/Jy2Jjyf5S6nomlgb+KssJ6u4
         rBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768997213; x=1769602013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=FTYKX3Soulov7XZaZ/xOp6Tiw9MZFxB4JDLC8NwxvcGntqDZw6UZgrst1e0zVEWgUx
         9yROE1XIKlZorBvJpBvF8Tem8RdeH2hI7b6zT94eATeHrxBcp4cxLoSRQkidA4mjW5ol
         lfiSMFPWB8zSS8l3Jth0tsTod/7wZtud2jr/kPpe+VLUEhzbm8jUMq2dD/ydw5MCzCIw
         IBDnX6p8mJs+mQdbGfiSoswUscBTY0DvOc8xyyvqB0mv+ihXwXnnMjYvzWC1D6ICmX+t
         8EuYTnatrxjl7U5+olA/DfyEdjc5npxtqKwfTNWIXeitMrsj0NvFOm5sQ2q3TV4ypoi9
         7y1w==
X-Forwarded-Encrypted: i=1; AJvYcCWC49P16K38GAIk4daJxufvZXnYXzC0AS1CeBuEsm+heKYfamSZoQeqV1ZpyBQrpb6RbRCBhJ+oAyoAQns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2wLHDKMeryiYtrT7eMf9IzcmJ326Rxen5KySE1acDYY5pz7Zi
	8uABK03ttz7aDBubxJ1bVHkmMZgOTaIhZ3DWOmb6ZCz1GEsV5V9ZeTkJlaGnYQ==
X-Gm-Gg: AZuq6aLYVBO1+V33i9Wf6y0m1X9CLxZ+OKoHWaBUJ7IIw6bBdDuyNLmYrqSpA2O3Cge
	aIs9FkTzMYVDJvt0A1+6FzfWehhLKo5lLxMWS7qh5y01zMMAO7uYnZK82/NjrORrkLyjx9CMrkS
	xrnPdr02dBpg/pegUCQ176LPYM6SGvYY14tAKmDfkxnp0gQXMonpF6NRZLmCZSpIdk0/FvGx4ki
	yLn0oOrtTkPtoM9CLSRXbuM5gyF1ueHgzA+50wZjeEck0SLDP3L6kM3RBA6GYGod8bOnjI32RC2
	EkaWOLomEUp93/j3E1l4ULxFTWF2VTqB+/NSX1m+5nhL1Y5RzFrPxpoYoGQM065YNHjNPwd/+V6
	a+TqcExcFwsbEt5PZtDFPAEgnSclqIQiwYb/Jt3jC1vZJybXC8XMrTc4i9IjMwmNqiFKuUNlHor
	8dWnb/coPYvRT8IZPnbBBTqdHoKcPl5AwRsbc+YC8lhsomVCqW2bjA
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr238692885e9.1.1768990819461;
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm306630785e9.14.2026.01.21.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Date: Wed, 21 Jan 2026 10:20:17 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260121102017.539b5531@pumpkin>
In-Reply-To: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:ryan.roberts@arm.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16103-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,01.org:url,git-scm.com:url,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 779EB567C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 07:50:16 +0800
kernel test robot <lkp@intel.com> wrote:

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
> >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section  
> 

When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
become real functions.

Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

	David

