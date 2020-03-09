Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9417EB88
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 22:50:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bsMR3D9PzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 08:49:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bsKy2BDzzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 08:48:35 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 029LmRnH029563;
 Mon, 9 Mar 2020 16:48:27 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 029LmRiV029562;
 Mon, 9 Mar 2020 16:48:27 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 9 Mar 2020 16:48:27 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Message-ID: <20200309214827.GT22482@gate.crashing.org>
References: <20200303014527.39377-1-npiggin@gmail.com>
 <20200303230950.GM22482@gate.crashing.org>
 <1583379060.p6od1jalr3.astroid@bobo.none>
 <20200305105503.GZ22482@gate.crashing.org>
 <1583542596.l37hgse8mc.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583542596.l37hgse8mc.astroid@bobo.none>
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

On Sat, Mar 07, 2020 at 10:58:54AM +1000, Nicholas Piggin wrote:
> Segher Boessenkool's on March 5, 2020 8:55 pm:
> > That name looks perfect to me.  You'll have to update REs expecting the
> > arch at the end (like /le$/), but you had to already I think?
> 
> le$ is still okay for testing ppc64le, unless you wanted me to add the 
> -elfv2 suffix on there as well? If that was the case, for consistency
> we'd also have to add -elfv1 for the BE v1 case. I was just going to add
> -elfv2 for the new variant.

I was thinking that, yes, but your plan is better alright (there aren't
many supported configs at all, anyway!)


Segher
