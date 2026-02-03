Return-Path: <linuxppc-dev+bounces-16559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCt3HLpggmkzTQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 21:55:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCDDDEAAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 21:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5G2q5ZhLz3bcf;
	Wed, 04 Feb 2026 07:55:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770152115;
	cv=none; b=DTmOI4IA8GfAT6QuFKCU5l7z9IeXjBVNCG1QycG512PgE2wZVK+uG5n6zMaiuWx0syjZcp97o8P3PjGl6fa1LDqszEhMsRd0+MhzD+5MupgqmwYIq+oLbMwoc0Xwe4CXWEqg9Z5kGwgAuWHoBgPCDJzuznibveZbmyyVaDZeAJFtLYjtGn29nVrPCclktp/ymq26Kh8X4lrH4eMp59xGqhNIkkDUWoomOgkHM/jWy5GNRbRPnxOF13vJ0NFULyhZtw0ICBXHCFrTbpscyC/+/Gi1UpgvmflhmAadQFIEt39YaCbpIO/9rvqzccijTUyAut+NXkvzpJe6HgQMRvPMow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770152115; c=relaxed/relaxed;
	bh=s1aQwok2HKbsVBmX9eGa5RkrHuBtVFsjyMEuTuBB7cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSv50Tzw1KQiDnGOc7NpH50kez1QSU/K825Q0hCE/rEnvw7D82yOJqyc+Y5fo9tWGCl08Xy2r3Xhz3iW6jHaRKMW36A3xmhuDUMml7Mb4sY6twEUUyybf8Tmy/4Qkk8GBCRPEsAk9J1aDfEMK0ECdLk+DYxbT1bARcx6kerOdSlvAfem7NsXl9Ch/JNt7wAhWEDQvPjWK/XTow7phvU6QQcFyh2IXAQy9j1Q6LzNICF2mHXvTCCjJQmBv0fyaAu+8TMNtgNY/5TA8X3BHzeyWSAQZHHaoA8Rb/L/fLq4vOHFDWyvKLxCg3UQu5oc3IBgOrnyEmJ/6LahOUmDj0tMHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=POWNce9U; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=POWNce9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5G2p2Y0Zz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 07:55:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE7C360129;
	Tue,  3 Feb 2026 20:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E095C116D0;
	Tue,  3 Feb 2026 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770152106;
	bh=qNVKdNlvBI2upvfPnIIgcVTzRhdg8ywM2HpUBMwe0vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POWNce9Uce38XpZ7U2P46dhJuFXkGCnJDzv1qQ7fO+ohlM18AjxAR9TBIe6tAXdl5
	 PtKfRHKTYSLnla8zkDLT3odsYw90qWhaAtHzzpfQdcJHvtAKPq4e+jlGPJWGWFkk+l
	 XY6kO7rDIdleV7uKpQxL3QjMowb493+3u7SpFPJAh+RXIpAi6J2S5cKbK12Niazlip
	 Gcp86Os96EG3x8+RuErxGPng+g31nIgq9udndxB32r7QeKfOYLFMmtfIhv+qL76Kic
	 rJt3k424VOBVbbVJS9z6aHpldW0kJjzd+wo4VD4BR8BPryApHapNepBCQ2Mi+Bjaay
	 kgOdVzMPG/HpA==
Date: Tue, 3 Feb 2026 13:55:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/uaccess: Fix inline assembly for clang build on
 PPC32
Message-ID: <20260203205501.GC3573384@ax162>
References: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
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
In-Reply-To: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16559-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:segher@kernel.crashing.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,google.com,kernel.crashing.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev,intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 6CCDDDEAAC
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 08:30:41AM +0100, Christophe Leroy (CS GROUP) wrote:
> Test robot reports the following error with clang-16.0.6:
> 
>    In file included from kernel/rseq.c:75:
>    include/linux/rseq_entry.h:141:3: error: invalid operand for instruction
>                    unsafe_get_user(offset, &ucs->post_commit_offset, efault);
>                    ^
>    include/linux/uaccess.h:608:2: note: expanded from macro 'unsafe_get_user'
>            arch_unsafe_get_user(x, ptr, local_label);      \
>            ^
>    arch/powerpc/include/asm/uaccess.h:518:2: note: expanded from macro 'arch_unsafe_get_user'
>            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>            ^
>    arch/powerpc/include/asm/uaccess.h:284:2: note: expanded from macro '__get_user_size_goto'
>            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>            ^
>    arch/powerpc/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_size_allowed'
>            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>                    ^
>    arch/powerpc/include/asm/uaccess.h:258:4: note: expanded from macro '__get_user_asm2'
>                    "       li %1+1,0\n"                    \
>                     ^
>    <inline asm>:7:5: note: instantiated into assembly here
>            li 31+1,0
>               ^
>    1 error generated.
> 
> On PPC32, for 64 bits vars a pair of registers is used. Usually the
> lower register in the pair is the high part and the higher register is
> the low part. GCC uses r3/r4 ... r11/r12 ... r14/r15 ... r30/r31
> 
> In older kernel code inline assembly was using %1 and %1+1 to represent
> 64 bits values. However here it looks like clang uses r31 as high part,
> allthough r32 doesn't exist hence the error.
> 
> Allthoug %1+1 should work, most places now use %L1 instead of %1+1, so
> let's do the same here.
> 
> With that change, the build doesn't fail anymore and a disassembly shows
> clang uses r17/r18 and r31/r14 pair when GCC would have used r16/r17 and
> r30/r31:
> 
> 	Disassembly of section .fixup:
> 
> 	00000000 <.fixup>:
> 	   0:	38 a0 ff f2 	li      r5,-14
> 	   4:	3a 20 00 00 	li      r17,0
> 	   8:	3a 40 00 00 	li      r18,0
> 	   c:	48 00 00 00 	b       c <.fixup+0xc>
> 				c: R_PPC_REL24	.text+0xbc
> 	  10:	38 a0 ff f2 	li      r5,-14
> 	  14:	3b e0 00 00 	li      r31,0
> 	  18:	39 c0 00 00 	li      r14,0
> 	  1c:	48 00 00 00 	b       1c <.fixup+0x1c>
> 				1c: R_PPC_REL24	.text+0x144
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602021825.otcItxGi-lkp@intel.com/
> Fixes: c20beffeec3c ("powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
> I set Fixes: tag to the commit that recently replaced %1+1 by %L1 in the main part of the macro as the fix would be uncomplete otherwise but the problem has been there since commit 2df5e8bcca53 ("powerpc: merge uaccess.h")
> ---
>  arch/powerpc/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index ba1d878c3f404..570b3d91e2e40 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -255,7 +255,7 @@ __gus_failed:								\
>  		".section .fixup,\"ax\"\n"		\
>  		"4:	li %0,%3\n"			\
>  		"	li %1,0\n"			\
> -		"	li %1+1,0\n"			\
> +		"	li %L1,0\n"			\
>  		"	b 3b\n"				\
>  		".previous\n"				\
>  		EX_TABLE(1b, 4b)			\
> -- 
> 2.49.0
> 

