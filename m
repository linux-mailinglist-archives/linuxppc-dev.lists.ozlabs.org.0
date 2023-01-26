Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5DE67D2F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:23:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2nbg0b3Hz3fFV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:23:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2nb624mkz3fD7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:22:40 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30QHJRSd028306;
	Thu, 26 Jan 2023 11:19:27 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 30QHJPDN028305;
	Thu, 26 Jan 2023 11:19:25 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 26 Jan 2023 11:19:25 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 02/24] powerpc/pseries: Fix alignment of PLPKS structures and buffers
Message-ID: <20230126171925.GN25951@gate.crashing.org>
References: <20230120074306.1326298-1-ajd@linux.ibm.com> <20230120074306.1326298-3-ajd@linux.ibm.com> <87pmb2pxpa.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmb2pxpa.fsf@mpe.ellerman.id.au>
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
Cc: gjoyce@linux.ibm.com, Andrew Donnellan <ajd@linux.ibm.com>, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, linux-integrity@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 12:09:53AM +1100, Michael Ellerman wrote:
> Andrew Donnellan <ajd@linux.ibm.com> writes:
> > A number of structures and buffers passed to PKS hcalls have alignment
> > requirements, which could on occasion cause problems:
> >
> > - Authorisation structures must be 16-byte aligned and must not cross a
> >   page boundary
> >
> > - Label structures must not cross page boundaries
> >
> > - Password output buffers must not cross page boundaries
> >
> > Round up the allocations of these structures/buffers to the next power of
> > 2 to make sure this happens.
> 
> It's not the *next* power of 2, it's the *nearest* power of 2, including
> the initial value if it's already a power of 2.

It's not the nearest either, the nearest power of two to 65 is 64.  You
could say "but, round up" to which I would say "round?"  :-P

"Adjust the allocation size to be the smallest power of two greater than
or equal to the given size."

"Pad to a power of two" in shorthand.  "Padded to a power of two if
necessary" if you want to emphasise it can be a no-op.


Segher
