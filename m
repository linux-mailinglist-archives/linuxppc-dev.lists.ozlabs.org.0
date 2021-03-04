Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 469BC32D70C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:49:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrwJw2Hs2z3dC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 02:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DrwJc56mRz3cmX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 02:48:47 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 124FjbCr026969;
 Thu, 4 Mar 2021 09:45:37 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 124FjacO026968;
 Thu, 4 Mar 2021 09:45:36 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 4 Mar 2021 09:45:35 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
Message-ID: <20210304154535.GS29191@gate.crashing.org>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
 <20210203211732.GD30983@gate.crashing.org>
 <20210204082753.GI210@DESKTOP-TDPLP67.localdomain>
 <20210302023732.GH29191@gate.crashing.org>
 <20210303163127.GE1913@DESKTOP-TDPLP67.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303163127.GE1913@DESKTOP-TDPLP67.localdomain>
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

On Wed, Mar 03, 2021 at 10:01:27PM +0530, Naveen N. Rao wrote:
> On 2021/03/01 08:37PM, Segher Boessenkool wrote:
> > > And, r6 always ends up with 0xaea. It changes with the value I put into 
> > > r6 though.
> > 
> > That is exactly the behaviour specified for p8.  0aaa+0040=0aea.
> > 
> > > Granted, this is all up in the air, but it does look like there is more 
> > > going on and the value isn't the EA or the value at the address.
> > 
> > That *is* the EA.  The EA is the address the insn does the access at.
> 
> I'm probably missing something here. 0xaaa is the value I stored at an 
> offset of 64 bytes from the stack pointer (r1 is copied into r6). In the 
> ldu instruction above, the EA is 64(r6), which should translate to 
> r1+64.  The data returned by the load would be 0xaaa, which should be 
> discarded per the description you provided above. So, I would expect to 
> see a 0xc0.. address in r6.

Yes, I misread your code it seems.

> In fact, this looks to be the behavior documented for P9:
> 
> > > Power9 does:
> > >
> > >   Load with Update Instructions (RA = 0)
> > >     EA is placed into R0.
> > >   Load with Update Instructions (RA = RT)
> > >     The storage operand addressed by EA is accessed. The 
> > >     displacement
> > >     field is added to the data returned by the load and placed into 
> > >     RT.

Yup.  So on what cpu did you test?

Either way, the kernel should not emulate any particular cpu here, I'd
say, esp. since recent cpus do different things for this invalid form.


Segher
