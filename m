Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D432533E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 17:11:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmd7p3J32z3cy7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 03:11:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dmd7T6bfdz30NL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 03:11:01 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 11PG8wqw024663;
 Thu, 25 Feb 2021 10:08:58 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 11PG8vrh024661;
 Thu, 25 Feb 2021 10:08:57 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 25 Feb 2021 10:08:57 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [RFC PATCH 8/8] powerpc/64/asm: don't reassign labels
Message-ID: <20210225160857.GH28121@gate.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-9-dja@axtens.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225031006.1204774-9-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvmlinux@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 25, 2021 at 02:10:06PM +1100, Daniel Axtens wrote:
> The assembler really does not like us reassigning things to the same
> label:
> 
> <instantiation>:7:9: error: invalid reassignment of non-absolute variable 'fs_label'
> 
> This happens across a bunch of platforms:
> https://github.com/ClangBuiltLinux/linux/issues/1043
> https://github.com/ClangBuiltLinux/linux/issues/1008
> https://github.com/ClangBuiltLinux/linux/issues/920
> https://github.com/ClangBuiltLinux/linux/issues/1050
> 
> There is no hope of getting this fixed in LLVM, so if we want to build
> with LLVM_IAS, we need to hack around it ourselves.
> 
> For us the big problem comes from this:
> 
> \#define USE_FIXED_SECTION(sname)				\
> 	fs_label = start_##sname;				\
> 	fs_start = sname##_start;				\
> 	use_ftsec sname;
> 
> \#define USE_TEXT_SECTION()
> 	fs_label = start_text;					\
> 	fs_start = text_start;					\
> 	.text
> 
> and in particular fs_label.

The "Setting Symbols" super short chapter reads:

"A symbol can be given an arbitrary value by writing a symbol, followed
by an equals sign '=', followed by an expression.  This is equivalent
to using the '.set' directive."

And ".set" has

"Set the value of SYMBOL to EXPRESSION.  This changes SYMBOL's value and
type to conform to EXPRESSION.  If SYMBOL was flagged as external, it
remains flagged.

You may '.set' a symbol many times in the same assembly provided that
the values given to the symbol are constants.  Values that are based on
expressions involving other symbols are allowed, but some targets may
restrict this to only being done once per assembly.  This is because
those targets do not set the addresses of symbols at assembly time, but
rather delay the assignment until a final link is performed.  This
allows the linker a chance to change the code in the files, changing the
location of, and the relative distance between, various different
symbols.

If you '.set' a global symbol, the value stored in the object file is
the last value stored into it."

So this really should be fixed in clang: it is basic assembler syntax.


Segher
