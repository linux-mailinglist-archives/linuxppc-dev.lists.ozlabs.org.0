Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84174347D12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 16:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5CWJ4G39z30Gr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 02:55:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F5CVy6CpKz30Bf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 02:55:21 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 12OFp7Vj004371;
 Wed, 24 Mar 2021 10:51:07 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 12OFp6Nv004370;
 Wed, 24 Mar 2021 10:51:06 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 24 Mar 2021 10:51:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 6/8] powerpc/mm/book3s64/hash: drop pre 2.06 tlbiel
 for clang
Message-ID: <20210324155105.GZ16691@gate.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-7-dja@axtens.net>
 <1616118111.i881ydq4h2.astroid@bobo.none>
 <7f7cafb5-e6c4-5015-5285-9f9ca25e52fb@csgroup.eu>
 <1616436133.s8792026fh.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616436133.s8792026fh.astroid@bobo.none>
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
Cc: llvmlinux@lists.linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Mar 23, 2021 at 04:11:10AM +1000, Nicholas Piggin wrote:
> The problem in this file is we generate 3 different tlbie and tlbiel
> instructions with the same mnemonic corresponding to different ISA
> versions.
> 
> This might actually be the one good place to use .machine to make sure 
> the assembler generates the right thing.

Yes, but then hide that in some macro.

(And "the one good place"?  I protest!)

> I'm not entirely sure it is
> foolproof because some of the times the instruction variant is inferred
> by the number of arguments it has yet arguments can be implicit. PPC_
> define would be exactly explicit.

The variants with fewer operands have those coded as 0 in the
instruction.  All of this is backwards compatible.

> But if it can be made reasonably robust with .machine then I'd be okay
> with that too.

Since you should do a macro (or inline) for it anyway, you could just
do .long, all the nastiness is in one place anyway then, it won't make
much difference what you do.  It should be documented there as well :-)


Segher
