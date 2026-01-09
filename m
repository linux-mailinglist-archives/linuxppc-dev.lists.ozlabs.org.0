Return-Path: <linuxppc-dev+bounces-15477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BCD0B993
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 18:21:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnpTH2f8Sz2xm5;
	Sat, 10 Jan 2026 04:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767979267;
	cv=none; b=cigt8wDAfcPpA8MhWroNHO23jrosLyU+I9LMMR4NuX8qRSDWZoULmYvHAVT1RTmiSCCSJa8gDisg7jXlqD0Ojt9JBH2aVqyaWooex1vTO++KZowa432hvPjaBnIC+vuRWzSs0Q57Icj1BA6F63izvWvoY/m6Pdhxl7FO0rAUdNiibL4x220tVy+ZmNqfkicKNS5MUIfMutisadAPGDI4m3wVdCtQK9nXwYi1YEaPWXHvSeavNejfY+qIHwtjqdKFoL9QAaUl/rGgrbY35VlXEErNbTaMJdNyyxTwx0jduWAz7rc/+ZutPfsn8mV1VusBq6h2M+LoyBiiM8ohpJ5VWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767979267; c=relaxed/relaxed;
	bh=9/3s+V1kqVDfGWl6kub+GDpGC7pldbCGqQsxGeZtyMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fobWT8XdPJlMkdvW4zSLjxjGGMYtYP5dBT3V7P+FXS2V1bouZ71/ZQxd7ux02vtUwfHmU59VSjo42C+4RRa29Mx644pTnqTy2SL7WWzDx5R4v5fKrpa5fOKtMSgGekbOA70cJouP8ybykWZ4ytvY13hcL52zT36XCCIJ5wwdMpY+7cljEuZUcnJBx2+NDdYC9PMa7g2Y4uhy4WJWulpowlEJ+DRdoHkX8JIcbcWXJOtbhehlk6SKLg8417zMvy8cmqCO5332OWhyq0bzWLyZH8pEy/eCR3KQkhg4gCpVD22S4cPRo5LrB95MKo3PhI02d7pv4Vz9S3m0/lLvufP5bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UfzHeo17; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UfzHeo17;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnpT96wysz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 04:21:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9238C40660;
	Fri,  9 Jan 2026 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56496C4CEF1;
	Fri,  9 Jan 2026 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979229;
	bh=njwlYPtno5gZ8EIwtH+rwItwtDE7dwKke0RUnx/c3T0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UfzHeo17A0hD70wTGe8ZAQpTDPXrHM20FzqRA9L/+AeSPNOvbFtzJU/Mtg89FkP2x
	 aK78bmcJMjaFvIw3+M6DbbhWXR6buj396nMHkKb9vnHj68ZL11z1U+S0SZ7J0W3s8z
	 j9FYB94zXnVznpWBLkEKmFyJYqCEVG+ZhR7QMB+j+vMjsWmUaWN7J5Y+biLM8d8CDg
	 J+etDJaBWRs/l+HmKFzQTCOz76DbDKgq0MNAqlY2z835Euti6OAMig2qzTW7BqeVhx
	 uZdsJmFuBX9LjWi9AIc++TggpmV4ioibr89cUmIPJJ0D+oASRlaMW4SK+SGcyKtIyB
	 AerPmuX88VCdw==
