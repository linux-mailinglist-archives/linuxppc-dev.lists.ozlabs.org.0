Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 408602DFED4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 18:17:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D05k33p3WzDqJk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 04:16:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4D05gq6s7GzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 04:15:03 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0BLHCTFq012889;
 Mon, 21 Dec 2020 11:12:30 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0BLHCSI6012888;
 Mon, 21 Dec 2020 11:12:28 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 21 Dec 2020 11:12:28 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH] powerpc:Don't print raw EIP/LR hex values in dump_stack()
 and show_regs()
Message-ID: <20201221171228.GA2672@gate.crashing.org>
References: <20201221032758.12143-1-nixiaoming@huawei.com>
 <2279fc96-1f10-0c3f-64d9-734f18758620@csgroup.eu>
 <20201221163130.GZ2672@gate.crashing.org>
 <ad814ccf34c14c76b45e50b6e7741c3a@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad814ccf34c14c76b45e50b6e7741c3a@AcuMS.aculab.com>
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
Cc: "ravi.bangoria@linux.ibm.com" <ravi.bangoria@linux.ibm.com>,
 "mikey@neuling.org" <mikey@neuling.org>,
 "yanaijie@huawei.com" <yanaijie@huawei.com>,
 "wangle6@huawei.com" <wangle6@huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "haren@linux.ibm.com" <haren@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 Xiaoming Ni <nixiaoming@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 21, 2020 at 04:42:23PM +0000, David Laight wrote:
> From: Segher Boessenkool
> > Sent: 21 December 2020 16:32
> > 
> > On Mon, Dec 21, 2020 at 04:17:21PM +0100, Christophe Leroy wrote:
> > > Le 21/12/2020 à 04:27, Xiaoming Ni a écrit :
> > > >Since the commit 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR
> > > >infrastructure"), the powerpc system is ready to support KASLR.
> > > >To reduces the risk of invalidating address randomization, don't print the
> > > >EIP/LR hex values in dump_stack() and show_regs().
> > 
> > > I think your change is not enough to hide EIP address, see below a dump
> > > with you patch, you get "Faulting instruction address: 0xc03a0c14"
> > 
> > As far as I can see the patch does nothing to the GPR printout.  Often
> > GPRs contain code addresses.  As one example, the LR is moved via a GPR
> > (often GPR0, but not always) for storing on the stack.
> > 
> > So this needs more work.
> 
> If the dump_stack() is from an oops you need the real EIP value
> on order to stand any chance of making headway.

Or at least the function name + offset, yes.

> Otherwise you might just as well just print 'borked - tough luck'.

Yes.  ASLR is a house of cards.  But that isn't constructive wrt this
patch :-)


Segher
