Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F81EC15A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 19:49:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c00q2yGxzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 03:49:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49bzzJ6bb4zDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 03:48:11 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 052Hlp3g001807;
 Tue, 2 Jun 2020 12:47:51 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 052Hlm6f001805;
 Tue, 2 Jun 2020 12:47:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 2 Jun 2020 12:47:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200602174748.GS31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <20200602021245.GO31009@gate.crashing.org>
 <alpine.DEB.2.21.2006021342440.24059@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006021342440.24059@digraph.polyomino.org.uk>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 02, 2020 at 01:50:32PM +0000, Joseph Myers wrote:
> On Mon, 1 Jun 2020, Segher Boessenkool wrote:
> 
> > > The supported glibc ABIs are listed at 
> > > <https://sourceware.org/glibc/wiki/ABIList>.
> > 
> > powerpcle-linux already does work somewhat, and that should also he
> > worth something, official or not ;-)
> > 
> > (It has worked for very many years already...  That is, I have built it
> > a lot, I have no idea about running a full distro that way).
> 
> Greg McGary's patches as referenced at 
> <https://sourceware.org/legacy-ml/libc-hacker/2006-11/msg00013.html> were 
> never merged, and I don't know how big the changes to .S files were or if 
> they were ever posted.  Many files were subsequently fixed as part of 
> bringing up support for powerpc64le, but without actual 32-bit LE testing 
> as part of each release cycle there's not much evidence of correctness for 
> LE of code not used for powerpc64le.

Yeah sorry, I meant I have built the toolchain parts a lot, not libc.
GCC and binutils.  I reckon there is more work to do in libc, certainly
for configuration and similar.


Segher
