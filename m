Return-Path: <linuxppc-dev+bounces-16561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rxhZB7aNgmkMWQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 01:07:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAFADFE52
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 01:07:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5LJJ4vPjz2yFm;
	Wed, 04 Feb 2026 11:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::644"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770163632;
	cv=none; b=Gg6Ny3gQnKboE3hmJgn8F8pv3ayUglc3P0SNwpzdTWal1pP4foJyp1AsJz+CZGGvAQuZQem8W8k1YAvHGq5o1PvmcqxOyR64HORuQ68d9d7gY/iNU1r9L3or8++Kl3M/h/tISjPnR0SbRJ/thHrBX8+TEyrjcTuBft0b1l5ngouyoSy/2P5HixjqJB8zv0Q0+SetKA63dQ2dy1yUkpqxGswYdCnjjXdav+CYGKs5Z7qvVKjZJZicMllNsL+JxJwZjW9uO/f75DCU3EJoequj6ZurODNOtxim2qEKubHosZerIu2XG/YZw20ZIXCQmnMgkZ+Fb9y2m54Cmw4Ou6kaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770163632; c=relaxed/relaxed;
	bh=YgKK3ByONbvoWC+ll8e6+//MuLfVWAgLVs4G9qm5feQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtUog8kFY/XtKUe8WMExSlzcDRiDWjEnwfTfkivqd06DJ3Hhl1Mng0zk+rrN9k2euXbV9w/R738/Jq4jxn8jobF/P8pu/ty73xJTJv0G7dqhAYUNjzW37CV7VcsE6uc6N4bj5sEk2Wwe5xy5qKExdXRDQxLEWjHbhMSauWOm0Vh86RIGrM6iiQP+C1AnVNHqMSqigLRnwWjQHr4rFUvG7Ur4yseLBJBxAsWGFcLyvWZcKp92Ax+Zkl+KklHod8iITMMY8mzqpi4esxQHTHA73j/HSIoi+1eITj2A7For2+9KTCYq1VqNWWVUt+nDuh/HUU/Zo82ZDq9P5gwibTPahA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N3mkUY4+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N3mkUY4+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5LJG6Cnzz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 11:07:09 +1100 (AEDT)
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-b885e8c679bso971667866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 16:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770163622; x=1770768422; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgKK3ByONbvoWC+ll8e6+//MuLfVWAgLVs4G9qm5feQ=;
        b=N3mkUY4+Jto2HcZ7C4P7TJZL3u9Q5Pt4SSoce0OQ60JaN20Ui0VJdaJl5k4JkAKqGV
         puoIhXDM1kYP35Bo2+k/x+BesusKH5xaKQaI0Wyz8K0HYnXBrjGUS0k1v49rEw4P/vGK
         Xi5mcJqgIMon4nHUXKCesAMV6R/sNYWzxInhbN+mh+sM7DkEZcUDuLg+v9aaBPCn42ob
         /dH5ief68Ddcsm0UVLBmXoAvJesW45VE9Un1conR4zWoHuFkFdT8wy9QKaSVl637W4ES
         e/c6L4N+a01irt0i1wzx1MmibAKXJs9yAF+pvIZgxxERLKxe/ik09V2NQdHn9nHRgRxN
         2qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770163622; x=1770768422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgKK3ByONbvoWC+ll8e6+//MuLfVWAgLVs4G9qm5feQ=;
        b=ZwCMYHYJ2DXfvf3TeheLNRnHBtW08zk1gmOw2OQQcbrs5YLVWsE+aisLoKxRk2WjVY
         O+gRWrqNozGg/gL/Zid85VW0UQ1MmZN2J8S8BAX4/SCGoCx2wtB85OAmWadVjvjcUYKs
         DCXIWsKNTpfer8QNYJIax76JeHRpymkiQrvFOHayNV+k5+c713i2gGjjkKoz/f8kBBB6
         JT47cqAHvtCsYx626GFgk2gHbQ/bkch7J2HjmDuC2IC+sa6Fy+VE1G2mg67v7rFL6wAx
         3cgabpdd8EblE9WCUEjJTGaixneod6+xCEoYr+aLPgS0o5eNmGTn1ObY6USZMz+GAxcR
         skCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYu1gwdlwC67mD+6JV3/lBXit2ronEBoFqHIEvvc+Y9CgBYOPNVUgfHhvMxdteVnMHf5cHBYsdLfkse2M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywc7C4LQX4x+Ky4pRR1KrWZlKcI/xXfhgSF6OLGPqtvRJIH9Bck
	K5KFnoMkFVMNb18mJzJRFwrJLsiFPgzAY6WxsoBiORR3hk1SJLl6P1ND8rUf7gb0
X-Gm-Gg: AZuq6aJCuMu7eqnmZ4zkreR1+zEcloC/vzM/6CrGJ+dqICjRkCkLF6bOVloOLt+yFMU
	muNpwPK7Qs2zECZXocbhzJUFpZPJoUW2u+ZChgsFPe2XSYQcV2kONSaizQdDdWyAb4V4WT9c+9T
	cKTpGxfIsc1L7LX+tLJYbLAkCmbPJPrZ3JaVVRMUS3L62sOdGltEnqFBltAsxN6cUTlJcdyfXXe
	TmNDrtChx6zSvOxlLUDNz2C+zsPTnxkILtjRw8dutW07eF9YovRaelw6MgwcMMx7zGNxSxG8oSx
	4aITWTXXrGo6h+WJDVl6RkRjd8zWDWTg565wK+uNa7hp+3I7ZFqBmK2PC2lzqoPeq00XqjSTcca
	b2oXHK7w3VJJ8NBu1mUZj8ZD1Gs/lQKHjq/RK0oVIx1g6QB+yTXnWoswx18HcQcPmoQk50qAkBk
	6LwQUhIHQxMLGGc8/Trh5HAml2ly7fSNHKzfoG7CD4KK2kl49Z07r2
X-Received: by 2002:a05:600c:3549:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-4830e92cc18mr16039605e9.1.1770157181418;
        Tue, 03 Feb 2026 14:19:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310858ffdsm906015e9.7.2026.02.03.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 14:19:41 -0800 (PST)
Date: Tue, 3 Feb 2026 22:19:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Segher Boessenkool
 <segher@kernel.crashing.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH] powerpc/uaccess: Fix inline assembly for clang build on
 PPC32
Message-ID: <20260203221939.059bb903@pumpkin>
In-Reply-To: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
References: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:segher@kernel.crashing.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-16561-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,kernel.crashing.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev,intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9AAFADFE52
X-Rspamd-Action: no action

On Tue,  3 Feb 2026 08:30:41 +0100
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

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

Isn't it all horribly worse than that?
It only failed because clang picked r31, but if can pick two non-adjacent
registers might it not pick any pair.
In which case there could easily be a 64bit get_user() that reads an incorrect
value and corrupts another register.
Find one and you might have a privilege escalation.

	David 

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


