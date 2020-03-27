Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA75D195DCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 19:42:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48prLR0NzfzDr0R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 05:42:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 48pqrV3KNBzDrBy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 05:19:38 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 02RIJTBJ023044;
 Fri, 27 Mar 2020 13:19:29 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 02RIJSEO023043;
 Fri, 27 Mar 2020 13:19:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 27 Mar 2020 13:19:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2] powerpc xmon: use `dcbf` inplace of `dcbi` instruction
 for 64bit Book3S
Message-ID: <20200327181928.GJ22482@gate.crashing.org>
References: <20200326061522.33123-1-bala24@linux.ibm.com>
 <caf285b1-172e-7116-b2ed-3645f36264ed@c-s.fr>
 <a0d623ad8347c6b88ef25c4de1ac5ed736037025.camel@linux.ibm.com>
 <9a3c084a-9e86-ff37-111c-6f1a8f0989fc@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3c084a-9e86-ff37-111c-6f1a8f0989fc@c-s.fr>
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 04:12:13PM +0100, Christophe Leroy wrote:
> Maybe you could also change invalidate_dcache_range():
> 
> 	for (i = 0; i < size >> shift; i++, addr += bytes) {
> 		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> 			dcbf(addr);
> 		else
> 			dcbi(addr);
> 	}

But please note that flushing is pretty much the opposite from
invalidating (a flush (dcbf) makes sure that what is in the cache now
ends up in memory, while an invalidate (dcbi) makes sure it will *not*
end up in memory).  (Both will remove the addressed cache line from the
data caches).

So you cannot blindly replace them; in all cases you need to look and
see if it does what you need here.

(dcbi is much harder to use correctly -- it can race very easily -- so
in practice you will be fine most of the time; but be careful around
startup code and the like).


Segher
