Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA52194F0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 02:20:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Gz71V46zDqs2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:20:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4B2GxJ1FtjzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 10:18:43 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0690Ic1A019905;
 Wed, 8 Jul 2020 19:18:38 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0690IcnS019903;
 Wed, 8 Jul 2020 19:18:38 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 8 Jul 2020 19:18:37 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: Failure to build librseq on ppc
Message-ID: <20200709001837.GD3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org> <87k0ze2nv4.fsf@mpe.ellerman.id.au>
 <20200708235331.GA3598@gate.crashing.org>
 <1968953502.5815.1594252883512.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1968953502.5815.1594252883512.JavaMail.zimbra@efficios.com>
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
Cc: Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 08, 2020 at 08:01:23PM -0400, Mathieu Desnoyers wrote:
> > > #define RSEQ_ASM_OP_CMPEQ(var, expect, label)                                   \
> > >                 LOAD_WORD "%%r17, %[" __rseq_str(var) "]\n\t"                   \
> > 
> > The way this hardcodes r17 *will* break, btw.  The compiler will not
> > likely want to use r17 as long as your code (after inlining etc.!) stays
> > small, but there is Murphy's law.
> 
> r17 is in the clobber list, so it should be ok.

What protects r17 *after* this asm statement?


Segher
