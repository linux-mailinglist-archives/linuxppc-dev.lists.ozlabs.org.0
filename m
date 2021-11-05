Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E53446833
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 18:59:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm7Z64xZvz3c8d
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 04:59:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Hm7Yh4xmzz2yp6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 04:59:18 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1A5Hw3s4018233;
 Fri, 5 Nov 2021 12:58:03 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1A5Hw1tI018232;
 Fri, 5 Nov 2021 12:58:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 5 Nov 2021 12:58:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
Message-ID: <20211105175801.GO614@gate.crashing.org>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
 <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
 <de4b689-236e-505e-2632-6ce89110a1e9@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4b689-236e-505e-2632-6ce89110a1e9@linux-m68k.org>
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
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>,
 Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 05, 2021 at 10:36:18AM +1100, Finn Thain wrote:
> There is no __get_user_asm2_goto in this tree, and __get_user_asm2 already
> has the "=&r" constraint:
> 
> #define __get_user_asm2(x, addr, err)                   \
>         __asm__ __volatile__(                           \
>                 "1:     lwz%X2 %1, %2\n"                        \
>                 "2:     lwz%X2 %L1, %L2\n"              \
>                 "3:\n"                                  \
>                 ".section .fixup,\"ax\"\n"              \
>                 "4:     li %0,%3\n"                     \
>                 "       li %1,0\n"                      \
>                 "       li %1+1,0\n"                    \
>                 "       b 3b\n"                         \
>                 ".previous\n"                           \
>                 EX_TABLE(1b, 4b)                        \
>                 EX_TABLE(2b, 4b)                        \
>                 : "=r" (err), "=&r" (x)                 \
>                 : "m" (*addr), "i" (-EFAULT), "0" (err)) 

operand 0 needs an earlyclobber as well, in principle.  But there is
nothing left it can be tied to, so this won't change generated code.

What is operand 4 about?  It isn't used?

The "%1+1" can be written %L1 btw (it means exactly the same thing, but
work on more configs).


Segher
