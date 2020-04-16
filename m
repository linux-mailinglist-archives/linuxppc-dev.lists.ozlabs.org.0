Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F21AD307
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 01:04:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493FDP18PjzDscR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:04:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 493FBF4J9YzDrN8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 09:03:01 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03GN2bHF015254;
 Thu, 16 Apr 2020 18:02:37 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03GN2ZC2015253;
 Thu, 16 Apr 2020 18:02:35 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 16 Apr 2020 18:02:35 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200416230235.GG26902@gate.crashing.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <87k12gf32r.fsf@mid.deneb.enyo.de>
 <20200416153509.GT11469@brightrain.aerifal.cx>
 <87sgh3e613.fsf@mid.deneb.enyo.de>
 <20200416165257.GY11469@brightrain.aerifal.cx>
 <87ftd3e1vg.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftd3e1vg.fsf@mid.deneb.enyo.de>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
 musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>,
 libc-dev@lists.llvm.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 08:12:19PM +0200, Florian Weimer wrote:
> > I think my choice would be just making the inline syscall be a single
> > call insn to an asm source file that out-of-lines the loading of TOC
> > pointer and call through it or branch based on hwcap so that it's not
> > repeated all over the place.
> 
> I don't know how problematic control flow out of an inline asm is on
> POWER.  But this is basically the -moutline-atomics approach.

Control flow out of inline asm (other than with "asm goto") is not
allowed at all, just like on any other target (and will not work in
practice, either -- just like on any other target).  But the suggestion
was to use actual assembler code, not inline asm?


Segher
