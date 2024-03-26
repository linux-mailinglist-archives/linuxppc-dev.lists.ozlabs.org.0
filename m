Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E188CBED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 19:24:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3yqx29kXz3vcW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 05:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3yqX3S78z3d28
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 05:23:50 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 42QIKS8h020379;
	Tue, 26 Mar 2024 13:20:29 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 42QIKQRQ020377;
	Tue, 26 Mar 2024 13:20:26 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 26 Mar 2024 13:20:26 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Appropriate liburcu cache line size for Power
Message-ID: <20240326182026.GE19790@gate.crashing.org>
References: <19c3ea76-9e05-4552-8b93-6c42df105747@efficios.com> <87ttktiho5.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttktiho5.fsf@mail.lhotse>
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
Cc: paulmck <paulmck@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 26, 2024 at 06:19:38PM +1100, Michael Ellerman wrote:
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> writes:
> The ISA doesn't specify the cache line size, other than it is smaller
> than a page.

It also says it is "aligned".  Nowhere is it said what an aligned size
is, but it seems clear it has to be a power of two.

> In practice all the 64-bit IBM server CPUs I'm aware of have used 128
> bytes.

Yup.  It is 128B on p3 already.

> It is possible to discover at runtime via AUXV headers. But that's no
> use if you want a compile-time constant.

The architecture does not require the data block size to be equal to the
instruction block size, already.  But many programs subscribe to an
overly simplified worldview, which is a big reason everything is 128B on
all modern PowerPC.

It is quite a nice tradeoff size, there has to be a huge change in the
world for this to ever change :-)


Segher
