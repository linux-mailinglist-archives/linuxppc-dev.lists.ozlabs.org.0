Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345B318D81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 15:37:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbzjc0GVzzDvZB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DbzfY5FG9zDvXp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 01:34:29 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 11BEUxQ2020284;
 Thu, 11 Feb 2021 08:30:59 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 11BEUxVp020283;
 Thu, 11 Feb 2021 08:30:59 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 11 Feb 2021 08:30:59 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/bug: Remove specific powerpc BUG_ON()
Message-ID: <20210211143059.GE28121@gate.crashing.org>
References: <694c7195c81d1bcc781b3c14f452886683d6c524.1613029237.git.christophe.leroy@csgroup.eu>
 <20210211114910.GA28121@gate.crashing.org>
 <6126ca14-419a-9e15-7ffa-b295f26a552e@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6126ca14-419a-9e15-7ffa-b295f26a552e@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 11, 2021 at 03:09:43PM +0100, Christophe Leroy wrote:
> Le 11/02/2021 à 12:49, Segher Boessenkool a écrit :
> >On Thu, Feb 11, 2021 at 07:41:52AM +0000, Christophe Leroy wrote:
> >>powerpc BUG_ON() is based on using twnei or tdnei instruction,
> >>which obliges gcc to format the condition into a 0 or 1 value
> >>in a register.
> >
> >Huh?  Why is that?
> >
> >Will it work better if this used __builtin_trap?  Or does the kernel only
> >detect very specific forms of trap instructions?
> 
> We already made a try with __builtin_trap() 1,5 year ago, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20510ce03cc9463f1c9e743c1d93b939de501b53.1566219503.git.christophe.leroy@c-s.fr/
> 
> The main problems encountered are:
> - It is only possible to use it for BUG_ON, not for WARN_ON because GCC 
> considers it as noreturn. Is there any workaround ?

A trap is noreturn by definition:

 -- Built-in Function: void __builtin_trap (void)
     This function causes the program to exit abnormally.

> - The kernel (With CONFIG_DEBUG_BUGVERBOSE) needs to be able to identify 
> the source file and line corresponding to the trap. How can that be done 
> with __builtin_trap() ?

The DWARF debug info should be sufficient.  Perhaps you can post-process
some way?

You can create a trap that falls through yourself (by having a trap-on
condition with a condition that is always true, but make the compiler
not see that).  This isn't efficient though.

Could you file a feature request (in bugzilla)?  It is probably useful
for generic code as well, but we could implement this for powerpc only
if needed.


Segher