Message-ID: <50236a86-c177-4baf-b511-50df675f96eb@kernel.org>
Date: Fri, 9 Jan 2026 18:20:24 +0100
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
Subject: Re: [PATCH 1/1] powerpc/xmon: Delete unused ansidecl.h
To: Petr Tesarik <ptesarik@suse.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260109154636.2945330-1-ptesarik@suse.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260109154636.2945330-1-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/01/2026 à 16:46, Petr Tesarik a écrit :
> Delete arch/powerpc/xmon/ansidecl.h. The definitions from this header file
> are not used.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/xmon/ansidecl.h | 130 -----------------------------------
>   arch/powerpc/xmon/ppc-dis.c  |   1 -
>   2 files changed, 131 deletions(-)
>   delete mode 100644 arch/powerpc/xmon/ansidecl.h
> 
> diff --git a/arch/powerpc/xmon/ansidecl.h b/arch/powerpc/xmon/ansidecl.h
> deleted file mode 100644
> index 17a85a52b63a9..0000000000000
> --- a/arch/powerpc/xmon/ansidecl.h
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/* ANSI and traditional C compatibility macros
> -   Copyright 1991, 1992 Free Software Foundation, Inc.
> -   This file is part of the GNU C Library.
> -
> - */
> -
> -/* ANSI and traditional C compatibility macros
> -
> -   ANSI C is assumed if __STDC__ is #defined.
> -
> -   Macro	ANSI C definition	Traditional C definition
> -   -----	---- - ----------	----------- - ----------
> -   PTR		`void *'		`char *'
> -   LONG_DOUBLE	`long double'		`double'
> -   VOLATILE	`volatile'		`'
> -   SIGNED	`signed'		`'
> -   PTRCONST	`void *const'		`char *'
> -   ANSI_PROTOTYPES  1			not defined
> -
> -   CONST is also defined, but is obsolete.  Just use const.
> -
> -   DEFUN (name, arglist, args)
> -
> -	Defines function NAME.
> -
> -	ARGLIST lists the arguments, separated by commas and enclosed in
> -	parentheses.  ARGLIST becomes the argument list in traditional C.
> -
> -	ARGS list the arguments with their types.  It becomes a prototype in
> -	ANSI C, and the type declarations in traditional C.  Arguments should
> -	be separated with `AND'.  For functions with a variable number of
> -	arguments, the last thing listed should be `DOTS'.
> -
> -   DEFUN_VOID (name)
> -
> -	Defines a function NAME, which takes no arguments.
> -
> -   obsolete --     EXFUN (name, (prototype))	-- obsolete.
> -
> -	Replaced by PARAMS.  Do not use; will disappear someday soon.
> -	Was used in external function declarations.
> -	In ANSI C it is `NAME PROTOTYPE' (so PROTOTYPE should be enclosed in
> -	parentheses).  In traditional C it is `NAME()'.
> -	For a function that takes no arguments, PROTOTYPE should be `(void)'.
> -
> -    PARAMS ((args))
> -
> -	We could use the EXFUN macro to handle prototype declarations, but
> -	the name is misleading and the result is ugly.  So we just define a
> -	simple macro to handle the parameter lists, as in:
> -
> -	      static int foo PARAMS ((int, char));
> -
> -	This produces:  `static int foo();' or `static int foo (int, char);'
> -
> -	EXFUN would have done it like this:
> -
> -	      static int EXFUN (foo, (int, char));
> -
> -	but the function is not external...and it's hard to visually parse
> -	the function name out of the mess.   EXFUN should be considered
> -	obsolete; new code should be written to use PARAMS.
> -
> -    For example:
> -	extern int printf PARAMS ((CONST char *format DOTS));
> -	int DEFUN(fprintf, (stream, format),
> -		  FILE *stream AND CONST char *format DOTS) { ... }
> -	void DEFUN_VOID(abort) { ... }
> -*/
> -
> -#ifndef	_ANSIDECL_H
> -
> -#define	_ANSIDECL_H	1
> -
> -
> -/* Every source file includes this file,
> -   so they will all get the switch for lint.  */
> -/* LINTLIBRARY */
> -
> -
> -#if defined (__STDC__) || defined (_AIX) || (defined (__mips) && defined (_SYSTYPE_SVR4)) || defined(WIN32)
> -/* All known AIX compilers implement these things (but don't always
> -   define __STDC__).  The RISC/OS MIPS compiler defines these things
> -   in SVR4 mode, but does not define __STDC__.  */
> -
> -#define	PTR		void *
> -#define	PTRCONST	void *CONST
> -#define	LONG_DOUBLE	long double
> -
> -#define	AND		,
> -#define	NOARGS		void
> -#define	CONST		const
> -#define	VOLATILE	volatile
> -#define	SIGNED		signed
> -#define	DOTS		, ...
> -
> -#define	EXFUN(name, proto)		name proto
> -#define	DEFUN(name, arglist, args)	name(args)
> -#define	DEFUN_VOID(name)		name(void)
> -
> -#define PROTO(type, name, arglist)	type name arglist
> -#define PARAMS(paramlist)		paramlist
> -#define ANSI_PROTOTYPES			1
> -
> -#else	/* Not ANSI C.  */
> -
> -#define	PTR		char *
> -#define	PTRCONST	PTR
> -#define	LONG_DOUBLE	double
> -
> -#define	AND		;
> -#define	NOARGS
> -#define	CONST
> -#ifndef const /* some systems define it in header files for non-ansi mode */
> -#define	const
> -#endif
> -#define	VOLATILE
> -#define	SIGNED
> -#define	DOTS
> -
> -#define	EXFUN(name, proto)		name()
> -#define	DEFUN(name, arglist, args)	name arglist args;
> -#define	DEFUN_VOID(name)		name()
> -#define PROTO(type, name, arglist) type name ()
> -#define PARAMS(paramlist)		()
> -
> -#endif	/* ANSI C.  */
> -
> -#endif	/* ansidecl.h	*/
> diff --git a/arch/powerpc/xmon/ppc-dis.c b/arch/powerpc/xmon/ppc-dis.c
> index af105e1bc3fca..3f2c01c13c661 100644
> --- a/arch/powerpc/xmon/ppc-dis.c
> +++ b/arch/powerpc/xmon/ppc-dis.c
> @@ -10,7 +10,6 @@ This file is part of GDB, GAS, and the GNU binutils.
>   #include <asm/cputable.h>
>   #include <asm/cpu_has_feature.h>
>   #include "nonstdio.h"
> -#include "ansidecl.h"
>   #include "ppc.h"
>   #include "dis-asm.h"
>   


