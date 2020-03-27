Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB321959B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 16:26:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pm0n64ZbzDrFJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 02:26:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 48plyg3ZBxzDrB5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 02:24:43 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02RFOTOH014259;
 Fri, 27 Mar 2020 10:24:29 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 02RFOSQa014258;
 Fri, 27 Mar 2020 10:24:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 27 Mar 2020 10:24:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Fangrui Song <maskray@google.com>
Subject: Re: [PATCH v2] powerpc/boot: Delete unneeded .globl _zimage_start
Message-ID: <20200327152428.GF22482@gate.crashing.org>
References: <20200325164257.170229-1-maskray@google.com>
 <20200326221625.GA22482@gate.crashing.org>
 <20200326222612.zbbiyi75emq6npzn@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326222612.zbbiyi75emq6npzn@google.com>
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
Cc: Alan Modra <amodra@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 03:26:12PM -0700, Fangrui Song wrote:
> On 2020-03-26, Segher Boessenkool wrote:
> >On Wed, Mar 25, 2020 at 09:42:57AM -0700, Fangrui Song wrote:
> >>.globl sets the symbol binding to STB_GLOBAL while .weak sets the
> >>binding to STB_WEAK. GNU as let .weak override .globl since binutils-gdb
> >>5ca547dc2399a0a5d9f20626d4bf5547c3ccfddd (1996). Clang integrated
> >>assembler let the last win but it may error in the future.
> >
> >GNU AS works for more than just ELF.  The way the assembler language
> >is defined, it is not .weak overriding .globl -- instead, .weak sets a
> >symbol attribute.  On an existing symbol (but it creates on if there is
> >none yet).
> >
> >Clang is buggy if it does not allow valid (and perfectly normal)
> >assembler code like this.
> 
> https://sourceware.org/pipermail/binutils/2020-March/110399.html
> 
> Alan: "I think it is completely fine for you to make the llvm assembler
> error on inconsistent binding, or the last directive win.  Either of
> those behaviours is logical and good, but you quite possibly will run
> into a need to fix more user assembly.

This would be fine and consistent behaviour, of course.  But it is not
appropriate if you want to pretend to be compatible to GNU toolchains.

Which is exactly why you want this kernel patch at all.  And the kernel
can (in this case) accommodate your buggy assembler, sure, but are you
going to "fix" all other programs with this "problem" as well?


Segher
