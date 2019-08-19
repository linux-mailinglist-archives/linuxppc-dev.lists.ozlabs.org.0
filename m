Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E494908
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 17:49:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Byyl2CcFzDqsv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 01:49:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Byv0456mzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:45:48 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7JFjWZd027621;
 Mon, 19 Aug 2019 10:45:32 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x7JFjVsv027620;
 Mon, 19 Aug 2019 10:45:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 19 Aug 2019 10:45:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 3/3] powerpc: use __builtin_trap() in BUG/WARN macros.
Message-ID: <20190819154531.GM31406@gate.crashing.org>
References: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
 <20510ce03cc9463f1c9e743c1d93b939de501b53.1566219503.git.christophe.leroy@c-s.fr>
 <20190819132313.GH31406@gate.crashing.org>
 <dbafc03a-6eda-d9a3-c451-d242f03b01d9@c-s.fr>
 <20190819143700.GK31406@gate.crashing.org>
 <44a19633-f2a9-79f9-da7c-16ba64a66600@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44a19633-f2a9-79f9-da7c-16ba64a66600@c-s.fr>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 05:05:46PM +0200, Christophe Leroy wrote:
> Le 19/08/2019 à 16:37, Segher Boessenkool a écrit :
> >On Mon, Aug 19, 2019 at 04:08:43PM +0200, Christophe Leroy wrote:
> >>Le 19/08/2019 à 15:23, Segher Boessenkool a écrit :
> >>>On Mon, Aug 19, 2019 at 01:06:31PM +0000, Christophe Leroy wrote:
> >>>>Note that we keep using an assembly text using "twi 31, 0, 0" for
> >>>>inconditional traps because GCC drops all code after
> >>>>__builtin_trap() when the condition is always true at build time.
> >>>
> >>>As I said, it can also do this for conditional traps, if it can prove
> >>>the condition is always true.
> >>
> >>But we have another branch for 'always true' and 'always false' using
> >>__builtin_constant_p(), which don't use __builtin_trap(). Is there
> >>anything wrong with that ?:
> >
> >The compiler might not realise it is constant when it evaluates the
> >__builtin_constant_p, but only realises it later.  As the documentation
> >for the builtin says:
> >   A return of 0 does not indicate that the
> >   value is _not_ a constant, but merely that GCC cannot prove it is a
> >   constant with the specified value of the '-O' option.
> 
> So you mean GCC would not be able to prove that 
> __builtin_constant_p(cond) is always true but it would be able to prove 
> that if (cond)  is always true ?

Not sure what you mean, sorry.

> And isn't there a away to tell GCC that '__builtin_trap()' is 
> recoverable in our case ?

No, GCC knows that a trap will never fall through.

> >I think it may work if you do
> >
> >#define BUG_ON(x) do {						\
> >	if (__builtin_constant_p(x)) {				\
> >		if (x)						\
> >			BUG();					\
> >	} else {						\
> >		BUG_ENTRY("", 0);				\
> >		if (x)						\
> >			__builtin_trap();			\
> >	}							\
> >} while (0)
> 
> It doesn't work:

You need to make a BUG_ENTRY so that it refers to the *following* trap
instruction, if you go this way.

> >I don't know how BUG_ENTRY works exactly.
> 
> It's basic, maybe too basic: it adds an inline asm with a label, and 
> adds a .long in the __bug_table section with the address of that label.
> 
> When putting it after the __builtin_trap(), I changed it to using the 
> address before the one of the label which is always the twxx instruction 
> as far as I can see.
> 
> #define BUG_ENTRY(insn, flags, ...)			\
> 	__asm__ __volatile__(				\
> 		"1:	" insn "\n"			\
> 		".section __bug_table,\"aw\"\n"		\
> 		"2:\t" PPC_LONG "1b, %0\n"		\
> 		"\t.short %1, %2\n"			\
> 		".org 2b+%3\n"				\
> 		".previous\n"				\
> 		: : "i" (__FILE__), "i" (__LINE__),	\
> 		  "i" (flags),				\
> 		  "i" (sizeof(struct bug_entry)),	\
> 		  ##__VA_ARGS__)

#define MY_BUG_ENTRY(lab, flags)			\
	__asm__ __volatile__(				\
		".section __bug_table,\"aw\"\n"		\
		"2:\t" PPC_LONG "%4, %0\n"		\
		"\t.short %1, %2\n"			\
		".org 2b+%3\n"				\
		".previous\n"				\
		: : "i" (__FILE__), "i" (__LINE__),	\
		  "i" (flags),				\
		  "i" (sizeof(struct bug_entry)),	\
		  "i" (lab))

called as

#define BUG_ON(x) do {						\
	MY_BUG_ENTRY(&&lab, 0);					\
	lab: if (x)						\
		__builtin_trap();				\
} while (0)

not sure how reliable that works -- *if* it works, I just typed that in
without testing or anything -- but hopefully you get the idea.


Segher
