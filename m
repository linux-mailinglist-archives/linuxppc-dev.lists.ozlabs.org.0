Return-Path: <linuxppc-dev+bounces-16110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD86HyUBcWmgbAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 17:39:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6795A01A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 17:38:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx8z30dW7z2xrC;
	Thu, 22 Jan 2026 03:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769013534;
	cv=none; b=O9KTHVc2zIY7MCyaPIDP7foNSTHQW2aUggxUqFo82PdcMW8+l4dYAmH6xowCcR0vIv/BHl7YZXDCHk/F99x76Ln2CWLGsMm5bqdHiD0+0NE0cuNLxWH9ZYqy8AuqLksTcQ9qTv2ryANWgjnzd6qSbtBYY/oYcb3WyYyA0+mnaz+8onTRv5EQX/ZXFhLX5EPoAaayJ0WMbmT+Zi/dJaPEFy1us4oJsC8KZ3+ZhLx4qX+HwbUSNDnmcm/+zwbxpflPs7H8z3TpxRzHgsk1it0RNccqrJXcK5PFo+upnLaYnUUpR7WwZ3y5hga31gCbqL7gUecHHVg+oqXuRBcfAMGIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769013534; c=relaxed/relaxed;
	bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXfDyPB93Qd8G3z+ttEGJ++LstiK4XI48T2X9BwQkoHEdt58wRP9gX8Ch7FQiWYoRinJTK3GuAY5WbF9op7seG8PY2KxV5fVyfiULtlm6xxd17V2iid3xWIzjGo4I7kJMXOrwJruhjnBtUXRohnYvtWXR2z3poXTi+0ag7crjo0iIQP4MvoAFBjD9bQVK0dmne3em7Mdnf0271+L24v2Nf0s8/ZoMuhgMmEdYM7/rpXwKoedMnOTzJ0YssLbFWbHS2L1280s5s/P8OYzby3gs5Chg7R0EP6X+rRHDiOKbcM8s3KDwGf1Hbcaji/kGfjbwkorxE1FuUkuhdXvk75KWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SrWk5meI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SrWk5meI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx8z13Hw1z2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 03:38:52 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso57027a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 08:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769013525; x=1769618325; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=SrWk5meIJCC8BJur3fxb4EOVnFaM5LUP7D8wu92m30lr3ndr8Fuvk3b9yktDrN5uOT
         lCY+CzVnr2UYoS7VbdXIx36AUyPzf3m5VORS4Ibaj1W3E61SZJydhXm/knqYxZr11EAk
         q7HsXqYBhvP+c5wlvXcH3h1EHrAQxq4B7q5In+NAX5ztYbPQ2uGw+eNJnrnBhQ0Gec/u
         ku+c77+q/zclajYH3DztBBCXuV2nZGDRdVfQ87IuW2T6IMvcbv3RcWFFJCKdobG0PHwG
         AMau9dUdPgG/lidj1enjE0nYEYRzaFwNUgiTtnKMdOLioE2dxIsg27GPskCMaMMwv5iW
         upow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013525; x=1769618325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=Hr1+0x/3d4FMJwRMyJtNPC+gdfwtPG1eih4XR4mUWyW7+e3KQwYa2qFRNGufLDEEsj
         HtvooMrDmQ5NanUS8Ify4mkGdKhST4e+oIY2vVKqgTOR4WGWQwiur3BxLojjSCIldwfV
         qT37lylCDMAEigJrT9qYe/uz4nsx9JzTDsBiGh0zCBSBcMqyIDPLHpqTgCTs2y6rFvYy
         YST1Krt0BSRcOPDKpBNT0m/yQFjPu/EC60uxNPkGVyosc8N8FWJGyL0q+/whLfcSDslg
         V1+BK8lquAF+uxdEUmqvoPHozdGOBRz6cqWmxPYSHJLRmUnpJbHwkNzmsf1NJH4yX0lx
         Yj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyPbTa9rXSuW1pr1pjMokBBsd14cg73QY3HwHmTHKmQHgmQo0M6+nrOxdHWwFr5g9Mexdler4j0bduegI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4nmsYOCNDHZJa+hB55u6TsrH8AcZ6J2H64Buokb8dcVTH6hO6
	EiwGHeutY2eHmebJOLThBDfdcviHpPsa23U2K4BYQ7fzDvJYPQsz0sLbu/UWlA==
X-Gm-Gg: AZuq6aIvaQ/NtU30hN5dR795ea+dyL6UjUJ2cyJ51cp2O6lym524ij/87tKhByglCY8
	lonnbmpn5vXdmWs6GcoBXr0ADw0hOij2fHftlXKKAObSd7wGNM20gunSFFZwpBVcrQwIxJ96+UY
	9r8/7chz+hdgeuc/Qu/16oH9yBJq8Bj6pPHhGmZVYXNt2XWjGx8XF1qY4GN3fzQw6lezp2qFlJc
	8sKGFwYywmge1j4FXqZ3DoA0zkjcJAtd5woxnra6TcpQXfRizqIFr/JdeU/UXmMkBdB6Qs3Hhxx
	hGuql3q/7hM8uwRu4nVKyX1Q7SvhvRZ1J4A7cr9UNcOXXta7K+7GpU95z9ks7Tw90L/XBWTbXC9
	nlqVaMkHSjPFiGO2xSmxdJrV/TuD0VYl90J2tzo0l+bz1vGhxlxs0Q9KJpkXV0mhKFauMuG2Uq2
	4L1lVhZ9pCix5xjNKxh6DaNMn1Lacfqy8dd7NCA5BfDJ94rzv8vxrK
X-Received: by 2002:a05:600c:4fc7:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-48042f7e0e0mr38897745e9.25.1769006884109;
        Wed, 21 Jan 2026 06:48:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm274897235e9.7.2026.01.21.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:48:03 -0800 (PST)
Date: Wed, 21 Jan 2026 14:48:02 +0000
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
Message-ID: <20260121144802.1287ce3e@pumpkin>
In-Reply-To: <20260121102017.539b5531@pumpkin>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
	<20260121102017.539b5531@pumpkin>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:ryan.roberts@arm.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16110-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,01.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 7B6795A01A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 10:20:17 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 21 Jan 2026 07:50:16 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ryan,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> > [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> > patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> > config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> >   
> > >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> > >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section    
> >   
> 
> When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
> the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
> become real functions.
> 
> Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

Or the code could just use the per-cpu data without disabling preemption.
Usually that isn't a good idea at all, but it can't matter in this case.
Might give a noticeable performance gain, disabling preemption is
non-trivial and/or an atomic operation on some architectures.

If anyone is worried about preemption causing the output be repeated, that
would be (mostly) mitigated by checking that s[1234] haven't changed prior
to writing the new values.
I think a 'not locked at all' compare of two of the four values will
stop everything except two threads doing system calls at the same time
getting the same output from the prng.

The whole thing is very unlikely and there will be much easier ways
to break the prng.
Provided s[1234] are only written with valid values (ie ones which aren't
effectively zero) it will continue generating numbers.

	David


> 
> 	David
> 


