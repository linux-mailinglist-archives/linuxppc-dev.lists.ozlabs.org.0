Return-Path: <linuxppc-dev+bounces-15460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6E4D0B06C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 16:47:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnmPX677wz2xm5;
	Sat, 10 Jan 2026 02:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767973664;
	cv=none; b=cE7X5gjyvJf8B1TeWuSoFTG+eWynXwSUEHsffLK1XY1+B2wcN90Trzjrk63KS5/SLm2mWqSJ72HKdZAowSeN+Zu1of7QrK2YO9qjuUt3dMW3yypQM2QiSGXRJ0IMaZjUT51HN423rhcx1gp5tvXqdXdnHDR140A80g9hany3YgdIUSCWgV+FAqNz8grkFUc43aETTjoL7/ze2PWVWXvUlldSmdPehTaUs3dQT+x1DAaz2pHQk8jWhTUMUSjRNLu1PM6gjGJMsJ9VtOX17Oato30Q+R4Ika0R3wRsSp9H/cSPp6amUs893K/jVILwEnYErFajeWUgxz2BonDUuX/bLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767973664; c=relaxed/relaxed;
	bh=prBancCJyrr76Vmgscx04lCJJfZG5vh928PPT7BCWUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BO1irOJ36yEz7E7xRW3m3EVYc63bfLTr60JiCeYXSusbydLS4UaQ1S75WjXmUCq2Jlex/HBber9aj+R1YVy3mmqVU5w+QZMD8P1MNXfLUInQFsgPb6ihn+BEW298uQ5HoiWTMl8mKMJFtlutI2qZKr6T3+xsduXd08rdfsoHFMLRweADHGBWQDmWXdlNuwCAHro5twarTHPs81Vg9TMaIoJoOyq93HWwfMeEpQM/z+EvFh/8sRyN22UbD7zjnC/t1C0n/VRr6kdb0wBuNJ7RUXcSDT1LzvyzwAegJvDLjy1YkcmPB8GtMMCvFdIU7+AnlX20QREzokqRfyby4kw++g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TTyINOrA; dkim-atps=neutral; spf=pass (client-ip=209.85.128.45; helo=mail-wm1-f45.google.com; envelope-from=ptesarik@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TTyINOrA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.45; helo=mail-wm1-f45.google.com; envelope-from=ptesarik@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnmPV6dqzz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 02:47:42 +1100 (AEDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779c9109ceso3938695e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 07:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767973598; x=1768578398; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=prBancCJyrr76Vmgscx04lCJJfZG5vh928PPT7BCWUk=;
        b=TTyINOrAidFQL+ZlgFv4zDY077FhkAfexjBusAm6+1QbkF8qb/BUWb0ut4SaNIcnNF
         GovmIdHwfEm7gudrLne+obnthg/bRcG/qqW4skTWvYs0GIotChR4b5dBqkoFDTZQk8t6
         w1Mvfhqp1pEseAeCTIV5+2MnHwKYajQLDGqUy8ydcclRxBsqypoSt/f3ToucLRtypg/3
         kJ+2IriX0xaQdjrSMnmLjp23uK5vFPNPb6hARpTzxvsNwm2yxZmZWTFlzLfjkmFuXmFE
         v/nY54miEmto8OzvC1KZgMKyniqkf8IGY5MUOgwpECMcQuX2Ynqk2B18Lkx9Cv/6kuqN
         NSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973598; x=1768578398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prBancCJyrr76Vmgscx04lCJJfZG5vh928PPT7BCWUk=;
        b=djHZ3Xi/95cpO1U+nO0vAJQ9bSJt7cJtNmZIaUtGUVlcgyeSqSnvoSiOomdp2+HC+s
         TY3ONFt2vhIA38RsPhUgabceFsUYr8xKEA+bqLQajbXEZc1mccj9LGpB8eVeRgG8dNN+
         TpQrUwPYrpYxM8gkz8yB/uab8r34GWfSR/FrcuyriJU5MRjnatP7lxnvet4j2XiddQaa
         XauZ6g2poqp6qDNn8Nvk1nTOaLQEz+YXAA0EGSaOclecPIGDf2slKEgcbKxBK3I2wdlm
         ikm8Yqecp00wWFTqgay7fW8y38hPm3n2yosRlSPPSs12W+cJkXeb1efGEi3Y0kFoPHcl
         T1ug==
X-Gm-Message-State: AOJu0Yy0ObFzxvG1P/zq08ByaHntDW/d+HFg3FYxYu2pq80iE+DNCT8P
	HcJwVotAwikuGQ8hoMMcDYIxoJ4mrHJLfsTMvyjNZIUg25HHzOgOZB12zZFpsmLRnBc=
X-Gm-Gg: AY/fxX7We7NSRaMKJqI2yDWlgBlOJ92UrKjFxifZ5U1kZ+LYS8AoPbIe1hCf6dUJOqi
	HOPjmOK5LuZSHxWsAZEdZmEXn02ZDK+YzGfKtJjbt5ukD7Mvd2J8f7c4EVEH1Auvhrgia81cVzG
	NegkSr7FPT1DhjB7PTZLswgq2Fj1PFedOJpZOoRaDJ9uJdIIBJLw637N5QJooaHhM1kfL9KEuf5
	xQPSnpj+UnrdvOcduLsnK1L5Z8V2UbXNjOIdTxx/H4/BdBYl8casQGh8ATay4Xd1yeekrw6Lyc5
	iUL0iZAjUakKe1uAVhBeKiPO+bFHQE8JqZQ3P9Y0MTRegQC/+WSqeeYHSKjssFQ+ALrLh7RfjmF
	DOwHsDKOE/jcXl9t13ZQMbcU9Ih+5A8Xe6kOavpsGdIKZGB3/GccnR49g4aZtHTtRG/4gTqZVlm
	71OOXviESTDzTG2ZIQm0qQXMEY5ElzavYO1ZRhWDQiRnXv18k3yQ8glV4TYH6UM/b1Xhs22hvPd
	mGOeA==
X-Google-Smtp-Source: AGHT+IFCpFRLysb2UuU7Ert4ZiASf29rItBcJSWoBRj45/P5Dg23t8tCIWhu31ZzdtL2JuFDaAbXhQ==
X-Received: by 2002:a05:600c:4fd2:b0:477:a16e:fec5 with SMTP id 5b1f17b1804b1-47d849aa8bbmr65143155e9.0.1767973598429;
        Fri, 09 Jan 2026 07:46:38 -0800 (PST)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm23156541f8f.19.2026.01.09.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:46:38 -0800 (PST)
From: Petr Tesarik <ptesarik@suse.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 1/1] powerpc/xmon: Delete unused ansidecl.h
Date: Fri,  9 Jan 2026 16:46:36 +0100
Message-ID: <20260109154636.2945330-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.52.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Delete arch/powerpc/xmon/ansidecl.h. The definitions from this header file
are not used.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/powerpc/xmon/ansidecl.h | 130 -----------------------------------
 arch/powerpc/xmon/ppc-dis.c  |   1 -
 2 files changed, 131 deletions(-)
 delete mode 100644 arch/powerpc/xmon/ansidecl.h

diff --git a/arch/powerpc/xmon/ansidecl.h b/arch/powerpc/xmon/ansidecl.h
deleted file mode 100644
index 17a85a52b63a9..0000000000000
--- a/arch/powerpc/xmon/ansidecl.h
+++ /dev/null
@@ -1,130 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/* ANSI and traditional C compatibility macros
-   Copyright 1991, 1992 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-
- */
-
-/* ANSI and traditional C compatibility macros
-
-   ANSI C is assumed if __STDC__ is #defined.
-
-   Macro	ANSI C definition	Traditional C definition
-   -----	---- - ----------	----------- - ----------
-   PTR		`void *'		`char *'
-   LONG_DOUBLE	`long double'		`double'
-   VOLATILE	`volatile'		`'
-   SIGNED	`signed'		`'
-   PTRCONST	`void *const'		`char *'
-   ANSI_PROTOTYPES  1			not defined
-
-   CONST is also defined, but is obsolete.  Just use const.
-
-   DEFUN (name, arglist, args)
-
-	Defines function NAME.
-
-	ARGLIST lists the arguments, separated by commas and enclosed in
-	parentheses.  ARGLIST becomes the argument list in traditional C.
-
-	ARGS list the arguments with their types.  It becomes a prototype in
-	ANSI C, and the type declarations in traditional C.  Arguments should
-	be separated with `AND'.  For functions with a variable number of
-	arguments, the last thing listed should be `DOTS'.
-
-   DEFUN_VOID (name)
-
-	Defines a function NAME, which takes no arguments.
-
-   obsolete --     EXFUN (name, (prototype))	-- obsolete.
-
-	Replaced by PARAMS.  Do not use; will disappear someday soon.
-	Was used in external function declarations.
-	In ANSI C it is `NAME PROTOTYPE' (so PROTOTYPE should be enclosed in
-	parentheses).  In traditional C it is `NAME()'.
-	For a function that takes no arguments, PROTOTYPE should be `(void)'.
-
-    PARAMS ((args))
-
-	We could use the EXFUN macro to handle prototype declarations, but
-	the name is misleading and the result is ugly.  So we just define a
-	simple macro to handle the parameter lists, as in:
-
-	      static int foo PARAMS ((int, char));
-
-	This produces:  `static int foo();' or `static int foo (int, char);'
-
-	EXFUN would have done it like this:
-
-	      static int EXFUN (foo, (int, char));
-
-	but the function is not external...and it's hard to visually parse
-	the function name out of the mess.   EXFUN should be considered
-	obsolete; new code should be written to use PARAMS.
-
-    For example:
-	extern int printf PARAMS ((CONST char *format DOTS));
-	int DEFUN(fprintf, (stream, format),
-		  FILE *stream AND CONST char *format DOTS) { ... }
-	void DEFUN_VOID(abort) { ... }
-*/
-
-#ifndef	_ANSIDECL_H
-
-#define	_ANSIDECL_H	1
-
-
-/* Every source file includes this file,
-   so they will all get the switch for lint.  */
-/* LINTLIBRARY */
-
-
-#if defined (__STDC__) || defined (_AIX) || (defined (__mips) && defined (_SYSTYPE_SVR4)) || defined(WIN32)
-/* All known AIX compilers implement these things (but don't always
-   define __STDC__).  The RISC/OS MIPS compiler defines these things
-   in SVR4 mode, but does not define __STDC__.  */
-
-#define	PTR		void *
-#define	PTRCONST	void *CONST
-#define	LONG_DOUBLE	long double
-
-#define	AND		,
-#define	NOARGS		void
-#define	CONST		const
-#define	VOLATILE	volatile
-#define	SIGNED		signed
-#define	DOTS		, ...
-
-#define	EXFUN(name, proto)		name proto
-#define	DEFUN(name, arglist, args)	name(args)
-#define	DEFUN_VOID(name)		name(void)
-
-#define PROTO(type, name, arglist)	type name arglist
-#define PARAMS(paramlist)		paramlist
-#define ANSI_PROTOTYPES			1
-
-#else	/* Not ANSI C.  */
-
-#define	PTR		char *
-#define	PTRCONST	PTR
-#define	LONG_DOUBLE	double
-
-#define	AND		;
-#define	NOARGS
-#define	CONST
-#ifndef const /* some systems define it in header files for non-ansi mode */
-#define	const
-#endif
-#define	VOLATILE
-#define	SIGNED
-#define	DOTS
-
-#define	EXFUN(name, proto)		name()
-#define	DEFUN(name, arglist, args)	name arglist args;
-#define	DEFUN_VOID(name)		name()
-#define PROTO(type, name, arglist) type name ()
-#define PARAMS(paramlist)		()
-
-#endif	/* ANSI C.  */
-
-#endif	/* ansidecl.h	*/
diff --git a/arch/powerpc/xmon/ppc-dis.c b/arch/powerpc/xmon/ppc-dis.c
index af105e1bc3fca..3f2c01c13c661 100644
--- a/arch/powerpc/xmon/ppc-dis.c
+++ b/arch/powerpc/xmon/ppc-dis.c
@@ -10,7 +10,6 @@ This file is part of GDB, GAS, and the GNU binutils.
 #include <asm/cputable.h>
 #include <asm/cpu_has_feature.h>
 #include "nonstdio.h"
-#include "ansidecl.h"
 #include "ppc.h"
 #include "dis-asm.h"
 
-- 
2.52.0


