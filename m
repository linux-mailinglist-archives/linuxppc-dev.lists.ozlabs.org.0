Return-Path: <linuxppc-dev+bounces-16562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH76H1OPgmkMWQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 01:14:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873BDFF26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 01:14:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5LSH3kFtz2yFm;
	Wed, 04 Feb 2026 11:14:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770164047;
	cv=none; b=dUDppQiyq+/K7LZ0dxUVfNgzjRytq4/HMwhTmZQJzaETG6lKEqAW5zSf5gtLzGmyCX1RhKJDZtXQ4FS4Dz9URWHiHzrswlVuXIG/p1ayL5Yuveib19gF64uAsSRHYIQMEFfaDVobL3q4ldDvbREPQe74K2fdslZ9sw6g9J+UKwZmnI7r2DI7sVY2wUO+g+LXfcnSB7tkmfRjU0O7NkWY++s+6txFfs8yIAABr5Ib10IkyiR0ZdAETNskfA/+yLmUSgTjghR0LKT6ufO52eKRGIM7hG43dQtdIbKnm6UmL7Y05uzqjq1WU6ERyIau0nOcD+IAW6WxpTbx47x76NYs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770164047; c=relaxed/relaxed;
	bh=PfNOKX1Fk35pkOLEC0awZ9Kx+9oPmVLsG5sCalOXezY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0B/q8e4O9Za1sJD2J4HfwnlB5AnYKTc4uBrxR6a5g/NdZLt1TEDkcrvV9hHzIwIkhNYZdUrZxj9gLJPAPKsxMdjwTFUmyFxe9JzBdt2hOgQRJgd0XlL8MJPqRFU7wNdRf9O/34fd541ej/XcKwGmOmknsHj0WFBdyqWvWNk3Tqsfp4fBpdXw3mQgJYHeMftcEJyQ8zqzA2dSrvtFt2QqB9TIo4BbWHa9QfxDcuTQuCW8fN/6wDVK78En6L1Jldx5szKuzZHEt4UUaskzHbq2/xREY0UIDjBAYiF/7O/8HAH+UYMGHBJY2/aV4+EhM3UQ4FhdCN2VoSdKUDkracc/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5LSF6nwQz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 11:14:05 +1100 (AEDT)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 6140DeeX3681128;
	Tue, 3 Feb 2026 18:13:40 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 6140DZ1W3681124;
	Tue, 3 Feb 2026 18:13:35 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 3 Feb 2026 18:13:35 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/uaccess: Fix inline assembly for clang build on
 PPC32
Message-ID: <aYKPL-KME9KnRoA7@gate>
References: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
 <20260203221939.059bb903@pumpkin>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203221939.059bb903@pumpkin>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[crashing.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:davidlaightlinux@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[segher@kernel.crashing.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16562-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XAW(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[segher@kernel.crashing.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,google.com,vger.kernel.org,lists.ozlabs.org,lists.linux.dev,intel.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4873BDFF26
X-Rspamd-Action: no action

Hi!

On Tue, Feb 03, 2026 at 10:19:39PM +0000, David Laight wrote:
> On Tue,  3 Feb 2026 08:30:41 +0100
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> > Test robot reports the following error with clang-16.0.6:
> > 
> >    In file included from kernel/rseq.c:75:
> >    include/linux/rseq_entry.h:141:3: error: invalid operand for instruction
> >                    unsafe_get_user(offset, &ucs->post_commit_offset, efault);
> >                    ^
> >    include/linux/uaccess.h:608:2: note: expanded from macro 'unsafe_get_user'
> >            arch_unsafe_get_user(x, ptr, local_label);      \
> >            ^
> >    arch/powerpc/include/asm/uaccess.h:518:2: note: expanded from macro 'arch_unsafe_get_user'
> >            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
> >            ^
> >    arch/powerpc/include/asm/uaccess.h:284:2: note: expanded from macro '__get_user_size_goto'
> >            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
> >            ^
> >    arch/powerpc/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_size_allowed'
> >            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
> >                    ^
> >    arch/powerpc/include/asm/uaccess.h:258:4: note: expanded from macro '__get_user_asm2'
> >                    "       li %1+1,0\n"                    \
> >                     ^
> >    <inline asm>:7:5: note: instantiated into assembly here
> >            li 31+1,0
> >               ^
> >    1 error generated.
> > 
> > On PPC32, for 64 bits vars a pair of registers is used. Usually the
> > lower register in the pair is the high part and the higher register is
> > the low part. GCC uses r3/r4 ... r11/r12 ... r14/r15 ... r30/r31
> > 
> > In older kernel code inline assembly was using %1 and %1+1 to represent
> > 64 bits values. However here it looks like clang uses r31 as high part,
> > allthough r32 doesn't exist hence the error.
> > 
> > Allthoug %1+1 should work, most places now use %L1 instead of %1+1, so
> > let's do the same here.
> > 
> > With that change, the build doesn't fail anymore and a disassembly shows
> > clang uses r17/r18 and r31/r14 pair when GCC would have used r16/r17 and
> > r30/r31:
> 
> Isn't it all horribly worse than that?
> It only failed because clang picked r31, but if can pick two non-adjacent
> registers might it not pick any pair.
> In which case there could easily be a 64bit get_user() that reads an incorrect
> value and corrupts another register.
> Find one and you might have a privilege escalation.

I don't think LLVM is that broken, it only has problems for some edge
cases.  Yes, I might expect too much.  But without proof to the contrary
let's assume things are okay :-)

And, worrying.  But what can we do against it!  Other than never ever
use LLVM for anything serious, of course.


Segher

