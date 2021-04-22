Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E84D536855A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 18:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR3XP6qGQz30Bm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 02:58:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FR3X43dYbz2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 02:58:08 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13MGsfdu020034;
 Thu, 22 Apr 2021 11:54:41 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13MGsb0c020029;
 Thu, 22 Apr 2021 11:54:37 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 22 Apr 2021 11:54:37 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Message-ID: <20210422165437.GA27473@gate.crashing.org>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <87r1j3ys8i.fsf@dja-thinkpad.axtens.net>
 <3e6b31d92d5042d982daeb989e49299e@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e6b31d92d5042d982daeb989e49299e@AcuMS.aculab.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "lkp@intel.com" <lkp@intel.com>, "robh@kernel.org" <robh@kernel.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 "bauerman@linux.ibm.com" <bauerman@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 'Daniel Axtens' <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 08:05:27AM +0000, David Laight wrote:
> > (Does anyone - and by anyone I mean any large distro - compile with
> > local variables inited by the compiler?)
> 
> There are compilers that initialise locals to zero for 'debug' builds
> and leave the 'random' for optimised 'release' builds.
> Lets not test what we are releasing!

Yeah, that's the worst of all possible worlds.

> I also think there is a new option to gcc (or clang?) to initialise
> on-stack structures and arrays to ensure garbage isn't passed.
> That seems to be a horrid performance hit!
> Especially in userspace where large stack allocations are almost free.
> 
> Any auto-initialise ought to be with a semi-random value
> (especially not zero) so that it is never right and doesn't
> lead to lazy coding.

Many compilers did something like this, decades ago -- for debug builds.


Segher
