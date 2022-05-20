Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B452F1D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:46:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Z0M4XZRz3cg7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 03:46:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L4Yzv2JVBz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 03:46:01 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24KHgpwc017781;
 Fri, 20 May 2022 12:42:51 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 24KHgov5017779;
 Fri, 20 May 2022 12:42:50 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 20 May 2022 12:42:50 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul E Murphy <murphyp@linux.ibm.com>
Subject: Re: [RFC Linux patch] powerpc: add documentation for HWCAPs
Message-ID: <20220520174250.GG25951@gate.crashing.org>
References: <20220520051528.98097-1-npiggin@gmail.com>
 <c1f6c6c9-4cc7-0dcb-360d-9ae0df6378b4@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f6c6c9-4cc7-0dcb-360d-9ae0df6378b4@linux.ibm.com>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 20, 2022 at 09:21:43AM -0500, Paul E Murphy wrote:
> >+PPC_FEATURE_HAS_ALTIVEC
> >+    Vector (aka Altivec, VSX) facility is available.
> 
> I think "(aka Altivec, VSX)" might be more accurately stated as "(aka 
> Altivec)"?

"Also known as AltiVec or VMX", yes.

> >+PPC_FEATURE_HAS_DFP
> >+    DFP facility is available.
> 
> Maybe something like "Decimal floating point instructions are available 
> to userspace.  Individual instruction availability is dependent on the
> reported architecture version."?

That is true for *all* facilities, and even the base architecture!  This
is not only hypothetical, either.


Segher
