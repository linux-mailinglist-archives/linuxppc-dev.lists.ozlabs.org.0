Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817314CB5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 14:23:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48741r3LvjzDqQy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 00:23:44 +1100 (AEDT)
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
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4873y76PJCzDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 00:20:27 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00TDKK3S010139;
 Wed, 29 Jan 2020 07:20:20 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00TDKJZP010137;
 Wed, 29 Jan 2020 07:20:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 29 Jan 2020 07:20:19 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
Message-ID: <20200129132019.GL22482@gate.crashing.org>
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <cd9e4b28-d577-8850-7c2b-a488fcb4740d@linaro.org>
 <1580273424.ea818exa2c.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580273424.ea818exa2c.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 29, 2020 at 02:58:44PM +1000, Nicholas Piggin wrote:
> Adhemerval Zanella's on January 29, 2020 3:26 am:
> >     __asm__ __volatile__                                                \
> >       ("sc\n\t"                                                         \
> >        "bns+ 1f\n\t"                                                    \
> >        "neg %1, %1\n\t"                                                 \
> >        "1:\n\t"                                                         \

> True, but the taken branch would be a 1 cycle bubble in fetch. Could 
> avoid that by branching out of line then back for the error case. But
> mfocrf is fine (only sources one register), that's what should be used
> here I think.

        neg %9,%1 ; isel %1,%9,%1,so

> That probably makes the performance argument for avoiding CR[SO] for
> error return indication less significant. Commonality with other
> architectures is probably the bigger reason for it.

Yes, and to have the syscall calling convention closer to the normal
function calling convention would be good, too.


Segher
