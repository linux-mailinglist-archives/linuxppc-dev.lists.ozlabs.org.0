Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FFD3160DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 09:23:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbCSN19nBzDvZl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 19:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uhCgB6Tt; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbCQ84V27zDr2l
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 19:21:04 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id u15so801257plf.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 00:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=y9ueWC+qy7zRAnCAZ9+0eKnj/8u9oJqH4nTZhyJhcxU=;
 b=uhCgB6TtwZ04qIdJFahWJ+phR4sQIelHq1yi3fTzolVjT44jmQOapFamwyNDpHmlLJ
 a7aKVWQ2pI52IPboZv8SB/h32ax4C4pdVIC5K85Sqz2tSOIyNrBZZ4sre95+bxqS7YA5
 WP7ELgRpCGjPw65N+g/9E67vlznfbRhBRue440khdfbCI0TWM0R6g4fHY1/fdbY1845t
 eZ42u7T3cdqd48Ku3JDvQsywE3TQy9mw35XXrQ1vvuaBdOR0TrjdGOnbT0A6jLo3UWIT
 z5/UVOHSnZ3bhkXS82hFOlx6Q0uQEUQpNONKM/eNysQz7sKMZpzYzukcI265H8pn9elG
 4/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=y9ueWC+qy7zRAnCAZ9+0eKnj/8u9oJqH4nTZhyJhcxU=;
 b=Rm/d1Uh66Xmr7VXd80mrAfUM4vYIxBSbo4WC0Ohe/pxtOYVAlH7tNk14S5pbLYvGMd
 oNHh+Sxtwec1Egd6CVEq0S06sejjPjd80MsNhtQ4sYmAZK36deOp73ZKv3c9DXePmUtB
 JUXn0VEGpsZgtcYLBKY4tVJsEovKSe1GZ0yXpdAhHD1QqePSilGxbz5hG1GohAfcovgj
 O/I5N59gTMiXy/U9iuIqMkk+2nJ/JQgipGpUpHy//OIHTA9DYw2CesSNpE0kqIefF4uh
 tksa4UtnQ/zqCf4lQiY5GqSM06wp1BWJvuPXLMwacPOVIF5DGQ4l8uTsFFm+uletAFpS
 9LjA==
X-Gm-Message-State: AOAM533yZ43KgShhigs8wRdTGPEdTdxgTVhSfbesGIcUtofblg++cFF4
 7/iruwCq0pNYjVO3sM5XO8Er4HX86fs=
X-Google-Smtp-Source: ABdhPJxX/BPSWkTKCX656F5jzGCJybSd/yRy8Lxrt2741SututWjlFOTlsEMSSSPtSfark+udAsv/g==
X-Received: by 2002:a17:902:b089:b029:e3:28:b8ee with SMTP id
 p9-20020a170902b089b02900e30028b8eemr2039609plr.84.1612945260944; 
 Wed, 10 Feb 2021 00:21:00 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id b17sm1179361pfl.190.2021.02.10.00.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:21:00 -0800 (PST)
Date: Wed, 10 Feb 2021 18:20:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: PowerPC <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210209211921.777e3053@canb.auug.org.au>
In-Reply-To: <20210209211921.777e3053@canb.auug.org.au>
MIME-Version: 1.0
Message-Id: <1612945076.ng7h3tp2jn.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Stephen Rothwell's message of February 9, 2021 8:19 pm:
> Hi all,
>=20
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x0): relocation truncated to=
 fit: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd se=
ction in arch/powerpc/mm/fault.o
> arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x8): relocation truncated to=
 fit: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd se=
ction in arch/powerpc/mm/fault.o
> arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x28): relocation truncated t=
o fit: R_PPC64_REL24 (OPD) against symbol `unknown_exception' defined in .o=
pd section in arch/powerpc/kernel/traps.o
>=20
> Not sure exactly which commit caused this, but it is most likkely part
> of a series in the powerpc tree.
>=20
> I have left the allyesconfig build broken for today.

Hey Stephen,

Thanks for that, it's due to .noinstr section being put on the other=20
side of .text, so all our interrupt handler asm code can't reach them=20
directly anymore since the ppc interrupt wrappers patch added noinstr
attribute.

That's not strictly required though, we've used NOKPROBE_SYMBOL okay
until now. If you can take this patch for now, it should get=20
allyesconfig to build again. I'll fix it in the powerpc tree before the=20
merge window.

Thanks,
Nick
--

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/as=
m/interrupt.h
index 4badb3e51c19..fee1e4dd1e84 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -172,6 +172,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt=
_regs *regs, struct inter
 #define DECLARE_INTERRUPT_HANDLER_RAW(func)				\
 	__visible long func(struct pt_regs *regs)
=20
+#define ppc_noinstr         noinline notrace __no_kcsan __no_sanitize_addr=
ess
+
 /**
  * DEFINE_INTERRUPT_HANDLER_RAW - Define raw interrupt handler function
  * @func:	Function name of the entry point
@@ -198,7 +200,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt=
_regs *regs, struct inter
 #define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+__visible ppc_noinstr long func(struct pt_regs *regs)			\
 {									\
 	long ret;							\
 									\
@@ -228,7 +230,7 @@ static __always_inline long ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER(func)					\
 static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr void func(struct pt_regs *regs)			\
+__visible ppc_noinstr void func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 									\
@@ -262,7 +264,7 @@ static __always_inline void ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER_RET(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+__visible ppc_noinstr long func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 	long ret;							\
@@ -297,7 +299,7 @@ static __always_inline long ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER_ASYNC(func)				\
 static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr void func(struct pt_regs *regs)			\
+__visible ppc_noinstr void func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_state state;					\
 									\
@@ -331,7 +333,7 @@ static __always_inline void ____##func(struct pt_regs *=
regs)
 #define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
 static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
-__visible noinstr long func(struct pt_regs *regs)			\
+__visible ppc_noinstr long func(struct pt_regs *regs)			\
 {									\
 	struct interrupt_nmi_state state;				\
 	long ret;							\
