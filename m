Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03993DC1C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 02:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gc4Fr5rBtz3cVk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 10:02:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gc4FT34pZz3bnC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 10:02:03 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 16UNtuUP004776;
 Fri, 30 Jul 2021 18:55:56 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 16UNtsHB004775;
 Fri, 30 Jul 2021 18:55:54 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 30 Jul 2021 18:55:54 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] powerpc/vdso: Don't use r30 to avoid breaking Go lang
Message-ID: <20210730235554.GJ1583@gate.crashing.org>
References: <20210729131244.2595519-1-mpe@ellerman.id.au>
 <392b3b47-1878-d27a-9656-4596fdc7c343@molgen.mpg.de>
 <CAKwvOdmR9nB3T-PLNSGea3=9qbZuOoLs5D22UPRBbvw_+aOO7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmR9nB3T-PLNSGea3=9qbZuOoLs5D22UPRBbvw_+aOO7A@mail.gmail.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 29, 2021 at 09:25:43AM -0700, Nick Desaulniers wrote:
> On Thu, Jul 29, 2021 at 6:42 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> > Am 29.07.21 um 15:12 schrieb Michael Ellerman:
> > > Note this only works with GCC, clang does not support -ffixed-rN.
> >
> > Maybe the clang/LLVM build support folks (in CC) have an idea.
> 
> Right, we've had issues with these in the past.  Generally, we need to
> teach clang about which registers are valid for `N` so that it can
> diagnose invalid values ASAP.  This has to be done on a per arch basis
> in LLVM to steal the register from the register allocator.  For
> example, this was used previously for aarch64 (but removed from use in
> the kernel) and IIRC is used for m68k (which we're working to get
> builds online for).

In GCC, it is -ffixed-* (note: no "r").  The string is stripped of the
standard prefix for the target (for Power, none), and possibly of one
"%" or "#".  If the string is a recognised register name (or alternative
register name) for the target, that is used.  If not, and it is a
decimal number, then the internal GCC register of that number is used
(these numbers can differ from one GCC release to another, and in fact
we have changed the numbering for Power before -- but 0..31 have always
been the GPRs, and 32..63 have always been the FPRs).

The names for the Power registers are:
GPRs:
  0..31, or alternatively
  r0..r31
FPRs:
  0..31, or alternatively
  fr0..fr31, or alternatively
  vs0..vs31
VRs:
  0..31, or alternatively
  v0..v31, or alternatively
  vs32..vs63
CR fields:
  0..7, or alternatively
  cr0..cr7

(There are more, but changing the default calling convention for those
will not work anyway.  Also, some non-Linux configurations use different
names.)


Segher
