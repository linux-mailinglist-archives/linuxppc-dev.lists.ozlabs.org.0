Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F93295AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 03:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqLwX4Y0mz3cZZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 13:41:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DqLwC0gJlz3cGs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 13:40:42 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1222bYjB019759;
 Mon, 1 Mar 2021 20:37:35 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1222bXw2019758;
 Mon, 1 Mar 2021 20:37:33 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 1 Mar 2021 20:37:33 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
Message-ID: <20210302023732.GH29191@gate.crashing.org>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
 <20210203211732.GD30983@gate.crashing.org>
 <20210204082753.GI210@DESKTOP-TDPLP67.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204082753.GI210@DESKTOP-TDPLP67.localdomain>
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, Sandipan Das <sandipan@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

I didn't see this until now, almost a month later, sorry about that :-)

On Thu, Feb 04, 2021 at 01:57:53PM +0530, Naveen N. Rao wrote:
> On 2021/02/03 03:17PM, Segher Boessenkool wrote:
> > Power8 does:
> > 
> >   Load with Update Instructions (RA = 0)
> >     EA is placed into R0.
> >   Load with Update Instructions (RA = RT)
> >     EA is placed into RT. The storage operand addressed by EA is
> >     accessed, but the data returned by the load is discarded.
> 
> I'm actually not seeing that. This is what I am testing with:
> 	li      8,0xaaa
> 	mr      6,1
> 	std     8,64(6)
> 	#ldu    6,64(6)
> 	.long	0xe8c60041
> 
> And, r6 always ends up with 0xaea. It changes with the value I put into 
> r6 though.

That is exactly the behaviour specified for p8.  0aaa+0040=0aea.

> Granted, this is all up in the air, but it does look like there is more 
> going on and the value isn't the EA or the value at the address.

That *is* the EA.  The EA is the address the insn does the access at.


Segher
