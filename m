Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C13FF711
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 00:22:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0wQr4PHHz2ywY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 08:22:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4H0wQR5PGlz2xqx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 08:22:07 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 182MK3Ll023453;
 Thu, 2 Sep 2021 17:20:03 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 182MK2IW023450;
 Thu, 2 Sep 2021 17:20:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 2 Sep 2021 17:20:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/64s: system call scv tabort fix for
 corrupt irq soft-mask state
Message-ID: <20210902222002.GN1583@gate.crashing.org>
References: <20210901165418.1412891-1-npiggin@gmail.com>
 <65ed1ac8-f4af-742a-1d2a-e5db7e71a920@csgroup.eu>
 <1630553233.5hjr91skvz.astroid@bobo.none>
 <20210902215203.GM1583@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902215203.GM1583@gate.crashing.org>
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
Cc: Eirik Fuller <efuller@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 02, 2021 at 04:52:03PM -0500, Segher Boessenkool wrote:
> On Thu, Sep 02, 2021 at 01:33:10PM +1000, Nicholas Piggin wrote:
> > Excerpts from Christophe Leroy's message of September 2, 2021 3:21 am:
> > >> -	/* Firstly we need to enable TM in the kernel */
> > >> +	/* We need to enable TM in the kernel, and disable EE (for scv) */
> > >>   	mfmsr	r10
> > >>   	li	r9, 1
> > >>   	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
> > >> +	LOAD_REG_IMMEDIATE(r9, MSR_EE)
> > >> +	andc	r10, r10, r9
> > > 
> > > Why not use 'rlwinm' to mask out MSR_EE ?
> > > 
> > > Something like
> > > 
> > > 	rlwinm	r10, r10, 0, ~MSR_EE
> > 
> > Mainly because I'm bad at powerpc assembly. Why do you think I'm trying 
> > to change as much as possible to C?
> 
> The actual bit (bit 31, i.e. with value 1UL << 32) cannot be cleared
> with rlwinm (only the low 32 bits can).  There are many ways to do it
> using two insns of course.

Wow I misread that, you want to clear MSR[EE] really, not MSR[TM].

You cannot use rlwinm and keep the high 32 bits of the target register
intact.  You either clear all to 0 or set them to a copy of the rotated
value in the low 32 bits.


Segher
