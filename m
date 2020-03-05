Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20E17A380
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 11:56:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y73X1ZZXzDqnl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 21:56:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y71p6SRnzDqkj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 21:55:09 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 025At4mT009633;
 Thu, 5 Mar 2020 04:55:04 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 025At4o9009630;
 Thu, 5 Mar 2020 04:55:04 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 5 Mar 2020 04:55:03 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Message-ID: <20200305105503.GZ22482@gate.crashing.org>
References: <20200303014527.39377-1-npiggin@gmail.com>
 <20200303230950.GM22482@gate.crashing.org>
 <1583379060.p6od1jalr3.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583379060.p6od1jalr3.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 05, 2020 at 01:34:22PM +1000, Nicholas Piggin wrote:
> Segher Boessenkool's on March 4, 2020 9:09 am:
> >> +override flavour := linux-ppc64v2
> > 
> > That isn't a good name, heh.  This isn't "v2" of anything...  Spell out
> > the name "ELFv2"?  Or as "elfv2"?  It is just a name after all, it is
> > version 1 in all three version fields in the ELF headers!
> 
> Yeah okay. This part is only for some weird little perl asm generator
> script, but probably better to be careful. linux-ppc64-elfv2 ?

That generator is from openssl, or inspired by it, it is everywhere.
So it is more important to get it right than it would seem at first
glance ;-)

That name looks perfect to me.  You'll have to update REs expecting the
arch at the end (like /le$/), but you had to already I think?


Segher
