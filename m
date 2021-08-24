Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 251543F61A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 17:29:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvChz0ZVBz2yn2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 01:29:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GvChX0K2kz2xKW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 01:29:30 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17OFSFBJ017344;
 Tue, 24 Aug 2021 10:28:15 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17OFSEsh017341;
 Tue, 24 Aug 2021 10:28:14 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 24 Aug 2021 10:28:13 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Don't use lmw/stmw for saving/restoring non
 volatile regs
Message-ID: <20210824152813.GG1583@gate.crashing.org>
References: <316c543b8906712c108985c8463eec09c8db577b.1629732542.git.christophe.leroy@csgroup.eu>
 <20210823184648.GY1583@gate.crashing.org>
 <9bbc9797-cfc7-1484-90ad-2146ff1a5e18@csgroup.eu>
 <20210824131600.GF1583@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824131600.GF1583@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 24, 2021 at 08:16:00AM -0500, Segher Boessenkool wrote:
> On Tue, Aug 24, 2021 at 07:54:22AM +0200, Christophe Leroy wrote:
> > >On mpccore both lmw and stmw are only N+1 btw.  But the serialization
> > >might cost another cycle here?
> > 
> > That coherent on MPC8xx, that's only 2 cycles.
> > But on the mpc832x which has a e300c2 core, it looks like I have 10 cycles 
> > difference. Is anything wrong ?
> 
> I don't know that core very well, I'll have a look.

So, I don't see any difference between e300c2 and e300c1 (which is 603
basically, for this) that is significant here.  The e300c2 has two
integer units instead of just one, but it still has only one load/store
unit, and I don't see anything else that could matter either.  Huh.


Segher
